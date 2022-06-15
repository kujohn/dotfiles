#!/bin/bash
vultr-cli dns record update johnku.com f8ec885b-e477-46b0-a323-7045a1ce8e79 -n connect -d $(curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g')
