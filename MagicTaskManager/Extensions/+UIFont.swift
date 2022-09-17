import UIKit
import SwiftUI

public enum FontWeight: String {
    case bold = "Montserrat-Bold"
    case medium = "Montserrat-Medium"
    case regular = "Montserrat-Regular"
    case semibold = "Montserrat-SemiBold"
}

extension UIFont {
    static func montserrat(_ size: CGFloat, _ weight: FontWeight) -> UIFont {
             UIFont(name: weight.rawValue, size: size)!
        }
}

extension Font {
    init(uiFont: UIFont) {
        self = Font(uiFont as CTFont)
    }
}
