//
//  File.swift
//  deneme
//
//  Created by mac on 30.08.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct Veriler : Codable {
    let success : Bool
    let result : [Result]
    
}

struct Result: Codable {
    let country: String
    let totalCases: String
    let newCases: String
    let totalDeaths: String
    let newDeaths: String
    let totalRecovered: String
    let activeCases: String
}





