import configparser, os, sys, logging, datetime
from pyzabbix.api import ZabbixAPI
from server import Server

#FECHAS
x=(datetime.datetime.now()-datetime.timedelta(days=30)).strftime("%Y-%m-%d %H:%M:%S")
y=(datetime.datetime.now()).strftime("%Y-%m-%d %H:%M:%S")
##############################################################
### VARIABLES FICHERO
##############################################################
path = os.path.join(os.path.dirname(__file__),'parameters.ini')

config = configparser.ConfigParser()
config.read(path)

server = config['CREDENTIALS']['server']
user = config['CREDENTIALS']['user']
password = config['CREDENTIALS']['password']

url = "https://" + server + "/zabbix/"
g_saas_ss_cloudops = config['GROUPS']['group_SaaS_SS_CloudOPS']

zapi = ZabbixAPI(url=url,user=user,password=password)
################################################################
#Get all monitored servers
################################################################
result1 = zapi.host.get(monitored_hosts=1, output='extend')
result2 = zapi.hostgroup.get(monitored_hosts=1, output='extend')

hostnames1 = [host['host'] for host in result1]
hostnames2 = [hostgroup['groupid'] for hostgroup in result2]
#####################################################################
# Obtenemos hostname y hostid y se añade a la lista list_servers
#####################################################################
list_servers = []
for group_id in hostnames2:
    result3 = zapi.host.get(groupids=group_id)
    print("============",group_id,"===================")
    hostnames,idhostnames = [host['host'] for host in result3], [host['hostid'] for host in result3]

    for host,id in zip(hostnames,idhostnames):
        list_servers.append(Server(id,host,group_id))
        print(id,host)

#######################################################################
# Leyendo varios parámetros desde el fichero config
#######################################################################
items=[]
for (each_key, each_val) in config.items("ITEMS"):
        items.append(each_val)
        print(each_val)
        print(each_key)

#########################################################################
#
#############################################################################
for i in list_servers:
    abc = i.id_name+''
    print("-->", abc)
    if (i.id_name != '10084'):
        resultx = zapi.history.get(hostids=i.id_name,search='',output='extend')
        #print(resultx)
