//
//  DataManager.swift
//  NewProject
//
//  Created by Гузель on 04.11.2018.
//  Copyright © 2018 Гузель. All rights reserved.
//

import CoreData
import UIKit

protocol DataManager {
    
    /// Удаление объекта из базы данных
    ///
    /// - Parameter managedObject: тип объекта
    func delete<T>(managedObject: T) where T: NSManagedObject
    
    /// Получение массива объектов отфильтрованных предикатом
    ///
    /// - Parameters:
    ///   - type: тип объекта
    ///   - predicate: request predicate
    /// - Returns: массива объектов
    func get<T: NSManagedObject>(with type: T.Type, predicate: NSPredicate?) -> [T]?
    
    /// Сохранение всех изменений в базе данных
    func saveAll()
    
    
    /// Получение текущего контекста
    ///
    /// - Returns: контекст
    func getContext()-> NSManagedObjectContext
    
    
}


//
//
//    /// Асинхронное удаление поста
//    ///
//    /// - Parameters:
//    ///   - id: id поста который нужно удалить
//    ///   - completion: блок - обработчик, связанное значение - bool (cтатус результата выполнения задачи)
//    /// - Returns:
//    func removeAsync(by id: Int, completion: @escaping (Bool) -> Void)
//
//
//    /// Синхронное удаление поста
//    ///
//    /// - Parameter id: id поста который нужно удалить
//    /// - Returns: cтатус результата выполнения задачи
//    func removeSync(by id: Int) -> Bool
//
//
//    /// Асинхронный поиск поста
//    ///
//    /// - Parameters:
//    ///   - id: id поста который нужно найти
//    ///   - completion: блок - обработчик, связанное значение - Post? (Опциональный результат поиска поста)
//    /// - Returns:
//    func searchAsync(by id: Int, completion: @escaping (Post?) -> Void)
//
//
//    /// Синхронный поиск поста
//    ///
//    /// - Parameter id: id поста который нужно найти
//    /// - Returns: Опциональный результат поиска поста - Post?
//    func searchSync(by id: Int) -> Post?
//
//    /// Асинхронное получение всех постов
//    ///
//    /// - Parameter completion: блок - обработчик, связанное значение - [Post] (Массив всех постов)
//    /// - Returns:
//    func allPostsAsync(completion: @escaping ([Post]) -> Void)
//
//
//    /// Синхронное получение всех постов
//    ///
//    /// - Returns: Массив всех постов
//    func allPostsSync() -> [Post]
    
    

