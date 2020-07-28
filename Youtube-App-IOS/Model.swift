//
//  Model.swift
//  Youtube-App-IOS
//
//  Created by Kapil Bhattarai on 7/28/20.
//  Copyright © 2020 Kapil Bhattarai. All rights reserved.
//

import Foundation

struct Model {
    
    func getVideos() {
            
        let url = URL(string: "\(Constansts.API_URL)")
        
        guard url != nil else{
            return
        }
        
        let session  = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if data == nil || error != nil{
                return
            }
            
        }
        
        dataTask.resume()
    }
}
