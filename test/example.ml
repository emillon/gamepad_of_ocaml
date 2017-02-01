module H = Dom_html
let js = Js.string

let status =
  Js.Opt.get (H.document##getElementById(js"status")) (fun () -> assert false)

let display msg =
  status##.innerHTML := js msg

let string_of_gamepad (g:Gamepad.t Js.t) =
  let print_array p x =
    String.concat " " (List.map p (Array.to_list x))
  in
  let p_ax f =
    Printf.sprintf "% 3.2f" f
  in
  let p_button b =
    if Gamepad.button_is_pressed b then "[X]" else "[ ]"
  in
  Printf.sprintf ("%s\n%d\n%s\n%s")
    (g##.id |> Js.to_string)
    (g##.timestamp)
    (g##.axes |> Js.to_array |> print_array p_ax)
    (g##.buttons |> Js.to_array |> print_array p_button)

let _ =
  while%lwt true do
    let gamepads = Gamepad.get () in
    let gamepad_def = Js.array_get gamepads 0 in
    Js.Optdef.iter gamepad_def (fun gamepad ->
      display (string_of_gamepad gamepad)
    );
    Lwt_js_events.request_animation_frame ()
  done
