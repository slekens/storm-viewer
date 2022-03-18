//
//  WindowController.swift
//  StormViewer
//
//  Created by Abraham Abreu on 18/03/22.
//

import Cocoa

class WindowController: NSWindowController {

    @IBOutlet var shareButton: NSButton!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        shareButton.sendAction(on: .leftMouseDown)
    }
}
