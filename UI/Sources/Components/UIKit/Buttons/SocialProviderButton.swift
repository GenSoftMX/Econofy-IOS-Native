//
//  SocialproviderButton.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//
//
//  SocialProviderButton.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 06/01/25.
//

import UIKit
import SnapKit

/// A customizable button component that represents a social provider, with an icon, title, and tap action.
public class SocialProviderButton: UIView {
    
    // MARK: - Private Properties

    /// The main button overlay that captures user interactions.
    private let button = UIButton()

    /// The image view displaying the social provider's icon.
    private let iconImageView = UIImageView()

    /// The label displaying the title of the social provider.
    private let titleLabel = UILabel()

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
        // Set up corner radius and background color.
        self.layer.cornerRadius = 16
        self.layer.masksToBounds = true
        self.backgroundColor = .systemGray6

        // Add subviews.
        addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(button)

        // Configure the icon image view.
        iconImageView.contentMode = .scaleAspectFit

        // Configure the title label.
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black

        // Configure the button to capture tap events.
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        setupConstraints()
    }

    /// Sets up constraints for the subviews.
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(24)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }

        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // MARK: - Action Handlers

    /// Handles the button tap event and executes the `buttonAction` closure if it is set.
    @objc private func buttonTapped() {
        buttonAction?()
    }

    // MARK: - Public Methods

    /// Configures the button with a title, icon, and background color.
    /// - Parameters:
    ///   - title: The text to display on the button.
    ///   - icon: The image to display as the button's icon.
    ///   - backgroundColor: The background color of the button.
    public func configure(with title: String, icon: UIImage, backgroundColor: UIColor) {
        titleLabel.text = title
        iconImageView.image = icon
        self.backgroundColor = backgroundColor
    }
}
