//
//  Model.swift
//  Youtube-App-IOS
//
//  Created by Kapil Bhattarai on 7/28/20.
//  Copyright © 2020 Kapil Bhattarai. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func fetchedVideos(_ videos : [VideoItem])
}
struct Model {
    
    var delegate: ModelDelegate?
    
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
            do{
                let decoder = JSONDecoder()
               //decoder.dateDecodingStrategy = .iso8601
                let video = try decoder.decode(Video.self, from: data!)
               
                let videoItems = video.items?.map { ( item : Item) in
                    VideoItem(videoId: item.snippet?.resourceId?.videoId ?? "", title: item.snippet?.title ?? "", description: item.snippet?.description ?? "", thumbnail: item.snippet?.thumbnails?.high?.url ?? "", published: item.snippet?.publishedAt ?? "")
                }
                 if  let videos = videoItems {
                    DispatchQueue.main.async {
                            self.delegate?.fetchedVideos(videos)
                    }
                
                }
               
            }catch{
                print(error)
                return
            }
            
        }
        
        dataTask.resume()
    }
}
