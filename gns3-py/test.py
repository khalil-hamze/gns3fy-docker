from gns3fy import Gns3Connector, Project
from tabulate import tabulate

server = Gns3Connector("http://localhost:3080")

lab = Project(name="topology_container", connector=server)
lab.get()
print(lab)

print('\n--------------------------------\n')

nodes = lab.nodes_summary(is_print=False)
print(tabulate(nodes))

print('\n--------------------------------\n')

links = lab.links_summary(is_print=False)
print(tabulate(links))