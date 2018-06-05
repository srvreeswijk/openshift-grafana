#!/bin/bash



# -n prometheus            = the name of the prometheus datasource in grafana, can be any name
# -s prometheus            = prometheus service account name to use
# -p tooling               = namespace where prometheus is installed
# -a                       = install oauth-proxy for grafana
# -e                       = install node-exporter dashboard
# for more options see setup-grafana.sh script. 
./setup-grafana.sh -n prometheus -s prometheus -p tooling -a -e
