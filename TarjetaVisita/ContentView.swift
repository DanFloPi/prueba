//
//  ContentView.swift
//  TarjetaVisita
//
//  Created by daniel on 25/02/2021.
//

import SwiftUI

class USerInfo: ObservableObject {
    @Published var name: String = ""
    @Published var surname: String = ""
    @Published var job: String = ""
    @Published var phoneNumber: String = ""
    @Published var mail: String = ""
    @Published var address: String = ""
}


struct ContentView: View {
    
    @EnvironmentObject var userInfo: USerInfo
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        VStack {
            
            Text("FactoryCard")
                .font(.custom("SnellRoundhand", size: 50))
                .bold()
                .foregroundColor(Color("LowBrown"))
                .frame(maxHeight:60)
                .shadow(color: .black, radius: 1, x: 1, y: 1)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            Text("Introduce tus datos")
                .font(.title2)
                .foregroundColor(.white)
                .bold()
                .padding(.top, 30)
            
            Form {
                
                Section(header: Text("Cara frontal").foregroundColor(.white)) {
                    TextField("Nombre", text: $userInfo.name)
                    TextField("Apellido", text: $userInfo.surname)
                    TextField("Puesto de trabajo", text: $userInfo.job)
                    
                }
                Rectangle()
                    .frame(minWidth: 200, maxHeight: 10)
                    .foregroundColor(Color("Chocolate"))
                Section(header: Text("Cara trasera").foregroundColor(.black)){
                    TextField("Número de teléfono", text: $userInfo.phoneNumber)
                    TextField("Correo electrónico", text: $userInfo.mail)
                    TextField("Dirección", text: $userInfo.address)
                }
            }.multilineTextAlignment(.center)
            .padding(.top, 40)
            
        } .background(Image("tarjetas2")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea())
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
