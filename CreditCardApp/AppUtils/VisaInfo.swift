import Foundation

class VisaInfo: ObservableObject {
    @Published var name: String = ""
    @Published var cardNum: String = ""
    @Published var expires: String = ""
    @Published var cvv: String = ""
}

extension String {
    
    func isMatch(_ Regex: String) -> Bool {
        
        do {
            let regex = try NSRegularExpression(pattern: Regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }.count > 0
        } catch {
            return false
        }
    }
    
    func getCreditCardType() -> String? {
        
        
        
        let VISA = "^4[0-2][0-4][0-5]{6,}$"  // 40 11 35 45 55
        let MasterCard =  "^5[1-5][0-9]{5,}|222[1-9][0-9]{3,}|22[3-9][0-9]{4,}|2[3-6][0-9]{5,}|27[01][0-9]{4,}|2720[0-9]{3,}$" // 24 12 75 12
        let AmericanExpress = "^3[47][0-9]{5,}$"// 37 18 85 81
        let DinersClub = "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
        // 30 48 63 40 50 50
        let Discover = "^6(?:011|5[0-9]{2})[0-9]{3,}$"
        let JCB = "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
        
        
        
        
        if self.isMatch(VISA) {
            return "VISA"
        } else if self.isMatch(MasterCard) {
            return "MasterCard"
        } else if self.isMatch(AmericanExpress) {
            return "AmericanExpress"
        } else if self.isMatch(DinersClub) {
            return "DinersClub"
        } else if self.isMatch(Discover) {
            return "Discover"
        } else if self.isMatch(JCB) {
            return "JCB"
        } else {
            return nil
        }
    }
}



