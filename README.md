README.md

cfcgntp
=======

Hi! This is a little simple CFC (ColdFusion component/object) that enables sending notifications to a Growl/GNTP host. This should work under both Railo and Adobe ColdFusion and is programmed in cfscript CFML. The object works by calling the libgrowl jar, and is essentially a wrapper.

Basically it lets you send real-time alerts that pop-up on the desktop of the specified computer.

The cfc has been designed to be used as a singleton, i.e. instantiated in the _Application_ scope or in a FW1 controller - scopes that exists for the lifetime of the application.

## Why?
What would you use this for?
* Intranet situations
* Server/service monitoring for real time alerts
* Debugging
* Administrative interfaces

## Installation
0. Clone this repository somewhere accessible as a CFC, under your web root or in a Custom Tag path etc.
1. Download the libgrowl http://sourceforge.net/projects/libgrowl/ java library and put that in a path where your cfml-engine can access the library, that would likely be a _lib_ folder in the servlet container or similar.
2. Now you can create an instance of the cfc in your files, and call the _notify()_ method to send messages

## Usage
First initialize and instantiate the object:
```javascript
gntp = createObject('gntp').init(
    'localhost',
    'MyApplication',
    'https://raw.githubusercontent.com/fraxen/cfcgntp/master/gntp.png'
);
gntp.notify('Title of message', 'A little test message');
gntp.notify('Da title', 'Another message');
```

All arguments to _init()_ are optional:
* **hostname**, hostname of the growl server _defaults to localhost_
* **Application name**, the name of the application _defaults to APPLICATION.ApplicationName_
* **icon**, optional url or file reference to a icon image file _defaults to a default icon_

For _notify()_ the **title** and **message** arguments are mandatory, the rest are optional:
* **title**, title of the notification _required_
* **message**, message body *required*
* **icon**, optional url or file reference to an icon image file _defaults to icon chosen at init_
* **priority**, optional priority number, higher is more important, usually between -2 and 2 *defaults to 0*
* **sticky**, boolean - defines if the notification should stick around until manually dismissed *defaults to false*

## Notes
There is currently no exception and error handling, but I guess errors from libgrowl should propagate.

## License
This repository and all contents are licensed under the Apache 2 license, see the **[license file](https://github.com/fraxen/cfcgntp/blob/master/LICENSE)** for full details.
