pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
    
    event SellTokens(address seller, uint256 amountOfTokens, uint256 amountOfETH);
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

    YourToken public yourToken;
    uint256 public constant tokensPerEth = 100;

    constructor(address tokenAddress) Ownable(msg.sender){
        yourToken = YourToken(tokenAddress);
    }

    // ToDo: create a payable buyTokens() function:

    function buyTokens() public payable {
        require(msg.value > 0, "You need to send some ETH");
        uint256 amountToBuy = msg.value * tokensPerEth;
        uint256 vendorBalance = yourToken.balanceOf(address(this));
        require(vendorBalance >= amountToBuy, "Vendor has insufficient tokens");
        bool sent = yourToken.transfer(msg.sender, amountToBuy);
        require(sent, "Failed to transfer tokens to buyer");
        emit BuyTokens(msg.sender, msg.value, amountToBuy);
    }

    // ToDo: create a withdraw() function that lets the owner withdraw ETH

    function withdraw() public onlyOwner {
        uint256 ownerBalance = address(this).balance;
        require(ownerBalance > 0, "No ETH to withdraw");
        (bool sent, ) = msg.sender.call{value: ownerBalance}("");
        require(sent, "Failed to send ETH to owner");
    }

    // ToDo: create a sellTokens(uint256 _amount) function: 

    function sellTokens(uint256 tokenAmount) public {
    require(tokenAmount > 0, "Specify an amount of tokens greater than 0");

    uint256 userBalance = yourToken.balanceOf(msg.sender);
    require(userBalance >= tokenAmount, "Your balance is lower than the amount of tokens you want to sell");

    uint256 amountOfEthToTransfer = tokenAmount / tokensPerEth;
    uint256 ownerEthBalance = address(this).balance;
    require(ownerEthBalance >= amountOfEthToTransfer, "Vendor has insufficient funds");

    bool sent = yourToken.transferFrom(msg.sender, address(this), tokenAmount);
    require(sent, "ERC20 transferFrom failed");

    (bool ethSent, ) = msg.sender.call{value: amountOfEthToTransfer}("");
    require(ethSent, "Failed to send ETH to the user");

    emit SellTokens(msg.sender, tokenAmount, amountOfEthToTransfer);
    }

}
