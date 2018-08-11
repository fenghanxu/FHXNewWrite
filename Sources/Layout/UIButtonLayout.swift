//
//  UIButtonLayout.swift
//  sharesChonse
//
//  Created by 冯汉栩 on 2017/11/20.
//  Copyright © 2017年 fenghanxuCompany. All rights reserved.
//

/*
 let button = UIButton(type: .custom).hxAddSubView(toSuperView: view).hxLayout { (make) in
 make.centerX.equalToSuperview()
 make.centerY.equalToSuperview().offset(50)
 make.width.equalTo(100)
 make.height.equalTo(50)
 }.hxConfig { (button) in
 button.hx
 .ButtonTitle(title: "button", for: .normal)
 .ButtonTitleColor(color: Color.blue, for: .normal)
 .ButtonFont(systemFontOfSize: Font.font18)
 .ButtonBackgroundColor(Color: Color.background, for: .normal)
 .ButtonQYCornerRadius(radius: 10)
 .ButtonBKborder(width: 1.0, Color: Color.price)
 .ButtonAddTarget(selector: #selector(buttonClick))
 }
 
 @objc func buttonClick(){
 print("ok")
 }
 
 */

import UIKit

extension NameSpace where Base == UIButton {
    
        /*设置文字内容*/
        @discardableResult
        public func ButtonTitle(title: String, for state: UIControlState) -> Self {
            base.setTitle(title, for:state)
            return self
        }

        /*设置不同状态下文字的颜色*/
        @discardableResult
        public func ButtonTitleColor(color: UIColor, for state: UIControlState) -> Self {
            base.setTitleColor(color, for: state)
            return self
        }
    
        /*设置不同状态下文字阴影的颜色*/
        @discardableResult
        public func ButtonTitleShadowColor(color: UIColor, for state: UIControlState) -> Self {
            base.setTitleShadowColor(color, for:state)
            return self
        }
    
        /*设置文字大小*/
        @discardableResult
        public func ButtonFont(systemFontOfSize: UIFont) -> Self {
            base.titleLabel?.font = systemFontOfSize
            return self
        }
    
        /*按键背景颜色*/
        @discardableResult
        public func ButtonBackgroundColor(Color: UIColor, for state: UIControlState) -> Self {
            base.setBackgroundColor(color: Color, for: state)
            return self
        }
    
        /*设置图片*/
        @discardableResult
        public func ButtonImage(named: String) -> Self {
            base.setImage(UIImage(named:named), for: .normal)
            return self
        }
    
    
        /*使触摸模式下按钮也不会变暗（半透明)*/
        @discardableResult
        public func ButtonAdjustsImageWhenHighlighted(state:Bool) -> Self {
            base.adjustsImageWhenHighlighted = state
            return self
        }
    
        /*背景图片*/
        @discardableResult
        public func ButtonSetBackgroundImage(named:String) -> Self {
            base.setBackgroundImage(UIImage(named:named), for:.normal)
            return self
        }
    
        /*切圆*/
        @discardableResult
        public func ButtonQYCornerRadius(radius:CGFloat) -> Self {
            base.layer.cornerRadius = radius
            base.layer.masksToBounds = true
            return self
        }
    
        /*设置边框颜色和大小*/
        @discardableResult
        public func ButtonBKborder(width:CGFloat, Color:UIColor) -> Self {
            base.layer.borderWidth = width
            base.layer.borderColor = Color.cgColor
            return self
        }
    
        /*点击事件*/
        @discardableResult
        public func ButtonAddTarget(selector: Selector) -> Self  {
            base.addTarget(self, action: selector, for: .touchUpInside)
            return self
        }
    
    
}

extension UIButton {
  
  /// 设置背景颜色
  ///
  /// - Parameters:
  ///   - color: color
  ///   - forState: Button状态
  func setBackgroundColor(color: UIColor,for forState: UIControlState) {
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
    UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    self.setBackgroundImage(colorImage, for: forState)
  }
  
}


