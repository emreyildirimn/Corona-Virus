//
//  jsonDownloader.swift
//  deneme
//
//  Created by mac on 1.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
class json {
    var countries : [String] = []
    var totalCases : [String] = []
    var newCases : [String] = []
    var totalDeath : [String] = []
    var newDeaths : [String] = []
    var totalRecovered : [String] = []
    var activeCases : [String] = []
    func jsonStepTwo () {
        let headers = [
           "content-type": "application/json",
           "authorization": "apikey 7coLvWmb1XPh3K5K79ZAo1:0EPXQKFEZFr7zwUBeZWLbN"
         ]

         let request = NSMutableURLRequest(url: NSURL(string: "https://api.collectapi.com/corona/countriesData")! as URL,
                                                 cachePolicy: .useProtocolCachePolicy,
                                             timeoutInterval: 10.0)
         request.httpMethod = "GET"
         request.allHTTPHeaderFields = headers

         let session = URLSession.shared


        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
              print("Error1: \(error!)")
              return
            }
         let decoder = JSONDecoder()
         do {
            let result = try decoder.decode(Veriler.self, from: data)
            let counter = result.result
           for i in 0..<counter.count {
            self.countries.append(counter[i].country)
            self.totalCases.append(counter[i].totalCases)
            self.newCases.append(counter[i].newCases)
            self.totalDeath.append(counter[i].totalDeaths)
            self.newDeaths.append(counter[i].newDeaths)
            self.totalRecovered.append(counter[i].totalRecovered)
            self.activeCases.append(counter[i].activeCases)
           }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
         } catch {
           print(error)
         }
        }
        dataTask.resume()
    }
}
