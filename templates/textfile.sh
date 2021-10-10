#!/bin/bash
# {{ ansible_managed }}

set -euo pipefail

{% if item.env is defined and item.env != "" %}
{{ item.env }} \
{% endif %}
{{ node_exporter_scripts_dir }}/{{ item.symlink | default(item.src) | basename }} \
{% if item.args is defined and item.args != "" %}
{{ item.args }} \
{% endif %}
> {{ node_exporter_textfile_directory }}/{{ item.name }}.tmp

mv {{ node_exporter_textfile_directory }}/{{ item.name }}.tmp {{ node_exporter_textfile_directory }}/{{ item.name }}.prom
