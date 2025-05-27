# PROXY Protocol
*Programmable Delegation for Web3*

## Why PROXY?
- **Granular Control**: Delegate specific actions (e.g., "Vote only on Proposal X")  
- **Auto-Revoke**: Agents lose power if conditions unmet  
- **DAO-Ready**: Compatible with Tally, Snapshot, OpenZeppelin  

## Technical Spec
```solidity
// Core execute() function
function execute(address target, bytes calldata data) external;
