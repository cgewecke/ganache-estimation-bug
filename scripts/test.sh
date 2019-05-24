#!/usr/bin/env bash

# Executes cleanup function at script exit.
trap cleanup EXIT

# Load helpers
source ./scripts/launch_testrpc.sh

# -----------------------  Launch client ---------------------------------------

if [ $TEST = 'ganache' ]; then
  echo "Starting ganache-cli instance"
  npx ganache-cli --version
  start_testrpc
elif [ $TEST = 'geth' ]; then
  echo "Starting geth instance (this takes a minute...)"
  npx geth-dev-assistant --launch --tag latest --accounts 0
fi

# Buidler is super fast on launch
sleep 5

# -----------------------  Test ------------------------------------------

npx buidler test

# ----------------------- Cleanup ----------------------------------------
if [ $TEST = 'geth' ]; then
  docker stop geth-client
fi
