//
//  ViewController.swift
//  LunchPad
//
//  Created by Wayne Lustberg on 11/15/18.
//  Copyright © 2018 Wayne Lustberg. All rights reserved.
//

import Cocoa
import LunchPad

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let lunchPadView = LunchPadView(frame: view.bounds)
        lunchPadView.autoresizingMask = [.width, .height]
        view.addSubview(lunchPadView)
    }
}
