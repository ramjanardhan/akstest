#!/bin/bash

CLUSTER_NAME=Micro
RESOURCE_GROUP=MC_cloud_Micro_westus2

NODE_RESOURCE_GROUP=$(az aks show -g $RESOURCE_GROUP -n $CLUSTER_NAME --query "nodeResourceGroup" -o tsv)

az vmss list -g MC_cloud_Micro_westus2 --query "[].name" -o tsv | while read -r scale_set
do 
    echo "Shutting down scaleset in the AKS resource group. Scale Set: $scale_set"
    az vmss deallocate -g MC_cloud_Micro_westus2 -n aks-agentpool-20675736-vmss
done