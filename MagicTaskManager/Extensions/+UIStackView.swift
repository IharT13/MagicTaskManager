import UIKit

extension UIStackView {
    func addAllArrangedSubview(_ views: UIStackView...) {
        views.forEach(addArrangedSubview)
    }
}
