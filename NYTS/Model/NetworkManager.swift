//
//  NetworkManager.swift
//  NYTS
//
//  Created by Thahi on 08/07/2021.
//

import Foundation
//@Published var posts = [Post]()
class NetworkManager: ObservableObject {

    @Published var posts = [Post]()
    
    let newsUrl = "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=O0FOsCkvdHUnadaVDnwYP2uZVN3pgBEG"
    
func fetchData() {
    if let url = URL(string: newsUrl){
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error == nil{
                                let decoder = JSONDecoder()
                                if let safeData = data{
                                    do{
                                let results = try decoder.decode(Results.self, from: safeData)
                                        DispatchQueue.main.async {
                                            self.posts = results.results
                                        }
                
                                    }catch{
                                        print(error)
                                    }
                                }
                            }
                        }
                        task.resume()
                        }
        }

    }
    
 
