import UIKit

class lineHorizontal:UIView {
  
  required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
  
  override init(frame:CGRect) {
    super.init(frame: frame)
    
    layer.backgroundColor = colorGreyLines().CGColor
    translatesAutoresizingMaskIntoConstraints = false
    
    Constraint(restrict: self).staticHeight(1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
}


class lineVertical:UIView {
  
  required init?(coder aDecoder: NSCoder){super.init(coder: aDecoder)}
  
  override init(frame:CGRect) {
    super.init(frame: frame)
    
    layer.backgroundColor = colorGreyLines().CGColor
    translatesAutoresizingMaskIntoConstraints = false
    
    Constraint(restrict: self).staticWidth(1)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
}
