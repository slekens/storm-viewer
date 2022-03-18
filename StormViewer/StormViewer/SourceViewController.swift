//
//  SourceViewController.swift
//  StormViewer
//
//  Created by Abraham Abreu on 16/03/22.
//

import Cocoa

class SourceViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    
    private var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    func selectRowAt(_ index: Int) {
        guard let splitVC = parent as? NSSplitViewController else {
            return
        }
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pictures[0])
        }
    }
}

extension SourceViewController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        let imageName = pictures[row]
        vw.textField?.stringValue = imageName
        vw.imageView?.image = NSImage(named: imageName)
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else {
            return
        }
        selectRowAt(tableView.selectedRow)
    }
}
