//
//  AntResource.swift
//  AntExample
//
//  Created by Pluto on 2017/7/11.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

enum AntResourceState {
    case none
    case waiting
    case downloading
    case suspened
    case completed
    case failed
}

public class AntResource: NSObject {
    let urlStr: String
    var state: AntResourceState
    let fileName: String
    var writtenBytes: UInt64
    var totalBytes: UInt64
    
    init(urlStr: String, state: AntResourceState, writtenBytes: UInt64, totalBytes: UInt64) {
        self.urlStr = urlStr
        self.state = state
        self.fileName = urlStr.md5
        self.writtenBytes = writtenBytes
        self.totalBytes = totalBytes
    }
}
