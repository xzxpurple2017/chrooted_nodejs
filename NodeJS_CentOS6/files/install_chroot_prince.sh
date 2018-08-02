#!/bin/bash

VERSION='12-1'
curl -O https://www.princexml.com/download/prince-${VERSION}.centos6.x86_64.rpm
yum install -y prince-${VERSION}.centos6.x86_64.rpm
