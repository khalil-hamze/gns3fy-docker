# gns3fy-docker

Control the end Devices in Topology created in GNS3 using Python, and containerize the project (create a docker image contain project files)

# GNS3 Without GUI

The purpose of the document is to open gns3 project without GUI using Python library `gns3fy`.

## Requirements

- Download images from <https://mega.nz/folder/nJR3BTjJ#N5wZsncqDkdKyFQLELU1wQ> and add them into directory `images/IOS`.
- Create the topology of your project in gns3 and put the project in `topology_container` folder.
- Install latest version of GNS3 2.2.~ .
- Install Python 3.8.~ .
- Add Configs(controller, server, gui).
- Add Files and Project.

## Install GNS3

GNS3 packages are available on a GNS3 ppa repository, first, add the repository by running the commands below:

```
sudo apt-get update
sudo apt-get upgrade
sudo add-apt-repository ppa:gns3/ppa
```

Update system package list and install GNS3:

```
sudo apt-get update
sudo apt-get install gns3-server gns3-gui
```

## Install Python and Pip

[1]: [https://www.python.org/ftp/python/3.8.4/Python-3.8.4.tar.xz]

- Install [Python][1] Zip file
- Now, open a terminal and extract Python-3.8.~.tgz file through tar command-line utility:

```
cd /Path/to/Python-3.8.~.tgz
tar -xvf Python-3.8.~.tgz
```

- This creates a folder – Python-3.8.0 in current directory.

```
cd Python-3.8.0/
```

- And, issue the following three commands:

```
./configure
make
make test
```

- Now, to keep the default installed Python version and install Python v3.8.0 alongside the installed version. Therefore, run the following command:

```
sudo make altinstall
```

- Finaly install pip3 using command:

```
sudo apt-get install python3-pip
```

## Add Configuration Files

First, you need to know the path and content of the 3 configutions files:

- server
- controller
- gui

Go to `/$HOME/.config/GNS3/2.2/` you will the 3 configuration files.
**N.B:** If the File Not Exist, you need to open gns3 gui for the first time.
In the gns3 server configuration file, make sure if the authentication is false `auth = False`.
Replace the controller file with ours. _(Please ask the team for those files)_.

## Add Project File

- Put the images files in `/$HOME/GNS3/images/IOS/`.
- Put the project file in `/$HOME/GNS3/projects/`.

## Run The gns3server

Open New Terminal and tap command `gns3server`. this command will start the gns3 server on **host:** `localhost` and **port:** `3080`.

## Run Gns3 Project

You need to be familiar with Python library [gns3fy](https://davidban77.github.io/gns3fy/user-guide/#interact-with-existing-project).
Open new terminal got to the `Path/of/Python/script` and install requirement module using `pip3 install -r requirements.txt`
Run the main file using `python3 main.py`.
Now check the terminal where you run the gns3server, you see the project running.

## Configure interface tap0

Open New Terminal and run the commands below:

```
sudo ifconfig tapx up
sudo ifconfig tapx 10.200.1.1/24
sudo ip route add 10.200.33.0/24 via 10.200.1.9
sudo ip route add 10.200.44.0/24 via 10.200.1.9
```

## Ping Routers

```
ping <ip_router>
```
