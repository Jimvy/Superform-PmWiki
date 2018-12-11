# PmWiki instance for Superform testing and integrations

## Installation and configuration

In the following, we use the terms "host OS" to refer to the operating system
of your computer (the supervisor OS: Windows, macOS or GNU+Linux)
and "guest OS" to refer to the operating system running in the virtual machine;
in this case, this is CentOS 7, based on GNU+Linux.

- Install Virtualbox for your host OS: https://www.virtualbox.org/wiki/Downloads.
It is possible the installation can succeed if you use another virtualization software
(like WMware, Hyper-V or Docker), but I didn't test it.
- install Vagrant for your host OS: https://www.vagrantup.com.
Don't expect it to run under WSL (Bash for Windows): this won't work.
- Clone this repo to an appropriate folder
- Download the latest XAMPP release for the guest OS at
https://www.apachefriends.org/download.html
(mine was 7.2.10) and put the downloaded file to the vagrant/files folder.
Mine was named "xampp-linux-x64-7.2.10-0-installer.run"
- If you're on Windows, in Git Bash, in the folder of the repo
(the one with a fila named "Vagrantfile"),
type `vagrant plugin install vagrant-vbguest`. Looks like this plugin is required on Windows
to set up shared folders and network port forwarding.
- In a decent terminal in your host OS (Git Bash, Terminal; NOT cmd.exe), type `vagrant up`.
Normally, a lot of messages should appear in your terminal, talking about
downloading a box and running provisions. If no text in red
color appears, the installation should be successful.
- Try accessing http://localhost:5001. This should redirect you to an XAMPP-branded page
- Try accessing http://localhost:5002. This should redirect you to the home of PmWiki.
- If you can't access either one, try the following:
  - Type `vagrant ssh` to log into the box
  - Type `sudo su` to get root rights
  - Type `/opt/lampp/lampp stop` to stop the server
  - Type `/opt/lampp/lampp start` to start the server. Check that Apache is ok.
  - To exit, type Ctrl+D two times.

## Common use

- Access http://localhost:5002 to get to the Wiki.

## Vagrant usage

- Start the box (and initialize it the first time) by running `vagrant up`.
- Access the internal box by running `vagrant ssh`.
- Verify its status by running `vagrant status`. Not kidding, this is useful.
- Halt the box by running `vagrant halt`
- Restart the box by running `vagrant reload`. This is the combination of `halt` and `up`.
- Re-provision the box by running `vagrant provision`. This is faster than reloading it.
- Pause the box by running `vagrant suspend`. No idea why this is useful.
Resume it with (you know it) `vagrant resume`.
- Get rid of everything Vagrant-related by running `vagrant destroy` (to destroy the files locally)
and `vagrant box remove centos/7` (to remove the box from your computer)
- You can force provision by adding `--provision` to `up`, `reload` or `resume` commands.
By default, provisioning (running scripts to setup the environment) is only done the first time
`vagrant up` is done, so you need to force it.
