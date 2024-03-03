require("@nomicfoundation/hardhat-toolbox");

module.exports = {
	solidity: "0.8.19",
	networks: {
		gcc: {
			url: "http://34.247.196.215:8000/rpc", // Change the RPC URL
			accounts: ["0x6715d324d14e0565ab02a575fa5f74540719ba065a610cba6497cdbf22cd5cdb"]
		}
	},
};
