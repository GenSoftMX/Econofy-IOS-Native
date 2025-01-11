//
//  PasswordTextField.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//


import UIKit

/// A customizable UITextField with additional features such as placeholder styling,
/// dynamic border color on focus, password visibility toggle, and input validation.
public class PasswordTextField: UITextField {
   
    /// Button to toggle password visibility when the text field is used for secure input.
    private let toggleButton = UIButton(type: .custom)

    // MARK: - Initializers
  
    /// Initializes the custom text field programmatically.
   
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        
        self.isSecureTextEntry = true
        
        configurePasswordButton()
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
        self.textColor = UIColor.darkGray
        self.tintColor = UIColor.blue
        self.backgroundColor = UIColor(hex: "#F5F9FE")
        
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    
    // MARK: - Public Methods

    
    /// Validates the input of the text field by ensuring it is non-empty.
    /// - Returns: `true` if the input is valid, otherwise `false`.
    func isValidInput() -> Bool {
        guard let text = self.text else { return false }
        return !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    
    /// Set the input title
    public func setTitle(title:String) {
        self.attributedPlaceholder = NSAttributedString(
            string: title,
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
       return bounds.inset(by: .init(top: 16, left: 24, bottom: 16, right: 50))
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
    
    
    // MARK: - Public Methods

    public var onChange: ((String) -> Void)?

    
    // MARK: - Private Methods
    
    /// Configures the toggle button for password visibility.
    private func configurePasswordButton() {
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal) // Icon for hidden password
        toggleButton.setImage(UIImage(systemName: "eye"), for: .selected) // Icon for visible password
       
        toggleButton.tintColor = UIColor.gray
        toggleButton.frame = CGRect(x: 0, y: 0, width: 22, height: 22)
        
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        
        let buttonContainer = UIView(frame: CGRect(x: 0, y: 0, width: 48, height: 48))
        
        toggleButton.center = buttonContainer.center
        
        buttonContainer.addSubview(toggleButton)
        
        rightView = buttonContainer
        
        rightViewMode = .always
    }
    
    /// Toggles the visibility of the password text.
    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle() // Toggle secure entry
        toggleButton.isSelected.toggle() // Update button state
        
        // Fix visual issue when toggling `isSecureTextEntry`
        let currentText = text
        text = nil
        text = currentText
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let onChange = onChange {
            onChange(textField.text ?? "")
        }
    }
}
