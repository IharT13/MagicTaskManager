import UIKit

final class TodoStackView: UIStackView {
    
    static let identifier = "TodoStackView"
    
    private let lineStackView = UIStackView()
    private let circleImageView = UIImageView()
    private let lineView = UIView()
    private let todoView = ToDoView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addContraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(_ label: String, _ isDone: Bool) {
        todoView.set(label, isDone)
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {
        addLineStackViewConstraints()
        addCircleImageConstraints()
        addLineViewConstraints()
    }
    
    private func addLineStackViewConstraints() {
        lineStackView.translatesAutoresizingMaskIntoConstraints = false
        lineStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.05).isActive = true
    }
    
    private func addCircleImageConstraints() {
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        circleImageView.heightAnchor.constraint(equalTo: lineStackView.heightAnchor, multiplier: 0.12).isActive = true
        circleImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        circleImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func addLineViewConstraints() {
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addAllArrangedSubviews(lineStackView, todoView)
        lineStackView.addAllArrangedSubviews(circleImageView,
                                          lineView)
    }
    
    private func addSetups() {
        addStackViewSetups()
        addLineStackViewSetups()
        addCircleImageSetups()
        addLineSetups()
    }
    
    private func addStackViewSetups() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillProportionally
        spacing = 15
    }
    
    private func addLineStackViewSetups() {
        lineStackView.axis = .vertical
        lineStackView.alignment = .center
        lineStackView.distribution = .fillProportionally
        lineStackView.spacing = 5
    }
    
    private func addCircleImageSetups() {
        circleImageView.image = UIImage(systemName: "circle.inset.filled")
        circleImageView.tintColor = AppColor.lightOrangeColor
    }

    private func addLineSetups() {
        lineView.backgroundColor = AppColor.redColor
    }
}

