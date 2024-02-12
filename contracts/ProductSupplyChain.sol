// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "contracts/interfaces/Registry.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ProductSupplyChain is Ownable {
    struct Product {
        uint256 productId;
        string name;
        address currentOwner;
        uint256 price;
        string state;
    }

    mapping(uint256 => Product) public products;

    event ProductCreated(uint256 productId, string name, address owner);
    event ProductSold(uint256 productId, address buyer);

    function createProduct(uint256 _productId, string memory _name, uint256 _price, string memory _state) public onlyOwner {
        require(products[_productId].productId == 0, "Product already exists");

        Product memory newProduct = Product({
            productId: _productId,
            name: _name,
            currentOwner: msg.sender,
            price: _price,
            state: _state
        });

        products[_productId] = newProduct;

        emit ProductCreated(_productId, _name, msg.sender);
    }

    address public registryAddress;

    function sellProduct(uint256 _productId, address _buyer) public {
        require(products[_productId].productId != 0, "Product does not exist");
        require(products[_productId].currentOwner == msg.sender, "Only the product owner can sell the product");
        require(_buyer != msg.sender, "Buyer should not be the current owner");

        Registry registry = Registry(registryAddress);
        require(registry.isVerifiedProduct(_productId), "Product is not verified");

        products[_productId].currentOwner = _buyer;

        emit ProductSold(_productId, _buyer);
    }
}
