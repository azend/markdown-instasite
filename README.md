Markdown InstaSite
==================
Markdown InstaSite is an easy way to get up and running online quickly. Markdown InstaSite works by taking your exising Markdown source documentation and compiles it into beautiful looking pages which are ready to be put on the web.

Purpose
-------
For a few months now, I've searching the internet to find a project which can take my own written existing Markdown files and turn them into polished web pages for applications such as a wiki. Today I gave up on this search and decided to write something from scratch.

How to use
----------
Using Markdown InstaSite is pretty simple. All you really have to do is copy in your Markdown source files and run the build script.

### Pages
Pages in Markdown InstaSite are created for any file which is inside of `src/`. To make a page, simply drop your Markdown source into the `src/` directory and the build script will pick it up the next time you run it.

### Static files
When the build script is run, any files which are currently in `static/` are automatically copied over to the root of the build directory. The static folder is where you put files which should not be compiled but are needed to run the site. I've encluded a base install of Twitter Bootstrap in the static folder already to make getting started quicker.

### Headers and footers
Perhaps you would like to include a custom CSS rule or Google Analytics tracking to the pages in your website. The `tpl/` directory is where you do that. Inside `tpl/`, a base header and footer are provided to get you started quickly. These header and footer files are automatically appended to the beginning and end of your Markdown pages respectively.

Advanced configuration
----------------------
If you're an IT ninja and the default configuration doesn't work for you, many of the configuration file/folder names can be changed in the top varible declarations of the build script. This will let you change around folder names or whatever to better suit your needs.

However, if you really are an IT ninja, you've probably stopped reading this already and have moved on to look at the build script instead anyways.
