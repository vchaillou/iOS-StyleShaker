//
//  DataPersistence.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

class DataPersistence {
    static var dataPersistence:DataPersistence = DataPersistence()
    
    private var data:Array<UserPreference>
    
    
    internal static func getInstance() -> DataPersistence {
        return dataPersistence
    }
    
    
    init() {
        data = Array<UserPreference>()
    }
    
    // getter/setter
    internal func addUserPreference(userPreference:UserPreference) -> Void {
        data.append(userPreference)
    }
    
    internal func removeUserPreference(userPreference:UserPreference) -> Void {
        data = data.filter {
            $0.title != userPreference.title
        }
    }
    
    internal func getUserPreferences() -> Array<UserPreference> {
        return data
    }
}