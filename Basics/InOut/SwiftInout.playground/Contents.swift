import UIKit

// ========== Without inout ========
struct User {
    var userId: String?
    let name: String
}

func updateUser(user: User) -> User {
    var user = user
    user.userId = "100"
    return user
}
let user = User(userId: "50", name: "Amit")

//let updatedUser = updateUser(user: user)

//print(updatedUser.userId)

// ========== With inout ========

func updateUserIO(_ user:inout User) {
    user.userId = "200"
}

updateUser(user: &user)
print(user.userId)
