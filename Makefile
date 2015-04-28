
run: dist/ROOT.war
	docker run -p 8080:8080 --rm --name docker-nemid-tu-example-customized-run -v $(shell pwd)/dist:/usr/local/tomcat/webapps tomcat:8.0

open-browser:
	open http://$(shell boot2docker ip):8080

build: dist/ooapi.jar dist/ROOT.war

build-ooapi: dist/ooapi.jar

dist/ooapi.jar: ooapi-source.zip | dist
	docker run -v $(shell pwd)/src/ooapi-source:/usr/src/ooapi-source -w /usr/src/ooapi-source docker-nemid-tu-example-customized-build mvn clean install
	cp src/ooapi-source/target/ooapi.jar dist/

build-tuexample: dist/ROOT.war

dist/ROOT.war: dist/ooapi.jar tuexample-source.zip | dist
	docker run -v $(shell pwd)/src/tuexample-source:/usr/src/tuexample-source -w /usr/src/tuexample-source docker-nemid-tu-example-customized-build mvn clean install
	cp src/tuexample-source/target/tuexample.war dist/ROOT.war

build-tuexample-interactive:
	docker run -it -v $(shell pwd)/src/tuexample-source:/usr/src/tuexample-source -w /usr/src/tuexample-source docker-nemid-tu-example-customized-build /bin/bash

init: src ooapi-source.zip tuexample-source.zip
	docker build -t docker-nemid-tu-example-customized-build .

clean:
	rm -rf ooapi-source.zip tuexample-source.zip src dist

dist:
	mkdir -p dist

src:
	mkdir -p src

ooapi-source.zip: |src
	curl -O http://www.nets.eu/dk-da/Service/kundeservice/nemid-tu/Documents/TU-pakken/Kode/Java/ooapi-source.zip
	unzip ooapi-source.zip -d src/
	rm -rf src/ooapi-source/src/test

tuexample-source.zip: |src
	curl -O http://www.nets.eu/dk-da/Service/kundeservice/nemid-tu/Documents/TU-pakken/Kode/Java/tuexample-source.zip
	unzip tuexample-source.zip -d src/
	rm -rf src/tuexample-source/src/test
	patch -nup0 -i tuexample-source-pom-log4j.patch
	patch -nup0 -i tuexample-customize.patch

