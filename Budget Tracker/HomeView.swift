//
//  HomeView.swift
//  Budget Tracker
//
//  Created by Роберт Гадеев on 08.01.2023.
//

import SwiftUI

struct HomeView: View {

    @State private var blur = false
    @State var isModalPresented = false
    @State private var stories = [Story]()
    @State private var transactionName = ""
    @State private var amount: Double? = nil
    
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
                StoryCollection(stories: self.$stories)
                Spacer()
            }.padding([.leading,.trailing], 40)
            if self.isModalPresented {
                VisualBlurEffect(uiVisualEffect: UIBlurEffect(style: .systemUltraThinMaterialDark))
                                    .transition(.scale)
                                    .ignoresSafeArea(.all)
                                    .onTapGesture {
                                        self.isModalPresented.toggle()
                                    }
                ModalView(transactionName: self.$transactionName, amount: self.$amount?, isModalPresented: self.$isModalPresented, stories: self.$stories)
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

        @Binding var stories: [Story]

        var body: some View {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(stories) { story in
                        StoryCell(color: Color("Failure"), amount: story.amount!, action: story.transactionName, category: story.category)
                    }
                }
            }
        }
    }

    struct StoryCell: View {
        var color: Color
        var amount: Double
        var action: String
        var category: DropdownMenuOption?
        var body: some View {
        VStack {
            ZStack {
                Rectangle().foregroundColor(.white)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(action).font(.system(size: 16.0, weight: .semibold))
                        Text(category!.option).font(.system(size: 14.0, weight: .regular))
                    }.padding(.trailing)
                    Spacer()
                    Text(String(amount) + "₽").font(.system(size: 18.0, weight: .bold)).foregroundColor(color)
                }
            }.frame(height: 61)
            Divider()
            }
        }
    }

struct Story: Identifiable, Hashable {
    let id = UUID().uuidString
    let amount: Double?
    let transactionName: String
    let category: DropdownMenuOption?
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
