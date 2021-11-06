//
//  ViewController.swift
//  testWebServices
//
//  Created by Prateek Kumar on 19/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    let session: URLSession = {
        let config = URLSessionConfiguration.default
        return  URLSession(configuration: config)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // call the get countries list API
        
        getCountriesList()
        
        // call the Holiday list api fot US and year 2019.
        
        print("PRINTING the Holiday List now for US and 2019")
        getHolidayList()
    }
    
    
    func getHolidayList(){
        
        //let url = URL(string: "https://apple.com/ca/");
        
        let url = URL(string: "https://calendarific.com/api/v2/holidays?api_key=a90c5506798ec879722ab2118542a928955410fa&country=US&year=2019");
        
//        let url = URL(string: "https://ocr-text-extractor.p.rapidapi.com/detect-text-from-image-uri");
        
        
        let request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
        
        let task = session.dataTask(with: request){
            (data, response, error) -> Void in
            
            print("Starting data filtering")
            
            if let jsonData = data{
//                if let jsonString = String(data: jsonData, encoding: .utf8){
//                    print(jsonString)
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    guard
//                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
//                        let results = jsonDictionary["holidays"] as? [[String:Any]] else{
//                        preconditionFailure("GUARD STATEMENT FAILED")
//                    }
                    //print(results[0])
                    
                    print(jsonObject)
                } catch let error {
                    print("Error creating json object: \(error)")
                }
            }else if let requestError = error{
                print("Error fetching data:\(requestError)")
            }
            else{
                print("Unexpected error with the request")
            }
            
        }
        
        task.resume()
        
    }
    
     func getCountriesList(){

    let url = URL(string: "https://calendarific.com/api/v2/countries?api_key=a90c5506798ec879722ab2118542a928955410fa")

    let request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
           
           
           
           let task = session.dataTask(with: request){
               (data, response, error) -> Void in
               
               print("Starting data filtering")
               
               if let jsonData = data{
    //
                   do{
                       let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
    //                    guard
    //                        let jsonDictionary = jsonObject as? [AnyHashable: Any],
    //                        let results = jsonDictionary["holidays"] as? [[String:Any]] else{
    //                        preconditionFailure("GUARD STATEMENT FAILED")
    //                    }
                       //print(results[0])
                       
                       print(jsonObject)
                   } catch let error {
                       print("Error creating json object: \(error)")
                   }
               }else if let requestError = error{
                   print("Error fetching data:\(requestError)")
               }
               else{
                   print("Unexpected error with the request")
               }
               
           }
           
           task.resume()
       }
    }





