//
//  AntResource.swift
//  AntExample
//
//  Created by Pluto on 2017/7/11.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

enum AntResourceState: Int {
    case none
    case waiting
    case downloading
    case suspened
    case completed
    case failed
}

public class AntResource: NSObject, NSCoding {
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
        //为了避免计算进度比例的时候除数小于1造成的计算错误，此处做处理
        self.totalBytes = totalBytes >= 1 ? totalBytes : 1
    }
    
    // MARK: - NSCoding
    public required init?(coder aDecoder: NSCoder) {
        self.urlStr = aDecoder.decodeObject(forKey: "urlStr") as! String
        self.state = AntResourceState(rawValue: Int(aDecoder.decodeCInt(forKey: "state")))!
        self.fileName = aDecoder.decodeObject(forKey: "fileName") as! String
        self.writtenBytes = UInt64(aDecoder.decodeInt64(forKey: "writeenBytes"))
        self.totalBytes = UInt64(aDecoder.decodeInt64(forKey: "totalBytes"))
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.urlStr, forKey: "urlStr")
        aCoder.encodeCInt(Int32(self.state.rawValue), forKey: "state")
        aCoder.encode(self.fileName, forKey: "fileName")
        aCoder.encode(Int64(self.writtenBytes), forKey: "writeenBytes")
        aCoder.encode(Int64(self.totalBytes), forKey: "totalBytes")
    }
}

