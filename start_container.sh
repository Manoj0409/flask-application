#!/bin/bash
set -e
docker pull lakshmimanoj/flask:v2
docker run -dit --name flask -p 5000:5000 lakshmimanoj/flask:v2
