import UIKit

//// Before DI ======================================

// low level module
struct Employee {
    func work() {
        print("working ..... ")
    }
}

// high level module
struct Employer {
    var employee: [Employee]
    func manage() {
        employee.forEach { employee in
            employee.work()
        }
    }
}
let employer = Employer(employee: [Employee()])
employer.manage()



//// After DI ======================================
protocol Workable {
    func work()
}
struct DIEmployee: Workable {
    func work() {
        print("Working...")
    }
}
struct DIEmployer {
    let employee: [Workable]
    func manage() {
        employee.forEach { employee in
            employee.work()
        }
    }
}
let DIEmployerObj = DIEmployer(employee: [DIEmployee()])
DIEmployerObj.manage()
