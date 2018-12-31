//
//  ViewController.swift
//  LunchPad
//
//  Created by Wayne Lustberg on 11/15/18.
//  Copyright © 2018 Wayne Lustberg. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var textBox: NSTextField!
    @IBOutlet var collectionView: NSCollectionView!
    @IBAction func btnClick(_ sender: Any) {
        filteredData = textBox.stringValue == "" ? scratchPads : scratchPads.filter { pad -> Bool in
            return pad.title.lowercased().range(of: textBox.stringValue.lowercased()) != nil
            
        }
        collectionView.reloadData()
    }
    
    
    @IBAction func textBoxChange(_ sender: Any) {
        filteredData = textBox.stringValue.isEmpty ? scratchPads : scratchPads.filter { pad -> Bool in
            return pad.title.range(of: textBox.stringValue) != nil
        }
        collectionView.reloadData()
    }
    
    var scratchPads = [ScratchPad]()
    var filteredData = [ScratchPad]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 100.0, height: 100.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        collectionView.collectionViewLayout = flowLayout
        view.wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
        
        scratchPads.append(ScratchPad(title: "Project 1", language: ScratchPad.Language.python))
        scratchPads.append(ScratchPad(title: "Some Calculations", language: ScratchPad.Language.ruby))
        scratchPads.append(ScratchPad(title: "My scratchpad", language: ScratchPad.Language.javascript))
        scratchPads.append(ScratchPad(title: "Another test", language: ScratchPad.Language.javascript))
        
        filteredData = scratchPads
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
}

extension ViewController: NSCollectionViewDataSource{
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int{
        return filteredData.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier:NSUserInterfaceItemIdentifier(rawValue: "LabelItem"), for: indexPath)
        guard let myItem = item as? LabelItem else { return item }
        myItem.scratchPad = filteredData[indexPath.item]
        return myItem
    }
}


