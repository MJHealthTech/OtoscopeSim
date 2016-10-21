import UIKit

struct Conditions {
    
    static let Normal = Condition(name: "Normal", images: [#imageLiteral(resourceName: "01_normal")], testConditionName: ["Otitis Media", "Normal", "Perforated Eardrum", "Myringosclerosis"], informationText: "This is a normal tympanic membrane. Whilst it is important to recognise pathologies, it is equally important to recognise what is normal.", signs:[])
    
//    static let AcuteOtitisMedia = Condition(name: "Acute otitis media", images:[#imageLiteral(resourceName: "common_otitis_media")], testConditionName: ["Otitis media with effusion", "Haemotympanum", "Glomus Tumor", "Acute otitis media"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs:["Bulging typmanic membrane", "Increased vascularity"])
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
//    static let Haemotympanum = Condition(name: "Haemotympanum", images:[#imageLiteral(resourceName: "03_haemotympanum")], testConditionName: ["Acute otitis media", "Otitis media with effusion", "Glomus Tumor", "Haemotympanum"], informationText: "Haemotympanum can occur following trauma and can indicate a basal skull fracture. It is important to also check behind the ear lobe for bruising (Battle’s Sign).", signs:[])
//
    static let ForeignBodyInsect = Condition(name: "Foreign body (insect)", images:[#imageLiteral(resourceName: "07_insect")], testConditionName: ["Myringosclerosis", "Foreign body (insect)", "Otitis media", "Normal Tympanic Membrane"], informationText: "Different types of foreign body require different methods of removal. Insects should be killed prior to their removal. This can be done by using mineral oil or lidocaine.", signs:[])
    
    //RED TYMPANIC MEMBRANE
    
    static let BullousMyringitis = Condition(name: "Bullous Myringitis", images:[#imageLiteral(resourceName: "bullous_myringitis")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Haemotympanum", "Otosclerosis"], informationText: "Myringitis means inflammation of the tympanic membrane. Blood or serous filled bullae form between the layers of the tympanic membrane causing sudden and severe pain", signs: ["Blistering of the tympanic membrane", "Blisters can be filled with serous fluid or blood"])
    
    static let AcuteOtitisMedia1 = Condition(name: "Acute Otitis Media", images:[#imageLiteral(resourceName: "acute_otitis_media")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Haemotympanum", "Glomus Tumor or Schwartz sign"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs: ["Bulging of the tympanic membrane", "Increased vascularity / hyperaemia"])
    
    static let Haemotympanum = Condition(name: "Haemotympanum", images:[#imageLiteral(resourceName: "haemotympanum")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Haemotympanum", "Glomus Tumor or Schwartz sign"], informationText: "Haemotympanum can occur following trauma and can indicate a basal skull fracture. It is important to also check behind the ear lobe for bruising (Battle’s Sign).", signs: ["Dark red fluid collection behind the tympanic membrane", "Bulging of the tympanic membrane"])
    
    static let GlomusTumorAndOtosclerosis = Condition(name: "Glomus Tumor or Otosclerosis", images:[#imageLiteral(resourceName: "glomus_tumour"), #imageLiteral(resourceName: "otosclerosis")], testConditionName: ["Acute Otitis Media", "Bullous Myringitis", "Glomus Tumor", "Haemotympanum", "Glomus Tumor or Otosclerosis"], informationText: "In this image it is difficult to tell whether this is a glomus tumor or Schwartz sign of otosclerosis. A glomus tumor is a slow growing vasular tumor that rises from the jugular foramen. Schwartz sign is seen in otoslerosis. This is a condition where the normal bony structure of the stapes and cocholea are replaced by spongy and then sclerotic bone. Schwartz sign is an area of increased vascularity seen when the disease is in it's spongy phase.", signs: ["Localised area of pinkish coloration behind the tympanic membrane"])
    
    static let RedTympanicMembrane = [BullousMyringitis, AcuteOtitisMedia1, Haemotympanum, GlomusTumorAndOtosclerosis]
    
    //WHITE TYMPANIC MEMBRANE
    
    static let Tympanosclerosis = Condition(name: "Tympanosclerosis", images:[#imageLiteral(resourceName: "tympanosclerosis")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis", "Grommet"], informationText: "Tympanosclerosis is scarring of the tympanic membrane. Commonly occurs secondary to recurrent infections of the middle ear.", signs: ["Chalky white patches on the tympanic membrane"])
    
    static let CongenitalCholesteatoma = Condition(name: "Congenital Cholesteatoma", images:[#imageLiteral(resourceName: "congenital_cholesteatoma")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis", "Grommet"], informationText: "A cholesteatoma is a mis-nomer and rather than being anything to do with cholesterol represents an abnormal growth of squamous epithelial cells. If the tympanic membrane is intact than it is congenital. The reason for why they arise is not fully understood", signs: ["Pearly mass behind the tympanic membrane"])
    
    static let Osteoma = Condition(name: "Osteoma", images:[#imageLiteral(resourceName: "osteoma")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "Osteomas are benign neoplasms of the temporal bone (remember that around a third of the ear canal is made from cartilage and two thirds from temporal bone). The condition looks very similar to the condition exostosis (surfer's ear)", signs: ["Bony white outpouchings of the ear canal"])
    
    static let Grommet1 = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "grommet")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "Grommets are small tubes inserted into the tympanic membrane usually for the treatment of otitis media with effusion. The connection between the middle ear and the ear canal canal equalises the pressure in the middle ear and prevents further fluid building up in the middle ear ", signs: ["Grommet is usually placed antero-inferiorly"])
    
    static let OtomycosisCandidal = Condition(name: "Otomycosis (Candidal)", images:[#imageLiteral(resourceName: "otomycosis")], testConditionName: ["Tympanosclerosis", "Congenital Cholesteatoma", "Osteoma", "Otomycosis"], informationText: "Otomycosis is a fungal infection of the outer ear. The most common orgasnisms are Aspergillus Niger and Candida. In this case the infection is caused by candida which is evident by the characteristing white spores seen.", signs: ["Patchy white found on ear canal and sometimes the tympanic membrane"])
    
    static let WhiteTympanicMembrane = [Tympanosclerosis, CongenitalCholesteatoma, Osteoma, Grommet1, OtomycosisCandidal]
    
    //COMMON
    
    static let AcuteOtitisMedia2 = Condition(name: "Acute Otitis Media", images:[#imageLiteral(resourceName: "common_otitis_media"), #imageLiteral(resourceName: "acute_otitis_media")], testConditionName: ["Acute Otitis Media", "Otitis Media with Effusion", "Tympanic Membrane Perforation", "Grommet", "Otitis Externa"], informationText: "Acute otitis media is an infection of the middle ear. Typically characterised by a bulging tympanic membrane.", signs: ["Bulging of the tympanic membrane", "Increased vascularity / hyperaemia"])
    
    static let OtitisMediaWithEffusion = Condition(name: "Otitis media with effusion", images:[#imageLiteral(resourceName: "otitis_media_with_effusion"), #imageLiteral(resourceName: "common_otitis_media_with_effusion_bubbles")], testConditionName: ["Acute Otitis Media", "Otitis Media with Effusion", "Tympanic Membrane Perforation", "Grommet", "Otitis Externa"], informationText: "Otitis media with effusion is a very common condition in which the mucosal lining of the middle ear secretes fluid which may occur as a result of eustachian tube dysfunction. The condition is also known as ‘Glue Ear’.", signs: ["Discolored tympanic membrane (can be amber, blue or yellow", "Retraction of the tympanic membrane (If mild the annulus will look more prominent)", "Air fluid level or bubbles behind the tympanic membrane"])
    
    static let OtitisExterna = Condition(name: "Otitis Externa", images:[#imageLiteral(resourceName: "common_otitis_externa")], testConditionName: ["Acute Otitis Media", "Otitis Media with Effusion", "Tympanic Membrane Perforation", "Grommet", "Otitis Externa"], informationText: "Otitis externa is infection of the external ear. The main risk factors to ask about are swimming and trauma - particularly the use of cotton wool buds", signs: ["Ear canal red and oedematous", "Tympanic membrane sometimes not visible due to swelling"])
    
    static let TympanicMembranePerforation = Condition(name: "Tympanic Membrane Perforation", images:[#imageLiteral(resourceName: "common_tm_perforation"), #imageLiteral(resourceName: "04_perforation_thumb")], testConditionName: ["Acute Otitis Media", "Otitis Media with Effusion", "Tympanic Membrane Perforation", "Grommet", "Otitis Externa"], informationText: "Tympanic membrane perforations can be caused by direct penetrating injury or from barotrauma - a sudden change in pressure.", signs: ["Perforation", "Blood suggests trauma"])
    
    static let Grommet2 = Condition(name: "Grommet", images:[#imageLiteral(resourceName: "grommet")], testConditionName: ["Acute Otitis Media", "Otitis Media with Effusion", "Tympanic Membrane Perforation", "Grommet", "Otitis Externa"], informationText: "Grommets are small tubes inserted into the tympanic membrane usually for the treatment of otitis media with effusion. The connection between the middle ear and the ear canal canal equalises the pressure in the middle ear and prevents further fluid building up in the middle ear ", signs: ["Grommet is usually placed antero-inferiorly"])
    
    static let Common = [AcuteOtitisMedia2, OtitisMediaWithEffusion, OtitisExterna, TympanicMembranePerforation, Grommet2]
    
    //EMERGENCY
    
    static let AcquiredCholesteatoma = Condition(name: "Acquired Cholesteatoma", images:[#imageLiteral(resourceName: "acquired_cholesteatoma")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "A cholesteatoma is an abnormal growth of squamous epithelial cells. Acquired cholesteatomas may develop as a result of chronic middle ear disease.", signs: ["Debris or keratin plug see in the attic (superior portion of the tympanic membrane"])
    
    static let MalignantOtitisExterna = Condition(name: "Malignant Otitis Externa", images:[#imageLiteral(resourceName: "malignant_oe"), #imageLiteral(resourceName: "malignant_oe2")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "Malignant otitis externa is an aggressive form of otitis externa. Whilst otitis externa is confined to the skin of the ear canal, malignant otitis externa progresses to osteomyelitis, spreading to the underlying temporal bone", signs: ["Ear canal red and oedematous", "Granulation tissue"])
    
    static let AtticRetraction = Condition(name: "Attic Retraction", images:[#imageLiteral(resourceName: "tympanosclerosis_retraction_pocket"), #imageLiteral(resourceName: "attic_retraction")], testConditionName: ["Acquired Cholesteatoma", "Congenital Cholesteatoma", "Malignant Otitis Externa", "Attic Retraction Pocket"], informationText: "Retractions pockets in the attic of the tympanic membrane can develop into a cholesteatoma", signs: ["Retraction pocket in attic (superior area of the tympanic membrane / pars flaccida)"])
    
    static let Emergency = [AcquiredCholesteatoma, MalignantOtitisExterna, AtticRetraction]

}
