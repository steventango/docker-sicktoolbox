# docker-sicktoolbox

Docker container for interfacing with the SICK LMS2xx lasers. Dockerfile and Compose
specification for [sicktoolbox](http://wiki.ros.org/sicktoolbox) and
[sicktoolbox_wrapper](http://wiki.ros.org/sicktoolbox_wrapper) packages which
are only released in EOL distros.

```bash
docker compose run sicktoolbox rosrun sicktoolbox_wrapper sicklms _port:=/dev/ttyUSB0 _baud:=38400
```

There is a useful tutorial on [Using SICK Laser Scanners with the
sicktoolbox_wrapper](http://wiki.ros.org/sicktoolbox_wrapper/Tutorials/UsingTheSicklms)
