import { expect } from "chai";
import { ethers } from "hardhat";

describe("ProductSupplyChain", function () {
  it("Should create and sell a product", async function () {
    // Deploy the contract
    const ProductSupplyChain = await ethers.getContractFactory("ProductSupplyChain");
    const productSupplyChain = await ProductSupplyChain.deploy();
    await productSupplyChain.deployed();

    // Create a product
    await productSupplyChain.createProduct(1, "Product 1", 100, "Created");

    // Check the product details
    const product = await productSupplyChain.products(1);
    expect(product.name).to.equal("Product 1");
    expect(product.price).to.equal(100);

    // Sell the product
    const [owner, addr1] = await ethers.getSigners();
    await productSupplyChain.connect(owner).sellProduct(1, addr1.address);

    // Check the new owner of the product
    const updatedProduct = await productSupplyChain.products(1);
    expect(updatedProduct.currentOwner).to.equal(addr1.address);
  });
});
