#client2
sudo docker run --rm -d -p 8001:8443  \
    -p 8003:8443  -p 8005:8443 -p 8006:8443  \
    -v $(pwd):/opt/imposter/config \
    outofcoffee/imposter-openapi:0.7.0
