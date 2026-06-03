//
/********** Developed by Drudots Technology **********/
/******** https://www.drudotstech.com **********/
//

import UIKit

@IBDesignable
class FadedImageView: UIImageView {

    // MARK: - Inspectable Properties
    @IBInspectable var fadeLength: CGFloat = 30 {
        didSet { updateMask() }
    }

    @IBInspectable var fadeTop: Bool = true {
        didSet { updateMask() }
    }

    @IBInspectable var fadeBottom: Bool = true {
        didSet { updateMask() }
    }

    @IBInspectable var fadeLeft: Bool = false {
        didSet { updateMask() }
    }

    @IBInspectable var fadeRight: Bool = false {
        didSet { updateMask() }
    }

    private let maskLayer = CAGradientLayer()

    override func layoutSubviews() {
        super.layoutSubviews()
        updateMask()
    }

    private func updateMask() {
        maskLayer.frame = bounds
        
        // Use a vertical gradient for Top/Bottom fades
        // To do a true 4-way fade, you would need to stack masks or use a custom CGContext.
        // This implementation focuses on the most common Vertical or Horizontal use case.
        
        let vertical = (fadeTop || fadeBottom)
        maskLayer.startPoint = vertical ? CGPoint(x: 0.5, y: 0) : CGPoint(x: 0, y: 0.5)
        maskLayer.endPoint = vertical ? CGPoint(x: 0.5, y: 1) : CGPoint(x: 1, y: 0.5)
        
        let length = vertical ? bounds.height : bounds.width
        guard length > 0 else { return }
        
        let edgePercent = NSNumber(value: Float(fadeLength / length))
        let oppositeEdgePercent = NSNumber(value: Float(1.0 - (fadeLength / length)))

        var colors: [CGColor] = []
        var locations: [NSNumber] = []

        // Start Edge
        if (vertical && fadeTop) || (!vertical && fadeLeft) {
            colors.append(UIColor.clear.cgColor)
            locations.append(0.0)
            colors.append(UIColor.black.cgColor)
            locations.append(edgePercent)
        } else {
            colors.append(UIColor.black.cgColor)
            locations.append(0.0)
        }

        // End Edge
        if (vertical && fadeBottom) || (!vertical && fadeRight) {
            colors.append(UIColor.black.cgColor)
            locations.append(oppositeEdgePercent)
            colors.append(UIColor.clear.cgColor)
            locations.append(1.0)
        } else {
            colors.append(UIColor.black.cgColor)
            locations.append(1.0)
        }

        maskLayer.colors = colors
        maskLayer.locations = locations
        self.layer.mask = maskLayer
    }
}
