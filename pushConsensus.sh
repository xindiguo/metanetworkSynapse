#!/bin/bash

token=$1

#location of metanetwork synapse scripts
pathv=$( cd $(dirname $0) ; pwd -P )/
branch=$( git rev-parse --abbrev-ref HEAD )

. $pathv/config.sh

if [ -e $outputpath/bicNetworks.rda ] && [ -e $outputpath/rankConsensusNetwork.csv ]; then
    python2.7 $pathv/pushToSynapse.py "$outputpath/bicNetworks.rda" "$parentId" "$outputpath/annoFile.txt" "$outputpath/provenanceFile.txt" "bic" $branch $token "$versionCommitMessage"
    python2.7 $pathv/pushToSynapse.py "$outputpath/rankConsensusNetwork.csv" "$parentId" "$outputpath/annoFile.txt" "$outputpath/provenanceFile.txt" "rankConsensus" $branch $token "$versionCommitMessage"
fi
