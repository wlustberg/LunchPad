//
//  ScatchPad.swift
//  LunchPad
//
//  Created by Wayne Lustberg on 12/1/18.
//  Copyright © 2018 Wayne Lustberg. All rights reserved.
//

import Foundation

public class ScratchPad {
    
    public enum Language {
        case javascript
        case python
        case ruby
    }
    public var title: String
    public var language: Language
    
    public init(title: String, language: Language){
        self.title = title
        self.language = language
    }
}
