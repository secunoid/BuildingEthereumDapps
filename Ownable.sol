pragma solidity ^0.4.18;
contract Ownable {
    address public owner;//
 
    function Ownable() public {
        owner = msg.sender;//
    }
 
    modifier onlyOwner() {
        require(msg.sender == owner);//
        _;
    }
}