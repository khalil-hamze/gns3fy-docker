from gns3fy import Gns3Connector, Project
from gns3connection import connect
from OpenProject import OpenProject
from dotenv import load_dotenv
from pathlib import Path
import os

def main():
	load_dotenv(dotenv_path='./.env')
	gns3_server = connect(os.getenv('HOST'), os.getenv('PORT'));
	OpenProject(os.getenv('PROJECT_ID'), os.getenv('PROJECT_NAME'), gns3_server)


if __name__ == "__main__":
	main()