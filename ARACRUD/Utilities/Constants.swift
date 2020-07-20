//
//  Constants.swift
//  ARACRUD
//
//  Created by Toni De Gea on 17/07/2020.
//  Copyright © 2020 Toni De Gea. All rights reserved.
//

import Foundation



typealias CompletionHandler = (_ Success: Bool) -> ()


//MARK: - URLs

let BASE_URL =  "https://5f0ff22d00d4ab001613446c.mockapi.io/api/v1/user"


//MARK: - Params

let PARAM_DESC = "/user?sortBy=createdAt&order=desc"


//MARK: - Identifiers

let mainCell = "MainCell"

//MARK: - Segues

let TO_DETAIL = "toDetail"
let TO_NEW = "toNew"
let TO_UPDATE = "toUpdate"


//MARK: - Notification Center

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_USER_DETAIL_DID_CHANGE = Notification.Name("notifUserDetailChanged")

