Install
=======
Installing Markdown InstaSite is pretty simple. All you have to do really is copy a couple of files over and run the build script.

NOTE: This script is designed to be run on Linux servers. Doing otherwise may be possible but is not recommended.

Steps
-----
1. Install Markdown

	1.1 Download Markdown from the [Markdown website](http://daringfireball.net/projects/markdown/).

	1.2 Extract the archive to a temporary directory.
	
	1.3 Copy `Markdown.pl` to a place where the build script can run it. I put mine in `/usr/bin` but that may not be available in shared hosting environments.

2. Clone this repo into the web root of a domain. This will be the installation directory.

3. (If needed) Edit the configuration variables for your installation in `build.sh`.

4. Run `./build.sh` to build your site.

5. Edit the provided `.htaccess` file to rewrite all incoming requests to inside your `build/` directory.
