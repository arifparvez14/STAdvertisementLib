import UIKit

class BannerAddView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5.0
        return button
    }()
    
    var callbackClosure: ((Bool) -> Void)?
    
    init(messageText: String = "", callbackClosure: ((Bool) -> Void)?) {
        super.init(frame: .zero)
        self.callbackClosure = callbackClosure
        messageLabel.text = messageText
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(messageLabel)
        containerView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        closeButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 45.0).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    }
    
    @objc func closeButtonTapped(_ sender: Any){
        callbackClosure?(true)
    }
}
