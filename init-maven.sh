#!/bin/bash
# Copyright (c) 2017 Red Hat, Inc.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
#
#

set -e
set -u

maven-get() {
  url=${1}
  fold=${2}
  goal=${3}
  echo "Cloning ${1} and using subfolder ${fold} and goal ${goal}"
  cd ${HOME}
  git clone ${url} tmp-folder
  cd tmp-folder/${fold}
  scl enable rh-maven33 "mvn clean ${goal}"
  cd ${HOME} && rm -rf tmp-folder
}

maven-get "https://github.com/openshiftio-vertx-boosters/vertx-health-checks-booster" "" "package"
maven-get "https://github.com/apache/incubator-openwhisk-devtools" "java-action-archetype" "install"

