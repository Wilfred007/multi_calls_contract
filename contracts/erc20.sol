// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract WFTToken {
    string public name = "WIF Token";
    string public symbol = "WFT";
    uint8 public decimals = 18; // Standard decimals for ERC-20 tokens
    uint256 public totalSupply; // Total supply of tokens

    mapping(address => uint256) private balances; // Mapping of balances for each account
    mapping(address => mapping(address => uint256)) private allowances; // Allowances for token transfer approval

    // Event to notify clients of transfers
    event Transfer(address indexed from, address indexed to, uint256 value);
    // Event to notify clients of approval
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * (10 ** uint256(decimals)); // Total supply is scaled by the decimals
        balances[msg.sender] = totalSupply; // Assign all tokens to the contract creator
    }

    // The balanceOf function that returns the token balance of a given account
    function balanceOf(address _owner) external view returns (uint256 balance) {
        return balances[_owner];
    }

    // Transfer tokens from the caller to another account
    function transfer(address _to, uint256 _value) external returns (bool success) {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        require(_to != address(0), "Invalid address");

        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Approve another address to spend tokens on behalf of the caller
    function approve(address _spender, uint256 _value) external returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Allow the approved spender to transfer tokens on behalf of the owner
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success) {
        require(balances[_from] >= _value, "Insufficient balance");
        require(allowances[_from][msg.sender] >= _value, "Allowance exceeded");
        require(_to != address(0), "Invalid address");

        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    // Check the amount of tokens that a spender is allowed to transfer on behalf of the owner
    function allowance(address _owner, address _spender) external view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }
}
