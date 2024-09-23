# Prometheus.md

## Websites

* Exporters
  * [prometheus-community/windows_exporter](https://github.com/prometheus-community/windows_exporter)

# Installation

## Ubuntu

* {4} [How to Install and Configure Prometheus and Grafana on Ubuntu](https://www.linode.com/docs/guides/how-to-install-prometheus-and-grafana-on-ubuntu/)

## Antix

* {6} [How to Manage Services in Linux: systemd and SysVinit Essentials — DevOps Prerequisite 8](https://medium.com/@iAadiDev/how-to-manage-services-in-linux-systemd-and-sysvinit-essentials-devops-prerequisite-8-3224508041bb)
* {7} [Converting traditional sysV init scripts to Red Hat Enterprise Linux 7 systemd unit files](https://www.redhat.com/en/blog/converting-traditional-sysv-init-scripts-red-hat-enterprise-linux-7-systemd-unit-files)

* SystemD and SysVinit service file has different formats.
  * SystemD service files are located in "/etc/systemd/system/" directory.
  * SysVinit service files are located in "/etc/init.d" directory.
  * Install "prometheus" and "prometheus-node-exporter" from "official-repo" using "apt" command
    * `sudo apt install prometheus`
    * `sudo apt install prometheus-node-exporter`
  * Check service file "/etc/init.d/prometheus" and "/etc/init.d/prometheus-node-exporter".
  * Backup these two service files, install latest "prometheus" and "prometheus-node-exporter" and restore service files.
  * Check "prometheus" service
    * `service prometheus status`
    * `sudo service prometheus stop`
    * `sudo service prometheus start`
  * Check "prometheus-node-exporter" service
    * `service prometheus-node-exporter status`
    * `sudo service prometheus-node-exporter stop`
    * `sudo service prometheus-node-exporter start`
  * Install other prometheus exporter and follow same procedure like "prometheus-node-exporter"

# Comparison

# Netdata VS Prometheus

* [Netdata vs Prometheus](https://stackshare.io/stackups/netdata-vs-prometheus)
  * For long-term storage or historical analysis, NetData relies on third-party tools like Elasticsearch or InfluxDB.
  * Prometheus has its own time-series database that stores metrics persistently, making it easier to perform time-based queries and generate historical reports.

# References

* next-sl: {10}

* Tutorials
  * {4} [How to Install and Configure Prometheus and Grafana on Ubuntu](https://www.linode.com/docs/guides/how-to-install-prometheus-and-grafana-on-ubuntu/)
  * {5} [Installing Grafana and Prometheus on Windows 10 System](https://medium.com/@pinaki.pm/installing-grafana-and-prometheus-on-windows-10-system-f55d67eb356c)
  * {1} [Install Prometheus and Grafana on Ubuntu 20.04 LTS](https://www.fosstechnix.com/install-prometheus-and-grafana-on-ubuntu/) <sup>{2}</sup>
  * {8} [Docker Monitoring - Prometheus and Grafana Setup Guide](https://signoz.io/guides/how-to-monitor-docker-containers-with-prometheus-and-grafana/)
  * {9} [Deep Dive into Prometheus Monitoring: Architecture and Components Explained](https://abhiraj2001.medium.com/deep-dive-into-prometheus-monitoring-architecture-and-components-explained-d7b33cbe40db)

* Installation

  * Antix
    * {6} [How to Manage Services in Linux: systemd and SysVinit Essentials — DevOps Prerequisite 8](https://medium.com/@iAadiDev/how-to-manage-services-in-linux-systemd-and-sysvinit-essentials-devops-prerequisite-8-3224508041bb)
    * {7} [Converting traditional sysV init scripts to Red Hat Enterprise Linux 7 systemd unit files](https://www.redhat.com/en/blog/converting-traditional-sysv-init-scripts-red-hat-enterprise-linux-7-systemd-unit-files)

* YouTube Tutorials
  * {2} [Monitoring Linux Server with Prometheus and Grafana using Node Exporter | Install Prometheus Ubuntu BY DevOps Hint](https://www.youtube.com/watch?v=DuYnPOq4D6w) <sup>{1}</sup>
  * {3} [How to install Prometheus on Ubuntu 20.04 | VPS Tutorial BY GreenCloud](https://www.youtube.com/watch?v=tXIjm_0QQpk)
  * [Monitoring Websites with Prometheus | Prometheus Synthetic Monitoring | Prometheus Blackbox Exporter BY Vikas Jha](https://www.youtube.com/watch?v=HbaiglWbhR0)
