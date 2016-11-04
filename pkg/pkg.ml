#use "topfind"
#require "topkg"
open Topkg

let build_cmd c os =
  let ocamlbuild = Conf.tool "ocamlbuild" os in
  let build_dir = Conf.build_dir c in
  let debug = Cmd.(on (Conf.debug c) (v "-tag" % "debug")) in
  let profile = Cmd.(on (Conf.profile c) (v "-tag" % "profile")) in
  Cmd.(ocamlbuild % "-plugin-tag" % "package(js_of_ocaml.ocamlbuild)" 
    % "-use-ocamlfind" % "-classic-display" %% debug %% profile % "-build-dir" % build_dir)

let cmd c os files =
  OS.Cmd.run @@ Cmd.(build_cmd c os %% of_list files)

let build = Pkg.build ~cmd ()

let () =
  Pkg.describe ~build "gamepad" @@ fun c ->
  Ok [
    Pkg.mllib "src/gamepad.mllib";
  ]
