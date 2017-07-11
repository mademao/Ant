//
//  AntDownloader.swift
//  AntExample
//
//  Created by Pluto on 2017/7/11.
//  Copyright © 2017年 Pluto. All rights reserved.
//

import UIKit

/// 构建Session配置
func createSessionConfiguration() -> URLSessionConfiguration {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = true
    configuration.httpShouldUsePipelining = false
    configuration.requestCachePolicy = .useProtocolCachePolicy
    configuration.allowsCellularAccess = true
    configuration.timeoutIntervalForRequest = 60.0
    configuration.httpMaximumConnectionsPerHost = 10
    configuration.isDiscretionary = true
    return configuration
}

class AntDownloader: NSObject {
    /// 串行线程
    let synQueue = DispatchQueue(label: "cn.com.Pluto.AntDownloader", attributes: DispatchQueue.Attributes.concurrent)
    /// 基础session
    var session: URLSession?
    /// 最大允许下载数
    let allowMaxDownload: Int
    /// 此时下载数
    var currentDownload: Int = 0
    
    override init() {
        self.allowMaxDownload = 4
        super.init()
        let optionQueue = OperationQueue()
        optionQueue.maxConcurrentOperationCount = 1
        self.session = URLSession(configuration: createSessionConfiguration(), delegate: self, delegateQueue: optionQueue)
    }
}

extension AntDownloader: URLSessionDataDelegate {
    
}
