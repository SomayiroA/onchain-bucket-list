pragma solidity ^0.8.0;

contract OnChainBucketList {

    struct Goal {
        string description;
        bool completed;
    }

    mapping(address => Goal[]) public userGoals;

    function addGoal(string calldata _desc) external {
        userGoals[msg.sender].push(Goal(_desc, false));
    }

    function completeGoal(uint _index) external {
        require(_index < userGoals[msg.sender].length, "Invalid index");
        userGoals[msg.sender][_index].completed = true;
    }
