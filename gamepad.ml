let getGamepads () =
  Js.Unsafe.eval_string ("navigator.getGamepads ? navigator.getGamepads() : (navigator.webkitGetGamepads ? navigator.webkitGetGamepads() : [])")
