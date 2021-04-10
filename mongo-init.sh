#!/bin/bash
set -e

mongo <<EOF
use myDatabase
db.createUser({
  user:  '$ENV_APP_SERVER_USERNAME',
  pwd: '$ENV_APP_SERVER_PW',
  roles: [{
    role: 'readWrite',
    db: 'tweets'
  }]
})
db.createCollection("myCollection")
EOF