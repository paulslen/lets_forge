// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
// Standard test libs
import "forge-std/Test.sol";
import "forge-std/Vm.sol";
// Contract under test
import {VolcanoCoin} from "../src/VolcanoCoin.sol";

contract VolcanoCoinTest is Test {
    VolcanoCoin private vc;

    function setUp() public {
        vc = new VolcanoCoin();
    }

    function test_Log() public {
        emit log("Testing Volcano Coin");
    }

    function testInitialSupply() public {
        uint256 supply = vc.getTotalSupply();
        assertEq(supply, 10000);
    }

    function testIncrement() public {
        uint256 increment = vc.totalSupplyIncrement();
        assertEq(increment, 1000);
    }

    function testIncreaseSupplyAsOwner() public {
        assertEq(vc.getTotalSupply(), 10000);
        vc.increaseSupply();
        assertEq(vc.getTotalSupply(), 11000);
    }

    function testFailIncrementAsNotOwner() public {
        vm.prank(address(0));
        vc.increaseSupply();
    }

}