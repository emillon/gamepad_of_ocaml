.PHONY: watch

_obuild/app/app.js: _obuild/app/app.byte
	js_of_ocaml -pretty $<

_obuild/app/app.byte: *.ml *.mli
	ocp-build

watch:
	make ; while true ; do inotifywait -qe close_write *.ml *.mli; clear ; make ; echo OK ; done
