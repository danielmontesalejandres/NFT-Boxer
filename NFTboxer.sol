// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTboxer is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor(address initialOwner) ERC721("Constantina", "Tina") Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT() public onlyOwner returns (uint256) {
        uint256 newTokenId = tokenCounter;
        _safeMint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, "https://sapphire-basic-pigeon-114.mypinata.cloud/ipfs/QmVUh5pVBY9NvczUCUdMJFx6vjhc7A3Qzm5uC7LCM54fGZ");
        tokenCounter += 1;
        return newTokenId;
    }
}