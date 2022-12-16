sui start --network.config /root/.sui/sui_config/network.yaml &
sleep 3
sui client transfer --to 0x08f9a17ca2375b9e9a7df5348ce4f3f59534388d --object-id 0x0601e7fb4a37f0c312cc4c23bfd9332a367c269d --gas-budget 1000
sui client transfer --to 0xaa37732d5069a2153a2fcbd1118990d32ac3c176 --object-id 0x175c5fe4d123d2681da176d7127db47082f5e084 --gas-budget 1000

sleep infinity
