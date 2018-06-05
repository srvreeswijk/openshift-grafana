#!/bin/bash
set -x

setoauth=0
node_exporter=0
datasource_name='prometheus'
prometheus_namespace='tooling'
sa_reader='prometheus'
protocol="https://"


payload="$( mktemp )"
cat <<EOF >"${payload}"
{
"name": "${datasource_name}",
"type": "prometheus",
"typeLogoUrl": "",
"access": "proxy",
"url": "https://$( oc get route prometheus -n "${prometheus_namespace}" -o jsonpath='{.spec.host}' )",
"basicAuth": false,
"withCredentials": false,
"jsonData": {
    "tlsSkipVerify":true
},
"secureJsonData": {
    "httpHeaderName1":"Authorization",
    "httpHeaderValue1":"Bearer $( oc sa get-token "${sa_reader}" -n "${prometheus_namespace}" )"
}
}
EOF

echo '######################################################################################'
cat $payload
echo '######################################################################################'

# setup grafana data source
grafana_host="${protocol}$( oc get route grafana -o jsonpath='{.spec.host}' )"
curl --insecure -H "Content-Type: application/json" -u admin:admin "${grafana_host}/api/datasources" -X POST -d "@${payload}"


exit 0
