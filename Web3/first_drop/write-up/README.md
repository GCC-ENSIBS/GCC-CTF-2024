# First Drop

## Solution

1. Create a smart contract with `1 ETH` that will `mint()` a Beyond NFT during its construction. When a contract is **construction**, it has no bytecode yet meaning we can bypass the `_isContract()` check and register our contract as `isEligible`

2. Exploit a reentrancy in the `claimSpecialPrize()` function. When an NFT is `_safeMint()` to an address, the NFT contract checks that the target address contains bytecode. If it does, it will call the `onERC721Received()` on the address, giving it the control flow. Once the control flow has been obtained by the malicious contract, it can reenter the `claimSpecialPrize()` again as it does not follow the **check-effect-interaction (CEI)** pattern.

## Get the flag

In the `forge` command, the `--slow` parameter makes sure each transaction has been successfully executed before proceeding to another one

*Make sure you change the address of the challenge in `script/Solve.s.sol`*

```sh
TARGET_IP='127.0.0.1:8000' # to replace
PRIVATE_KEY='0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb'
forge script script/Solve.s.sol --tc 'Solve' --broadcast --private-key $PRIVATE_KEY --rpc-url http://${TARGET_IP}/rpc --skip-simulation --slow
curl -s "http://${TARGET_IP}/flag"
```
