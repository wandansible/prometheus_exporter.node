Ansible role: Prometheus Exporter - Node
========================================

Install and configure Node Exporter for Prometheus.

Requirements
------------

This role depends on the [base prometheus exporter role](https://github.com/wandansible/prometheus_exporter).

Role Variables
--------------

```
ENTRY POINT: main - Install and configure Node Exporter for Prometheus

OPTIONS (= is mandatory):

- node_exporter_add_extract_dir
        If true, add an extraction directory for the exporter package
        default: false
        type: bool

- node_exporter_arch_map
        Mapping of the possible values of ansible_architecture to the
        exporter package architectures
        default: null
        type: dict

- node_exporter_bin_dir
        Directory for the exporter executable
        default: null
        type: str

- node_exporter_binary
        Filename for the exporter executable
        default: null
        type: str

- node_exporter_checksum
        The exporter package checksum
        default: null
        type: str

- node_exporter_checksum_type
        The exporter package checksum type
        default: null
        type: str

- node_exporter_checksums_file
        Filename for the exporter package checksums
        default: null
        type: str

- node_exporter_checksums_url
        URL for the exporter package checksums
        default: null
        type: str

- node_exporter_configure_caddy
        If true, configure caddy to add a TLS endpoint for the
        exporter
        default: true
        type: bool

- node_exporter_description
        Description for the exporter systemd service
        default: null
        type: str

- node_exporter_disabled_collectors
        List of collectors to disable
        default: null
        elements: str
        type: list

- node_exporter_enabled_collectors
        List of collectors to enable
        Each item may be given as a string for the name of the
        collector or a dictonary with the following structure:
        Key = Name of the collector
        Value = Dictionary with the following structure:
          Key = Name of the collector option
          Value = Setting for the collector option
        default: null
        elements: raw
        type: list

- node_exporter_extra_flags
        Extra flags to run exporter with
        default: null
        type: dict

- node_exporter_file_sd_dir
        Directory, on scrape servers, for the file service discovery
        target
        default: /etc/prometheus/file_sd/node_exporter
        type: str

- node_exporter_flags
        Contents or list of flags to run exporter with
        default: null
        type: raw

- node_exporter_git_org
        Name of organisation for exporter git repository
        default: null
        type: str

- node_exporter_git_repo
        Name of exporter git repository
        default: null
        type: str

- node_exporter_group
        Name of the exporter unix group
        default: null
        type: str

- node_exporter_groups
        Unix groups added to exporter unix user
        default: null
        elements: str
        type: list

- node_exporter_install
        If true, install exporter
        default: true
        type: bool

- node_exporter_labels
        Labels added to exporter metrics, overrides prometheus_labels
        default: null
        type: dict

- node_exporter_latest_url
        URL for the latest version
        default: null
        type: str

- node_exporter_listen
        Listen address and port
        default: localhost:9100
        type: str

- node_exporter_log_level
        Only log messages with the given severity or above
        choices: [debug, info, warn, error]
        default: warn
        type: str

- node_exporter_manage_user
        If true, add exporter unix user and group
        default: true
        type: bool

- node_exporter_package
        Filename of the exporter package (without extension)
        default: null
        type: str

- node_exporter_package_dir
        Directory the exporter package is extracted to
        default: null
        type: str

- node_exporter_package_name
        Name of the exporter package
        default: null
        type: str

- node_exporter_package_url
        URL for the exporter package
        default: null
        type: str

- node_exporter_port
        Listen port
        default: 9100
        type: int

- node_exporter_register
        If true, register the exporter with the scrape servers
        default: true
        type: bool

- node_exporter_scrape_servers
        List of servers that scrape exporter metrics from the host,
        overrides prometheus_scrape_servers
        default: null
        elements: str
        type: list

- node_exporter_scripts
        List of custom scripts for generating metrics exported by the
        textfile collector
        default: null
        elements: dict
        type: list

        OPTIONS:

        - args
            Text for command arguments
            default: null
            type: str

        - dependencies
            List of packages to install
            default: null
            elements: str
            type: list

        - env
            Text for environment variables
            default: null
            type: str

        - execute_on_boot
            If true, the script is run just after boot without waiting
            for the delay set by update_every
            default: true
            type: bool

        - group
            Group to run the script
            default: node-exporter
            type: str

        = name
            Name for the script
            type: str

        - src
            Path to the script to copy over to the host
            default: null
            type: str

        - symlink
            Add the script as a symlink to the given path
            default: null
            type: str

        - update_every
            How often to run the script given as a systemd timespan,
            see https://www.freedesktop.org/software/systemd/man/syste
            md.time.html#Parsing%20Time%20Spans
            default: 1m
            type: str

        - user
            User to run the script
            default: node-exporter
            type: str

- node_exporter_scripts_dir
        Directory for the custom exporter scripts
        default: /opt/exporters/node_exporter/scripts
        type: str

- node_exporter_scripts_repos
        List of git repos with custom exporter scripts
        default: null
        elements: dict
        type: list

        OPTIONS:

        = name
            Name of the repo
            type: str

        = repo
            URL to the repo
            type: str

        - version
            Version of the repo to checkout
            default: master
            type: str

- node_exporter_service
        Name of the exporter systemd service
        default: null
        type: str

- node_exporter_src_dir
        Directory for the exporter downloads
        default: null
        type: str

- node_exporter_systemd_scripts_dir
        Directory for the systemd unit scripts
        default: /opt/exporters/node_exporter/scripts/systemd
        type: str

- node_exporter_tag
        Version git tag
        default: null
        type: str

- node_exporter_target
        Scrape target hostname and port
        default: null
        type: str

- node_exporter_textfile_directory
        Directory for the textfile collector to read from
        default: null
        type: str

- node_exporter_user
        Name of the exporter unix user
        default: null
        type: str

- node_exporter_version
        Version to install (use "latest" for the latest version)
        default: latest
        type: str

- node_exporter_version_regex
        Regular expression for capturing the version from the latest
        tag
        default: null
        type: str
```

Installation
------------

This role can either be installed manually with the ansible-galaxy CLI tool:

    ansible-galaxy install git+https://github.com/wandansible/prometheus_exporter,main,wandansible.prometheus_exporter
    ansible-galaxy install git+https://github.com/wandansible/prometheus_exporter.node,main,wandansible.prometheus_exporter.node
     
Or, by adding the following to `requirements.yml`:

    - name: wandansible.prometheus_exporter
      src: https://github.com/wandansible/prometheus_exporter
    - name: wandansible.prometheus_exporter.node
      src: https://github.com/wandansible/prometheus_exporter.node

Roles listed in `requirements.yml` can be installed with the following ansible-galaxy command:

    ansible-galaxy install -r requirements.yml

Example Playbook
----------------

    - hosts: all
      roles:
         - role: wandansible.prometheus_exporter.node
           become: true
