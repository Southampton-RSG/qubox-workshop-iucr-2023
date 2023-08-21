# QuantumBox Workshop at the IUCr Congress 2023

This repository contains setup instructions for the QuantumBox workshop at [IUCr 2023](https://iucr2023.org/), taking place on Tuesday, 22nd August 2023.

The software tools are provided as Docker containers. Please make sure you have `docker` / `docker compose` installed (see [Prerequisites](#prerequisites) below).

## Prerequisites

You need to have a recent version of `docker` and `docker compose` installed.
We recommend installing [Docker Desktop](https://docs.docker.com/desktop/), which comes bundled with `docker compose` and a graphical user interface, among other things.
Please follow the installation instructions for your operating system:
[Mac](https://docs.docker.com/desktop/install/mac-install/), [Windows](https://docs.docker.com/desktop/install/windows-install/), [Linux](https://docs.docker.com/desktop/install/linux-install/)

**⚠️ Important note for Windows users:**

> The installation of Docker Desktop depends on WSL (Windows Subsystem for Linux),
> and also requires certain BIOS features to be enabled. The section
> [System Requirements](https://docs.docker.com/desktop/install/windows-install/#system-requirements)
> in the Docker Desktop documentation has all the details, please read and follow
> these carefully to ensure you don't run into strange issues during the installation.


## Starting up the QuantumBox Docker containers

- Clone this repository:
   ```bash
   git clone https://github.com/Southampton-RSG/qubox-workshop-iucr-2023.git
   ```

  _Alternatively, click on [this link](https://github.com/Southampton-RSG/qubox-workshop-iucr-2023/archive/refs/tags/v1.3.0.zip) to download a zip file with the contents of this repository. Once downloaded, extract this to a location of your choice._


- Open a terminal / PowerShell and change into the cloned repository (or extracted folder).
  ```bash
  # If you cloned this repository:
  cd qubox-workshop-iucr-2023
  
  # If you downloaded and extracted the zip file:
  cd qubox-workshop-iucr-2023-1.0.0
  ```


- Pull the relevant docker images by running the following command:
  ```
  docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" pull
  ```
  _This will download multiple images with a combined size of several GB. We strongly recommend doing this before the workshop in a place with good internet connectivity. See the section [Troubleshooting](#troubleshooting) below if you encounter any errors._


- Spin up the docker containers:
  ```
  docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" up -d
  ```

## Verifying the installation

To verify that the installation worked, you can navigate to http://localhost:11000/ where you should see the message `"Hello from QuBox!"`.

Navigating to http://localhost:11000/applications/ should show something like the following:
```
[{"id":1,"name":"NoSpherA2 (pyscf)","version":"0.0.1","description":null,"url":null,"registered_at":"2023-08-16T13:50:48.216001"},
{"id":2,"name":"XHARPy","version":"git_d0d0f82","description":null,"url":null,"registered_at":"2023-08-16T13:50:49.110199"}]
```

Finally, navigating to http://localhost:12000/datasets/ should present a web interface with a list of datasets found in `shared_files/datasets/`.
For convenience, a couple of example CIF files (`Epoxide` and `L-Alanine`) are included in this repository, but feel free to place your own datasets in this folder as well.
Any subfolder of `shared_files/datasets/` will be interpreted as a separate dataset, and any `.cif` and `.par`/`.xpar` files present in a dataset subfolder will be picked up by the QuBox web interface.

## Tearing down the QuantumBox Docker containers

In order to stop and remove any running containers, execute the following command.
```
docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" down
```

Internally, some QuantumBox docker containers define "volumes", which are a way of persisting data across restarts of the containers.
If you run into any problems it can sometimes be useful to completely remove any data stored in these volumes.
To do this, run:
```
docker compose -f docker-compose.iucr23.yml --env-file="env.iucr23" --project-name="qubox-iucr23" down --volumes
```


## Troubleshooting

If you network speed is slow, there is a chance that pulling some image layers will fail with an error message like this:
```
Error response from daemon: Get "https://registry-1.docker.io/v2/": EOF
```
If this happens, try to re-run the above command and hopefully it will complete (possibly after several tries).
