#!/bin/bash

# set root pass
ROOT_PASS=$(<env)

if [ -z "$ROOT_PASS" ]
then
      echo -e "variable \$ROOT_PASS is empty\nYou must add strong password into env file\nFor example: echo \"MyStrongPass\" > env"  && exit 0
fi

# get parameter of num linodes
if [ $1 ]; then  NUMDROPLETS=$1; else NUMDROPLETS=1; fi

## set root pass
#if [ $2 ]; then  ROOT_PASS=$2; else echo -e "You must set a root password\nFor example: ./init.sh 10 YourStrongPass2022" && exit 1; fi

# get list of account ssh keys
KEYS=$(linode-cli sshkeys list --text --format 'ssh_key' --no-header)

IMAGE="linode/debian11"
STACKSCRIPT_LABEL="db1000n"

linode-cli stackscripts create --label $STACKSCRIPT_LABEL --images $IMAGE --script stackscript.sh

STACKSCRIPT_ID=$(linode-cli stackscripts list --label $STACKSCRIPT_LABEL --format 'id' --text --no-header |sort -r |head -n1)

# generate random hash for linodes name
HASH=$(date | md5)

for ((c=1; c<=NUMDROPLETS; c++))
do
     # get a random region from the list of all available
     REGION=$(linode-cli regions list --format 'id' --text --no-header | sort -R | head -n1)

     linode-cli linodes create \
       --image $IMAGE \
       --root_pass $ROOT_PASS \
       --stackscript_id  $STACKSCRIPT_ID \
       --type g6-nanode-1 \
       --region $REGION \
       --label "debian-${REGION}-$(date +%s)"
done
