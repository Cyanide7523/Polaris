//
//  ThirdLineStations.swift
//  Polaris
//
//  Created by 이씨안 on 2017. 4. 29..
//  Copyright © 2017년 이시안. All rights reserved.
//

import Foundation

var apiURL = NSURL(string:"http://openapi.seoul.go.kr:8088/575241456c43796137356c54787665/xml/SearchSTNBySubwayLineService/1/44/3/")

var stationCount:Int?

struct station {
    var stationCode:UInt
    var stationName:String
    var lineNumber:UInt
    var frCode:UInt
}
