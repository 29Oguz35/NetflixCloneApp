//
//  DataPersistenceManager.swift
//  NetflixClone
//
//  Created by naruto kurama on 25.05.2022.
//

import Foundation
import UIKit
import CoreData


class DataPersistenceManager {
    
    static let shared = DataPersistenceManager()
    
    enum DataBasError : Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeletedData
    }
    
    func downloadTitleWith(model: Title, completion: @escaping (Result<Void,Error>)->Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let item = TitleItem(context: context)
        
        item.original_title = model.original_title
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.id = Int64(model.id)
        item.title = model.title
        item.media_type = model.media_type
        item.original_language = model.original_language
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        do {
            try context.save()
            completion(.success(()))
        }catch {
            completion(.failure(DataBasError.failedToSaveData))
        }
    }
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>)-> Void) {
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let request : NSFetchRequest<TitleItem>
        request = TitleItem.fetchRequest()
        
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        }catch {
            completion(.failure(DataBasError.failedToFetchData))
        }
        
    }
    func deleteTitleWith(model : TitleItem , completion: @escaping (Result<Void, Error>) -> Void) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        }catch {
            completion(.failure(DataBasError.failedToDeletedData))
        }
    }
}
