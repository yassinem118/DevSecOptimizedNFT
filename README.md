# DevSec Optimized ERC-721A with Royalties (EIP-2981)

## Overview
An optimized ERC-721 smart contract implementation using `ERC721A` for gas-efficient batch minting, integrated with `EIP-2981` standard for multi-marketplace creator earnings, and protected against security vulnerabilities.

## Key Features & Architecture
- **ERC721A Integration:** Optimized batch minting logic reducing gas costs for multi-token minting operations.
- **EIP-2981 Standard:** Built-in royalty specification using OpenZeppelin's `ERC2981`.
- **Security Patterns:** 
  - `ReentrancyGuard` modifier (`nonReentrant`) applied to `mint` function to mitigate reentrancy attacks.
  - Access control using `Ownable` for restricted administration.
- **Interface Support:** `supportsInterface` override resolving standard conflicts between `ERC721A` and `ERC2981`.

## Contract Details
- **Max Supply:** 5000 NFTs
- **Mint Price:** 0.005 ETH
- **Max Per Tx:** 5 NFTs

## Tech Stack
- Solidity `^0.8.20`
- OpenZeppelin Contracts
- ERC721A (Azuki)
