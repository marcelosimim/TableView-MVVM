//
//  CarRotationResultViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import Foundation

protocol CarRotationResultViewModelProtocol {
    func calculateDays() -> [Weekday]
    func checkRestriction(_ licensePlate: String) -> Weekday
}

final class CarRotationResultViewModel: CarRotationResultViewModelProtocol {
    func calculateDays() -> [Weekday] {
        let currentDay = currentDay()
        var days:[Weekday] = []
        for index in 0...6 {
            days.append(getDay(weekday: currentDay, plus: index))
        }
        return days
    }

    func checkRestriction(_ licensePlate: String) -> Weekday {
        guard let lastNumber = licensePlate.last else { return .monday }
        return restrictionDay(lastNumber)
    }

    private func currentDay() -> Weekday {
        let date = Date()
        let calendar = Calendar.current
        let weekdayRawValue = calendar.component(.weekday, from: date)
        let weekday = Weekday.init(rawValue: weekdayRawValue)

        return weekday ?? .monday
    }

    private func getDay(weekday: Weekday, plus: Int) -> Weekday {
        let rawValue = weekday.rawValue
        let day = rawValue + plus
        if day <= 7 { return Weekday(rawValue: day) ?? .monday }
        else { return Weekday(rawValue: day-7) ?? .monday }
    }

    private func restrictionDay(_ number: Character) -> Weekday {
        if number == "1" || number == "2" { return .monday }
        else if number == "3" || number == "4" { return .tuesday }
        else if number == "5" || number == "6" { return .wednesday }
        else if number == "7" || number == "8" { return .thrusday }
        else { return .friday }
    }
}
