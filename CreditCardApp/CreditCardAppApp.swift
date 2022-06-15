import SwiftUI

@main
struct VisaCardAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(VisaInfo())
        }
    }
}
