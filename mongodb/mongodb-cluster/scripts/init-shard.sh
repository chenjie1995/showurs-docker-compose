#!/bin/bash 

mongos=${MONGOS}

mongodb1_1=${MONGO1_1}
mongodb1_2=${MONGO1_2}
mongodb1_3=${MONGO1_3}

mongodb2_1=${MONGO2_1}
mongodb2_2=${MONGO2_2}
mongodb2_3=${MONGO2_3}

mongodb3_1=${MONGO3_1}
mongodb3_2=${MONGO3_2}
mongodb3_3=${MONGO3_3}

port=${PORT:-27017}

echo "Started.."
mongo --host ${mongos}:${port} <<EOF
    db = db.getSiblingDB('admin')
    sh.addShard( "${RS1}/${mongodb1_1}:${PORT1},${mongodb1_2}:${PORT2},${mongodb1_3}:${PORT3}" );
    sh.addShard( "${RS2}/${mongodb2_1}:${PORT1},${mongodb2_2}:${PORT2},${mongodb2_3}:${PORT3}" );
    sh.addShard( "${RS3}/${mongodb3_1}:${PORT1},${mongodb3_2}:${PORT2},${mongodb3_3}:${PORT3}" );
    sh.status();
EOF
