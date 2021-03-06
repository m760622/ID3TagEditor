//
//  ViewController.swift
//  Demo macOS
//
//  Created by Fabrizio Duroni on 27/02/2018.
//  2018 Fabrizio Duroni
//

import Cocoa
import ID3TagEditor

class ViewController: NSViewController {
    private let id3TagEditor = ID3TagEditor()
    @IBOutlet weak var attachedPictureImage: NSImageView!
    @IBOutlet weak var informations: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            if let id3Tag = try id3TagEditor.read(from: PathLoader().pathFor(name: "example", fileType: "mp3")) {
                if let attachedPictures = id3Tag.attachedPictures, attachedPictures.count > 0 {
                    attachedPictureImage.image = NSImage(data: attachedPictures[0].art)
                }
                informations.stringValue = "\(id3Tag.title ?? "") \n\(id3Tag.artist ?? "")"
                print(id3Tag.title ?? "")
                print(id3Tag.artist ?? "")
                print(id3Tag.album ?? "")
                print(id3Tag.year ?? "")
                print(id3Tag.genre?.identifier ?? "")
                print(id3Tag.genre?.description ?? "")
                print(id3Tag.attachedPictures?[0].type ?? 0x00)
            }
        } catch {
            print(error)
        }
    }
    
    override var representedObject: Any? {
        didSet {}
    }
}
