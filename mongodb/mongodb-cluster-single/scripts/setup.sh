#!/bin/bash 

mongodb1=${MONGO1}
mongodb2=${MONGO2}
mongodb3=${MONGO3}

port1=${PORT01:-27017}
port2=${PORT02:-27017}
port3=${PORT03:-27017}

echo "Started.."
mongo --host ${mongodb1}:${port1} <<EOF
    db = db.getSiblingDB('admin')
    var cfg = {
        "_id": "${RS}",
        "protocolVersion": 1,
        "members": [
            {
                "_id": 0,
                "host": "${mongodb1}:${port1}"
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });
EOF
