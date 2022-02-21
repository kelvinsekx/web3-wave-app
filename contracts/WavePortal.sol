// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint waversMapSize = 0;

    struct waverAndWaveInfo {
        address waver;
        uint numberOfWave;
    }

    //create waversMap variable
    mapping(address => waverAndWaveInfo) public waversMap;

    constructor() {
        console.log('Hey you');
    }

    function wave() public {
        //increase the state variable 
        //totalWaves by one
        totalWaves = totalWaves + 1;

        // if waversMap is empty just add the new waver info
        if(waversMapSize < 1){
            waversMap[msg.sender] = (
                 msg.sender,
                 1
            );
        }else{
            if(waversMap[msg.sender].waver == msg.sender){
                waversMap[msg.sender].numberOfWave++;
            }else{
                waversMap[msg.sender] = (
                 msg.sender,
                 1
            ); 
            }
        }
        waversMapSize = 1;
        console.log("%s has waved", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
    }
}