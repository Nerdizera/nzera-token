import { ethers } from "hardhat";

async function main() {
  const adminContractFactory = await ethers.getContractFactory("NZeraAdmin");
  const nzeraContractFactory = await ethers.getContractFactory("NZera");

  const adminContract = await adminContractFactory.deploy();
  const nzeraContract = await nzeraContractFactory.deploy(adminContract.address);

  console.log(`Deployed contracts: [Admin: ${adminContract.address}], [ERC20: ${nzeraContract.address}]`)
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});