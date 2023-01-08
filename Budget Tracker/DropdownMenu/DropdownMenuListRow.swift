//
//  DropdownMenuListRow.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct DropdownMenuListRow: View {
    let option: DropdownMenuOption
    
    let onSelectedAction: (_ option: DropdownMenuOption) -> Void

    var body: some View {
        Button(action: {
            self.onSelectedAction(option)
        }) {
            Text(option.option)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundColor(.black)
        .padding(.vertical, 5)
        .padding(.horizontal)
    }
}

struct DropdownMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenuListRow(option: DropdownMenuOption.testSingleMonth, onSelectedAction: { _ in })
    }
}
