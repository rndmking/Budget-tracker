//
//  DropdownMenuOption.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI
import Foundation

struct DropdownMenuOption: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension DropdownMenuOption {
    static let testSingleMonth: DropdownMenuOption = DropdownMenuOption(option: "Продукты")
    static let testAllMonths: [DropdownMenuOption] = [
        DropdownMenuOption(option: "Продукты"),
        DropdownMenuOption(option: "Путешествия"),
        DropdownMenuOption(option: "Техника"),
        DropdownMenuOption(option: "Развлечения"),
        DropdownMenuOption(option: "Подарок"),
        DropdownMenuOption(option: "Долг")
    ]
}
