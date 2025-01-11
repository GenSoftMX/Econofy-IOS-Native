//
//  CustomButton.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//
//
//  CustomButton.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//

import UIKit

/// A customizable button component that supports dynamic title, font, and color, with tap action handling.
public class CustomButton: UIView {
    
    // MARK: - Private Properties

    /// The label used to display the button's title.
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    // MARK: - Public Properties

    /// The action to be executed when the button is tapped.
    public var buttonAction: (() -> Void)?

    // MARK: - Initializers

    /// Initializes the view programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    /// Initializes the view from a storyboard or XIB file.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Setup Methods

    /// Configures the view's appearance and behavior.
    private func setupView() {
        // Set up corner radius and clipping behavior.
        self.layer.cornerRadius = 14
        self.clipsToBounds = true

        // Add tap gesture recognizer to handle taps.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)

        // Add and constrain the title label.
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }

    // MARK: - Action Handlers

    /// Handles the tap gesture and executes the `buttonAction` closure if it is set.
    @objc private func handleTap() {
        buttonAction?()
    }

    // MARK: - Public Methods

    /// Sets the title, font, and color for the button's title.
    /// - Parameters:
    ///   - title: The text to display on the button.
    ///   - font: The font to use for the title.
    ///   - color: The color of the title text.
    public func setTitle(title: String, font: UIFont, color: UIColor) {
        titleLabel.text = title
        titleLabel.font = font
        titleLabel.textColor = color
    }
}
