import UIKit

class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        guard let gradientLayer = self.layer as? CAGradientLayer else {
            return;
        }
        
        let lightGrey = UIColor(red: 195/255, green: 202/255, blue: 208/255, alpha: 1.0).cgColor
        let darkerGrey = UIColor(red: 123/255, green: 131/255, blue: 142/255, alpha: 1.0).cgColor
        
        gradientLayer.colors = [lightGrey, darkerGrey]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
}
