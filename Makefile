.PHONY: all watch clean

_obuild/app/app.js: _obuild/app/app.byte
	js_of_ocaml -pretty $<

_obuild/app/app.byte: *.ml *.mli
	ocp-build

all:
	ocp-build

clean:
	ocp-build -clean

install: all
	ocp-build install gamepad

watch:
	make ; while true ; do inotifywait -qe close_write *.ml *.mli; clear ; make ; echo OK ; done
