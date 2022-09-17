import UIKit

extension UIStackView {
    func addAllArrangedSubviews(_ views: UIStackView...) {
        views.forEach(addArrangedSubview)
    }
}
