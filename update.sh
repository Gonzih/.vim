#!/bin/bash
git pull
git submodule init
git submodule update
git submodule foreach git pull origin master
git submodule foreach git checkout master
git ci -a -m 'Update submodules to latest versions'
git push
