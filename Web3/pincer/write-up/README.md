# Pincer

## Solution

The slippage in the `Vault` contract can be modified to make the `minAmountOut` parameter of the **UniswapV2** `swapExactTokensForTokens()` function go to 0. This means the swap can be exploited through a **sandwich attack** (front running + back running)

The issue is that the bot is very picky and only executes a swap if the slippage is 0.5% or below.

The goal is to change the slippage to our advantage but also to allow the bot to execute his transaction.

1. Monitor the mempool until you see the swap transaction coming from the bot

2. Front run the transaction to change the slippage to **1000** to make the `minAmountOut` equal 0

3. Front run, once again, to buy as many tokens the bot is trying to get which will inflate its price.

4. Back run the transaction to sell the tokens at a higher price

5. Repeat until the conditions to solve the challenge are met

## Get the flag

*Make sure you change the url in `hardhat.config.js`*

Run the following commands and wait for the bot to get sandwiched at least 3 times

```sh
npm install
npx hardhat run scripts/solve.js --network gcc
```
