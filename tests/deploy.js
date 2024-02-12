const hre = require("hardhat");

async function main() {
  const ProductSupplyChain = await hre.ethers.getContractFactory(
    "ProductSupplyChain"
  );
  const productSupplyChain = await ProductSupplyChain.deploy();
  await productSupplyChain.deployed();

  console.log("ProductSupplyChain deployed to:", productSupplyChain.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
