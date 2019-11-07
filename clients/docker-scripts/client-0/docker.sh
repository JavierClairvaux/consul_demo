# #client0 and client1
#  docker run --rm -d -p 8001:8443 -p 8002:8443 \
#     -p 8003:8443 -p 8004:8443 -p 8005:8443 -p 8006:8443  \
#     -v $(pwd):/opt/imposter/config \
#     outofcoffee/imposter-openapi:0.7.0
#
# sudo docker run -d --network host --name payment-proxy javier1/consul-envoy -sidecar-for payment
# sudo docker run -d --network host --name traffic-proxy javier1/consul-envoy -sidecar-for traffic-generator -admin-bind 127.0.0.1:19001

#Install influxdb
sudo curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt-get update
sudo apt-get install influxdb -y
sudo systemctl start influxd
sudo apt install influxdb-client
influx -execute "create database telegraf
create user telegraf with password 'pass'"
