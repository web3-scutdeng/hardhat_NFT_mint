const { network, deployments } = require("hardhat");
const { developmentChains } = require("../helper-hardhat-config.js");
const { verify } = require("../utils/verify.js");
module.exports = async function ({ getNamedAccounts, deployments }) {
  const { deployer } = await getNamedAccounts();
  const { deploy, log } = deployments;
  log("------------------------------------");
  const args = [];
  const basicNft = await deploy("BasicNFT", {
    from: deployer,
    args: args,
    log: true,
    waitComformatioms: network.config.blockConfirmations || 1,
  });
  console.log(await basicNft, args);
  if (
    !developmentChains.includes(network.name) &&
    process.env.ETHERSCAN_API_KEY
  ) {
    log("verifying...");
    await verify(basicNft.address, args);
  }
};
module.exports.tags = ["all", "BasicNFT"];
