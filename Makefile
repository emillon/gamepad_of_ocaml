.PHONY: all watch clean

_build/%:
	ocamlbuild -use-ocamlfind -plugin-tag "package(js_of_ocaml.ocamlbuild)" $*

all: _build/gamepad.cma _build/jsapp.js

clean:
	ocamlbuild -clean

watch:
	make ; while true ; do inotifywait -qe close_write *.ml *.mli; clear ; make ; echo OK ; done
