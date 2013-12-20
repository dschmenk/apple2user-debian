PACKAGE=apple2user
VERSION=0.1.0
DIST=$(PACKAGE)-$(VERSION)
DISTDIR=./$(DIST)

apple2user:

clean:

install:

dist:
	mkdir $(DISTDIR)
	-chmod 777 $(DISTDIR)
	cp Makefile $(DISTDIR)
	cp -R ./debian $(DISTDIR)
	-chmod -R a+r $(DISTDIR)
	tar czf $(DIST).tar.gz $(DISTDIR)

deb:
	$(MAKE) dist
	mv $(DIST).tar.gz $(PACKAGE)_$(VERSION).orig.tar.gz
	cd $(DIST); debuild -us -uc
	rm $(PACKAGE)_$(VERSION).orig.tar.gz
