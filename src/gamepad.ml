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

let get () =
  Js.Unsafe.eval_string ("navigator.getGamepads ? navigator.getGamepads() : (navigator.webkitGetGamepads ? navigator.webkitGetGamepads() : [])")

let button_is_pressed b =
  let f = Js.Unsafe.eval_string
    "(function (b) { return ((typeof(b) === 'object') ? b.pressed : b); })"
  in
  let this = Dom_html.window in
  Js.Unsafe.call f this [|Js.Unsafe.inject b|]
