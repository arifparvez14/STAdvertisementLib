//
//  AddView.swift
//  TryLibrary
//
//  Created by ShareTrip iOS on 2/5/21.
//

import UIKit

@IBDesignable
class AddView: UIView {
   
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stackview: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("AddView", owner: self)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
    }
    
    func configureView(title: String) {
        if title == "a" {
            stackview.addArrangedSubview(BaggageNotFoundView(messageText: "From Inside"))
        }
    }
}


