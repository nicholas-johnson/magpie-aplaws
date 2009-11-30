#!/bin/bash

cd $(readlink -f $(basename $0))
tar czvf sharedservices.tar.gz sharedservices
