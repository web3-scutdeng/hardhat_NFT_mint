// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    //
    string public constant TOKEN_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    uint256 private s_tokencounter;

    constructor() ERC721("lyp", "Dog") {
        s_tokencounter = 0;
    }

    function mintNft() public returns (uint256) {
        _safeMint(msg.sender, s_tokencounter);
        s_tokencounter++;
        return s_tokencounter;
    }

    function tokenURI(
        uint256 /*token id*/
    ) public view override returns (string memory) {
        return TOKEN_URI;
    }

    function gettokencounter() public view returns (uint256) {
        return s_tokencounter;
    }
}
