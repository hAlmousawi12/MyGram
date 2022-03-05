import SwiftUI
import Firebase
import GoogleSignIn
@main
struct MainApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                MainView(info: delegate)
                Test()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {
    
    @Published var email = ""
    @Published var name = ""
    //    var env: FirebaseEnv
    //
    //    init(env: FirebaseEnv) {
    //        self.env = env
    //    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        GIDSignIn.sharedInstance().delegate = self
        
        return true
    }
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            
            print(error.localizedDescription)
            return
            
        }
        
        
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        
        Auth.auth().signIn(with: credential) { result, err in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            self.email = (result?.user.email)!
            self.name = (result?.user.displayName)!
            
            if !self.email.isEmpty {
                print("👱🏻‍♂️ Creating user ...")
                Networking.createItem(User(username: self.name, email: self.email), inCollection: "users") {
                    print("👱🏻‍♂️ User has been created successfully ...")
                } fail: { err in
                    print("❌❌❌\n\(err?.localizedDescription ?? "")")
                }
                
            }
            
            print(result?.user.displayName)
            print(result?.user.email)
        }
    }
}
