# 0x0C. Web server
In this project, some of the tasks will be graded on 2 aspects:

   1. Is your `web-01` server configured according to requirements
   2. Does your answer file contain a Bash script that automatically performs commands to configure an Ubuntu machine to fit requirements (meaning without any human intervention)

For example, if I need to create a file `/tmp/test` containing the string `hello world` and modify the configuration of Nginx to listen on port `8080` instead of `80`, I can use emacs on my server to create the file and to modify the Nginx configuration file `/etc/nginx/sites-enabled/default`.

But my answer file would contain:
```
sylvain@ubuntu cat 88-script_example
#!/usr/bin/env bash
# Configuring a server with specification XYZ
echo hello world > /tmp/test
sed -i 's/80/8080/g' /etc/nginx/sites-enabled/default
sylvain@ubuntu
```
As you can tell, I am not using `emacs` to perform the task in my answer file. This exercise is aiming at training you on automating your work. If you can automate tasks that you do manually, you can then automate yourself out of repetitive tasks and focus your energy on something more interesting. For an `SRE`, that comes very handy when there are hundreds or thousands of servers to manage, the work cannot be only done manually. Note that the checker will execute your script as the `root` user, you do not need to use the `sudo` command.

## Learning objectives
### General
- What is the main role of a web server
- What is a child process
- Why web servers usually have a parent process and child processes
- What are the main HTTP requests

### DNS
- What DNS stands for
- What is DNS main role

### DNS Record Types
- A
- CNAME
- TXT
- MX

## Requirements
### General
- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass `Shellcheck` (version `0.3.7`) without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing
- You cant use `systemctl` for restarting a process
## TASKS
*** 0-transfer_file ** - Write a Bash script that transfers a file from our client to a server:

Requirements:

	- Accepts 4 parameters
		1. The path to the file to be transferred
		2. The IP of the server we want to transfer the file to
		3. The username scp connects with
		4. The path to the SSH private key that scp uses
	- Display `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY` if less than 3 parameters passed
	- `scp` must transfer the file to the user home directory `~/`
	- Strict host key checking must be disabled when using scp

*** 1-install_nginx_web_server *** - Web servers are the piece of software generating and serving HTML pages, lets install one!

Requirements:
	
	- Install nginx on your `web-01`
	- server
	- Nginx should be listening on port 80
	- When querying Nginx at its root / with a GET request (requesting a page) using curl, it must return a page that contains the string _Hello World!_
	- As an answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements (this script will be run on the server itself)
	- You cant use systemctl for restarting nginx

*** 2-setup_a_domain_name *** - Provide the domain name in your answer file.


Requirement:
	
	- provide the domain name only (example: foobar.tech), no subdomain (example: www.foobar.tech)
	- configure your DNS records with an A entry so that your root domain points to your web-01 IP address **Warning: the propagation of your records can take time (~1-2 hours)**

*** 3-redirection *** - Configure your Nginx server so that /redirect_me is redirecting to another page.

Requirements:
	
	- The redirection must be a 301 Moved Permanently
	- You answer file should be a Bash script containing commands to automatically configure a Ubuntu machine to respect above requirements
	- Using what you did with 1-install_nginx_web_server, write 3-redirection so that it configures a brand new Ubuntu machine to the requirements asked in this task

*** 4-not_found_page_404 *** - Configure your Nginx server to have a custom 404 page that contains the string `Ceci n'est pas une page`.

Requirements:
	
	- The page must return an HTTP 404 error code
	- The page must contain the string Ceci n'est pas une page
	- Using what you did with 3-redirection, write 4-not_found_page_404 so that it configures a brand new Ubuntu machine to the requirements asked in this task
