#edit the rpc-url and the user addr to set his balance

curl <rpc-url> -X POST -H "Content-Type: application/json" --data '{"method":"anvil_setBalance","params":["user-balance", "0x21E27C1806E59A40000"],"id":1,"jsonrpc":"2.0"}'

# This is curl example : 

curl http://localhost:8545 -X POST -H "Content-Type: application/json" --data '{"method":"anvil_setBalance","params":["0xE7616f8F030A611be722A7787Ce183FD78B941C9", "0x21E27C1806E59A40000"],"id":1,"jsonrpc":"2.0"}'