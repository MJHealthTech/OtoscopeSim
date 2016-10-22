import Foundation

struct Suites {
    static let CommonConditions = Suite(name:"5 Common Conditions", htmlDescription:"", conditions:Conditions.Common)
    
    static let EmergencyConditions = Suite(name:"Emergency and life threatening", htmlDescription:"", conditions:Conditions.Emergency)
//    static let NormalOrNotNormalConditions = Suite(name:"Normal or not normal", htmlDescription:"", conditions:[])
    static let RedTympanicMembraneConditions = Suite(name:"The red tympanic membrane", htmlDescription:"", conditions:Conditions.RedTympanicMembrane)
    static let WhiteTympanicMembraneConditions = Suite(name:"The white tympanic membrane", htmlDescription:"", conditions:Conditions.WhiteTympanicMembrane)
    
    static let TestSet = [CommonConditions, EmergencyConditions, RedTympanicMembraneConditions, WhiteTympanicMembraneConditions]
    
    static let FreeSuites = [CommonConditions]
    
    static var IsExtraContentUnlocked: Bool {
        return UserStore().isUserLoggedIn()
    }
    
    static func IsLocked(_ suite:Suite) -> Bool {
        if IsExtraContentUnlocked {
            return false
        } else {
            return !FreeSuites.contains { (testSuite) -> Bool in
                return testSuite.name == suite.name
            }
        }
    }
}
