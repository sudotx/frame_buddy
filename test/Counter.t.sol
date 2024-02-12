// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FrameGame, FrameToken} from "../src/Counter.sol";

contract CounterTest is Test {
    FrameGame game;
    FrameToken token;

    function setUp() public {
        token = new FrameToken("");
        game = new FrameGame(address(0));
    }

    function test_Increment() public pure {
        console2.log("hell");
    }

    function testFuzz_SetNumber(uint256 x) public {}
}
