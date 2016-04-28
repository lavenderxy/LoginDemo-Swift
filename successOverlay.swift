
import UIKit

protocol SuccessOverlayDelegate {
  func dismissSuccessOverlay()
}


class SuccessOverlay:UIView {
  var source:ForgetPwViewController!
  var delegate:SuccessOverlayDelegate?
  
  let title = UILabel()
  let passwordTF = PasswordTextField()
  let confirmationTF = PasswordTextField()
  let submitBtn = SubmitPasswordBtn()
  
  required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
  
  override init (frame : CGRect) {
    super.init(frame : frame)
  }
  
  convenience init(_controller:ForgetPwViewController) {
    self.init(frame:_controller.view.bounds)
    
    source = _controller
    
    let blurView = UIVisualEffectView(effect:UIBlurEffect(style: .Dark))
    blurView.frame = _controller.view.bounds
    
    
    let overlayView = UIView()
    overlayView.translatesAutoresizingMaskIntoConstraints = false
    overlayView.backgroundColor = colorWhite()
    overlayView.layer.cornerRadius = 10.0
    
    
    title.numberOfLines = 2
    title.font = UIFont(name: "Helvetica-Bold", size: 18)
    title.textAlignment = .Center
    title.text = "Success"
    title.translatesAutoresizingMaskIntoConstraints = false
    title.setContentHuggingPriority(10, forAxis: .Horizontal)
    title.textColor = colorTwitter()
    
    submitBtn.setTitle("OK", forState:.Normal)
    submitBtn.addTarget(self, action:#selector(didTapOKButton), forControlEvents:.TouchUpInside)
    
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.spacing = 40
    stack.axis = .Vertical
    stack.alignment = .Center
    stack.distribution = .Fill
    
    stack.addArrangedSubview(title)
    stack.addArrangedSubview(submitBtn)
    
    overlayView.addSubview(stack)
    
    addSubview(blurView)
    addSubview(overlayView)
    
    sendSubviewToBack(blurView)
    
    Constraint.init(restrict: blurView, authority: self)
      .matchAll()
    
    
    var cV:AnyObject, rV:AnyObject // cV for constrainedView, rV for relatedView
    var x:NSLayoutConstraint, y:NSLayoutConstraint
    var l:NSLayoutConstraint, r:NSLayoutConstraint
    var h:NSLayoutConstraint, w:NSLayoutConstraint
    
    
    rV = self
    cV = overlayView
    
    x = NSLayoutConstraint(item:cV,attribute:.CenterX,relatedBy:.Equal,toItem:rV,attribute:.CenterX, multiplier:1,constant:0)
    y = NSLayoutConstraint(item:cV,attribute:.CenterY ,relatedBy:.Equal,toItem:rV,attribute:.CenterY, multiplier:1,constant:0)
    l = NSLayoutConstraint(item:cV,attribute:.Width ,relatedBy:.Equal,toItem:nil,attribute:.NotAnAttribute,multiplier:1,constant:300)
    h = NSLayoutConstraint(item:cV,attribute:.Height ,relatedBy:.Equal,toItem:cV,attribute:.Width,multiplier:1,constant:0)
    
    rV.addConstraint(x)
    rV.addConstraint(y)
    cV.addConstraint(l)
    cV.addConstraint(h)

    Constraint(restrict: stack, authority: overlayView)
      .centerXs.__
      .tops.fix(40).__
      .heights.relative(0.6).__
      .widths.relative(0.87).__
    
    Constraint(restrict: submitBtn, authority:self)
      .widths.relative(0.6).__
      .heights.relative(0.08).__
    
  }
}

extension SuccessOverlay {
  
    func didTapOffOverlay() {
      if let delegate = delegate {
        delegate.dismissSuccessOverlay()
      }
    }
  
  func didTapOKButton() {
    if let delegate = delegate {
      delegate.dismissSuccessOverlay()
    }
  }
  
}