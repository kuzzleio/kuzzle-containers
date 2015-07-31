#!/bin/bash

PROFILING_LIST=$(find /profiling/*.out -type f -printf "/profiling/%f ")
blackfire upload -i $PROFILING_LIST