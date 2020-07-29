//
//  VideoTableViewCell.swift
//  Youtube-App-IOS
//
//  Created by Kapil Bhattarai on 7/29/20.
//  Copyright © 2020 Kapil Bhattarai. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var videoDate: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setcell( _ v: VideoItem)  {
        
        videoTitle.text = v.title
        videoDate.text = v.published
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE, MMM d, yyyy"
        let date = dateFormat.date(from: v.published)
        
        if let publishedDate = date {
            videoDate.text = dateFormat.string(from: publishedDate)
        }
        
        if v.thumbnail != "" {
            
            if  let cacheData = CacheManager.getVideoCache(v.thumbnail) {
                thumbnailImageView.image = UIImage(data: cacheData)
                return
            }
            let url = URL(string: v.thumbnail)
            let session = URLSession.shared
            guard url != nil else {
                return
            }
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                if error == nil && data != nil {
                    if url!.absoluteString != v.thumbnail {
                        return
                    }
                    CacheManager.setVideoCache(url!.absoluteString, data!)
                    let image = UIImage(data: data!)
                    DispatchQueue.main.async {
                        self.thumbnailImageView.image = image
                    }
                }
            }
            dataTask.resume()
        }
        
    }
}
