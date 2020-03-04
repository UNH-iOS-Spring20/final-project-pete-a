
import Foundation

struct Profile {
    var username: String

    static let `default` = Self(username: "p_auri")
    
    init(username: String) {
        self.username = username
    }
}
