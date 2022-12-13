#!/bin/bash -eo pipefail
SUCCESS=$(curl  https://keyvalue.immanuel.co/api/KeyVal/GetValue/ckbwbpyq/migration_e6f07ed -k)
echo "https://keyvalue.immanuel.co/api/KeyVal/GetValue/ckbwbpyq/migration_${CIRCLE_WORKFLOW_ID:0:7} -k"
value="fail"
echo "$SUCCESS"
echo "$value"
if [ "$SUCCESS" != "$value" ]
then 
  npm cache clean 
  rm -rf node_modules
  cd ~/project/backend
  npm i
  npm run migrations:revert

fi