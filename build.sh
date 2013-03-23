#!/bin/bash

# Markdown InstaSite
# Put up a site in seconds with Markdown Instasite. Simply place your markdown-
# formatted pages into "src/", run "build.sh" and you're done. Take the hassle
# out of making sure your site looks great.
# Author: Verdi R-D
# Date: March 22nd, 2013


MDBIN="Markdown.pl"

MDEXT=".md"
HTMLEXT=".html"

SRCDIR="src"
TPLDIR="tpl"
STATICDIR="static"
BUILDDIR="build"

HEADERTPL="header.html"
FOOTERTPL="footer.html"

BASEPATH=$( pwd )

# Check if the build directory has already been created
if [ -d "$BUILDDIR" ]; then
	# Clean out the directory and start from scratch
	echo "INFO: Build directory found. Cleaning for a rebuild."
	rm -rf "$BUILDDIR"
else
	echo "INFO: Build directory could not be found. Starting build anew."
fi

# Create the build directory
mkdir "$BUILDDIR"

# Copy over any static files there may be to beautify the site

if [ -d "$STATICDIR" ]; then
	echo -n "INFO: Copying over static files..."
	cp -R "$STATICDIR/" "$BUILDDIR/"
	echo "Done."
else
	echo "WARNING: Directory for static files could not be found." >&2
fi

# Find all of the source files to build
SRCFILES=$(find "$SRCDIR")

# Build the pages
for FILE in $(find "$SRCDIR"); do

	CURPATH=$( echo "$FILE" | sed "s,$SRCDIR,$BUILDDIR," )

	if [ -d "$FILE" ]; then
		# This is a directory. Don't compile.
		mkdir -p "$CURPATH"

	else
		echo -n "INFO: Compiling $FILE..."

		# Get the name of the page without the extension
		OUTPATH=$( echo "$CURPATH" | sed "s,$MDEXT,$HTMLEXT," )
	
		# Create the final file for good measure
		touch "$OUTPATH"

		# Include any html templates that may exist if
		# the folder is in the correct place
		if [ -d "$TPLDIR" ]; then

			# If the header is there, copy it over
			if [ -f "$TPLDIR/$HEADERTPL" ]; then
				cat "$TPLDIR/$HEADERTPL" >> "$OUTPATH"
			else 
				echo "\nWARNING: Header template not found. Ignoring header." >&2
			fi
	
			# Compile the file
			$MDBIN "$FILE" >> "$OUTPATH"
		
			# If the footer is there, copy it over
			if [ -f "$TPLDIR/$FOOTERTPL" ]; then
				cat "$TPLDIR/$FOOTERTPL" >> "$OUTPATH"
			else 
				echo "\nWARNING: Footer template not found. Ignoring footer." >&2
			fi

		else 
			# Just build the file ignoring templates
			echo "\nWARNING: Template folder not found. Ignoring templates." >&2
	
			# Compile the file
			$MDBIN "$FILE" > "$OUTPATH"
		fi

		echo "Done."
	fi

done

echo "INFO: Build complete."
