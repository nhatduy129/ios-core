
import Foundation

class User: NSObject {
    
    @objc dynamic var name: String?
    
    init(withUserName: String) {
        super.init()
        self.name = withUserName
    }
}

private var myContext = 0

class UserManager: NSObject {
    
    var user: User
    
    init(withUser: User) {
        self.user = withUser
        super.init()
        
        //add an observer to our user object
        self.user.addObserver(self, forKeyPath: #keyPath(User.name), options: .new, context: &myContext)
    }
    
    //observe changes:
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext {
            print("the value has changed")
            if let newValue = change?[.newKey] as? String {
                print(newValue)
            }
        }
    }
}

var user = User(withUserName: "Duy")
var userManager = UserManager(withUser: user)

user.name = "Nhat"
