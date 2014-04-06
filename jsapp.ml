module H = Dom_html
let js = Js.string

module Gamepad_types = struct

  class type gamepad = object
    method id : Js.js_string Js.t Js.prop
  end

end

module Gamepad : sig
  type gamepad = Gamepad_types.gamepad

  val getGamepads : unit -> gamepad Js.t Js.js_array Js.t
end = struct
  type gamepad = Gamepad_types.gamepad

  let getGamepads () =
    Js.Unsafe.fun_call ( Js.Unsafe.variable "navigator.webkitGetGamepads" )[||]
end

let status =
  Js.Opt.get (H.document##getElementById(js"status")) (fun () -> assert false)

let display msg =
  status##innerHTML <- msg

let runAnimation () =
  let gamepads = Gamepad.getGamepads () in
  for i = 0 to gamepads##length - 1 do
    let go = Js.array_get gamepads i in
    Js.Optdef.iter go (fun g ->
      let i = g##id in
      display i
    )
  done

let _ =
  H.window##setInterval (Js.wrap_callback runAnimation, 100.)
