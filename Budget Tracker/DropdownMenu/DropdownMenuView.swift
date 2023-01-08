//
//  DropdownMenuView.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct DropdownMenuView: View {
    @State private var category: DropdownMenuOption? = nil

    var body: some View {
        VStack {
            DropdownMenu(selectedOption: self.$category,
                         placeholder: "Выберите категорию",
                         options: DropdownMenuOption.testAllMonths)
        }
    }
}

struct DropdownMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuView()
    }
}
