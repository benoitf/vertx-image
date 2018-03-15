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

CURRENT_FOLDER=$(pwd)
git clone https://github.com/openshiftio-vertx-boosters/vertx-health-checks-booster tmp-folder
cd tmp-folder && scl enable rh-maven33 'mvn clean package'
cd ${CURRENT_FOLDER} && rm -rf tmp-folder
