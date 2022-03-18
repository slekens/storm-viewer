//
//  ViewController.swift
//  StormViewer
//
//  Created by Abraham Abreu on 16/03/22.
//

import Cocoa

class ViewController: NSSplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func shareClicked(_ sender: NSView) {
        guard let detail = children[1] as? DetailViewController else { return }
        guard let image = detail.imageView.image else { return }
        
        let picker = NSSharingServicePicker(items: [image])
        picker.show(relativeTo: .zero, of: sender, preferredEdge: .minY)
    }
    
    @IBAction func showAboutInfo(_ sender: NSView) {
        guard let detail = children[1] as? DetailViewController else { return }
        
        let alert = NSAlert()
        alert.informativeText = "App made by Slekens."
        alert.messageText = "Thanks for using it!"
        alert.runModal()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

