//
//  Enums.swift
//  Seiken
//
//  Created by Shahin on 2017-10-07.
//  Copyright © 2017 98chimp. All rights reserved.
//

import Foundation


enum SeikenUserRole: Int
{
    case nonmember = 0
    case member = 1
}

enum FailureAlertType: String
{
    case signup = "signing up"
    case signin = "signing in"
    case passwordReset = "resetting your password"
    case saveReward = "saving your reward"
    case deleteReward = "deleting your reward"
    case savedTodo = "saving your todo"
    case deleteTodo = "deleting your todo"
    case saveActivity = "saving your activity"
    case deleteActivity = "deleting your activity"
    case memberInvite = "inviting the new member"
    case sendReferral = "sending the referral email"
    case sendSignUp = "sending sign up email"
}
