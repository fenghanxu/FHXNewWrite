//
//  FHXCache.swift
//  FHXFoundation
//
//  Created by 冯汉栩 on 2018/8/10.
//

import UIKit
import YYCache

public class FHXCache: NSObject {
  
  public static let shared = FHXCache()
  
  fileprivate let cache = YYCache(name: "FHXCache")
  
  fileprivate enum Label: String {
    
    case searchHistory = "kSearchHistory"
    // 用户名称
    case userName = "kUserName"
    
    var name: String{ return self.rawValue}
  }
  
  //硬盘 获取
  fileprivate func cache(forKey key: Label) -> NSCoding? {
    return cache?.object(forKey: key.name)
  }
  
  //硬盘 保存
  fileprivate func cache(_ object: NSCoding?, forKey key: Label){
    cache?.setObject(object, forKey: key.name)
  }
  
  //缓存 获取
  fileprivate func memoryCache(forKey key: Label) -> Any? {
    return cache?.memoryCache.object(forKey: key.name)
  }
  
  //缓存 保存
  fileprivate func memoryCache(_ object: NSCoding?, forKey key: Label){
    cache?.memoryCache.setObject(object, forKey: key.name)
  }
  
  func cache(forKey key: String) -> NSCoding? {
    return cache?.object(forKey: key)
  }
  
  func cache(_ object: NSCoding?, forKey key: String){
    cache?.setObject(object, forKey: key)
  }
  
}

//保存 searchArr
extension FHXCache {
  // 硬盘数组
  public var searchHistories: [String] {
    set{
      cache(newValue as NSCoding, forKey: .searchHistory)
    }
    get{
      return cache(forKey: .searchHistory) as? [String] ?? [String]()
    }
  }
  // 添加硬盘数组
  public func searchHistories(append str: String) {
    if str.isEmpty { return }
    if searchHistories.contains(str) { return }
    searchHistories += [str]
  }
  // 删除单个硬盘中的数组
  public func searchHistories(remove str: String) {
    if str.isEmpty { return }
    searchHistories = searchHistories.filter({ (item) -> Bool in
      return item != str
    })
  }
  // 删除硬盘中的全部数组
  public func searchHistoriesRemoveAll() {
    searchHistories.removeAll()
  }
  
}

// 保存用户名称 -- 用户缓存的
extension FHXCache {
  
  var userName:String {
    set{
      if newValue != userName {
        memoryCache(newValue as NSCoding, forKey: .userName)
      }
    }
    get{
      return memoryCache(forKey: .userName) as? String ?? ""
    }
  }
  
}
