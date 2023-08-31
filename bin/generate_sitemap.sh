#!/bin/bash

# Start the sitemap.xml file
echo '<?xml version="1.0" encoding="UTF-8"?>' > sitemap.xml
echo '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' >> sitemap.xml

# For each .md file in the repository
for file in $(find . -type f -name "*.md"); do
    # Get the last commit date for the file
    last_commit_date=$(git log -1 --format=%cd --date=format:'%Y-%m-%d' -- "$file")
    
    # Convert the .md file path to .html
    html_path="${file%.md}.html"

    # Remove the leading ./
    html_path="${html_path#./}"

    # Append the entry to the sitemap.xml
echo "  <url>" >> sitemap.xml
echo "    <loc>https://stoerr.github.io/til/$html_path</loc>" >> sitemap.xml
echo "    <lastmod>$last_commit_date</lastmod>" >> sitemap.xml
echo "  </url>" >> sitemap.xml
done

# Close the sitemap.xml file
echo '</urlset>' >> sitemap.xml
