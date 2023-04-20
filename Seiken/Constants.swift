//
//  Constants.swift
//  Seiken
//
//  Created by Shahin on 2017-10-01.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation

let kMinimumPasswordLength = 8

func execute(after delay:Double, closure:@escaping ()->())
{
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

struct Constants
{
    struct SegueIdentifiers
    {
        static let toMain = "segueToMain"
        static let toSignin = "segueToSignin"
        static let toSignup = "segueToSignup"
        static let toWelcome = "toWelcome"
        static let toBeltCriteria = "toBeltCriteria"
        static let toBeltDetail = "toBeltDetail"
        static let toVideos = "toVideos"
        static let toTerminology = "toTerminology"
        static let toReferral = "toReferral"
        static let toEvents = "toEvents"
        static let toStudent = "toStudent"
        static let toGoalSetter = "toGoalSetter"
        static let toTieBelt = "toTieBelt"
        static let toSchedule = "toSchedule"
        static let toContact = "toContact"
        static let toMore = "toMore"
        static let toGallery = "toGallery"
        static let toGalleryDetail = "toGalleryDetail"
        static let toPrograms = "toPrograms"
        static let toEventDetail = "to event detail"
    }
    
    struct Storyboards
    {
        static let initial = "Initial"
        static let auth = "Authentication"
        static let welcome = "Welcome"
        static let main = "Main"
    }
    
    struct ViewControllers
    {
        static let initialVC = "Initial View Controller"
        static let tabBarVC = "Tab Bar Controller"
        static let summaryVC = "Summary View Controller"
        static let rewardsVC = "Rewards View Controller"
        static let rewardDetailVC = "Reward Detail View Controller"
        static let rewardRedeemVC = "Reward Redeem View Controller"
        static let welcome1 = "Welcome1VC"
        static let welcome2 = "Welcome2VC"
        static let welcome3 = "Welcome3VC"
        static let welcome4 = "Welcome4VC"
        static let welcome5 = "Welcome5VC"
    }
    
    struct ReuseIdentifiers
    {
        static let beltCell = "beltCell"
        static let galleryCell = "galleryCell"
    }
    
    struct SettingsOptions
    {
    }
    
    struct Notifications
    {
    }
    
    struct SKTextField
    {
        static let iconFont = "FontAwesome"
        static let emailIcon = "\u{f0e0}"
        static let passwordIcon = "\u{f023}"
        static let calendarIcon = "\u{f073}"
        static let personIcon = "\u{f007}"
        static let ageIcon = "\u{f1ae}"
        static let phoneIcon = "\u{f095}"
    }
    
    struct AlertService
    {
        static let attributedTitle = "attributedTitle"
        static let attributedMessage = "attributedMessage"
    }
    
    struct HUD
    {
        struct Status
        {
        }
    }
    
    struct Firebase
    {
        struct References
        {
            static let users = "users"
            static let galleryPhotos = "galleryPhotos"
            static let galleryThumbnails = "galleryThumbnails"
            static let events = "events"
            static let studentOfTheMonth = "studentOfTheMonth"
        }
        
        struct Keys
        {
            struct Users
            {
                static let firstName = "firstName"
                static let lastName = "lastName"
                static let birthDate = "birthDate"
                static let email = "email"
                static let userID = "userID"
                static let role = "role"
            }
            
            struct Events
            {
                static let upcomingClosure = "upcomingClosure"
                static let upcomingGradingTest = "upcomingGradingTest"
                static let upcomingMovieNight = "upcomingMovieNight"
                static let upcomingParties = "upcomingParties"
                static let upcomingTournament = "upcomingTournament"
                static let link = "link"
                static let title = "title"
            }
            
            struct StudentOfTheMonth
            {
                static let link = "link"
                static let name = "name"
            }
        }
    }
    
    struct Keys
    {
        struct SessionService
        {
            static let token = "token"
            static let userID = "userID"
            static let notFound = "not found"
        }
    }
}
