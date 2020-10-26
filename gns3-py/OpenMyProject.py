from gns3fy import Gns3Connector, Project

server = Gns3Connector("http://localhost:3080")

project = Project(name="topology_container", connector=server)

project.get()
project.open()
print(project)