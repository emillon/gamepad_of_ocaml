class type gamepad = object
  method id : Js.js_string Js.t Js.readonly_prop
  (*readonly    attribute long                index;*)
  (*readonly    attribute boolean             connected;*)
  method timestamp : int Js.readonly_prop
  (*readonly    attribute DOMString           mapping;*)
  method axes : float Js.js_array Js.t Js.readonly_prop
  method buttons : bool Js.js_array Js.t Js.readonly_prop
end
