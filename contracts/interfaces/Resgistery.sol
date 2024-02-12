// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface Registry {
    function isVerifiedProduct(uint256 _productId) external view returns (bool);
}
