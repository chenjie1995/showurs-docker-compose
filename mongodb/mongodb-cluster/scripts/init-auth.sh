#!/bin/bash 
mongo --host ${MONGOS1}:${MONGOS_PORT} <<EOF
db = db.getSiblingDB('admin')
db.createUser({
  user: "$MONGO_ROOT_USERNAME",
  pwd: "$MONGO_ROOT_PASSWORD",
  roles: [
    { role: 'userAdminAnyDatabase', db: 'admin' }
  ]
})
EOF

mongo --host ${MONGO_CONFIG1}:${MONGO_CONFIG_PORT} <<EOF
db = db.getSiblingDB('admin')
db.createUser({
  user: "$MONGO_ROOT_USERNAME",
  pwd: "$MONGO_ROOT_PASSWORD",
  roles: [
    { role: 'userAdminAnyDatabase', db: 'admin' }
  ]
})
EOF

mongo --host ${MONGO1}:${MONGO_PORT1} <<EOF
db = db.getSiblingDB('admin')
db.createUser({
  user: "$MONGO_ROOT_USERNAME",
  pwd: "$MONGO_ROOT_PASSWORD",
  roles: [
    { role: 'userAdminAnyDatabase', db: 'admin' }
  ]
})
EOF

mongo --host ${MONGO2}:${MONGO_PORT1} <<EOF
db = db.getSiblingDB('admin')
db.createUser({
  user: "$MONGO_ROOT_USERNAME",
  pwd: "$MONGO_ROOT_PASSWORD",
  roles: [
    { role: 'userAdminAnyDatabase', db: 'admin' }
  ]
})
EOF

mongo --host ${MONGO3}:${MONGO_PORT1} <<EOF
db = db.getSiblingDB('admin')
db.createUser({
  user: "$MONGO_ROOT_USERNAME",
  pwd: "$MONGO_ROOT_PASSWORD",
  roles: [
    { role: 'userAdminAnyDatabase', db: 'admin' }
  ]
})
EOF