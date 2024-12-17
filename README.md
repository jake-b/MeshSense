# 17 Dec 2024: Jake's changes

Wanted to run this on an arm64 (Raspberry Pi) in a docker container, for connecting to TCP-only hosts.
- Needed to remove bluetooth support, as discussed here: https://github.com/Affirmatech/MeshSense/issues/22
- Added ENV variable for the access key.
- Connect with http://{YOUR IP}:5920
	- Make sure you configure the access key in the client first (config button upper right)
	- Once configured with your access key, you'll get the full interface.
	- This allows you to select TLS, which you might need depending on your use case.
	- Connect to your WiFi-enabled node using the connect box upper left.
- I dont use docker-compose, so I simplified the build/run scripts for my purposes.  YMMV

# Original Readme Below

## 22Nov24
The container is now running with the following improvements:

Added proper DBus system configuration for Bluetooth support
Fixed environment variable setup
Properly configured startup script to run both UI and API services
Set up port mappings for both services (5920 for API, 5921 for UI)
You can access the services at:

UI: http://localhost:5921

API: http://localhost:5920

Note that there are still some npm package warnings and vulnerabilities that should be addressed in the future:

Critical vulnerabilities that should be fixed:

Run npm audit fix in both UI and API directories

Update deprecated packages to their latest versions

Deprecated packages that should be updated:

rimraf (update to v4 or later)

uuid (update to v7 or later)

request (consider using axios or node-fetch)

npmlog (consider using a different logging library)

and others as listed in the warnings


## Install

git clone https://github.com/youroldmangaming/MeshSense.git

cd MeshSense

chmod 777 run.sh

http://<HOST IP>:5921

![image](https://github.com/user-attachments/assets/a77a208c-0ada-4795-92b9-9f8cd65c5e69)



