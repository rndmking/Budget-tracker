//
//  HomeView.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct HomeView: View {

    @State private var blur = false
    @State private var isModalPresented = false
    var body: some View {
        ZStack {
            VStack {
                Header()
                VStack{
                    HStack {
                        Text("Ваш баланс")
                        Spacer()
                    }
                    HStack {
                        Text("530₽").font(.system(size: 50.0, weight: .semibold))
                        Spacer()
                    }
                }
                HStack(spacing: 23.0){
                    MoneyButton(color: Color("Success"), title: "💰")
                        .onTapGesture {
                            self.isModalPresented.toggle()
                        }
                    MoneyButton(color: Color("Failure"), title: "💸")
                        .onTapGesture {
                            self.isModalPresented.toggle()
                        }
                }
                Divider()
                HStack {
                    Text("История").font(.system(size: 28.0, weight: .bold))
                    Spacer()
                }
                StoryCollection()
                Spacer()
            }.padding([.leading,.trailing], 40)
            if self.isModalPresented {
                VisualBlurEffect(uiVisualEffect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                                    .transition(.scale)
                                    .ignoresSafeArea(.all)
                                    .onTapGesture {
                                        self.isModalPresented.toggle()
                                    }
                                ModalView(isModalPresented: self.$isModalPresented)
                                    .transition(.scale)
                                    .animation(.easeInOut)
                            }
            }
        }
    }
    @ViewBuilder

    private func Header() -> some View {
        HStack {
            Text("Добро пожаловать, Роберт").font(.system(size: 18.0)).fontWeight(.semibold)
            Spacer()
            ZStack {

                Image("memoji")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())

            }
            .frame(width: 50, height: 50)

        }
    }

    struct MoneyButton: View {
        var color: Color
        var title: String
        var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 20 ).foregroundColor(color)
                    .frame(width: 150, height: 70).shadow(radius: 10.0)

                Text(title).font(.system(size: 50.0))
            }
        }
    }

    struct StoryCollection: View {
        var body: some View {
            VStack {
                ScrollView(showsIndicators: false) {
                    StoryCell(color: Color("Failure"), sum: "-250", action: "Купил хлеба", category: "Продукты")
                    StoryCell(color: Color("Success"), sum: "+23250", action: "Зпха пришла", category: "Работа")
                    StoryCell(color: Color("Failure"), sum: "-343", action: "Кофе пил", category: "Кафе")
                    StoryCell(color: Color("Success"), sum: "+300", action: "Долг вернули", category: "Долг")
                    StoryCell(color: Color("Failure"), sum: "-250", action: "Купил колбасу", category: "Продукты")
                    StoryCell(color: Color("Success"), sum: "+2250", action: "Подарок", category: "Подарок")
                    StoryCell(color: Color("Failure"), sum: "-150", action: "Скатнулся на такси", category: "Путешествия")
                    StoryCell(color: Color("Failure"), sum: "+10", action: "Нашел чирик", category: "Подарок")
                    StoryCell(color: Color("Failure"), sum: "-50", action: "Уличному музыканту отдал", category: "Другое")
                    StoryCell(color: Color("Failure"), sum: "-2000", action: "Купил носки", category: "Одежда")
                }
            }
        }
    }

    struct StoryCell: View {
        var color: Color
        var sum: String
        var action: String
        var category: String
        var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(action).font(.system(size: 16.0, weight: .semibold))
                        Text(category).font(.system(size: 14.0, weight: .regular))
                    }.padding(.trailing)
                    Spacer()
                    Text(sum + "₽").font(.system(size: 18.0, weight: .bold)).foregroundColor(color)
                }
            }.frame(height: 61)
            Divider()
            }
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
