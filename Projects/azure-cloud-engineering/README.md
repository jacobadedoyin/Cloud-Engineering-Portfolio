# ☁️ Azure Cloud Engineering

![Azure Cloud Engineering banner](../../assets/azure-cloud-engineering/azure-banner.svg)

[↩️ Back to Portfolio Home](../../)  
[📁 Back to Projects Index](../)

## Azure Engineering Scope

This section demonstrates practical Azure engineering across **infrastructure as code, network architecture, secrets management, cloud monitoring, identity governance, and CI/CD automation**.

All three projects are live deployments on a personal Azure subscription with full GitHub Actions pipelines, what-if preview, and environment promotion across dev and prod. Evidence combines personal subscription deployments, sanitised workplace experience, and lab-based work.

<p align="center">
  <img src="../../assets/azure-cloud-engineering/cloud-engineering-overview.png" alt="Azure Cloud Engineering overview" width="900">
</p>

---

## Azure Engineering Project Index

<table>
  <tr>
    <th align="left" width="320">Project</th>
    <th align="left">Engineering Capability Demonstrated</th>
    <th align="left">Skills</th>
  </tr>
  <tr>
    <td align="left" width="320">
      ⚙️ <strong><a href="infrastructure-as-code-and-cloud-governance">Infrastructure as Code and Cloud Governance</a></strong>
    </td>
    <td align="left">
      Bicep module library deploying a hardened storage account, Log Analytics workspace, NSG with diagnostic settings, and an alert rule for privileged role assignments. Deployed via GitHub Actions CI/CD pipeline with what-if preview, environment promotion across dev and prod, and CanNotDelete resource locks enforced on critical resources. Key Vault module added for secrets management with RBAC-based access.
    </td>
    <td align="left">
      <code>Bicep</code> <code>Azure CLI</code> <code>NSG</code> <code>Log Analytics</code> <code>GitHub Actions</code> <code>Resource Locks</code> <code>Key Vault</code> <code>RBAC</code>
    </td>
  </tr>
  <tr>
    <td align="left" width="320">
      🌐 <strong><a href="hub-spoke-network-architecture">Hub-Spoke Network Architecture</a></strong>
    </td>
    <td align="left">
      Hub-spoke VNet topology with peered spoke networks, NSG rules enforced on each subnet, private DNS zone, and a private endpoint locking the storage account off the public internet. Managed Identity assigned to spoke VM with Key Vault Secrets User role for credential-free secret retrieval. Deployed via Bicep and GitHub Actions pipeline.
    </td>
    <td align="left">
      <code>VNet</code> <code>VNet Peering</code> <code>NSG</code> <code>Private Endpoints</code> <code>Private DNS</code> <code>Managed Identity</code> <code>Key Vault</code> <code>Bicep</code> <code>GitHub Actions</code>
    </td>
  </tr>
  <tr>
    <td align="left" width="320">
      📊 <strong><a href="monitoring-operations-and-service-visibility">Monitoring, Operations and Service Visibility</a></strong>
    </td>
    <td align="left">
      End-to-end monitoring stack built from scratch on a personal Azure subscription. Azure Monitor Agent deployed across a VM estate, Data Collection Rules and Endpoints configured for telemetry ingestion, KQL queries written for heartbeat monitoring and performance analysis, operational visibility delivered via Azure Workbooks, and security posture tracked via Defender for Cloud.
    </td>
    <td align="left">
      <code>Azure Monitor</code> <code>AMA</code> <code>DCR</code> <code>DCE</code> <code>KQL</code> <code>Log Analytics</code> <code>Workbooks</code> <code>Defender for Cloud</code>
    </td>
  </tr>
</table>

---

## Certifications

<table>
  <tr>
    <th align="left" width="160">Certification</th>
    <th align="left" width="110">Level</th>
    <th align="left">Focus Area</th>
    <th align="left">Certificate</th>
    <th align="left">Lab Evidence</th>
  </tr>
  <tr>
    <td align="left" width="160">
      <strong>AZ-104</strong><br>Azure Administrator
    </td>
    <td align="left" width="110">
      Associate
    </td>
    <td align="left">
      Hands-on administration: identity and governance, storage, compute, virtual networking, and monitoring at production scale.
    </td>
    <td align="left">
      <a href="certificates/az104-certificate.pdf">View certificate</a>
    </td>
    <td align="left">
      <a href="azure-identity-governance-engineering">azure-identity-governance-engineering</a>
    </td>
  </tr>
  <tr>
    <td align="left" width="160">
      <strong>AZ-900</strong><br>Azure Fundamentals
    </td>
    <td align="left" width="110">
      Fundamentals
    </td>
    <td align="left">
      Core cloud concepts, Azure service models, pricing, and governance — the foundation underpinning the AZ-104 work above.
    </td>
    <td align="left">
      <a href="certificates/az900-certificate.pdf">View certificate</a>
    </td>
    <td align="left">
      <a href="azure-identity-security-foundations">azure-identity-security-foundations</a>
    </td>
  </tr>
  <tr>
    <td align="left" width="160">
      <strong>SC-900</strong><br>Security, Compliance & Identity Fundamentals
    </td>
    <td align="left" width="110">
      Fundamentals
    </td>
    <td align="left">
      Microsoft Entra ID, Zero Trust principles, and compliance fundamentals — security context for the identity governance work in this portfolio.
    </td>
    <td align="left">
      <a href="certificates/sc900-certificate.pdf">View certificate</a>
    </td>
    <td align="left">
      <a href="azure-identity-security-foundations">azure-identity-security-foundations</a>
    </td>
  </tr>
</table>
