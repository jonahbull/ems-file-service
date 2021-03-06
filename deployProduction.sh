#!/bin/bash

#
# Copyright Elasticsearch B.V. and/or licensed to Elasticsearch B.V. under one
# or more contributor license agreements. Licensed under the Elastic License;
# you may not use this file except in compliance with the Elastic License.
#

set -e
set +x

# Expected env variables:
# * GPROJECT - e.g. "elastic-ems"
# * GCE_ACCOUNT - credentials for the google service account (JSON blob)

if [[ -z "${GPROJECT}" ]]; then
    echo "GPROJECT is not set, e.g. 'GPROJECT=elastic-ems-prod'"
    exit 1
fi

export EMS_PROJECT="files"

export TILE_HOST="tiles.maps.elastic.co"
export VECTOR_HOST="vector.maps.elastic.co"
export CATALOGUE_BUCKET=${GPROJECT}-${EMS_PROJECT}-catalogue
export VECTOR_BUCKET=${GPROJECT}-${EMS_PROJECT}-vector
export ARCHIVE_BUCKET=${GPROJECT}-files-archive

./build.sh
