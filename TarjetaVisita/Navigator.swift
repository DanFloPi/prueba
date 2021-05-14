

import SwiftUI



struct Navigator: View {
    
    @EnvironmentObject var userInfo: USerInfo
    @State var emptyFields = true
    
    var body: some View {
        
        TabView {
            ContentView()
                
                .tabItem {
                    Image(systemName: "pencil.and.ellipsis.rectangle")
                    Text("Crea la tarjeta")
                }
            
            CardView()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Tarjeta")
                }
        }
    }
}

struct Navigator_Previews: PreviewProvider {
    static var previews: some View {
        Navigator()
    }
}
