# Openshift Grafana Dashboards

Research repository, see the origin page for official example
- https://github.com/openshift/openshift-ansible/tree/master/roles/openshift_grafana
- https://github.com/openshift/origin/tree/master/examples/grafana

## Available Dashboards
- openshift cluster metrics
- node exporter metrics

## To deploy grafana
Note: make sure to have openshift prometheus deployed.
(https://github.com/openshift/origin/tree/master/examples/prometheus)

``` ./setup-grafana.sh -n prometheus -a -e ``` 

when you being asked to type username \ password, type 'grafana'
and login with the same cerdentials 

## Create Prometheus datasource
Our prometheus is protected by an openshift oauth-proxy.  
Therefore it needs the token for the service account to allow it to connect to prometheus.  
The script `create-prometheus-datasource-OT.sh` will create this datasource in grafana, with the token already embedded.  
It will create an json REST call to the grafana api to push the datasource.  

1. Login to one of the masters
2. Clone this repo
3. Login to openshift as an administrator
4. Run the script: `create-prometheus-datasource-OT.sh`


## Resources 
- example video https://youtu.be/srCApR_J3Os
- deploy openshift prometheus https://github.com/openshift/origin/tree/master/examples/prometheus 
