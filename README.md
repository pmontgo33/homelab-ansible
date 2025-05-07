# Monty's Homelab Ansible

Welcome to my **Homelab Ansible** repository! This project is a personal collection of **Ansible playbooks**, **roles**, and configuration files that I use to manage and automate my homelab infrastructure. It is tailored to my specific needs but can serve as inspiration or a starting point for others building their own homelabs.

## Overview

This repository is built to simplify and streamline the deployment, configuration, and maintenance of various services and systems in my homelab. While it reflects my own environment, the structure and approach may be useful to others looking to manage their infrastructure as code (IaC) with Ansible.

### Key Features:
- **Infrastructure Automation**: Automates the setup and configuration of homelab services.
- **Modular Design**: Includes reusable roles and playbooks for common tasks.
- **Flexible and Extensible**: Incorporates Shell scripting, Jinja templates, and HCL for additional functionality and customization.

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

This project is licensed under the [MIT License](LICENSE). Feel free to use or adapt it for your own homelab projects.

## Acknowledgments

This repository is a reflection of my personal homelab journey. A big thank you to the open-source community for providing the tools and inspiration to build and maintain homelabs. 🙌
