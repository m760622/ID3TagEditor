//
//  ViewController.swift
//  Demo tvOS
//
//  Created by Fabrizio Duroni on 14.03.18.
//  Copyright © 2018 Fabrizio Duroni. All rights reserved.
//

import UIKit
import ID3TagEditor

class ViewController: UIViewController {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet weak var attachedPictureImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackPositionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3"))
            titleLabel.text = id3Tag?.title
            artistLabel.text = id3Tag?.artist
            yearLabel.text = id3Tag?.year
            genreLabel.text = "\(id3Tag?.genre?.identifier?.rawValue ?? 0) \(id3Tag?.genre?.description ?? "")"
            trackPositionLabel.text = "Track \(id3Tag?.trackPosition?.position ?? -1) of " +
                                      "\(id3Tag?.trackPosition?.totalTracks ?? -1)"
            if let attachedPictures = id3Tag?.attachedPictures, attachedPictures.count > 0 {
                attachedPictureImage.image = UIImage(data: attachedPictures[0].art)
            }
        } catch {
            print(error)
        }
    }
}
