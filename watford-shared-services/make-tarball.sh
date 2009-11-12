#!/bin/bash

cd $(readlink -f $(basename $0))
tar czvf sharedservices.tar.gz --transform 's#watford-shared-services#sharedservices#;' watford-shared-services
