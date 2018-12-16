

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameUILabel: UILabel!
    @IBOutlet weak var statusUILabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var cityYearsOldUILabel: UILabel!
    @IBOutlet weak var firstScrollView: UIScrollView!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var homeTownLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var groupsCountLabel: UILabel!
    @IBOutlet weak var photosCountLabel: UILabel!
    @IBOutlet weak var videosCountLabel: UILabel!
    
    var userObject: UserObject?
    var mainService: MainService!
    var dataManager: DataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.clipsToBounds = true
        firstScrollView.contentSize.height = 650
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.clipsToBounds = true
        
        mainService = MainServiceImplementation()
        dataManager = DataManagerImplementation.sharedInstance
        
        guard let userID = UserDefaultsSettings.currentUserID() else {
            //todo logout
            return
        }
        let predicate = NSPredicate(format: "id == %@", userID)
        userObject = dataManager.get(with: UserObject.self, predicate: predicate)?.first
        setUserData(userObject)
        loadProfile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUserData(_ user: UserObject?) {
         
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            
            self!.nameUILabel.text = self!.userObject?.firstName
            if let status = self!.userObject?.online {
                if(status == 0) {
                    self!.statusUILabel.text = "Online"
                } else {
                    self!.statusUILabel.text = "Offline"
                }
            }
            self!.cityYearsOldUILabel.text =  self!.userObject?.city?.title
            self!.birthdayLabel.text = self!.userObject?.bdate ?? "No birthday date"
            self!.phoneLabel.text = self!.userObject?.mobilePhone ?? "No phone number"
            self!.countryLabel.text = self!.userObject?.country?.title ?? "Not specified"
            self!.cityLabel.text = self!.userObject?.city?.title ?? "Not specified"
            self!.homeTownLabel.text = self!.userObject?.homeTown ?? "Not specified"
            if let friendsCount = self!.userObject?.counters?.friends {
                self!.friendsCountLabel.text = String(friendsCount)
            }
            if let followersCount = self!.userObject?.counters?.followers {
                self!.followersCountLabel.text = String(followersCount)
            }
            if let groupsCount = self!.userObject?.counters?.groups {
                self!.groupsCountLabel.text = String(groupsCount)
            }
            if let photosCount = self!.userObject?.counters?.photos {
                self!.photosCountLabel.text = String(photosCount)
            }
            if let videosCount = self!.userObject?.counters?.videos {
                self!.videosCountLabel.text = String(videosCount)
            }
        }
        
        profileImageView.downloaded(from: user?.photoOrig ?? "")
        

    }
    
    //MARK: - network
    
    func loadProfile() {
        mainService.profile { [weak self] (result) in
            switch result {
            case .success(let user):
                    self?.userObject = UserObject.transfrom(user)
                    self?.dataManager.saveAll()
                    self?.setUserData(self?.userObject)
                    print(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

