module H = Dom_html
let js = Js.string

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
