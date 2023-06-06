FROM ros:kinetic-ros-core

RUN apt-get update
RUN apt-get install -y build-essential git ros-kinetic-diagnostic-updater

ENV WS=/root/catkin_ws
RUN mkdir -p ${WS}/
WORKDIR ${WS}/src

RUN git clone -b catkin https://github.com/ros-drivers/sicktoolbox.git
WORKDIR ${WS}/src/sicktoolbox
RUN git checkout 9ea9174
WORKDIR ${WS}/src

RUN git clone -b revert-6-kinetic-devel https://github.com/ros-drivers/sicktoolbox_wrapper.git
WORKDIR ${WS}

RUN . /opt/ros/${ROS_DISTRO}/setup.sh && catkin_make

RUN rosdep init
RUN rosdep update --include-eol-distros
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && . devel/setup.sh && rosdep install sicktoolbox_wrapper
RUN . /opt/ros/${ROS_DISTRO}/setup.sh && . devel/setup.sh && rosmake install sicktoolbox_wrapper

RUN sed --in-place --expression '$isource "$WS/devel/setup.bash"' /ros_entrypoint.sh

CMD ["rosrun", "sicktoolbox_wrapper", "sicklms", "_port:=/dev/ttyUSB0", "_baud:=38400"]
