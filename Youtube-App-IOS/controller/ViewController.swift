//
//  ViewController.swift
//  Youtube-App-IOS
//
//  Created by Kapil Bhattarai on 7/28/20.
//  Copyright © 2020 Kapil Bhattarai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var model = Model()
    var videos = [VideoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        model.delegate = self
        model.getVideos()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else{
            return
        }
        
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        let detailVc = segue.destination as! DetailViewController
        
        detailVc.videoItem = selectedVideo
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(Constansts.VideoCell_ID)", for: indexPath) as! VideoTableViewCell
        cell.setcell(videos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func fetchedVideos(_ videos: [VideoItem]) {
        self.videos = videos
        tableView.reloadData()
    }
    
}
