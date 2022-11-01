pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
// Contract under test
import {NFTProject} from "../src/YourContract.sol";


contract NFTProjectTest is Test {

  NFTProject private np;

  function setUp() public {
    np = new NFTProject();
  }

  function test_Log() public {
    emit log("Testing NFT Project");
  }

  function testLetsMint() public {
    uint256 balance = np.balanceOf(msg.sender);
    np.letsMint(msg.sender, 0);
    assertEq((balance+1), np.balanceOf(msg.sender));
  }

  function testTransferFrom() public {
    emit log_address(msg.sender);
    emit log_address(np.owner());
    np.letsMint(msg.sender, 1);
    vm.prank(msg.sender);
    np.transferFrom(msg.sender, address(1337), 1);
    assertEq(address(1337), np.ownerOf(1));
  }

}
