// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

contract FrameGame {
    uint128 gameNumber;

    struct ActiveGame {
        uint128 id;
        address host;
        uint128 p1score;
        bool p1cig;
        uint128 value;
        bool active;
    }

    ActiveGame[] public activeGames;
    FrameToken internal token;

    event GameHosted(uint256 indexed _id);
    event GameCompleted(uint256 indexed _id);

    // If player already hosting game
    mapping(address => bool) hostingGame;

    constructor(address Ftoken) {
        token = FrameToken(Ftoken);
    }

    // host a match
    function hostMatch() public {}
    // duel with another token
    function duelAnotherToken() public {}
    // add game
    function addGame() public {}
    // deactivate game
    function deactivateGame() public {}
    // join game
    function joinGame() public {}
    // determine winner
    function determineWinner() public {}
    // start game
    function startGame() public {}
}

contract FrameToken {
    constructor() {}

    // an onchain nft
    // inherits from OZ
    // some more good stuff

    // mint for all users

    // tokens represent characters in the game
}
