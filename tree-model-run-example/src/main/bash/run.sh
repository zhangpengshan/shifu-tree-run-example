#!/bin/bash
# 
# Copyright (c) 2016 PayPal Corporation. All rights reserved.

# --------------------------------------------------------------------------------------------------------------
#
#    Run shifu tree ensemble model
#
#    Author: pengzhang@paypal.com
#
# --------------------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------------------
#
# Variables
#
# --------------------------------------------------------------------------------------------------------------
export BIN_DIR="$( cd "$( dirname $0)" && pwd )"
# --------------------------------------------------------------------------------------------------------------
#
# Shell flow
#
# --------------------------------------------------------------------------------------------------------------
cd ${BIN_DIR}

# check java
if [ -f "/x/opt/java7/bin/java" ]; then
    JAVA=/x/opt/java7/bin/java
else
    if [ "${JAVA_HOME}X" != "X" ]; then
        JAVA=${JAVA_HOME}/bin/java
    else
        java -version
        _status=$?
        if [ "${_status}X" != "0X" ]; then
            echo "ERROR: JAVA_HOME is not set, cannot run iras service with Jetty."
            exit 1
        else
            JAVA="java"
        fi
    fi
fi
echo $BIN_DIR/lib/shifu-0.10.0-SNAPSHOT.jar 

echo "GBT model prediction start ..."
$JAVA -server -Xms512M -Xmx512M \
    -classpath $BIN_DIR/../lib/shifu-0.10.0-SNAPSHOT.jar:$BIN_DIR/../lib/guagua-core-0.7.4.jar:$BIN_DIR/../lib/tree-model-run-example-0.0.1-SNAPSHOT.jar \
    ml.shifu.tree.Main $BIN_DIR/../model/model0.gbt

echo "RF model prediction start ..."
$JAVA -server -Xms512M -Xmx512M \
    -classpath $BIN_DIR/../lib/shifu-0.10.0-SNAPSHOT.jar:$BIN_DIR/../lib/guagua-core-0.7.4.jar:$BIN_DIR/../lib/tree-model-run-example-0.0.1-SNAPSHOT.jar \
    ml.shifu.tree.Main $BIN_DIR/../model/model0.rf

echo "INFO: DONE."