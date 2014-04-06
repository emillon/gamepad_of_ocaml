class type gamepad = object
  method id : Js.js_string Js.t Js.prop
  method axes : float Js.js_array Js.t Js.prop
  method buttons : bool Js.js_array Js.t Js.prop
end
