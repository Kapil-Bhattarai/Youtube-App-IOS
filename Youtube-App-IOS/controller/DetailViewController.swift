//
//  DetailViewController.swift
//  Youtube-App-IOS
//
//  Created by Kapil Bhattarai on 7/29/20.
//  Copyright © 2020 Kapil Bhattarai. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var webVIew: WKWebView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var videoItem : VideoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            
        textview.text = ""
        dateLabel.text = ""
        titleLabel.text = ""
        
        guard videoItem!.videoId != nil else {
            return
        }
        
        let embedUrl = Constansts.YT_EMBDED + videoItem!.videoId
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webVIew.load(request)
        
        titleLabel.text = videoItem?.title
        dateLabel.text = videoItem?.published
        textview.text = videoItem?.description
        
    }
}
