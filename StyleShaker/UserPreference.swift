//
//  UserPreference.swift
//  StyleShaker
//
//  Created by Valentin Chaillou on 18/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

private let APPEND_RIGHT_SELECTED:String = "_RIGHT_SELECTED"
private let APPEND_ENABLED:String = "_ENABLED"

class UserPreference {
    internal var title:String
    internal var leftValue:String
    internal var rightValue:String
    private var persistenceTagRightSelected:String
    private var persistenceTagEnabled:String
    private var enabled:Bool
    private var rightSelected:Bool
    
    init(sTitle:String, sLeftValue:String, sRightValue:String, sPersistenceTag:String) {
        title = sTitle
        leftValue = sLeftValue
        rightValue = sRightValue
        persistenceTagRightSelected = sPersistenceTag + APPEND_RIGHT_SELECTED
        persistenceTagEnabled = sPersistenceTag + APPEND_ENABLED
        
        // Persistence
        // Par défaut, la préférence est activée, le bouton de gauche est sélectionné
        NSUserDefaults.standardUserDefaults().registerDefaults([persistenceTagEnabled:true, persistenceTagRightSelected:false])
        enabled = NSUserDefaults.standardUserDefaults().boolForKey(persistenceTagEnabled)
        rightSelected = NSUserDefaults.standardUserDefaults().boolForKey(persistenceTagRightSelected)
        
        DataPersistence.getInstance().addUserPreference(self)
    }
    
    deinit {
        DataPersistence.getInstance().removeUserPreference(self)
    }
    
    internal func setEnabled(enable:Bool) {
        enabled = enable
        NSUserDefaults.standardUserDefaults().setBool(enabled, forKey: persistenceTagEnabled)
    }
    
    internal func setRightSelected(rightSelect:Bool) {
        rightSelected = rightSelect
        NSUserDefaults.standardUserDefaults().setBool(rightSelected, forKey: persistenceTagRightSelected)
    }
    
    internal func isEnabled() -> Bool {
        return enabled
    }
    
    internal func isRightSelected() -> Bool {
        return rightSelected
    }
}