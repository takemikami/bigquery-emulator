#!/bin/bash

if [ "$PROJECT" = "" ]; then
    PROJECT=test
fi
if [ "$DATASET" = "" ]; then
    DATASET=test
fi

exec /bin/bigquery-emulator --project $PROJECT --dataset $DATASET
