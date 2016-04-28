
import UIKit

protocol Binding: class {
  var location:String! {get}
  var description:String {get}
  
  var authority:AnyObject! {get}
  var restricted:AnyObject {get}
  
  var restrictedAttribute:NSLayoutAttribute {get}
  var authorityAttribute:NSLayoutAttribute {get}
  
  var relationship:NSLayoutRelation {get set}
  var multiplier:CGFloat {get set}
  var constant:CGFloat {get set}
}


struct Locate {
  
  class Private {
    static func parse(_path:String, _function:String, _line:Int) -> String {
      let path     = Locate.path(_path)
      let function = Locate.function(_function)
      let line     = Locate.line(_line)
      return path + ":" + function + ":" + line
    }
  }
  
  static func debug(_path:String = #file, _function:String = #function, _line:Int = #line) -> String {
    return Private.parse(_path, _function:_function, _line:_line)
  }
  
  static func path(_path:String = #file) -> String {
    return _path.componentsSeparatedByString("/").last!
  }
  
  static func function(_function:String = #function) -> String {
    return _function.componentsSeparatedByString("(").first!
  }
  
  static func line(_line:Int = #line) -> String {
    return String(_line)
  }
  
}


struct LayoutAttribute {
  
  static func name(_attribute:NSLayoutAttribute) -> String {
    switch _attribute {
    case .Baseline: return ".Baseline"
    case .Bottom: return ".Bottom"
    case .BottomMargin: return ".BottomMargin"
    case .CenterX: return ".CenterX"
    case .CenterXWithinMargins: return ".CenterXWithinMargins"
    case .CenterY: return ".CenterY"
    case .CenterYWithinMargins: return ".CenterYWithinMargins"
    case .FirstBaseline: return ".FirstBaseline"
    case .Height: return ".Height"
    case .Leading: return ".Leading"
    case .LeadingMargin: return ".LeadingMargin"
    case .Left: return ".Left"
    case .LeftMargin: return ".LeftMargin"
    case .Right: return ".Right"
    case .RightMargin: return ".RightMargin"
    case .Top: return ".Top"
    case .TopMargin: return ".TopMargin"
    case .Trailing: return ".Trailing"
    case .TrailingMargin: return ".TrailingMargin"
    case .Width: return ".Width"
    default:
      return ""
    }
  }
}

enum Offsets {
  case Static(NSNumber)
  case Relative(NSNumber)
  case Complex(NSNumber,NSNumber)
}

//enum Bound {
//  
//  init(
//    restrict _restricted:AnyObject
//    ,authority _authority:AnyObject? = nil
//    , _path:String = #file
//    , _function:String = #function
//    , _line:Int = #line
//    ){
//    restricted = _restricted
//    authority  = _authority
//    location = Locate.debug(_path, _function:_function, _line:_line)
//  }
//
//
//}
//
//enum Basis {
//  case Tops
//    Of
//}
//enum Frame:{} {
//  case Baselines
//    return Offsets
//  case Bottoms: return ".Bottom"
//  case BottomMargins: return ".BottomMargin"
//  case CenterXs: return ".CenterX"
//  case CenterXs_WithinMargins: return ".CenterXWithinMargins"
//  case CenterYs: return ".CenterY"
//  case CenterYs_WithinMargins: return ".CenterYWithinMargins"
//  case FirstBaselines: return ".FirstBaseline"
//  case Heights: return ".Height"
//  case Leadings: return ".Leading"
//  case LeadingMargins: return ".LeadingMargin"
//  case Lefts: return ".Left"
//  case LeftMargins: return ".LeftMargin"
//  case Rights: return ".Right"
//  case RightMargins: return ".RightMargin"
//  case Tops: return ".Top"
//  case TopMargins: return ".TopMargin"
//  case Trailings: return ".Trailing"
//  case TrailingMargins: return ".TrailingMargin"
//  case Widths: return ".Width"
//  }

//}




//
//if newValue > value {
//  return Tree.Node(value, left: left, right: right.insert(newValue))
//} else {
//  return Tree.Node(value, left: left.insert(newValue), right: right)
//}

//enum asdf:NSURLRelationship {
//  case =
//  case >=
//  case <= = .Equal
//}

class Constraint:Binding {
  var location:String!
  var description:String = ""
  
  var authority:AnyObject!
  var restricted:AnyObject
  
  var restrictedAttribute:NSLayoutAttribute = .NotAnAttribute
  var authorityAttribute:NSLayoutAttribute = .NotAnAttribute
  
  var relationship:NSLayoutRelation = .Equal
  var multiplier:CGFloat = CGFloat(1)
  var constant:CGFloat = CGFloat(0)
  
//  var gte:Constraint {
//    self.relationship = .GreaterThanOrEqual
//    return self
//  }

  var widths:Constraint {
    setAttributes(.Width)
    return self
  }
  
  var heights:Constraint {
    setAttributes(.Height)
    return self
  }

  var leadings:Constraint {
    setAttributes(.Leading)
    return self
  }

  var trailings:Constraint {
    setAttributes(.Trailing)
    return self
  }

  var tops:Constraint {
    setAttributes(.Top)
    return self
  }

  var bottoms:Constraint {
    setAttributes(.Bottom)
    return self
  }

  var centerXs:Constraint {
    setAttributes(.CenterX)
    return self
  }
  
  var centerYs:Constraint {
    setAttributes(.CenterY)
    return self
  }

  var __:Constraint {
    constrain()
    return self
  }

  func fix(_value:NSNumber) -> Constraint {
    constant = CGFloat(_value)
    description += describe(_value)
    return self
  }

  func relative(_value:NSNumber) -> Constraint {
    multiplier = CGFloat(_value)
    description += describe(_value)
    return self
  }
  

  func setAttributes(_attribute:NSLayoutAttribute){
    restrictedAttribute = _attribute
    authorityAttribute = _attribute
  }
  
  
  init(
    restrict _restricted:AnyObject
    ,authority _authority:AnyObject? = nil
    , _path:String = #file
    , _function:String = #function
    , _line:Int = #line
    ){
    restricted = _restricted
    authority  = _authority
    location = Locate.debug(_path, _function:_function, _line:_line)
  }
  
  func describe(_value:AnyObject) -> String {
    return "[" + String(_value) + "]"
  }
  
}

protocol Constrainable:Binding {
  func constrain()
}





extension Constraint {


  func squareStatic(_value:NSNumber) -> Self {
    staticHeight(_value)
    relateEqual(.Width, restrict:.Height)
    return self
  }
  
}


extension Constraint {
  
  
  
  func fixed(_attribute:NSLayoutAttribute, _constant:NSNumber){
    restrictedAttribute = _attribute
    description += "-" + LayoutAttribute.name(_attribute) + describe(_constant)
    constrain()
  }
  
  func applyCementable(_constant:NSNumber, _function:String=#function){
    constant = CGFloat(_constant)
    description += "-" + Locate.function(_function) + describe(_constant)
    constrain()
  }
  
  func staticWidth(_constant:NSNumber) -> Self {
    restrictedAttribute = .Width
    applyCementable(_constant)
    return self
  }
  
  func staticHeight(_constant:NSNumber) -> Self {
    restrictedAttribute = .Height
    applyCementable(_constant)
    return self
  }
  
  func lineStaticWidth(_constant:NSNumber) {
    staticWidth(_constant)
    staticHeight(1)
  }
  
  func lineStaticHeight(_constant:NSNumber) {
    staticWidth(1)
    staticHeight(_constant)
  }
  
}





extension Constraint {
  
  func constrain(){
    let restriction = NSLayoutConstraint(
      item:        restricted
      ,attribute:  restrictedAttribute
      ,relatedBy:  relationship
      ,toItem:     authority
      ,attribute:  authorityAttribute
      ,multiplier: CGFloat(multiplier)
      ,constant:   CGFloat(constant)
    )
    
    restriction.identifier = location + "" + description
    
//    print(#function, #line, restriction)
    
    if let _ = authority {
      authority.addConstraint(restriction)
    } else {
      restricted.addConstraint(restriction)
    }
    
  }
  
}


extension Constraint {
  
  func setConstant(_value:NSNumber){
    constant = CGFloat(_value)
    description += describe(_value)
  }
  
  func setMultiplier(_value:NSNumber){
    multiplier = CGFloat(_value)
    description += describe(_value)
  }
  
  func apply(
    _restricted:NSLayoutAttribute
    , _authority:NSLayoutAttribute? = nil
    , _relationship:NSLayoutRelation? = nil
    , _constant:NSNumber? = nil
    , _multiplier:NSNumber? = nil)
  {
    
    restrictedAttribute  = _restricted
    
    if let authority = _authority {
      authorityAttribute  = authority
      description += "-Align" + LayoutAttribute.name(authority) + "|" + LayoutAttribute.name(_restricted)
    } else {
      authorityAttribute  = _restricted
      description += "-Same" + LayoutAttribute.name(_restricted)
    }
    
    if let relations = _relationship {
      relationship = relations
    }
    
    
    
    if let value = _constant { setConstant(value) }
    if let value = _multiplier { setMultiplier(value) }

    constrain()
  }
  
  func equal(_attribute:NSLayoutAttribute) -> Self {
    apply(_attribute)
    return self
  }
  
  func equalAlterFixed(_attribute:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_attribute, _constant:_value)
    return self
  }
  
  func equalAlterRelative(_attribute:NSLayoutAttribute, multiple _value:NSNumber) -> Self {
    apply(_attribute, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func greaterOrSame(_attribute:NSLayoutAttribute) -> Self {
    apply(_attribute, _relationship:.GreaterThanOrEqual)
    return self
  }
  
  func greaterOrSameAlterFixed(_attribute:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_attribute, _relationship:.GreaterThanOrEqual, _constant:_value)
    return self
  }
  
  func greaterOrSameAlterRelative(_attribute:NSLayoutAttribute, _multiple _value:NSNumber) -> Self {
    apply(_attribute, _relationship:.GreaterThanOrEqual, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func lessOrSame(_attribute:NSLayoutAttribute) -> Self {
    apply(_attribute, _relationship:.LessThanOrEqual)
    return self
  }
  
  func lessOrSameAlterFixed(_attribute:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_attribute, _relationship:.LessThanOrEqual, _constant:_value)
    return self
  }
  
  func lessOrSameAlterRelative(_attribute:NSLayoutAttribute, multiple _value:NSNumber) -> Self {
    apply(_attribute, _relationship:.LessThanOrEqual, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func relateEqual(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute) -> Self {
    apply(_restricted, _authority:_authority)
    return self
  }
  
  func relateEqualAlterFixed(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _constant:_value)
    return self
  }
  
  func relateEqualAlterRelative(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, multiple _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func relateLessOrEqual(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.LessThanOrEqual)
    return self
  }
  
  func relateLessOrEqualAlterFixed(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.LessThanOrEqual, _constant:_value)
    return self
  }
  
  func relateLessOrEqualAlterRelative(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, multiple _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.LessThanOrEqual, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func relateGreaterOrEqual(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.LessThanOrEqual)
    return self
  }
  
  func relateGreaterOrEqualAlterFixed(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, constant _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.GreaterThanOrEqual, _constant:_value)
    return self
  }
  
  func relateGreaterOrEqualAlterRelative(_authority:NSLayoutAttribute, restrict _restricted:NSLayoutAttribute, multiple _value:NSNumber) -> Self {
    apply(_restricted, _authority:_authority, _relationship:.GreaterThanOrEqual, _multiplier:_value)
    return self
  }
  
}

extension Constraint {
  
  func lineRelativeWidth(multiple _value:NSNumber) {
    equalAlterRelative(.Width, multiple:_value)
    staticHeight(1)
  }
  
  func lineRelativeHeight(multiple _value:NSNumber) {
    staticWidth(1)
    equalAlterRelative(.Height, multiple:_value)
  }
  
  func rectangleRelative(height _height:NSNumber, width _width:NSNumber) {
    equalAlterRelative(.Height, multiple:_height)
    equalAlterRelative(.Width, multiple:_width)
  }
  
  func rectangleStatic(height _height:NSNumber, width _width:NSNumber) {
    staticWidth(_height)
    staticHeight(_width)
  }
  
  func matchAll() {
    equal(.CenterX)
    equal(.CenterY)
    equal(.Height)
    equal(.Width)
  }
  
  func insetMargin() {
    relateEqual(.LeadingMargin, restrict:.Leading)
    relateEqual(.TrailingMargin, restrict:.Trailing)
    relateEqual(.TopMargin, restrict:.Top)
    relateEqual(.BottomMargin, restrict:.Bottom)
  }
  
  func insetStatic(_constant:NSNumber) {
    relateEqualAlterFixed(.Leading, restrict:.Leading, constant:_constant)
    relateEqualAlterFixed(.Trailing, restrict:.Trailing, constant:_constant)
    relateEqualAlterFixed(.Top, restrict:.Top, constant:_constant)
    relateEqualAlterFixed(.Bottom, restrict:.Bottom, constant:_constant)
  }
  
  func insetRelative(_multiple:NSNumber) {
    relateEqualAlterRelative(.Leading, restrict:.Leading, multiple:_multiple)
    relateEqualAlterRelative(.Trailing, restrict:.Trailing, multiple:_multiple)
    relateEqualAlterRelative(.Top, restrict:.Top, multiple:_multiple)
    relateEqualAlterRelative(.Bottom, restrict:.Bottom, multiple:_multiple)
  }
  
}









