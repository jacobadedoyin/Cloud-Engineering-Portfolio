# ⚙️ Infrastructure as Code and Cloud Governance

<p align="left">
  ↩️ <a href="../"><strong>Back to Azure Cloud Engineering Index</strong></a><br>
  📁 <a href="../../"><strong>Back to Projects Index</strong></a>
</p>

## What Was Built

A production Azure environment deployed entirely via Bicep modules and Azure CLI. Every resource was defined as code, version-controlled, and deployed without a single portal click. Resources follow a consistent naming convention and mandatory tagging standard, and all observability is wired into a central Log Analytics workspace.

This is the kind of baseline a cloud engineer would build before handing an environment to an operations team: repeatable, documented, and auditable from day one.

---

![Four resources confirmed deployed across storage, networking, monitoring, and alerting — all via a single CLI command, all showing Succeeded status in UK South.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/06-terminal-all-resources-deployed.png)
*Four resources confirmed deployed across storage, networking, monitoring, and alerting — all via a single CLI command, all showing Succeeded status in UK South.*

---
## Code

The Bicep modules and environment parameter files are in the [`bicep/`](bicep/) directory of this project.

| File | Purpose |
|---|---|
| [`bicep/modules/storage/storage-account.bicep`](bicep/modules/storage/storage-account.bicep) | Hardened storage account module |
| [`bicep/modules/monitoring/log-analytics.bicep`](bicep/modules/monitoring/log-analytics.bicep) | Log Analytics workspace module |
| [`bicep/modules/networking/nsg.bicep`](bicep/modules/networking/nsg.bicep) | NSG with diagnostic settings module |
| [`bicep/modules/monitoring/alert-rule.bicep`](bicep/modules/monitoring/alert-rule.bicep) | Privileged role assignment alert rule module |
| [`bicep/environments/prod/`](bicep/environments/prod/) | Production parameter files |
## Resources Deployed

| Resource | Name | Module |
|---|---|---|
| Storage Account | `stcproduks001` | `modules/storage/storage-account.bicep` |
| Log Analytics Workspace | `law-core-prod-uks-001` | `modules/monitoring/log-analytics.bicep` |
| Network Security Group | `nsg-core-prod-uks-001` | `modules/networking/nsg.bicep` |
| Alert Rule | `alert-privileged-role-assignment-prod` | `modules/monitoring/alert-rule.bicep` |

All resources deployed to `rg-core-prod-uks-001` in UK South.

---

## Project Structure

```
azure-landing-zone-lite/
├── environments/
│   ├── dev/
│   └── prod/
│       ├── alert-rule.bicepparam
│       ├── log-analytics.bicepparam
│       ├── nsg.bicepparam
│       └── storage.bicepparam
├── modules/
│   ├── monitoring/
│   │   ├── alert-rule.bicep
│   │   └── log-analytics.bicep
│   ├── networking/
│   │   └── nsg.bicep
│   └── storage/
│       └── storage-account.bicep
└── policies/
```

![Modules separated by domain — storage, networking, monitoring — with environment-specific parameter files keeping prod and dev values separate from the reusable module definitions.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/05-vscode-folder-structure.png)
*Modules separated by domain — storage, networking, monitoring — with environment-specific parameter files keeping prod and dev values separate from the reusable module definitions.*

---

## Design Decisions

**Modular Bicep over monolithic templates.** Each resource type lives in its own module with typed parameters and `@description` decorators. Environment-specific values are passed via `.bicepparam` files, keeping modules reusable across dev and prod without duplication.

**Centralised observability.** NSG diagnostic settings point to the Log Analytics workspace, meaning all network flow data is captured in one place. The alert rule queries this workspace for privileged role assignments (`Microsoft.Authorization/roleAssignments/write`) and fires on any successful write — a standard detection pattern for privilege escalation in regulated environments.

**Consistent governance by default.** Every module enforces three tags: `environment`, `managed-by: bicep`, and `project: azure-landing-zone-lite`. This is not a manual step — it is baked into each module so no resource can be deployed untagged regardless of who runs the deployment.

**Storage hardened at the module level.** Public access disabled, minimum TLS 1.2 enforced, and network ACLs set to deny by default. These constraints cannot be bypassed through the portal after deployment because they are defined in code and redeployed idempotently.

---

## Evidence

![All four resources visible in the Azure Portal under rg-core-prod-uks-001, confirming the CLI deployments landed correctly in the right resource group and region.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/07-portal-resource-group-all-resources.png)
*All four resources visible in the Azure Portal under `rg-core-prod-uks-001`, confirming the CLI deployments landed correctly in the right resource group and region.*

---

![Storage account module deployed in 34 seconds via az deployment group create, with Succeeded status and incremental deployment mode confirmed.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/09-terminal-storage-deployment-succeeded.png)
*Storage account module deployed in 34 seconds via `az deployment group create`, with Succeeded status and incremental deployment mode confirmed.*

---

![NSG deployed with diagnostic settings wired to the Log Analytics workspace, enabling network flow capture without any manual configuration after deployment.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/08-terminal-nsg-deployment-succeeded.png)
*NSG deployed with diagnostic settings wired to the Log Analytics workspace, enabling network flow capture without any manual configuration after deployment.*

---

![Alert rule scoped to the Log Analytics workspace, configured to fire on any successful privileged role assignment write — a detection control relevant to SOC and cloud security teams.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/02-alert-rule-portal.png)
*Alert rule scoped to the Log Analytics workspace, configured to fire on any successful privileged role assignment write — a detection control relevant to SOC and cloud security teams.*

---

![Alert rule Bicep module open in VS Code, showing the KQL query, evaluation frequency, severity classification, and scope binding to the Log Analytics workspace resource ID.](../../../assets/azure-cloud-engineering/infrastructure-as-code-and-cloud-governance/04-alert-rule-bicep-vscode.png)
*Alert rule Bicep module open in VS Code, showing the KQL query, evaluation frequency, severity classification, and scope binding to the Log Analytics workspace resource ID.*

---

## Skills Demonstrated

| Area | Evidence |
|---|---|
| Infrastructure as Code | Bicep modules with typed parameters, `@description` decorators, and resource outputs |
| Cloud Governance | Mandatory tagging enforced at module level — not applied manually after deployment |
| Observability | NSG diagnostics piped to Log Analytics; alert rule querying for privileged role assignment events |
| Secure Configuration | Storage hardened by default: no public access, TLS 1.2 minimum, network deny ACL |
| CLI Deployment | All resources deployed via `az deployment group create` with no portal interaction |
| Naming Standards | Consistent `{type}-{workload}-{env}-{region}-{instance}` convention applied across all resources |
| Separation of Concerns | Module definitions kept separate from environment parameter files for reusability |

## Tools

| Area | Detail |
|---|---|
| Cloud Platform | Microsoft Azure (UK South) |
| Infrastructure as Code | Bicep |
| CLI | Azure CLI 2.87.0 |
| Version Control | GitHub |
| Editor | VS Code with Bicep extension |
