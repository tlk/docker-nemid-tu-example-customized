
# Customized NemID TU Example war-file
This project describes how to get the NemID TU Example from
http://www.nets.eu/dk-da/Service/kundeservice/nemid-tu/NemID-tjenesteudbyderpakken-okt-2014/Pages/default.aspx#tab3
up and running using Docker and Tomcat on Mac OS X.

The war-file is built and run on separate Docker containers.

Thanks to Docker it is not necessary to have neither Java JRE, JDK, Maven nor
Tomcat installed directly on the host OS. Neat!



### Install boot2docker
See https://docs.docker.com/installation/mac/

### Start boot2docker
```
boot2docker start
eval "$(boot2docker shellinit)"
```


# Build the TU example code

```
git clone git@github.com:tlk/docker-nemid-tu-example-customized.git
cd docker-nemid-tu-example-customized
make init
```

The source code is located in the newly created src directory. Use make to compile:
```
make build
```


# Run the customized TU example code

```
make run
```
Note: To stop tomcat and the docker container press <kbd>Ctrl</kbd>+<kbd>c</kbd>.

## Open the url in a browser
Since the docker container was started in interactive mode, go to another terminal window
and open the url from there.
```
open http://$(boot2docker ip):8080
```


