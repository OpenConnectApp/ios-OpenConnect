//
//  OCLineChartView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit
import Charts

class OCLineChartView: UIView {

    private var lineChartView: LineChartView = LineChartView()

    private let chartFilterCV: UICollectionView = .collectionview(scrollDirection: .horizontal)

    private let chartFilters: [String] = [
        "1h", "24h", "7d", "30d", "90d", "1y", "All"
    ]

    private var filterSelectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViews()
        themeViews()
        setupConstraints()
    }

    private func setupViews() {
        self.addAutoSubviews([chartFilterCV, lineChartView])

        chartFilterCV.register(TransactionFilterCVCell.self)

        if let layout = chartFilterCV.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 52, height: 32)
            layout.itemSize = UICollectionViewFlowLayout.automaticSize
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }

        chartFilterCV.delegate = self
        chartFilterCV.dataSource = self
    }

    private func themeViews() {
    }

    private func setupConstraints() {
        chartFilterCV.edgesToSuperview(excluding: .bottom)
        chartFilterCV.height(40)

        lineChartView.leadingToSuperview()
        lineChartView.trailingToSuperview()
        lineChartView.topToBottom(of: chartFilterCV, offset: 5)
        lineChartView.aspectRatio(3 / 2)
        lineChartView.bottomToSuperview(offset: -20)
    }
    
    func configure() {
        setLineChart()
    }

    private func setLineChart() {
        setup(lineChartView: lineChartView)

        let data = dataWithCount(36, range: 100)
        data.setValueFont(UIFont(name: "HelveticaNeue", size: 7)!)

        lineChartView.data = data

        lineChartView.animate(xAxisDuration: 2)
    }

    func dataWithCount(_ count: Int, range: UInt32) -> LineChartData {
        let yVals = (0..<count).map { i -> ChartDataEntry in
            let val = Double(arc4random_uniform(range)) + 3
            return ChartDataEntry(x: Double(i), y: val)
        }

        let set1 = LineChartDataSet(entries: yVals, label: "DataSet 1")

        set1.lineWidth = 2
        set1.drawCirclesEnabled = false
        set1.mode = .horizontalBezier
        set1.circleRadius = 0
        set1.circleHoleRadius = 0
        set1.drawFilledEnabled = true
        set1.fillColor = UIColor.aquamarine.withAlphaComponent(0.2)
        set1.setColor(.aquamarine)
        set1.setCircleColor(.clear)
        set1.highlightColor = .white
        set1.drawValuesEnabled = false

        return LineChartData(dataSet: set1)
    }

    func setup(lineChartView chartView: LineChartView) {
        //(data[0] as! LineChartDataSet).circleHoleColor = color

        chartView.delegate = self
        chartView.backgroundColor = .clear

        chartView.chartDescription?.enabled = false

        chartView.dragEnabled = true
        chartView.setScaleEnabled(true)
        chartView.pinchZoomEnabled = false
        chartView.setViewPortOffsets(left: 50, top: 0, right: 10, bottom: 0)

        chartView.legend.enabled = false
        chartView.borderLineWidth = 0.5

        chartView.leftAxis.axisLineColor = UIColor(hexString: "#ffffff").withAlphaComponent(0.2)
        chartView.leftAxis.enabled = true
        chartView.leftAxis.spaceTop = 0.4
        chartView.leftAxis.spaceBottom = 0.4
        chartView.leftAxis.labelTextColor = .silver20
        chartView.leftAxis.labelXOffset = -5
        chartView.leftAxis.drawAxisLineEnabled = false
        chartView.leftAxis.gridLineWidth = 0.3
        chartView.rightAxis.enabled = false
        chartView.xAxis.enabled = false
    }
}

extension OCLineChartView: ChartViewDelegate {
}

extension OCLineChartView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chartFilters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TransactionFilterCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.labelFont = .sectionSubTitle
        cell.selectedLabelFont = .heading
        cell.selectedBorderColor = .warmBlue
        cell.labelColor = UIColor.silver.withAlphaComponent(0.8)
        cell.selectedLabelColor = .silver
        cell.labelBgColor = .clear
        cell.selectedLabelBgColor = .darkGreyBlue
        let item = chartFilters[indexPath.row]
        cell.configure(title: item, indexPath: indexPath, isSelected: indexPath.row == filterSelectedIndex)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filterSelectedIndex = indexPath.row
        let offset = collectionView.contentOffset
        collectionView.reloadData()
        collectionView.contentOffset = offset
    }
}
