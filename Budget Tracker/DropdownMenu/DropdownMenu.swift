//
//  DropdownMenu.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct DropdownMenu: View {
    @State private var isOptionsPresented: Bool = false
    
    @Binding var selectedOption: DropdownMenuOption?
    
    let placeholder: String
    
    let options: [DropdownMenuOption]

    
    var body: some View {
        Button(action: {
            withAnimation {
                self.isOptionsPresented.toggle()
            }
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.option)
                    .fontWeight(.medium)
                    .foregroundColor(selectedOption == nil ? .gray : .black)
                Spacer()
                Image(systemName: self.isOptionsPresented ? "chevron.up" : "chevron.down")
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray, lineWidth: 2)
        }
        .overlay(alignment: .top) {
            VStack {
                if self.isOptionsPresented {
                    Spacer(minLength: 60)
                    DropdownMenuList(options: self.options) { option in
                        self.isOptionsPresented = false
                        self.selectedOption = option
                    }.zIndex(2)
                }
            }
        }
    }
}

struct DropdownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropdownMenu(selectedOption: .constant(nil),
                     placeholder: "Выберите категорию",
                     options: DropdownMenuOption.testAllMonths)
    }
}
