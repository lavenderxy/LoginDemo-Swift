
struct Debug {
  
  class Private {
    static func parse(_path:String, _function:String, _line:Int) -> String {
      let path     = Debug.path(_path)
      let function = Debug.function(_function)
      let line     = Debug.line(_line)
      return path + ":" + function + ":" + line + "::"
    }
  }
  
  static func examine(_value:Any? = nil, _path:String = #file, _function:String = #function, _line:Int = #line) -> String {
    let location = Private.parse(_path, _function:_function, _line:_line)
    
    if let value = _value {
      let type = Mirror(reflecting: value).subjectType
      print("")
      print(location)
      print(String(type) + " => " + String(value))
//      print(location + " " + String(type) + " => " + String(value))
//      print(location, "type:"+String(type), "value:"+String(value))
    } else {
      print(location)
    }
    return ""
  }
  
  static func trace(_silence:Bool=false, _path:String = #file, _function:String = #function, _line:Int = #line) -> String {
    let location = Private.parse(_path, _function:_function, _line:_line)
    
    if _silence == true {
      return location
    } else {
      print(location)
      return ""
    }
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