import Foundation

struct Suites {
    static let CommonConditions = Suite(name:"5 Common Conditions", htmlDescription:"", conditions:Conditions.Common)
    
    static let EmergencyConditions = Suite(name:"Emergency and life threatening", htmlDescription:"", conditions:Conditions.Emergency)
    static let NormalOrNotNormalConditions = Suite(name:"Normal or not normal", htmlDescription:"xxx", conditions:[])
    static let RedTympanicMembraneConditions = Suite(name:"Things that are red", htmlDescription:"xxx", conditions:Conditions.RedTympanicMembrane)
    static let WhiteTympanicMembraneConditions = Suite(name:"Things that are white", htmlDescription:"xxx", conditions:Conditions.WhiteTympanicMembrane)
    
    static let TestSet = [CommonConditions, EmergencyConditions, NormalOrNotNormalConditions, RedTympanicMembraneConditions, WhiteTympanicMembraneConditions]
    
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
