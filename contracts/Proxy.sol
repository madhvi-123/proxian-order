// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title Proxy.sol - Delegated Execution Agent (MVP)
/// @notice Part of the Proxian Sovereignty Stack

contract Proxy {
    address public soul; // Identity controller
    address public agent; // Delegate executor
    mapping(bytes32 => bool) public tasks; // Registered tasks

    event TaskExecuted(bytes32 indexed taskId, address indexed agent);
    event TaskRevoked(bytes32 indexed taskId);
    event AgentChanged(address indexed newAgent);

    modifier onlySoul() {
        require(msg.sender == soul, "Only SOUL may act");
        _;
    }

    constructor(address _soul, address _agent) {
        soul = _soul;
        agent = _agent;
    }

    function registerTask(bytes32 taskId) external onlySoul {
        tasks[taskId] = true;
    }

    function executeTask(bytes32 taskId) external {
        require(msg.sender == agent, "Unauthorized PROXY");
        require(tasks[taskId], "Unregistered task");
        emit TaskExecuted(taskId, agent);
        // Logic to perform delegated action goes here
    }

    function revokeTask(bytes32 taskId) external onlySoul {
        tasks[taskId] = false;
        emit TaskRevoked(taskId);
    }

    function changeAgent(address newAgent) external onlySoul {
        agent = newAgent;
        emit AgentChanged(newAgent);
    }
}
