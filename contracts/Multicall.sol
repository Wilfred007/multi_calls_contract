// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Multicall2 {

    // A struct to represent each call
    struct Call {
        address target;    // Address of the contract to call
        bytes callData;    // Encoded function signature and parameters
    }

    // The aggregate function that takes an array of Call structs and returns the block number and the return data
    function aggregate(Call[] memory calls) public returns (uint256 blockNumber, bytes[] memory returnData) {
        blockNumber = block.number;   // Capture the current block number
        returnData = new bytes[](calls.length);  // Initialize return data array

        // Loop through each call in the calls array
        for (uint i = 0; i < calls.length; i++) {
            (bool success, bytes memory data) = calls[i].target.call(calls[i].callData);
            
            require(success, "Multicall2: call failed");
            
            returnData[i] = data;  // Store the returned data
        }
    }
}
