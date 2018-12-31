//
//  LabelItem.swift
//  LunchPad
//
//  Created by Wayne Lustberg on 11/26/18.
//  Copyright © 2018 Wayne Lustberg. All rights reserved.
//

import Cocoa

public class LabelItem: NSCollectionViewItem {

    var scratchPad: ScratchPad? {
        didSet {
            guard isViewLoaded else { return }
            if let x = scratchPad {
                textField?.stringValue = x.title
                imageView?.image = GetIconName(language: x.language)
            } else {
                textField?.stringValue = ""
                imageView?.image = NSImage(named:"PythonIcon")!
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func GetIconName(language: ScratchPad.Language) -> NSImage {
        switch language{
        case .python: return NSImage(named: "PythonIcon")!
        case .javascript: return NSImage(named: "JavascriptIcon")!
        case .ruby: return NSImage(named: "RubyIcon")!
        }
    }
}
