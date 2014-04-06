let getGamepads () =
  Js.Unsafe.fun_call ( Js.Unsafe.variable "navigator.webkitGetGamepads" )[||]
