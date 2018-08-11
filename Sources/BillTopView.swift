//
//  AccountMiddleCell.swift
//  B7iOSShop
//
//  Created by iOS003 on 2016/11/30.
//  Copyright © 2016年 spzjs.b7iosshop.com. All rights reserved.
//

import UIKit
import Charts

public let SPScreenWidth: CGFloat = UIScreen.main.bounds.width

public class BillTopView: UIView {

//  var model: ChartsModel = ChartsModel(){
//    didSet{
//      if model != oldValue{ setUIData() }
//    }
//  }

  // public
  fileprivate let chartView = UIView()
  fileprivate var pieChart = PieChartView() // 饼图
  fileprivate var dataSet = PieChartDataSet()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    buildUI()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BillTopView {
  fileprivate func setUIData() {
//    let values = [PieChartDataEntry(value: model.validDrawMoney),
//                  PieChartDataEntry(value: model.drawingMoney),
//                  PieChartDataEntry(value: model.invalidDrawMoney),
//                  PieChartDataEntry(value: model.settleMoney)]
//    dataSet.values = values
//    let data = PieChartData(dataSet: dataSet)
//    pieChart.data = data
  }
  
  fileprivate func buildUI() {
    addSubview(chartView)
    layer.masksToBounds = true
    
    buildSubView()
    buildLayout()
  }
  
  private func buildSubView() {
    chartView.addSubview(pieChart)
    let x = (SPScreenWidth - 200) / 2
    pieChart.frame = CGRect(x: Int(x), y: 10, width: 200, height: 200)
    pieChart.legend.enabled = false
    pieChart.isUserInteractionEnabled = false
    pieChart.chartDescription?.enabled = false
    pieChart.drawHoleEnabled = false
    
    let colors = [UIColor.green,
                  UIColor.yellow,
                  UIColor.red,
                  UIColor.blue]
    dataSet.colors = colors
    dataSet.drawIconsEnabled = false
    dataSet.drawValuesEnabled = false
    pieChart.animate(xAxisDuration: 1.0, easingOption: .easeOutExpo)
  }
  
  private func buildLayout() {
    chartView.snp.makeConstraints { (make) in
      make.top.left.bottom.right.equalToSuperview()
    }
  }
}
