//
//  OCPieChartView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 19/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit
import Charts

class OCPieChartView: UIView {

    let parties = ["Party A", "Party B", "Party C", "Party D", "Party E", "Party F",
                   "Party G", "Party H", "Party I", "Party J", "Party K", "Party L",
                   "Party M", "Party N", "Party O", "Party P", "Party Q", "Party R",
                   "Party S", "Party T", "Party U", "Party V", "Party W", "Party X",
                   "Party Y", "Party Z"]

    private var pieChartView: PieChartView = PieChartView()

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
        self.addAutoSubview(pieChartView)
    }

    private func themeViews() {
    }

    private func setupConstraints() {
        pieChartView.leadingToSuperview()
        pieChartView.trailingToSuperview()
        pieChartView.topToSuperview()
        pieChartView.bottomToSuperview()
        pieChartView.aspectRatio(1.2)
    }

    func configure() {
        setPieChart()
    }

    private func setPieChart() {
        setup(pieChartView: pieChartView)
        pieChartView.delegate = self

        self.setPieDataCount(6, range: 100)

        pieChartView.animate(xAxisDuration: 1.4, easingOption: .easeOutCubic)
    }

    func setPieDataCount(_ count: Int, range: UInt32) {
        let entries = (0..<count).map { (i) -> PieChartDataEntry in
            // IMPORTANT: In a PieChart, no values (Entry) should have the same xIndex (even if from different DataSets), since no values can be drawn above each other.
            return PieChartDataEntry(value: Double(arc4random_uniform(range) + range / 5),
                                     label: parties[i % parties.count],
                                     icon: #imageLiteral(resourceName: "ic_round_tick"))
        }

        let set = PieChartDataSet(entries: entries, label: "Results")
        set.drawIconsEnabled = false
        set.sliceSpace = 2
        set.yValuePosition = .outsideSlice
        set.valueLineColor = .clear
        set.valueFont = .sectionSubTitle
        set.valueTextColor = UIColor.silver.withAlphaComponent(0.7)
        set.valueLinePart1OffsetPercentage = 0.5
        set.valueLinePart1Length = 0.1
        set.valueLinePart2Length = 0.1

        set.colors = ChartColorTemplates.vordiplom()
            + ChartColorTemplates.joyful()
            + ChartColorTemplates.colorful()
            + ChartColorTemplates.liberty()
            + ChartColorTemplates.pastel()
            + [UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)]

        let data = PieChartData(dataSet: set)

        let pFormatter = NumberFormatter()
        pFormatter.numberStyle = .percent
        pFormatter.maximumFractionDigits = 1
        pFormatter.multiplier = 1
        pFormatter.percentSymbol = " %"
        data.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))

        pieChartView.data = data
        pieChartView.highlightValues(nil)
    }

    private func setup(pieChartView chartView: PieChartView) {
        chartView.usePercentValuesEnabled = true
        chartView.chartDescription?.enabled = false
        chartView.setExtraOffsets(left: 10, top: 10, right: 10, bottom: 5)
        chartView.drawEntryLabelsEnabled = false

        chartView.drawHoleEnabled = true
        chartView.drawSlicesUnderHoleEnabled = false
        chartView.holeRadiusPercent = 0.9
        chartView.transparentCircleRadiusPercent = 0
        chartView.holeColor = .clear

        chartView.rotationAngle = 0
        chartView.rotationEnabled = true
        chartView.highlightPerTapEnabled = false

        setupCenterText(pieChartView: chartView)
        setupLegend(pieChartView: chartView)

        // entry label styling
        chartView.entryLabelColor = .white
        chartView.entryLabelFont = .systemFont(ofSize: 12, weight: .light)
    }

    private func setupLegend(pieChartView chartView: PieChartView) {
        let legend = chartView.legend
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        legend.xEntrySpace = 15
        legend.yEntrySpace = 15
        legend.yOffset = 12
        legend.maxSizePercent = 0.8
        legend.font = .sectionSubTitle
        legend.form = .circle
        legend.formSize = 10
        legend.formToTextSpace = 7
        legend.stackSpace = 20
        legend.textColor = .silver
        // chartView.legend = legend
    }

    private func setupCenterText(pieChartView chartView: PieChartView) {
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center

        let centerText = NSMutableAttributedString(string: "")
        let percentAttr = NSAttributedString(
            string: "+2.54%",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.silver,
                NSAttributedString.Key.font: UIFont(.montserrat(.bold), size: 24),
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
        )
        let totalAttr = NSAttributedString(
            string: "\nTOTAL",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.silver.withAlphaComponent(0.3),
                NSAttributedString.Key.font: UIFont(.montserrat(.bold), size: 10),
                NSAttributedString.Key.paragraphStyle: paragraphStyle
            ]
        )
        centerText.append(percentAttr)
        centerText.append(totalAttr)

        chartView.drawCenterTextEnabled = true
        chartView.centerAttributedText = centerText
    }
}

extension OCPieChartView: ChartViewDelegate {
}
