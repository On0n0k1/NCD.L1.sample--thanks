#!/usr/bin/env bash
set -e

# load environment variables
if [ -f './scripts/.env' ];
    then export $(grep -v '^#' ./scripts/.env | xargs);
    else echo 'Failed to find ./scripts/.env file';
fi


[ -z "$NEAR_ENV" ] && echo "Missing \$NEAR_ENV environment variable" && exit 1
# [ -z "$CONTRACT" ] && echo "Missing \$CONTRACT environment variable" && exit 1
[ -z "$SPEAKER" ] && echo "Missing \$SPEAKER environment variable" && exit 1
[ -z "$1" ] && echo "Missing \$1 First argument with the message" && exit 1
if [ -z "$2" ] && echo "No NEAR amount included";
    then export amount='';
    else echo "Setting amount to $2" & export amount="--amount $2";
fi

echo
echo 'About to call say() on the contract'
echo near call thanks.\$OWNER say "{\"message\":\"$1\", \"anonymous\": true}" --account_id \$SPEAKER $amount
echo
echo thanks.\$OWNER is $CONTRACT
echo \$SPEAKER is $SPEAKER
echo \$1 is [ $1 ] '(the message)'
echo \$2 is [ $2 NEAR ] '(optionally attached amount)'
echo
near call thanks.$OWNER say "{\"message\":\"$1\", \"anonymous\": true}" --account_id $SPEAKER $amount
