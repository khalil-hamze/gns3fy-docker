from gns3fy import Gns3Connector, Project

def OpenProject(project_id, project_name, gns3_server):
	project = Project(project_id=project_id, name=project_name, connector=gns3_server)
	project.get()
	project.open()