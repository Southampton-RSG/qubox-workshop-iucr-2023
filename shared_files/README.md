This folder will be made accessible to any running Docker containers in the QuantumBox project.
More precisely, it will be mounted as a Docker volume in each running container (at the location
`/mnt/shared_files`).  This ensures that the various docker services have access to the same files
and can exchange data, both between each other and with the host file system.
