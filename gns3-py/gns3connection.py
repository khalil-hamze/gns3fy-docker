from gns3fy import Gns3Connector

def connect(host, port):
    return Gns3Connector("http://" + str(host) + ":" + str(port))