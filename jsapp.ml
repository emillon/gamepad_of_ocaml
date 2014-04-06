module H = Dom_html
let js = Js.string

let status =
  Js.Opt.get (H.document##getElementById(js"status")) (fun () -> assert false)

let display msg =
  status##innerHTML <- js msg

let string_of_gamepad (g:Gamepad_types.gamepad Js.t) =
  let print_array p x =
    String.concat " " (List.map p (Array.to_list x))
  in
  let p_ax f =
    Printf.sprintf "% 3.2f" f
  in
  let p_button b =
    if b then "[X]" else "[ ]"
  in
  Printf.sprintf ("%s\n%s\n%s")
    (Js.to_string g##id)
    (g##axes |> Js.to_array |> print_array p_ax)
    (g##buttons |> Js.to_array |> print_array p_button)

let runAnimation () =
  let gamepads = Gamepad.getGamepads () in
  for i = 0 to gamepads##length - 1 do
    let go = Js.array_get gamepads i in
    Js.Optdef.iter go (fun g ->
      display (string_of_gamepad g)
    )
  done

let _ =
  H.window##setInterval (Js.wrap_callback runAnimation, 100.)