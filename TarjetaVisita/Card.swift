

import SwiftUI




struct CardView: View {
    
    @State var color: Color = .red
    @State var click = false
    @State var actualColor = ""
    
    
    func selectedColor(color: Color, colorName: String) {
        self.color = color
        self.actualColor = colorName
    }
    
    
    
    var body: some View {
        ScrollView {
            
            
            VStack {
                Spacer(minLength: 50)
                Text("Tu tarjeta")
                    .font(.custom("SnellRoundhand", size: 80))
                    .bold()
                    .foregroundColor(Color("Chocolate"))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 4, y: 4)
                    .multilineTextAlignment(.center)
                Spacer(minLength: 50)
                
                Text("Selecciona el color de la tarjeta")
                    .font(.custom("AmericanTypewriter", size: 25))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 4, y: 4)
                    .multilineTextAlignment(.center)
                
                HStack{
                    
                    Circle()
                        .foregroundColor(.red)
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                        .overlay(actualColor.contains("red")  ? Circle().stroke(Color.black, lineWidth: 3): Circle().stroke(Color.black, lineWidth: 0))
                        .scaleEffect(self.actualColor.contains("red") ? 1.2 : 1)
                        .onTapGesture {
                            selectedColor(color: .red, colorName: "red")
                        }.animation(.linear)
                    Spacer(minLength: 20)
                    
                    Circle()
                        .foregroundColor(.green)
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                        .overlay(actualColor.contains("green")  ? Circle().stroke(Color.black, lineWidth: 3): Circle().stroke(Color.black, lineWidth: 0))
                        .scaleEffect(self.actualColor.contains("green") ? 1.2 : 1)
                        .onTapGesture {
                            selectedColor(color: .green, colorName: "green")
                        } .animation(.linear)
                    Spacer(minLength: 20)
                    
                    Circle()
                        .foregroundColor(.blue)
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                        .overlay(actualColor.contains("blue")  ? Circle().stroke(Color.black, lineWidth: 3): Circle().stroke(Color.black, lineWidth: 0))
                        .scaleEffect(self.actualColor.contains("blue") ? 1.2 : 1)
                        .onTapGesture {
                            selectedColor(color: .blue, colorName: "blue")
                        } .animation(.linear)
                    Spacer(minLength: 20)
                    
                    Circle()
                        .foregroundColor(.yellow)
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                        .overlay(actualColor.contains("yellow")  ? Circle().stroke(Color.black, lineWidth: 3): Circle().stroke(Color.black, lineWidth: 0))
                        .scaleEffect(self.actualColor.contains("yellow") ? 1.2 : 1)
                        .onTapGesture {
                            selectedColor(color: .yellow, colorName: "yellow")
                        } .animation(.linear)
                    Spacer(minLength: 20)
                    
                    Circle()
                        .foregroundColor(.purple)
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                        .overlay(actualColor.contains("purple")  ? Circle().stroke(Color.black, lineWidth: 3): Circle().stroke(Color.black, lineWidth: 0))
                        .scaleEffect(self.actualColor.contains("purple") ? 1.2 : 1)
                        .onTapGesture {
                            selectedColor(color: .purple, colorName: "purple")
                        } .animation(.linear)
                    Spacer(minLength: 20)
                    
                }.padding()
                .frame(minWidth: 400, minHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                
                Text("Clicka en la tarjeta para girarla")
                    .font(.custom("AmericanTypewriter", size: 25))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 4, y: 4)
                    .padding(.top, 40)
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 220)
                        .foregroundColor(color)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Color.black, lineWidth: 3))
                        .shadow(color: .black, radius: 15, x: 10, y: 20)
                    if click {
                        BackView()
                    }else {
                        FrontView()
                    }
                } .rotation3DEffect(.degrees(click ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                .onTapGesture {
                    self.click.toggle()
                }.animation(.linear(duration: 0.2))
                Spacer(minLength: 150)
            }
        }.background(Image("madera")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea())
    }
}

struct FrontView: View {
    
    @EnvironmentObject var userInfo: USerInfo
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .frame(width:100 , height: 100)
                    .padding(5)
                    .foregroundColor(.white)
                //Text("P")
                Text(userInfo.name.isEmpty ? "V" : (userInfo.name.prefix(1)))
                    .font(.custom("AmericanTypewriter", size: 70))
                
            }
            VStack {
                HStack {
                    //                    Text("Pruebas")
                    Text(userInfo.name.isEmpty ? "Vacío" :  "\(userInfo.name)")
                        .foregroundColor(.black)
                        .font(.custom("AmericanTypewriter", size: 20))
                        .bold()
                    //                        Text("Pruebas")
                    Text(userInfo.surname.isEmpty ? "Vacío" :  "\(userInfo.surname)")
                        .foregroundColor(.black)
                        .font(.custom("AmericanTypewriter", size: 20))
                        .bold()
                }
                //                Text("Pruebas")
                Text(userInfo.job.isEmpty ? "Vacío" : "\(userInfo.job)")
                    .foregroundColor(.black)
                    .font(.custom("AmericanTypewriter", size: 18))
                
            }
        }.rotation3DEffect(
            .degrees(180),
            axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/)
        .padding(.leading, 40)
    }
}

struct BackView: View {
    
    @EnvironmentObject var userInfo: USerInfo
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(systemName: "phone.fill")
                //                Text("Pruebas")
                Text(userInfo.phoneNumber.isEmpty ? "Vacío" : "\(userInfo.phoneNumber)")
                    .foregroundColor(.black)
                    .bold()
                    .keyboardType(.numberPad)
            }.padding(.trailing, 40)
            .padding(.bottom, 10)
            HStack {
                Image(systemName: "envelope.fill")
                //                Text("Pruebas")
                Text(userInfo.mail.isEmpty || !userInfo.mail.contains("@") ? "Vacío/ mail no válido" :  "\(userInfo.mail)" )
                    .bold()
                    .textContentType(.emailAddress)
                    .foregroundColor(.black)
            }.padding(.bottom, 10)
            HStack {
                Image(systemName: "mappin.and.ellipse")
                //                Text("Pruebas")
                Text(userInfo.address.isEmpty ? "Vacío" : "\(userInfo.address)")
                    .foregroundColor(.black)
                    .bold()
            }.padding(.bottom, 10)
            
        }
    }
}



struct TarjetaView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
