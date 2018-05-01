#!/bin/bash

until $(curl --output /dev/null --silent --head --fail localhost:5601); do
    echo "Waiting for kibana to add saved objects..."
    sleep 5
done

echo "Connected to kibana";

curl -XPOST localhost:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @/kibana/provisioning/index-patterns.json
curl -XPOST localhost:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @/kibana/provisioning/visualizations.json
curl -XPOST localhost:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @/kibana/provisioning/searches.json
curl -XPOST localhost:5601/api/kibana/dashboards/import -H 'kbn-xsrf:true' -H 'Content-type:application/json' -d @/kibana/provisioning/dashboards.json
