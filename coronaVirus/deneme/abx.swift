//
//  abx.swift
//  deneme
//
//  Created by mac on 2.09.2020.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class abx: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()




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
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
          if (error != nil) {
             print (error)
          } else {
            let httpResponse = response as? HTTPURLResponse
          // print(httpResponse!)
          }
         let decoder = JSONDecoder()
         do {
             let result = try decoder.decode(Veriler.self, from: data!)
             let counter = result.result
           for i in 0..<counter.count {
            ulkeler.append(counter[i].country)
            totalCases.append(counter[i].totalCases)
            newCases.append(counter[i].newCases)
            totalDeath.append(counter[i].totalDeaths)
            newDeaths.append(counter[i].newDeaths)
            totalRecovered.append(counter[i].totalRecovered)
            activeCases.append(counter[i].activeCases)
           }
         } catch {
           print(error)

         }
           
        })
        dataTask.resume()
         print (ulkeler)














    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
