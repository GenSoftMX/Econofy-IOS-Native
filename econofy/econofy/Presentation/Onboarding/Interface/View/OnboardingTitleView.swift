import Foundation
import UIKit
import SnapKit
import CustomUI

class OnboardingTitleView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.WhiteColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0 // Permite que el texto se expanda
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = AppColors.GrayScale200Color
        label.textAlignment = .center
        label.numberOfLines = 0 // Permite que el texto se expanda
        return label
    }()
    
    // Propiedad para asegurar que el contenedor se ajuste dinámicamente
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: .init())
    }
    
    private func setupView() {
        addSubview(stackView)
        
        // Usamos SnapKit para el contenedor principal (stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        // Asegura que el stackView crezca de acuerdo al contenido
        stackView.setContentHuggingPriority(.required, for: .vertical)
        stackView.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    func configure(title: String, subtitle: String, icon: UIImage?) {
        titleLabel.text = title
        subtitleLabel.attributedText = getAttributedSubTitle(title: subtitle, icon: icon)
    }
    
    // Función para combinar texto con imagen
    private func getAttributedSubTitle(title: String, icon: UIImage?) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()
        
        // Añadir texto al subtítulo
        let titleString = NSAttributedString(string: " \(title)", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ])
        attributedString.append(titleString)
        
        // Añadir imagen al texto
        if let icon = icon {
            let attachment = NSTextAttachment()
            attachment.image = icon
            attachment.bounds = CGRect(x: 0, y: -10, width: 50, height: 50) // Ajustar la posición y tamaño de la imagen
            
            let imageString = NSAttributedString(attachment: attachment)
            attributedString.append(imageString)
        }
        
        return attributedString
    }
}
