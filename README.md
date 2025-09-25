# Monty's Homelab Ansible

Welcome to **Monty's Homelab Ansible** repository! This project is a personal collection of **Ansible playbooks**, **roles**, and configuration files that I use to manage and automate my homelab infrastructure. It is tailored to my specific needs but can serve as inspiration or a starting point for others building their own homelabs.

## Overview

This repository is built to simplify and streamline the deployment, configuration, and maintenance of various services and systems in my homelab. While it reflects my own environment, the structure and approach may be useful to others looking to manage their infrastructure as code (IaC) with Ansible.

### Key Features:

- **Infrastructure Automation**: Automates the setup and configuration of homelab services.
- **Modular Design**: Includes reusable roles and playbooks for common tasks.
- **Flexible and Extensible**: Incorporates Shell scripting, Jinja templates, and HCL for additional functionality and customization.

- **Host File Managed Services**:

    This repository simplifies homelab management by using Ansible's inventory hosts file as a centralized configuration. By defining service configurations directly in your host file, you can define attributes of each host that can be queried by specific ansible playbooks for use in various applications. The Ansible inventory host file defines network settings, service parameters, and deployment variables in one location for consistent management across the homelab.

    **Caddy Web Server**:

    Automated deployment for both local and public-facing reverse proxy configurations
    Dynamic Caddyfile generation from host variables handles SSL certificates, domain routing, and upstream services
    Supports internal homelab services and external domain management seamlessly

    **Samba File Shares**:

    Host-defined share configurations including mount points, permissions, and user access controls
    Automated SMB/CIFS setup with customizable security settings
    Share provisioning driven directly from inventory variables

    **Docker Compose Management**:

    Simplified deployment and updates for containerized services.
    **TODO**: Manage all compose files directly within this repository, and push out to the host.

    **Homepage Dashboard**:

    Automated dashboard configuration based on your deployed services
    Customizable layouts and service groupings managed through host variables

## Repository Structure

Here's an overview of the key directories and their purposes:

- **`playbooks/`**: Contains Ansible playbooks for various tasks and configurations.
- **`roles/`**: Stores reusable Ansible roles for modular configurations.
- **`templates/`**: Houses Jinja2 templates for dynamic file generation.
- **`scripts/`**: Includes Shell scripts for auxiliary tasks.
- **`terraform/`**: Contains HCL files for Terraform integration, if applicable.
- **`justfile`**: Provides task automation using the **Just** command runner.

## Prerequisites

To use or adapt this repository, ensure you have the following tools installed on your system:

1. **Ansible**: [Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
2. **Terraform** (optional): For managing infrastructure provisioning, if HCL files are utilized.
3. **Just** (optional): For task automation.

## Getting Started

### 1. Clone the Repository
```bash
git clone https://github.com/pmontgo33/homelab-ansible.git
cd homelab-ansible
```

### 2. Install Dependencies
Install the required roles and collections using `ansible-galaxy`:
```bash
ansible-galaxy install -r requirements.yml
```

### 3. Configure Inventory
Edit the `inventory` file to include your homelab hosts and their connection details. This file defines the systems and services to be managed.

### 4. Run a Playbook
Execute a playbook to configure or manage your homelab environment:
```bash
ansible-playbook -i inventory playbooks/<playbook-name>.yml
```

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

This repository is a work in progress, current state of my personal homelab configuration. A big thank you to the open-source community for providing the tools and inspiration to build and maintain homelabs. Also, [Ansible](https://docs.ansible.com) has excellent documentation! 🙌
