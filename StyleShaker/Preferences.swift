//
//  DataPersistence.swift
//  StyleShaker
//
//  Created by Karthikan KANDASAMY on 25/06/2016.
//  Copyright © 2016 ESGI. All rights reserved.
//

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

