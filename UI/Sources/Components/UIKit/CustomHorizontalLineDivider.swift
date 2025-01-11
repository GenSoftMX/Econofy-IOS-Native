//  CustomHorizontalLineDivider.swift
//  CustomUI
//
//  Created by Jesus Donaldo Sanchez Inzunza on 07/01/25.
//

import UIKit

/// A custom view that displays a horizontal line divider with a title in the center.
/// The divider has two lines on either side of the title.
public class CustomHorizontalLineDivider: UIView {
  
    // MARK: - Private Properties
    
    private lazy var firstLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    private lazy var finalLine: UIView = {
        let line = UIView()
        line.backgroundColor = .lightGray
        return line
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.GrayScale900Color
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Or" // Default text
        return label
    }()
    
    // MARK: - Initializers
    
    /// Initializes the view with a frame.
    ///
    /// - Parameter frame: The frame for the view.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    /// Initializes the view from a storyboard or nib.
    ///
    /// - Parameter coder: The coder used to decode the view.
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup Methods
    
    /// Sets up the view by adding subviews and configuring constraints.
    private func setupView() {
        addSubview(firstLine)
        addSubview(finalLine)
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    /// Configures the constraints for the subviews.
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        firstLine.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalTo(titleLabel.snp.leading).offset(-11)
            make.height.equalTo(1)
        }
        
        finalLine.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(11)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    // MARK: - Public Methods
    
    /// Configures the divider with a custom title and line color.
    ///
    /// - Parameters:
    ///   - title: The title text to display in the center of the divider.
    ///   - lineBackgroundColor: The background color for both the lines.
    public func configure(with title: String, lineBackgroundColor: UIColor) {
        firstLine.backgroundColor = lineBackgroundColor
        finalLine.backgroundColor = lineBackgroundColor
        titleLabel.text = title
    }
}
