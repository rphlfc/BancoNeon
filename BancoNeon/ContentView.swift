//
//  ContentView.swift
//  BancoNeon
//
//  Created by Raphael Cerqueira on 22/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0, green: 0.2759236097, blue: 0.6261566281, alpha: 1))
            .ignoresSafeArea(.all, edges: .top)
            
            VStack(spacing: 0) {
                HStack {
                    Text("meu neon")
                        .font(.system(size: 19))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 3) {
                        Image(systemName: "creditcard.fill")
                            .font(.system(size: 8))
                            .rotationEffect(.init(degrees: -30))
                        
                        Text("10/10")
                            .font(.system(size: 12))
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.8437514901, blue: 0.8414718509, alpha: 1)))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 1)
                    .background(Capsule().stroke(Color(#colorLiteral(red: 0, green: 0.8437514901, blue: 0.8414718509, alpha: 1))))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        ZStack(alignment: .bottom) {
                            Text("EO")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Circle().stroke(Color.white, lineWidth: 2))
                                .padding(4)
                                .background(Circle().stroke(Color(#colorLiteral(red: 0, green: 0.8193284869, blue: 0.8476273417, alpha: 1)), lineWidth: 2))
                                .padding(.bottom, 6)
                            
                            ZStack {
                                Circle()
                                    .fill(Color(#colorLiteral(red: 1, green: 0.7818681598, blue: 0.01097669918, alpha: 1)))
                                    .frame(width: 18, height: 18)
                                    .background(Circle().stroke(Color.white, lineWidth: 2))
                                    
                                Circle()
                                    .trim(from: 0.3, to: 1)
                                    .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                                    .foregroundColor(.white)
                                    .frame(width: 9, height: 9)
                                    .rotationEffect(.init(degrees: 35))
                            }
                                
                        }
                    })
                }
                .padding(.vertical)
                .padding(.horizontal, 35)
                .background(Color(#colorLiteral(red: 0, green: 0.2759236097, blue: 0.6261566281, alpha: 1)))
                
                GeometryReader { geometry in
                    VStack {
                        ForEach(items) { item in
                            Button(action: {}, label: {
                                HStack {
                                    Text(item.title)
                                        .font(.system(size: 19))
                                        .foregroundColor(.white)
                                        .fontWeight(.bold)
                                    
                                    Spacer()
                                    
                                    if item.value != nil {
                                        Text(item.value!)
                                            .font(.system(size: 19))
                                            .foregroundColor(.white)
                                    } else {
                                        Image(systemName: item.image!)
                                            .font(.system(size: 24))
                                            .foregroundColor(.white)
                                            .padding(.trailing)
                                    }
                                }
                            })
                            .padding(.horizontal, 35)
                            .frame(height: geometry.size.height / CGFloat(items.count))
                            .background(item.bgColor)
                        }
                    }
                }
                .ignoresSafeArea(.all, edges: .bottom)
            }
        }
    }
}

struct MenuItem: Identifiable {
    let id = UUID().uuidString
    var title: String
    var bgColor: Color
    var image: String?
    var value: String?
}

let items = [
    MenuItem(title: "saldo", bgColor: Color(#colorLiteral(red: 0.0006606298848, green: 0.4526929259, blue: 0.8015016913, alpha: 1)), image: nil, value: "R$1.500,00"),
    MenuItem(title: "crédito", bgColor: Color(#colorLiteral(red: 0.004515713546, green: 0.6459810734, blue: 0.9422804117, alpha: 1)), image: nil, value: "R$2.000,00"),
    MenuItem(title: "investimentos", bgColor: Color(#colorLiteral(red: 0, green: 0.8437514901, blue: 0.8414718509, alpha: 1)), image: nil, value: "R$3.000,00"),
    MenuItem(title: "cartões", bgColor: Color(#colorLiteral(red: 0, green: 0.6290210485, blue: 0.6283193827, alpha: 1)), image: "creditcard.fill", value: nil),
    MenuItem(title: "transferências", bgColor: Color(#colorLiteral(red: 0, green: 0.5097014308, blue: 0.5098894238, alpha: 1)), image: "dollarsign.circle.fill", value: nil),
    MenuItem(title: "pagamentos", bgColor: Color(#colorLiteral(red: 0, green: 0.6290210485, blue: 0.6283193827, alpha: 1)), image: "barcode", value: nil),
    MenuItem(title: "recargas", bgColor: Color(#colorLiteral(red: 0, green: 0.8437514901, blue: 0.8414718509, alpha: 1)), image: "iphone.homebutton", value: nil)
    
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
