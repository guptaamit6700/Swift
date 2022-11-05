import UIKit
/// Violation of Interface segregation principal
protocol Action {
    func canEat()
    func canWork()
}
class Adult: Action {
    func canEat() {
        // adult eat
    }
    func canWork() {
        // adult work
    }
}
class Baby: Action {
    func canEat() {
        // baby eat
    }
    func canWork() {
        // baby can't work
    }
}

/// Correct implementation of IS principal
protocol EatAction {
    func canEat()
}

protocol WorkAction {
    func canWork()
}

class Adult: EatAction, WorkAction {
    func canEat() {
        // adut eat
    }
    func canWork() {
        // adult work
    }
}


class Baby: EatAction {
    func canEat() {
        // baby eat
    }
}

