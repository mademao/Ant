//
//  FileHelper.swift
//  AntExample
//
//  Created by Dareway on 2017/7/11.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import Foundation

fileprivate let AntDirName = "Ant"
fileprivate let AntFileDirName = "AntFile"
fileprivate let AntFileInfoName = "AntInfo.plist"

func getAntDir() -> String {
    var document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    document = document + "/" + AntDirName
    let fileManager = FileManager.default
    try! fileManager.createDirectory(atPath: document, withIntermediateDirectories: true, attributes: nil)
    return document
}

func getAntFileDir() -> String {
    var dir = getAntDir()
    dir = dir + "/" + AntFileDirName
    let fileManager = FileManager.default
    try! fileManager.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
    return dir
}
