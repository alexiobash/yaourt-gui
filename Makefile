SHELL = /bin/bash
INSTALL = /usr//bin/install -c
MSGFMT = /usr/bin/msgfmt
SED = /bin/sed
DESTDIR =
bindir = /usr/bin
localedir = /usr/share/locale
config = /usr/share/yaourt-gui
icons = /usr/share/pixmaps
deskdir = /usr/share/applications

all:

install: all
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -d $(DESTDIR)$(config)
	$(INSTALL) -d $(DESTDIR)$(icons)
	$(INSTALL) -d $(DESTDIR)$(deskdir)
	$(INSTALL) -m755 yaourt-gui $(DESTDIR)$(bindir)
	$(INSTALL) -m755 yglogo $(DESTDIR)$(config)
	$(INSTALL) -m644 COPYING $(DESTDIR)$(config)
	$(INSTALL) -m644 AUTHORS $(DESTDIR)$(config)
	$(INSTALL) -m644 yaourtgui.png $(DESTDIR)$(icons)
	$(INSTALL) -m644 Yaourt-Gui.desktop $(DESTDIR)$(deskdir)
	for file in po/*.po; \
	do \
		lang=$$(echo $$file | $(SED) -e 's#.*/\([^/]\+\).po#\1#'); \
		$(INSTALL) -d $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES; \
		$(MSGFMT) -o $(DESTDIR)$(localedir)/$$lang/LC_MESSAGES/yaourt-gui.mo $$file; \
	done
