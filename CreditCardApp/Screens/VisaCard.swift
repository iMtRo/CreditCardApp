import SwiftUI

struct CreditCard<Content>: View where Content: View {
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

class aaaa: ObservableObject {
    @EnvironmentObject var info: VisaInfo
    var str: String = ""
    init(str: String) {
            self.str = str
    }
    func a() -> String?{
        var str1 = ""
        let arr = Array(str)
        if arr.count == 16 {
            str1 += String(arr[0])
            str1 += String(arr[1])
            str1 += String(arr[2])
            str1 += String(arr[3])
            str1 += " "
            str1 += String(arr[4])
            str1 += String(arr[5])
            str1 += String(arr[6])
            str1 += String(arr[7])
            str1 += " "
            str1 += String(arr[8])
            str1 += String(arr[9])
            str1 += String(arr[10])
            str1 += String(arr[11])
            str1 += " "
            str1 += String(arr[12])
            str1 += String(arr[13])
            str1 += String(arr[14])
            str1 += String(arr[15])
        }
        
        return str1
    }
}

struct CreditCardFront: View {
    
    @EnvironmentObject var info: VisaInfo
    @State var card: String = ""
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 23))
                Spacer()
                Text(info.cardNum.getCreditCardType() ?? "CARD")
                    .fontWeight(.black)
                    .font(.system(size: 30))
            }.padding()
            .padding(.top, 10)
            
            HStack{
                
                Text(info.cardNum.isEmpty ? "1234 1234 1234 1234" : info.cardNum)
                    .fontWeight(.bold)
                    .font(.system(size: 28))
                
                Spacer()
                
            }.padding(.leading)
            
            HStack{
                VStack{
                    Text("CARD HOLDER")
                        .fontWeight(.bold)
                        .font(.system(size: 13))
                        .padding(.bottom, 1)
                    Text(info.name.isEmpty ? "CARD HOLDER" : info.name)
                        .font(.system(size: 15))
                        .fontWeight(.black)
                }
                
                Spacer()
                
                VStack{
                    Text("EXPIRES")
                        .fontWeight(.bold)
                        .font(.system(size: 13))
                        .padding(.bottom, 1)
                    Text(info.expires.isEmpty ? "00/00" : info.expires)
                        .font(.system(size: 15))
                        .fontWeight(.black)
                }
            }
            .padding()
            
            Spacer()
        }
        .foregroundColor(Color.white)
        .frame(width: 350, height: 250)
        .background(LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("blue")]), startPoint:  .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
    }
}



// Visa Back
struct CreditCardBack: View {
    @EnvironmentObject var info: VisaInfo
    var body: some View {
        VStack {
            HStack{}
            .frame(width: 350, height: 30)
            .background(Color.black)
            .padding(.top, 20)
            
            Spacer()
            
            HStack{
                Spacer()
                
                Text(info.cvv.isEmpty ? "123" : info.cvv)
                    .kerning(2)
                    .fontWeight(.black)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 125, height: 35)
                    .background(Color.white)
                
            }.padding()
            
        }.frame(width: 350, height: 250)
        .background(LinearGradient(gradient: Gradient(colors: [Color("purple"), Color("blue")]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(15)
    }
}


struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content: { CreditCardFront() })
    }
}
