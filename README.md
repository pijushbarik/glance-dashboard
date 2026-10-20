# Glance dashboard
My Glance dashboard configs, running on Termux on an old Android device.

## Build Glance
The Android device I am running Termux on is 32 bit (armv7). The armv7 linux build of the Glance release was not working on the device, may be due to some compatibility issues. So I had to build the Glance binary from source.

### Prerequisite
Go needs to be installed to build Glance.

### Build
1. Clone the repo
  ```sh
  git clone https://github.com/glanceapp/glance
  ```
2. Build
```sh
cd glance
go build -ldflags="-s -w" -o glance .
```

Now the `glance` binary can be copied to the `glance-dashboard` root.

## Start
1. Create `.env` file from the `.env.example` template with the respective values.
2. Manual launch by
	```sh
	./launch-glance.sh
	```
3. Run in background with automatic start on device boot
	```sh
	# copy the script in termux boot directory
	cp tmux-bg-launch.sh ~/.termux/boot
	# and run
	~/.termux/boot/tmux-bg-launch.sh
	```

## Available scripts
- `launch-glance.sh`: loads .env and starts Glance in the current session
- `tmux-bg-launch.sh`: Acquires the Termux wake lock, starts Glance server by calling the `launch-glance.sh` script, and uses Apache rotatelogs to rotate logs daily. `cleanup-logs.sh` removes old logs.

## Stop server running on background
1. Grab the pid from
	```sh
	ps aux | grep 'glance'
	```
2. Then kill by
	```sh
	kill <pid>
	```
