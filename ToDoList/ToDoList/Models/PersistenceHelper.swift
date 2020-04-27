//
//  PersistenceHelper.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

struct PersistenceHelper<T: Codable> {
    
    //MARK: - Properties
    
    let fileName: String
    
    var url: URL {
           return filePathFromDocumentDirectory(fileName: fileName)
       }
    
    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    //MARK: - Initializer
    
    init(fileName: String){
        self.fileName = fileName
    }
    
    //MARK: - Functions
    
    private func filePathFromDocumentDirectory(fileName: String) -> URL {
        return documentDirectory.appendingPathComponent(fileName)
    }
    
    func getObjects() throws -> [T] {
        let objectArray = [T].self
        
        guard let data = FileManager.default.contents(atPath: url.path) else {
            return []
        }
        
        return try PropertyListDecoder().decode(objectArray, from: data)
    }
    
    
    func saveObject(newObject: T) throws {
        var objects = try getObjects()
        objects.append(newObject)
        let data = try PropertyListEncoder().encode(objects)
        try data.write(to: url, options: .atomic)
    }
    
    func replaceArray(objects: [T]) throws {
        let data = try PropertyListEncoder().encode(objects)
        try data.write(to: url, options: .atomic)
    }
    
}
