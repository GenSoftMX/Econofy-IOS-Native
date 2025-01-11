//
//  PasswordTextField.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//


import UIKit

/// A customizable UITextField with additional features such as placeholder styling,
/// dynamic border color on focus, password visibility toggle, and input validation.
public class CustomTextField: UITextField {
    
    // MARK: - Initializers
    
    /// Initializes the custom text field programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /// Initializes the custom text field when used in a storyboard or xib file.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    
    /// Configures the base appearance and properties of the text field.
    private func setup() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor(hex: "#F5F9FE").cgColor
        self.layer.cornerRadius = 14.0
        self.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.textColor = AppColors.GrayScale900Color
        self.tintColor = AppColors.WhiteColor
        
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    
    // MARK: - Public Methods
    
    public var onChange: ((String) -> Void)?

    /// Configures the text field with a placeholder and additional features like password visibility toggle.
    /// - Parameter placeHolder: The placeholder text to display when the field is empty.
    public func configure(placeHolder: String) {
      

        self.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [
                .foregroundColor: UIColor.lightGray,
                .font: UIFont.italicSystemFont(ofSize: 16)
            ]
        )
    }
    
    
    // MARK: - Overridden Methods
    
    /// Customizes the text rectangle for the text field.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 16)
    }
    
    /// Customizes the editing rectangle for the text field.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 24, dy: 16)
    }
    
    /// Updates the border color when the text field gains focus.
    public override func becomeFirstResponder() -> Bool {
        let didBecomeFirstResponder = super.becomeFirstResponder()
        if didBecomeFirstResponder {
            self.layer.borderColor = AppColors.Primary500Color.cgColor // Change border color on focus
        }
        return didBecomeFirstResponder
    }
     
    /// Restores the border color when the text field loses focus.
    public override func resignFirstResponder() -> Bool {
        let didResignFirstResponder = super.resignFirstResponder()
        if didResignFirstResponder {
            self.layer.borderColor = AppColors.GrayScale100Color.cgColor // Reset border color
        }
        return didResignFirstResponder
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let onChange = onChange {
            onChange(textField.text ?? "")
        }
    }
}
