import Foundation

struct Suites {
    static let CommonConditions = Suite(name:"5 Common Conditions", htmlDescription:"<h2>Acute otitis media</h2><p>Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.</p><h2>Myringosclerosis</h2><p>Myringosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.</p>", conditions:[Conditions.AcuteOtitisMedia, Conditions.Grommet, Conditions.OtitisMediaWithEffusion, Conditions.OtitisExterna, Conditions.TympanicMembranePerforation])
    
    static let Suite2 = Suite(name:"Emergency and life threatening", htmlDescription:"xxx", conditions:[Conditions.Normal, Conditions.Myringosclerosis])
    static let Suite3 = Suite(name:"Normal or not normal", htmlDescription:"xxx", conditions:Conditions.TestSet)
    static let Suite4 = Suite(name:"Things that are red", htmlDescription:"xxx", conditions:Conditions.TestSet)
    static let Suite5 = Suite(name:"Things that are white", htmlDescription:"xxx", conditions:Conditions.TestSet)
    
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
