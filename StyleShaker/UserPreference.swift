//
//  UserPreference.swift
//  StyleShaker
//
//  Created by Valentin Chaillou on 18/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

import UIKit

// Les préférences sont accessibles depuis toute l'application
// Si il faut ajouter une préférence, l'ajouter dans les tableaux

// Tableau des préférences de Me
let ME_PREFERENCES:Array<UserPreference> = [
    UserPreference(sKey: "hair", sTitle: "Cheuveux", sLeftValue: "Clairs", sRightValue: "Foncés", sPersistenceTag: "USER_DATA_PREFERENCE_HAIR"),
    UserPreference(sKey: "skin", sTitle: "Peau", sLeftValue: "Claire", sRightValue: "Foncée", sPersistenceTag: "USER_DATA_PREFERENCE_SKIN"),
    UserPreference(sKey: "gender", sTitle: "Sexe", sLeftValue: "Male", sRightValue: "Femelle", sPersistenceTag: "USER_DATA_PREFERENCE_GENDER")]

// Tableau des préférences du Mood
let MOOD_PREFERENCES:Array<UserPreference> = [
    UserPreference(sKey: "Work", sTitle: "Travail", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_WORK"),
    UserPreference(sKey: "party", sTitle: "Soiree", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_NIGHT"),
    UserPreference(sKey: "weekend", sTitle: "Weekend", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_WEEKEND"),
    UserPreference(sKey: "chill", sTitle: "Chill", sLeftValue: "", sRightValue: "", sPersistenceTag: "USER_DATA_PREFERENCE_CHILL")]

private let APPEND_RIGHT_SELECTED:String = "_RIGHT_SELECTED"
private let APPEND_ENABLED:String = "_ENABLED"

// Classe représentant une préférence Me ou Mood
// Pour les préférences Mood, le booléen rightSelected est inutilisé
class UserPreference {
    internal var key:String
    internal var title:String
    internal var leftValue:String
    internal var rightValue:String
    private var persistenceTagRightSelected:String
    private var persistenceTagEnabled:String
    private var enabled:Bool
    private var rightSelected:Bool
    
    init(sKey:String, sTitle:String, sLeftValue:String, sRightValue:String, sPersistenceTag:String) {
        key = sKey
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