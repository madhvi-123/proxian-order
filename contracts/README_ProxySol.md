# PROXYsol — Delegated Execution Framework

A programmable execution contract for DAO delegation, automation, and revocable authority.

---

## 🔑 Key Concepts

- `soul`: the identity owner (can revoke or update)
- `agent`: the authorized executor (temporary delegate)
- `TaskExecuted`: logs which action was approved
- `onlySoul`: prevents agent overreach

---

## ⚙️ Contract Highlights

```solidity
modifier onlySoul() {
    require(msg.sender == soul, "Unauthorized");
    _;
}
