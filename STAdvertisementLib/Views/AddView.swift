//
//  AddView.swift
//  TryLibrary
//
//  Created by ShareTrip iOS on 2/5/21.
//

import UIKit

public enum AddType{
    case banner
    case interstitial
    case native
}

public class AddView: UIView {
    
    var callbackClosure: ((Bool) -> Void)?
    private let status = true
    private let viewModel = AddViewModel(service: AddService())
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor.clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        guard let containerView = self.loadNib(name: "AddView") else {return}
        containerView.frame = self.bounds
        self.addSubview(containerView)
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        setupView()
    }
    
    func setupView() {
        addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo:leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo:trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    public func configureView(addType: AddType, callbackClosure: ((Bool) -> Void)?) {
        self.callbackClosure = callbackClosure
        
        viewModel.loadData() { [weak self] success in
            if success {
                let htmlStr = self?.viewModel.getHTMLString()
                DispatchQueue.main.async { [weak self] in
                    self?.showAddView(addType, htmlStr ?? "")
                }
            }
            else {
                print("Error")
            }
        }
    }
    
    private func showAddView(_ addType: AddType, _ htmlString: String) {
        if addType == .banner {
            self.stackView.addArrangedSubview(BannerAddView(messageText: "From Inside") {
                [weak self] crossButtonTap in
                if crossButtonTap {
                    self?.callbackClosure?(self?.status ?? true)
                }
            })
        }
        
        if addType == .interstitial {
            self.stackView.addArrangedSubview(InterstitialAddView(htmlString: htmlString) {
                [weak self] crossButtonTap in
                if crossButtonTap {
                    self?.callbackClosure?(self?.status ?? true)
                }
            })
        }
    }
}

extension UIView {
    func loadNib(name: String) -> UIView? {
        let bundleName = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundleName)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! UIView
        return view
    }
}


