BIN ?= dcpr
PREFIX ?= /usr/local

install:
	cp dcpr $(PREFIX)/bin/$(BIN)
	chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)
