# Ode

## Solution



## Get the flag

In the `forge` command, the `--slow` parameter makes sure each transaction has been successfully executed before proceeding to another one

*Make sure you change the address of the challenge in `script/Solve.s.sol`*

```sh
TARGET_IP='127.0.0.1:8000' # to replace
PRIVATE_KEY='0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb'
forge script script/Solve.s.sol --tc 'Solve' --broadcast --private-key $PRIVATE_KEY --rpc-url http://${TARGET_IP}/rpc --skip-simulation --slow
curl -s "http://${TARGET_IP}/flag"
```
