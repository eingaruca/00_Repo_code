#!/environments-python/py-zabbix/bin/python3

import sys
import logging

from pyzabbix.api import ZabbixAPI


# Create ZabbixAPI class instance
logger = logging.getLogger("pyzabbix")
logger.setLevel(logging.DEBUG)
handler = logging.StreamHandler(sys.stdout)
logger.addHandler(handler)

# Create ZabbixAPI class instance
zapi = ZabbixAPI(url='https://10.1.1.24/zabbix', user='Admin', password='zabbix')

# Get all monitored hosts
result1 = zapi.host.get(monitored_hosts=1, output='extend')

# Get all disabled hosts
result2 = zapi.do_request('host.get',
                          {
                              'filter': {'status': 0},
                              'output': 'extend'
                          })

# Filter results
hostnames1 = [host['host'] for host in result1]
hostnames2 = [host['host'] for host in result2['result']]

# Logout from Zabbix
zapi.user.logout()
