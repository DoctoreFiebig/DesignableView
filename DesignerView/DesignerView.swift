import UIKit

@IBDesignable
class DesignerView: UIView {

    private var centerPoint: CGPoint!
    private var radius: CGFloat!
    
    @IBInspectable
    var outerMargin: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable
    var colorCircle: UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private func getCenter(){
        centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        radius = (min(bounds.size.width, bounds.size.height) / 2 ) - outerMargin
    }
    private func drawMyCircle()->UIBezierPath {
        let path = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: 0, endAngle: 2*CGFloat(M_PI), clockwise: false)
        return path
    }
    
    override func drawRect(rect: CGRect) {
        getCenter()
        colorCircle.setFill()
        drawMyCircle().fill()
    }

}
