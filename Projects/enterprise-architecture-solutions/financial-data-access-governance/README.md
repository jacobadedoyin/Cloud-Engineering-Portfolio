# 🏦 Financial Data Access Governance

<p align="left">
  ↩️ <a href="../"><strong>Back to Enterprise Security Architecture</strong></a><br>
  📁 <a href="../../"><strong>Back to Projects Index</strong></a>
</p>

## Overview

Delivered access governance controls for sensitive financial reporting platforms in a regulated enterprise environment. Work covered end-to-end ownership of role assignments, access review coordination, privileged access controls, and audit-ready evidence capture across Microsoft Entra ID.

---

## What I Did

| Area | Detail |
|---|---|
| **RBAC Design** | Scoped role assignments to least-privilege across financial reporting platforms, removing overprivileged access identified during review. |
| **Access Reviews** | Coordinated periodic recertification with platform owners, validated business justification for continued access, and documented outcomes. |
| **Privileged Access** | Applied controls to limit and monitor privileged role assignments, with sign-in and audit log review via KQL. |
| **Conditional Access** | Reviewed and validated Conditional Access policies enforcing MFA and compliant device requirements for sensitive platform access. |
| **Audit Evidence** | Captured and structured audit-ready evidence covering access assignments, review outcomes, and approval records. |

---

## Architecture

<p align="center">
  <img src="../../../assets/identity-security-architecture/financial-services-access-governance-architecture.png" alt="Financial Services Access Governance Architecture" width="900">
</p>

---

## Governance Design

<p align="center">
  <img src="../../../assets/identity-security-architecture/financial-services-access-governance-design.png" alt="Financial Services Access Governance Design" width="900">
</p>

---

## Skills Demonstrated

| Skill | Tool / Method |
|---|---|
| Role-Based Access Control | Microsoft Entra ID, Azure RBAC |
| Privileged Access Governance | PIM, audit log review, KQL |
| Conditional Access | Entra ID Conditional Access policies |
| Access Reviews | Entra ID Access Reviews, manual recertification |
| Audit Logging | KQL queries, sign-in log analysis |
| Least Privilege Enforcement | Role scoping, access removal, justification validation |
| Segregation of Duties | Conflicting access identification in financial reporting context |

---

## Relevance to Financial Services Roles

Directly applicable to IAM Engineer, Cloud Security, and GRC roles in regulated financial services environments. Demonstrates practical delivery of the access controls required under frameworks including SOX, DORA, and FCA operational resilience guidance.

---

> 🔒 All evidence is public-safe and sanitised. No real platform names, user identities, internal system references, or confidential business data are included.
