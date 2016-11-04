let getGamepads () =
  Js.Unsafe.eval_string ("navigator.getGamepads ? navigator.getGamepads() : (navigator.webkitGetGamepads ? navigator.webkitGetGamepads() : [])")

let button_is_pressed b =
  let f = Js.Unsafe.eval_string
    "(function (b) { return ((typeof(b) === 'object') ? b.pressed : b); })"
  in
  let this = Dom_html.window in
  Js.Unsafe.call f this [|Js.Unsafe.inject b|]
