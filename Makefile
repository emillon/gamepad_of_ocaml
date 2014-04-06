_obuild/app/app.js: _obuild/app/app.byte
	js_of_ocaml -pretty $<

_obuild/app/app.byte: *.ml
	ocp-build
