import UIKit

struct Suite {
    let name:String
    let htmlDescription:String
    let conditions:[Condition]
    
    var attributedDescription:NSAttributedString {
        do {
            let styledHtml = "<html><head><meta charset=\"utf-8\">" +
                "<style type=\"text/css\">body {font-size: 15px; font-family: AvenirNext, sans-serif;} table { border-collapse: collapse; } table, th, td { font-size: 12px; border: 1px solid #a0a0a0; padding: 3px 7px 2px 7px;} tr.alt td { background-color: #404040; } li:not(:first-child){ margin: 10px 0; }</style>" +
                "\(htmlDescription)" +
            "</body></head></html>"
            let attrStr = try NSAttributedString(data: styledHtml.data(using: .utf8)!, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType], documentAttributes: nil)
            return attrStr
        }
        catch {
        }
        return NSAttributedString()
    }
}
