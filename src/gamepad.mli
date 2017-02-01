type button

class type t = object
  method id : Js.js_string Js.t Js.readonly_prop
  (*readonly    attribute long                index;*)
  (*readonly    attribute boolean             connected;*)
  method timestamp : int Js.readonly_prop
  (*readonly    attribute DOMString           mapping;*)
  method axes : float Js.js_array Js.t Js.readonly_prop
  method buttons : button Js.js_array Js.t Js.readonly_prop
end

val get : unit -> t Js.t Js.js_array Js.t

val button_is_pressed : button -> bool
