// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "erc721a/contracts/ERC721A.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract DevSecOptimizedNFT is ERC721A, ERC2981, Ownable, ReentrancyGuard {

    //(Gas Optimization)
    uint256 public constant MAX_SUPPLY = 5000;
    uint256 public constant MINT_PRICE = 0.005 ether;
    uint256 public constant MAX_PER_TX = 5;

    //Constructor
    constructor(address _royaltyReceiver, uint96 _feeNumerator) 
        ERC721A("DevSecOptimizedNFT", "DSONFT") 
        Ownable(msg.sender) 
    {
        _setDefaultRoyalty(_royaltyReceiver, _feeNumerator);
    }

    function mint(uint256 quantity) external payable nonReentrant {
        require(quantity > 0 && quantity <= MAX_PER_TX, "Invalid quantity");
        require(_totalMinted() + quantity <= MAX_SUPPLY, "Exceeds max supply");
        require(msg.value >= MINT_PRICE * quantity, "Insufficient ETH");

        _mint(msg.sender, quantity);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721A, ERC2981)
        returns (bool)
    {
        return ERC721A.supportsInterface(interfaceId) || ERC2981.supportsInterface(interfaceId);
    }
}
