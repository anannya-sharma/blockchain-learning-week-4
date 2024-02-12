# blockchain-learning-week-4

## Overview

This contract simulates a basic supply chain process for a product, from creation to the end sale. It showcases advanced Solidity features and includes comprehensive unit tests.

## Contract Details

- Contract Name: ProductSupplyChain
- Solidity Version: 0.8.4
- Network: Rinkeby Testnet

## Structs and State Variables

- `Product`: A struct representing a product with properties like productId, name, currentOwner, price, and state.
- `products`: A mapping from productId to Product instances.

## Functions

- `createProduct`: This function allows the owner of the contract to create a new product. It emits a `ProductCreated` event.
- `sellProduct`: This function simulates the sale of a product, transferring the ownership and updating the relevant information. It emits a `ProductSold` event.

## Events

- `ProductCreated`: This event is emitted when a new product is created.
- `ProductSold`: This event is emitted when a product is sold.

## Tests

Comprehensive unit tests for the contract have been written using Hardhat. The tests cover all possible scenarios, including happy paths and bad paths.

## Deployment

The contract can be deployed using the `deploy.js` script in the `scripts` folder. The deployment details are logged to the console.

## Interactions with Other Contracts

The contract interacts with an external contract `Registry` to verify a condition before selling a product. The interface for the `Registry` contract is defined in the `interfaces` folder.

## Error Handling

The contract includes error handling for conditions like non-existent product IDs, actions restricted to the owner, or invalid operations.

## Getting Started

1. Clone the repository.
2. Install the dependencies with `npm install`.
3. Compile the contract with `npx hardhat compile`.
4. Run the tests with `npx hardhat test`.
5. Deploy the contract with `npx hardhat run scripts/deploy.js --network rinkeby`.
