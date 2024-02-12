// SPDX-License-Identifier: UNLICENSED

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import {console2} from "forge-std/console2.sol";
import {Address} from "@openzeppelin/contracts/utils/Address.sol";

contract FrameGame is Ownable {
    using Address for address;

    uint128 gameNumber;

    struct ActiveGame {
        uint128 id;
        address host;
        bool status;
    }

    mapping(uint256 => ActiveGame) ActiveGames;

    ActiveGame[] public activeGames;
    FrameToken internal token;

    event GameCompleted(uint256 indexed _id);

    constructor(address Ftoken) {
        token = FrameToken(Ftoken);
    }

    // set up some state so that a particular token id can only play once

    // determine winner
    function determineWinner() internal pure returns (bool status) {
        // actual function to determine winner
        return true;
    }

    function runMatch() public returns (bool status) {
        // start game
        // call rng function to simlute fight
        // winner of that random selection. wins

        uint128 CurrentGameNumber = ++gameNumber;

        (bool success) = determineWinner();

        status = success;

        // end game with stats
        ActiveGames[CurrentGameNumber] = ActiveGame({id: CurrentGameNumber, host: msg.sender, status: status});

        emit GameCompleted(CurrentGameNumber);

        return status;
    }

    function AdminCallFunction(bytes calldata action, address target) public onlyOwner {
        // call any function sent by admin
        // in a case to send out valuable tokens sent to the contract on accident
        (bytes memory data) = target.functionCall(action);
        console2.log(string(data));
    }
}

contract FrameToken is ERC721, Ownable, ReentrancyGuard {
    constructor(string memory _initBaseURI) ERC721("Knights Of Valour", "KOV") {}

    mapping(address => uint256) userMints;

    function mint() public {
        console2.log(userMints[msg.sender]);
        require(userMints[msg.sender] < 2, "cant have any more");
        ++userMints[msg.sender];
        super._mint(address(0), 0);
    }
}
