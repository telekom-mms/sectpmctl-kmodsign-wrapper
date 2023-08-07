all: 

package_build: package_clean generate_changelog
	debuild -i -uc -us -b

generate_changelog:
	curl -sL https://raw.githubusercontent.com/telekom-mms/deb-builder-base/main/git-dch.sh | /usr/bin/bash -s -- $(DIST) $(TAG)

package_clean:
	-rm -Rf debian/.debhelper
	-rm -Rf debian/$(firstword $(subst _, ,$(lastword $(subst /, ,$(shell pwd)))))
	-rm debian/$(firstword $(subst _, ,$(lastword $(subst /, ,$(shell pwd))))).debhelper.log
	-rm debian/$(firstword $(subst _, ,$(lastword $(subst /, ,$(shell pwd))))).substvars
	-rm debian/files
	-rm ../$(lastword $(subst /, ,$(shell pwd)))?*
