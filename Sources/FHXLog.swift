//
//  FHXLog.swift
//  FHXNewWrite
//
//  Created by 冯汉栩 on 2018/8/10.
//

import UIKit

public struct FHXLogsManager {
  //是否开启调试（记得开启或者关闭在AppDelegate里写）
  public static var spEnabled  = true
  public static var netEnabled = true
  public static var logsView = true
  public static var spLogs   = ""
  public static var netLogs  = ""
}

//#file 获取方法调用者所在的文件路径
//#function 获取方法调用者所在的方法名
//#line 获取所在的行数

public func FHXLog<T>(_ debug: T,
                      _ file: String = #file,
                      _ function: String = #function,
                      _ line: Int = #line) {
  let filename = file.ns.lastPathComponent.ns.deletingPathExtension
  if FHXLogsManager.spEnabled {
    print("\(filename):\(function):[\(line)]\(debug)")
  }
  if FHXLogsManager.logsView {
    FHXLogsManager.spLogs += "\n\(filename):\(function):[\(line)]\(debug)"
  }
}

public func NetLogs<T>(_ debug: T,
                       _ file: String = #file,
                       _ function: String = #function,
                       _ line: Int = #line) {
  let filename = file.ns.lastPathComponent.ns.deletingPathExtension
  guard let str = String(describing: debug).removingPercentEncoding else {
    print("\(filename):\(function):[\(line)]\(debug)")
    return
  }
  if(FHXLogsManager.netEnabled){
    print("\(filename):\(function):[\(line)]\(debug)")
  }
  if FHXLogsManager.logsView {
    FHXLogsManager.netLogs += "\n\(filename):\(function):[\(line)]\(debug)"
  }
}

private extension String {
  /// Qorum Extension
  var ns: NSString { return self as NSString }
}

/// 在模拟器上执行
public func onSimulator(_ fun: () -> Void) {
  #if (arch(x86_64) || arch(i386)) && os(iOS)
  fun()
  #endif
}

/// 是否为模拟器
public func isSimulator() -> Bool{
  #if (arch(x86_64) || arch(i386)) && os(iOS)
  return true
  #endif
  return false
}








