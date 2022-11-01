pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTProject is ERC721, Ownable {

  constructor() ERC721("Pauls NFTs", "PN") {}

  function letsMint (address _to, uint256 _id) public onlyOwner {
    _safeMint(_to, _id);
  }

}
