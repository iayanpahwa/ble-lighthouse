# ble-lighthouse - create ble beacons on single board linux computer using balena.io

![](https://raw.githubusercontent.com/iayanpahwa/ble-lighthouse/master/assets/ble-lighthouse.png)

**Make fleet of bluetooth low energy beacons using and manage them centrally via balenaCloud**

## Hardware required

tested on : 
- Raspberry Pi 4 with integrated ble radio but should work with all Rpi models
## Setup & Installation

Running this project is as simple as deploying it to a balenaCloud application. You can do it in just one click by using the button below:

[![](https://balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy?repoUrl=https://github.com/iayanpahwa/ble-lighthouse)

You can also deploy in the traditional manner using the balena CLI and `balena push` command. For more information [check out the docs](https://www.balena.io/docs/learn/deploy/deployment/).

## Customization

fleet of beacons can be all managed centrally via balenaCloud. Try any of the environment variables below to add some customization.

### ADVERTISE

* TRUE - to enable the beacon (advertising) mode
* FALSE - to disable the beacon (advertising) mode

### BEACON_TYPE

* URL - broadcasts a webpage URL defined with ```URL``` env variable 
* UID - broadcasts a 16 bytes UID defined with ```UID``` env variable 
* RAW - broadcasts sensor value attached to Pi (WORK IN PROGRESS)

### URL

URL - any web URL (with https://); default is : hub.balena.io

### UID

UID - any 16 bytes unique ID; default is : 01234567890123456789012345678901

## How to scan the beacon created

BLE beacons are meant to be used with custom application on ble supported mobile phones, but you can use beacon scanner app to detect them as well. ble beacons can also be detected using scanner applicaitions on phone and the advertised data can be relayed to internet via the gateway. 

For purpose of testing you can use ```beacon scanner``` app on Android device and ```eBeacon``` on ios. these apps should easily detect URL and UID beacons. ```nRF Connect``` is another great app to scan all sort of ble devices including ble beacons. 
