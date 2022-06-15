import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var info: VisaInfo
    
    @State private var degrees: Double = 0
    @State private var flipped: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                
                CreditCard() {
                   
                    VStack {
                        Group {
                            if flipped {
                                CreditCardBack()
                            } else {
                                CreditCardFront()
                            }
                        }
                    }.rotation3DEffect(
                        .degrees(degrees),
                        axis: (x: 1.0, y: 1.0, z: 0.0)
                    )
                    
                }
                .onTapGesture {
                    withAnimation {
                        degrees += 360
                        flipped.toggle()
                    }
                }
                
                // Visa Number Text Filed
                Button(action: {
                    withAnimation {
                        degrees += 360
                        flipped = false
                    }
                }, label: {
                    
                    TextField("Card Number", text : $info.cardNum)
                        .foregroundColor(Color.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        .padding()
                })

                // Name Text Filed
                Button(action: {
                    withAnimation {
                        degrees += 360
                        flipped = false
                    }
                }, label: {
                    TextField("Name", text: $info.name)
                        .foregroundColor(Color.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        .padding()
                })
                
                // Expires Text Filed
                Button(action: {
                    withAnimation {
                        degrees += 360
                        flipped = false
                    }
                }, label: {
                    TextField("Expires", text: $info.expires)
                        .frame(alignment: .leading)
                        .foregroundColor(Color.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        .padding()
                })
                
                // CVV Text Filed
                Button(action: {
                    withAnimation {
                        degrees += 360
                        flipped = true
                    }
                }, label: {
                    TextField("CVV", text: $info.cvv)
                        .foregroundColor(Color.black)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 2))
                        .padding()
                })
            }
            .navigationBarTitle("Add Card", displayMode: .inline)
            .navigationBarItems(trailing:
            Button(action: {}, label: {
                Text("Add Card")
                    .fontWeight(.black)
                    .padding(5)
                    .foregroundColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("blue")]), startPoint:  .topLeading, endPoint: .bottomTrailing))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 5))
                    .cornerRadius(10)
            }))
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
