### PROD VPN SCRIPT ###

#!/bin/bash

gcloud compute target-vpn-gateways create vpn-gateway-prod --network={vpc-network} --region={region} --project={project_name}

gcloud compute addresses describe vpn-ip-prod --region={region} --project={project_name} --format='flattened(address)'

gcloud compute forwarding-rules create fr-gateway-esp --load-balancing-scheme=EXTERNAL --network-tier=PREMIUM --ip-protocol=ESP --address={vpn-ip} --target-vpn-gateway={vpn-gateway} --region=us-{region} --project={project_name}

gcloud compute forwarding-rules create fr-gateway-udp500 --load-balancing-scheme=EXTERNAL --network-tier=PREMIUM --ip-protocol=UDP --ports=500 --address={vpn-ip} --target-vpn-gateway={vpn-gateway} --region={region} --project={project_name}

gcloud compute forwarding-rules create fr-gateway-udp4500 --load-balancing-scheme=EXTERNAL --network-tier=PREMIUM --ip-protocol=UDP --ports=4500 --address={vpn-ip} --target-vpn-gateway={vpn-gateway} --region={region} --project={project_name}

gcloud compute vpn-tunnels create vpn-tunnel-prod --peer-address={peer_ip_address} --ike-version=2 --shared-secret={shared_secret} --local-traffic-selector=0.0.0.0/0 --remote-traffic-selector=0.0.0.0/0 --target-vpn-gateway={vpn-gateway} --region={region} --project={project_name}

gcloud compute routes create vpn-route-prod --destination-range={destination_range} --next-hop-vpn-tunnel=vpn-tunnel --network={vpc-network} --next-hop-vpn-tunnel-region={region} --project={project_name}