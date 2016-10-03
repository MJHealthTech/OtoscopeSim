import Foundation

struct Suites {
    static let Suite1 = Suite(name:"5 Common Conditions", htmlDescription:"<h2>Acute otitis media</h2><p>Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.</p><h2>Myringosclerosis</h2><p>Myringosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.</p>", conditions:Conditions.TestSet)
    static let Suite2 = Suite(name:"Normal or Not normal", htmlDescription:"xxx", conditions:[Conditions.Normal, Conditions.Myringosclerosis])
    static let Suite3 = Suite(name:"Suite 3", htmlDescription:"xxx", conditions:Conditions.TestSet)
    static let Suite4 = Suite(name:"Suite 4", htmlDescription:"xxx", conditions:Conditions.TestSet)
    static let Suite5 = Suite(name:"Suite 5", htmlDescription:"xxx", conditions:Conditions.TestSet)
}
