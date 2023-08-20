#!/bin/bash
#
# This script is started when the container starts.
#
cat <<_eof_
Welcome to the container.
Jupyterlab: To run Jupyter-lab,  cd to the directory where you want to start,
            then run jlab.sh to start Jupyter-lab and then
            point your browser to localhost:11000/lab and paste in the token.


_eof_
cd 
bash
