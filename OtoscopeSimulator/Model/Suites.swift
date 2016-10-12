import Foundation

struct Suites {
    static let CommonConditions = Suite(name:"5 Common Conditions", htmlDescription:"", conditions:[Conditions.AcuteOtitisMedia1, Conditions.Grommet1, Conditions.OtitisMediaWithEffusion, Conditions.OtitisExterna, Conditions.TympanicMembranePerforation])
    
    static let Suite2 = Suite(name:"Emergency and life threatening", htmlDescription:"", conditions:[])
    static let Suite3 = Suite(name:"Normal or not normal", htmlDescription:"xxx", conditions:[])
    static let Suite4 = Suite(name:"Things that are red", htmlDescription:"xxx", conditions:[])
    static let Suite5 = Suite(name:"Things that are white", htmlDescription:"xxx", conditions:[])
    
    static let TestSet = [CommonConditions, Suite2, Suite3, Suite4, Suite5]
    
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
