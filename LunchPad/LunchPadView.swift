//
//  LunchPadView.swift
//  Demo
//
//  Created by Roben Kleene on 12/31/18.
//  Copyright © 2018 Wayne Lustberg. All rights reserved.
//

import Cocoa

public class LunchPadView: NSView {

    @IBOutlet var contentView: NSView!

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet var textBox: NSTextField!
    @IBOutlet var collectionView: NSCollectionView!
    @IBAction func btnClick(_ sender: Any) {
        filteredData = textBox.stringValue.isEmpty ? scratchPads : scratchPads.filter { pad -> Bool in
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

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    // MARK: Private

    private func setupContentView() {
        let bundle = Bundle(for: type(of:self))
        guard let nib = NSNib(nibNamed: "LunchPadView", bundle: bundle) else {
            assert(false)
            return
        }
        nib.instantiate(withOwner: self, topLevelObjects: nil)
        addSubview(contentView)
    }
    
    private func setupCollectionView() {
        let flowLayout = NSCollectionViewFlowLayout()
        flowLayout.itemSize = NSSize(width: 100.0, height: 100.0)
        flowLayout.sectionInset = NSEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        collectionView.collectionViewLayout = flowLayout
        wantsLayer = true
        collectionView.layer?.backgroundColor = NSColor.black.cgColor
        
        scratchPads.append(ScratchPad(title: "Project 1", language: ScratchPad.Language.python))
        scratchPads.append(ScratchPad(title: "Some Calculations", language: ScratchPad.Language.ruby))
        scratchPads.append(ScratchPad(title: "My scratchpad", language: ScratchPad.Language.javascript))
        scratchPads.append(ScratchPad(title: "Another test", language: ScratchPad.Language.javascript))
        
        filteredData = scratchPads
    }

}

extension LunchPadView: NSCollectionViewDataSource {
    
    public func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int{
        return filteredData.count
    }
    
    public func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier:NSUserInterfaceItemIdentifier(rawValue: "LunchPadItem"),
                                           for: indexPath)
        guard let myItem = item as? LunchPadItem else { return item }
        myItem.scratchPad = filteredData[indexPath.item]
        return myItem
    }
}
