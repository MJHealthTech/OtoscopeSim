import UIKit

struct Conditions {
    let commonOtitisMediaWithEffusionImages:[UIImage] = [#imageLiteral(resourceName: "common_otitis_media_with_effusion"), #imageLiteral(resourceName: "common_otitis_media_with_effusion_bubbles")]
    
    static let Normal = Condition(name: "Normal", images: [#imageLiteral(resourceName: "01_normal")], testConditionName: ["Otitis Media", "Normal", "Perforated Eardrum", "Myringosclerosis"], informationText: "This is a normal tympanic membrane. Whilst it is important to recognise pathologies, it is equally important to recognise what is normal.", signs:[])
    
//    static let AcuteOtitisMedia = Condition(name: "Acute otitis media", images:[#imageLiteral(resourceName: "common_otitis_media")], testConditionName: ["Otitis media with effusion", "Haemotympanum", "Glomus tumour", "Acute otitis media"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs:["Bulging typmanic membrane", "Increased vascularity"])
//    
//    static let TympanicMembranePerforation = Condition(name: "Traumatic Tympanic Membrane Perforation", images:[#imageLiteral(resourceName: "common_tm_perforation"), #imageLiteral(resourceName: "04_perforation")], testConditionName: ["Myringosclerosis", "Tympanic Membrane Perforation", "Haemotympanum", "Foreign Body"], informationText: "Tympanic membrane perforations can be caused by direct penetrating injury or from barotrauma - a sudden change in pressure.", signs:["Perforation", "Blood suggests trauma"])
//
//    static let OtitisExterna = Condition(name: "Otitis Externa", images:[#imageLiteral(resourceName: "common_otitis_externa")], testConditionName: ["Normal", "Acute Otitis Media", "TM Perforation"], informationText: "", signs: ["Tympanic membrane not visible", "Redness and swelling of ear canal", "Debris/discharge"])
//    
//    static let Grommet = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "common_grommet")], testConditionName: ["Normal", "Acute Otitis Media", "TM Perforation", "Grommit"], informationText: "", signs: [])
//    
//    static let OtitisMediaWithEffusion = Condition(name: "Otitis media with effusion", images:[#imageLiteral(resourceName: "06_otitismedia_effusion")], testConditionName: ["Acute otitis media", "Haemotympanum", "Ottic barotrauma", "Otitis media with effusion"], informationText: "Otitis media with effusion is a very common condition in which the mucosal lining of the middle ear secretes fluid which may occur as a result of eustachian tube dysfunction. The condition is also known as ‘Glue Ear’.", signs:["Fluid filled (often amber in color)", "Air bubbles may be visible"])
//    
//    static let Myringosclerosis = Condition(name: "Myringosclerosis", images:[#imageLiteral(resourceName: "05_myringosclerosis")], testConditionName: ["Myringosclerosis", "Otitis Media", "Normal Tympanic Membrane", "Cholesteatoma"], informationText: "Myringosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.", signs:[])
//    
//    static let Haemotympanum = Condition(name: "Haemotympanum", images:[#imageLiteral(resourceName: "03_haemotympanum")], testConditionName: ["Acute otitis media", "Otitis media with effusion", "Glomus tumour", "Haemotympanum"], informationText: "Haemotympanum can occur following trauma and can indicate a basal skull fracture. It is important to also check behind the ear lobe for bruising (Battle’s Sign).", signs:[])
//
    static let ForeignBodyInsect = Condition(name: "Foreign body (insect)", images:[#imageLiteral(resourceName: "07_insect")], testConditionName: ["Myringosclerosis", "Foreign body (insect)", "Otitis media", "Normal Tympanic Membrane"], informationText: "Different types of foreign body require different methods of removal. Insects should be killed prior to their removal. This can be done by using mineral oil or lidocaine.", signs:[])
    
    //RED TYMPANIC MEMBRANE
    
    static let BullousMyringitis = Condition(name: "Bullous Myringitis", images:[#imageLiteral(resourceName: "bullous_myringitis")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "Myringitis means inflammation of the tympanic membrane. Blood or serous filled bullae form between the layers of the tympanic membrane causing sudden and severe pain", signs: ["Blistering of the tympanic membrane", "Blisters can be filled with serous fluid or blood"])
    
    static let AcuteOtitisMedia1 = Condition(name: "Acute Otitis Media", images:[#imageLiteral(resourceName: "acute_otitis_media")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs: ["Bulging of the tympanic membrane", "Increased vascularity / hyperaemia"])
    
    static let Haemotympanum = Condition(name: "Haemotympanum", images:[#imageLiteral(resourceName: "haemotympanum")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "Haemotympanum can occur following trauma and can indicate a basal skull fracture. It is important to also check behind the ear lobe for bruising (Battle’s Sign).", signs: ["Dark red fluid collection behind the tympanic membrane", "Bulging of the tympanic membrane"])
    
    static let Otosclerosis = Condition(name: "Otosclerosis", images:[#imageLiteral(resourceName: "otosclerosis")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "Otosclerosis is a process by which the normal bony structure of stapes and / or cochlea is replaced by spongy and then sclerotic bone. This causes the stapes footplate to harden and limit its mobility. The pinkish color seen (known as schwartz sign) is increased vascularity of the cochlea seen during the spongy phase of the disease.", signs: ["Localised area of pinkish coloration behind the tympanic membrane"])
    
    static let GlomusTumor = Condition(name: "Glomus Tumor", images:[#imageLiteral(resourceName: "glomus_tumour")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "", signs: ["Localised area of pinkish coloration behind the tympanic membrane"])
    
    
    //WHITE TYMPANIC MEMBRANE
    
    static let Tympanosclerosis = Condition(name: "Tympanosclerosis", images:[#imageLiteral(resourceName: "tympanosclerosis")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "Myringosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.", signs: ["Chalky white patches on the tympanic membrane"])
    
    static let CongenitalCholesteatoma = Condition(name: "Congenital Cholesteatoma", images:[#imageLiteral(resourceName: "congenital_cholesteatoma")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "", signs: ["Pearly mass behind the tympanic membrane"])
    
    static let Osteoma = Condition(name: "Osteoma", images:[#imageLiteral(resourceName: "osteoma")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "", signs: ["Bony white outpouchings of the ear canal"])
    
    static let Grommet1 = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "grommet")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "", signs: ["Grommet is usually placed antero-inferiorly"])
    
    static let OtomycosisCandidal = Condition(name: "Otomycosis (Candidal)", images:[#imageLiteral(resourceName: "otomycosis")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "", signs: ["Patchy white found on ear canal and sometimes the tympanic membrane"])
    
    //COMMON
    
    static let AcuteOtitisMedia2 = Condition(name: "Acute Otitis Media", images:[#imageLiteral(resourceName: "common_otitis_media")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs: ["Bulging of the tympanic membrane", "Increased vascularity / hyperaemia"])
    
    static let OtitisMediaWithEffusion = Condition(name: "Otitis media with effusion", images:[#imageLiteral(resourceName: "otitis_media_with_effusion"), #imageLiteral(resourceName: "common_otitis_media_with_effusion_bubbles")], testConditionName: ["Acute otitis media", "Haemotympanum", "Ottic barotrauma", "Otitis media with effusion"], informationText: "Otitis media with effusion is a very common condition in which the mucosal lining of the middle ear secretes fluid which may occur as a result of eustachian tube dysfunction. The condition is also known as ‘Glue Ear’.", signs: ["Discolored tympanic membrane (can be amber, blue or yellow", "Retraction of the tympanic membrane (If mild the annulus will look more prominent)", "Air fluid level or bubbles behind the tympanic membrane"])
    
    static let OtitisExterna = Condition(name: "Otitis Externa", images:[#imageLiteral(resourceName: "common_otitis_externa")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumour", "Haemotympanum"], informationText: "", signs: ["Ear canal red and oedematous", "Tympanic membrane sometimes not visible due to swelling"])
    
    static let TympanicMembranePerforation = Condition(name: "Tympanic Membrane Perforation", images:[#imageLiteral(resourceName: "common_tm_perforation")], testConditionName: ["Myringosclerosis", "Tympanic Membrane Perforation", "Haemotympanum", "Foreign Body"], informationText: "Tympanic membrane perforations can be caused by direct penetrating injury or from barotrauma - a sudden change in pressure.", signs: ["Perforation", "Blood suggests trauma"])
    
    static let Grommet2 = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "grommet")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "", signs: ["Grommet is usually placed antero-inferiorly"])
    
    //EMERGENCY
    
    static let AcquiredCholesteatoma = Condition(name: "Acquired Cholesteatoma", images:[#imageLiteral(resourceName: "acquired_cholesteatoma")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "", signs: ["Debris or keratin plug see in the attic (superior portion of the tympanic membrane"])
    
    static let MalignantOtitisExterna1 = Condition(name: "Malignant Otitis Externa", images:[#imageLiteral(resourceName: "malignant_oe")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "", signs: ["Ear canal red and oedematous", "Granulation tissue"])
    
    static let MalignantOtitisExterna2 = Condition(name: "Malignant Otitis Externa", images:[#imageLiteral(resourceName: "malignant_oe2")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "", signs: ["Ear canal red and oedematous", "Granulation tissue"])
    
    static let AtticRetraction1 = Condition(name: "Attic Retraction", images:[#imageLiteral(resourceName: "tympanosclerosis_retraction_pocket")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "", signs: ["Retraction pocket in attic (superior area of the tympanic membrane / pars flaccida)"])
    
    static let AtticRetraction2 = Condition(name: "Attic Retraction", images:[#imageLiteral(resourceName: "attic_retraction")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "", signs: ["Retraction pocket in attic (superior area of the tympanic membrane / pars flaccida)"])

//    
//    static let TestSet = [Normal, AcuteOtitisMedia, Haemotympanum, TympanicMembranePerforation, Myringosclerosis, OtitisMediaWithEffusion, ForeignBodyInsect]
//    
//    static let FreeConditions = [Normal, AcuteOtitisMedia, Haemotympanum]
//    
//    static var IsExtraContentUnlocked = false
//    
//    static func IsLocked(_ condition:Condition) -> Bool {
//        if IsExtraContentUnlocked {
//            return false
//        } else {
//            return !FreeConditions.contains { (testCondition) -> Bool in
//                return testCondition.name == condition.name
//            }
//        }
//        
//    }
}
