# Synthatsu Katana Thief

## Solution

1. From the `Challenge` address, retrieve the `KatanaSale` address using the `katanaSale()` function. This variable is `public` meaning we can get its value using a function that has the same name.

2. Call the `becomeBeyond()` function with the string parameter `I will check out @BeyondBZH and @gcc_ensibs on X`

3. Call the `endSale()` function to retrieve all the katanas left

## Get the flag

In the `forge` command, the `--slow` parameter makes sure each transaction has been successfully executed before proceeding to another one

*Make sure you change the address of the challenge in `script/Solve.s.sol`*

```sh
TARGET_IP='127.0.0.1:8000' # to replace
PRIVATE_KEY='0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb'
forge script script/Solve.s.sol --tc 'Solve' --broadcast --private-key $PRIVATE_KEY --rpc-url http://${TARGET_IP}/rpc --skip-simulation --slow
curl -s "http://${TARGET_IP}/flag"
```
