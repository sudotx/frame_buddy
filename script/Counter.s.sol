// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {FrameGame, FrameToken} from "src/Counter.sol";

contract PissOff is Script {
    FrameGame game;
    FrameToken token;

    function setUp() public {
        vm.createSelectFork("");
        console2.log("");
    }

    function run() public {
        vm.startBroadcast();
        game = new FrameGame(address(0));
        token = new FrameToken("");
        vm.stopBroadcast();
    }
}
