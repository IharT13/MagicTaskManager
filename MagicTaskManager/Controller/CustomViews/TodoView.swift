import UIKit

final class ToDoView: UIView {
    // MARK: - Properties
    
    // MARK: Private
    
    private let todoStackView: UIStackView = .init()
    private let titleAndCheckBoxSV: UIStackView = .init()
    private let titleLabel: UILabel = .init()
    private let todoSwith: UISwitch = .init()
    private let imageStackView: UIStackView = .init()
    private let personImageView: UIImageView = .init()
    private let secondPersonImageView: UIImageView = .init()
    private let thirthyPersonImageView: UIImageView = .init()
    private let spacer: UIView = .init()
    private let timeLabel: UILabel = .init()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addSetups()
        addContraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.configuratorForPersonsImage(self.personImageView)
            self.configuratorForPersonsImage(self.secondPersonImageView)
            self.configuratorForPersonsImage(self.thirthyPersonImageView)
        }
    }
    
    // MARK: - API
    
    func set(_ title: String, _ isDone: Bool) {
        titleLabel.text = title
        todoSwith.isOn = isDone
        personImageView.image = UIImage(named: "\(Int.random(in: 1..<7))")
        secondPersonImageView.image = UIImage(named: "\(Int.random(in: 7..<14))")
        thirthyPersonImageView.image = UIImage(named: "\(Int.random(in: 14..<20))")
    }
    
    // MARK: - Constraints
    
    // MARK: Private
    
    private func addContraints() {
        addTodoStackViewConstraints()
        addTodoSwithConstraints()
        addImageStackViewConstraints()
        addPersonImageViewConstraints()
        addTodoSwitchSetups()
    }
    
    private func addTodoStackViewConstraints() {
        todoStackView.translatesAutoresizingMaskIntoConstraints = false
        todoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        todoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        todoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        todoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    private func addTodoSwithConstraints() {
        todoSwith.translatesAutoresizingMaskIntoConstraints = false
        todoSwith.widthAnchor.constraint(equalTo: todoStackView.widthAnchor, multiplier: 0.2).isActive = true
    }
    
    private func addImageStackViewConstraints() {
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.heightAnchor.constraint(equalTo: todoStackView.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    private func addPersonImageViewConstraints() {
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.widthAnchor.constraint(equalTo: imageStackView.widthAnchor, multiplier: 0.1).isActive = true
        personImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        personImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        secondPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        secondPersonImageView.widthAnchor.constraint(equalTo: imageStackView.widthAnchor, multiplier: 0.1).isActive = true
        secondPersonImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        secondPersonImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        thirthyPersonImageView.translatesAutoresizingMaskIntoConstraints = false
        thirthyPersonImageView.widthAnchor.constraint(equalTo: imageStackView.widthAnchor, multiplier: 0.1).isActive = true
        thirthyPersonImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        thirthyPersonImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.widthAnchor.constraint(equalTo: imageStackView.widthAnchor, multiplier: 0.15).isActive = true
    }
    
    // MARK: - Setups
    
    // MARK: Private
    
    private func addSubviews() {
        addSubview(todoStackView)
        todoStackView.addAllArrangedSubviews(titleAndCheckBoxSV,
                                          imageStackView)
        titleAndCheckBoxSV.addAllArrangedSubviews(titleLabel,
                                               todoSwith)
        imageStackView.addAllArrangedSubviews(personImageView,
                                           secondPersonImageView,
                                           thirthyPersonImageView,
                                           spacer,
                                           timeLabel)
    }
    
    private func addSetups() {
        addTodoViewSetups()
        addTodoStackViewSetups()
        addTitleAndCheckBoxSVSetups()
        addTitleLabelSetups()
        addTodoSwitchSetups()
        addTimeLabelSetups()
        addImageStackViewSetups()
    }
    
    private func addTodoViewSetups() {
        layer.cornerRadius = 20
        backgroundColor = AppColor.redColor
    }
    
    private func addTodoStackViewSetups() {
        todoStackView.axis = .vertical
        todoStackView.distribution = .fillProportionally
        todoStackView.alignment = .fill
        todoStackView.spacing = 10
    }
    
    private func addImageStackViewSetups() {
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillProportionally
        imageStackView.alignment = .fill
        imageStackView.spacing = -5
    }
    
    private func addTitleAndCheckBoxSVSetups() {
        titleAndCheckBoxSV.axis = .horizontal
        titleAndCheckBoxSV.distribution = .fillProportionally
        titleAndCheckBoxSV.alignment = .fill
        titleAndCheckBoxSV.spacing = 20
    }
    
    private func addTitleLabelSetups() {
        titleLabel.textColor = AppColor.textColor
        titleLabel.font = .montserrat(25, .bold)
        titleLabel.numberOfLines = 2
    }
    
    private func addTimeLabelSetups() {
        timeLabel.text = "\(Int.random(in: 0..<23)):\(Int.random(in: 0..<5))\(Int.random(in: 0..<9))"
        timeLabel.textColor = AppColor.textColor
        timeLabel.font = .montserrat(15, .regular)
    }
    
    private func addTodoSwitchSetups() {
        todoSwith.backgroundColor = AppColor.redColor
        todoSwith.onTintColor = AppColor.redColor
    }
    
    // MARK: - Helpers
    
    // MARK: Private
    
    private func configuratorForPersonsImage(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = personImageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
    }
}

