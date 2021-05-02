import UIKit

class BaggageNotFoundView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.font = UIFont.systemFont(ofSize: 12)
        messageLabel.textAlignment = .center
        messageLabel.textColor = .black
        return messageLabel
    }()
    
    
    init(messageText: String = "") {
        super.init(frame: .zero)
        messageLabel.text = messageText
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(messageLabel)
        NSLayoutConstraint.activate ([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
}
