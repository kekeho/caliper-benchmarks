sui start --network.config /root/.sui/sui_config/network.yaml &
sleep 3
sui client switch --address 0xfef3945b4fc518b416377bdce6cc0ded70a013ad
sui client transfer --to 0x08f9a17ca2375b9e9a7df5348ce4f3f59534388d --object-id 0x2420ca76d9a43a85e835d3da89e3e83cb703aaba --gas-budget 1000
sui client transfer --to 0xaa37732d5069a2153a2fcbd1118990d32ac3c176 --object-id 0x467eba8ecffe8354db8a740163b5e3dd59f52570 --gas-budget 1000

sleep infinity
