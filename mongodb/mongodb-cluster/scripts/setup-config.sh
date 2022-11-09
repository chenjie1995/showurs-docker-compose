#!/bin/bash 

mongodb1=${MONGO1}
mongodb2=${MONGO2}
mongodb3=${MONGO3}

port=${PORT:-27017}

echo "Started.."
mongo --host ${mongodb1}:${port} <<EOF
    db = db.getSiblingDB('admin')
    var cfg = {
        "_id": "${RS}",
        "configsvr": true,
        "protocolVersion": 1,
        "members": [
            {
                "_id": 100,
                "host": "${mongodb1}:${port}"
            },
            {
                "_id": 101,
                "host": "${mongodb2}:${port}"
            },
            {
                "_id": 102,
                "host": "${mongodb3}:${port}"
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });
EOF
