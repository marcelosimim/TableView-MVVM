//
//  CarRotationResultView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

protocol CarRotationResultViewProtocol {
    var view: UIView { get }

    func setupDayLabels(_ days: [Weekday])
    func setupRestriction(_ weekday: Weekday)
}

class CarRotationResultView: CarRotationResultViewProtocol {
    var view = UIView()
    private lazy var labels: [UILabel] = [todayLabel, tomorrowLabel, day3Label, day4Label, day5Label, day6Label, day7Label]

    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tomorrowLabel: UILabel = {
        let label = UILabel()
        label.text = "Amanhã: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var day3Label: UILabel = {
        let label = UILabel()
        label.text = "Depois de amanhã: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var day4Label: UILabel = {
        let label = UILabel()
        label.text = "Daqui a 3 dias: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var day5Label: UILabel = {
        let label = UILabel()
        label.text = "Daqui a 4 dias: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var day6Label: UILabel = {
        let label = UILabel()
        label.text = "Daqui a 5 dias: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var day7Label: UILabel = {
        let label = UILabel()
        label.text = "Daqui a 6 dias: "
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var daysStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [todayLabel, tomorrowLabel, day3Label, day4Label, day5Label, day6Label, day7Label])
        stack.spacing = 8
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    init() {
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        view.addSubview(daysStack)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            daysStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            daysStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            daysStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
        ])
    }

    func setupDayLabels(_ days: [Weekday]) {
        var index = 0
        labels.forEach {
            $0.text?.append(days[index].title)
            $0.tag = days[index].rawValue
            index += 1
        }
    }

    func setupRestriction(_ weekday: Weekday) {
        labels.forEach {
           let isRestrictionDay = $0.tag == weekday.rawValue
           setupLabelRestriction(label: $0, isRestrictionDay: isRestrictionDay)
       }
    }
}

extension CarRotationResultView {
    private func setupLabelRestriction(label: UILabel, isRestrictionDay: Bool) {
        guard let currentText = label.text else { return }
        if isRestrictionDay {
            let newText = "\(currentText) - RESTRITO"
            let mutableString = NSMutableAttributedString(string: newText)
            let location = newText.count-(8)
            mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:location, length:8))
            label.attributedText = mutableString
        } else {
            let newText = "\(currentText) - LIBERADO"
            let mutableString = NSMutableAttributedString(string: newText)
            let location = newText.count-(8)
            mutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemGreen, range: NSRange(location:location, length:8))
            label.attributedText = mutableString
        }
    }
}
