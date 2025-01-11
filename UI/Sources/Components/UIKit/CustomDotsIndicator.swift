//
//  CustomDotIndicator.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 09/01/25.
//

import UIKit

/// A customizable dots indicator used to represent progress or steps in a process.
public class CustomDotsIndicator: UIView {
    
    // MARK: - Properties

    /// The total number of dots to display.
    public var numberOfDots: Int = 0 {
        didSet {
            setupDots()
        }
    }

    /// The index of the currently active dot.
    public var activeDotIndex: Int = 0 {
        didSet {
            updateActiveDot()
        }
    }

    /// The spacing between dots.
    public var dotSpacing: CGFloat = 8.0 {
        didSet {
            stackView.spacing = dotSpacing
        }
    }

    /// The color of inactive dots.
    public var inactiveDotColor: UIColor = .lightGray

    /// The color of the active dot.
    public var activeDotColor: UIColor = .blue

    /// The stack view containing all the dots.
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()

    /// The array of dot views.
    private var dotViews: [UIView] = []

    // MARK: - Initializers

    /// Initializes the view programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }

    /// Initializes the view from a storyboard or XIB file.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
    }

    // MARK: - Setup

    /// Configures the stack view and its constraints.
    private func setupStackView() {
        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        setupDots()
    }

    /// Creates and configures the dots based on the `numberOfDots` property.
    private func setupDots() {
        // Remove existing dots.
        dotViews.forEach { $0.removeFromSuperview() }
        dotViews.removeAll()

        // Add new dots.
        for index in 0..<numberOfDots {
            let dot = UIView()
            dot.backgroundColor = index == activeDotIndex ? activeDotColor : inactiveDotColor
            dot.layer.cornerRadius = 2

            stackView.addArrangedSubview(dot)
            dotViews.append(dot)

            // Set dot size constraints.
            dot.snp.makeConstraints { make in
                make.width.equalTo(32)
                make.height.equalTo(4)
            }
        }
    }

    /// Updates the color of the dots to reflect the `activeDotIndex`.
    private func updateActiveDot() {
        for (index, dot) in dotViews.enumerated() {
            dot.backgroundColor = index == activeDotIndex ? activeDotColor : inactiveDotColor
        }
    }
}
