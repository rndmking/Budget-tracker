//
//  ModalView.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct ModalView: View {
    @State var text = ""
    @State private var category: DropdownMenuOption? = nil
    @Binding var transactionName: String
    @Binding var amount: Int
    @Binding var isModalPresented: Bool
    @Binding var balance: Int
    @Binding var stories: [Story]
    private let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.zeroSymbol = ""
        return formatter
    }()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30.0)
                .foregroundColor(.white)
            VStack(spacing: 20.0) {
                HStack {
                    Text("Добавить транзакцию").font(.system(size: 24.0, weight: .semibold))
                    Spacer()
                }
                ZStack {
                    TextField("Введите сумму..", value: $amount, formatter: formatter)
                        .frame(height: 50)
                        .padding(.leading)
                        .keyboardType(.decimalPad)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.gray)
                                .opacity(0.1)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }
                }
                ZStack {
                    TextField("Обзовите транзакцию...", text: $transactionName)
                        .frame(height: 50)
                        .padding(.leading)
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(.gray)
                                .opacity(0.1)
                        }
                        .background {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }
                }
                VStack {
                    DropdownMenu(selectedOption: self.$category,
                                 placeholder: "Выберите категорию",
                                 options: DropdownMenuOption.testAllMonths)
                }.zIndex(2)
                SubmitButton().zIndex(1)
                    .onTapGesture {
                        let newStory = Story(amount: -self.amount, transactionName: self.transactionName, category: self.category)
                        self.stories.insert(newStory, at: 0)
                        self.balance -= amount
                        self.amount = 0
                        self.transactionName = ""
                        self.isModalPresented.toggle()
                        
                    }
            }.padding([.leading, .trailing, .top, .bottom])
                .padding([.top], 10)
        }.frame(width: 333, height: 200)
    }

    struct SubmitButton: View {
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20 ).foregroundColor(Color("Success"))
                    .frame(height: 50).shadow(radius: 10.0)

                Text("Готово").font(.title2).foregroundColor(.white).fontWeight(.semibold)
            }
        }
    }
}
