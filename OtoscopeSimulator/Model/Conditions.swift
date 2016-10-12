import UIKit

struct Conditions {
    let commonOtitisMediaWithEffusionImages:[UIImage] = [#imageLiteral(resourceName: "common_otitis_media_with_effusion"), #imageLiteral(resourceName: "common_otitis_media_with_effusion_bubbles")]
    
    static let Normal = Condition(name: "Normal", images: [#imageLiteral(resourceName: "01_normal")], testConditionName: ["Otitis Media", "Normal", "Perforated Eardrum", "Myringosclerosis"], informationText: "This is a normal tympanic membrane. Whilst it is important to recognise pathologies, it is equally important to recognise what is normal.", signs:[])
    
    static let AcuteOtitisMedia = Condition(name: "Acute otitis media", images:[#imageLiteral(resourceName: "common_otitis_media")], testConditionName: ["Otitis media with effusion", "Haemotympanum", "Glomus tumour", "Acute otitis media"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs:["Bulging typmanic membrane", "Increased vascularity"])
    
    static let TympanicMembranePerforation = Condition(name: "Traumatic Tympanic Membrane Perforation", images:[#imageLiteral(resourceName: "common_tm_perforation"), #imageLiteral(resourceName: "04_perforation")], testConditionName: ["Myringosclerosis", "Tympanic Membrane Perforation", "Haemotympanum", "Foreign Body"], informationText: "Tympanic membrane perforations can be caused by direct penetrating injury or from barotrauma - a sudden change in pressure.", signs:["Perforation", "Blood suggests trauma"])

    static let OtitisExterna = Condition(name: "Otitis Externa", images:[#imageLiteral(resourceName: "common_otitis_externa")], testConditionName: ["Normal", "Acute Otitis Media", "TM Perforation"], informationText: "", signs: ["Tympanic membrane not visible", "Redness and swelling of ear canal", "Debris/discharge"])
    
    static let Grommet = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "common_grommet")], testConditionName: ["Normal", "Acute Otitis Media", "TM Perforation", "Grommit"], informationText: "", signs: [])
    
    static let OtitisMediaWithEffusion = Condition(name: "Otitis media with effusion", images:[#imageLiteral(resourceName: "06_otitismedia_effusion")], testConditionName: ["Acute otitis media", "Haemotympanum", "Ottic barotrauma", "Otitis media with effusion"], informationText: "Otitis media with effusion is a very common condition in which the mucosal lining of the middle ear secretes fluid which may occur as a result of eustachian tube dysfunction. The condition is also known as ‘Glue Ear’.", signs:["Fluid filled (often amber in color)", "Air bubbles may be visible"])
    
    static let Myringosclerosis = Condition(name: "Myringosclerosis", images:[#imageLiteral(resourceName: "05_myringosclerosis")], testConditionName: ["Myringosclerosis", "Otitis Media", "Normal Tympanic Membrane", "Cholesteatoma"], informationText: "Myringosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.", signs:[])
    
    static let Haemotympanum = Condition(name: "Haemotympanum", images:[#imageLiteral(resourceName: "03_haemotympanum")], testConditionName: ["Acute otitis media", "Otitis media with effusion", "Glomus tumour", "Haemotympanum"], informationText: "Haemotympanum can occur following trauma and can indicate a basal skull fracture. It is important to also check behind the ear lobe for bruising (Battle’s Sign).", signs:[])

    static let ForeignBodyInsect = Condition(name: "Foreign body (insect)", images:[#imageLiteral(resourceName: "07_insect")], testConditionName: ["Myringosclerosis", "Foreign body (insect)", "Otitis media", "Normal Tympanic Membrane"], informationText: "Different types of foreign body require different methods of removal. Insects should be killed prior to their removal. This can be done by using mineral oil or lidocaine.", signs:[])
    
    static let TestSet = [Normal, AcuteOtitisMedia, Haemotympanum, TympanicMembranePerforation, Myringosclerosis, OtitisMediaWithEffusion, ForeignBodyInsect]
    
    static let FreeConditions = [Normal, AcuteOtitisMedia, Haemotympanum]
    
    static var IsExtraContentUnlocked = false
    
    static func IsLocked(_ condition:Condition) -> Bool {
        if IsExtraContentUnlocked {
            return false
        } else {
            return !FreeConditions.contains { (testCondition) -> Bool in
                return testCondition.name == condition.name
            }
        }
        
    }
}
