#!/bin/sh

echo "Publishing process started..."

# Copy the LICENSE_KEY variable into 'licensekey.txt' in Oxygen Publishing Engine 
echo "Copying license key..."
printf "%s" "$LICENSE_KEY" > ope/licensekey.txt

# The LICENSE_KEY variable does not contain a newline character but '@@' instead
# Replace all the '@@' characters back to '\n' in the 'licensekey.txt' file
echo "Fixing line endings in licensekey.txt..."
sed -i 's/@@/\n/g' ope/licensekey.txt

# Run the PDF CSS HTML5 transformation
echo "Running PDF CSS HTML5 transformation..."
ope/bin/dita -f pdf-css-html5 -i sample/space.ditamap -o sample/out/pdf-css-html5 -Dpdf.publishing.template=publishing  -Dpdf.publishing.template.descriptor=basket.opt

# Run the WebHelp Responsive transformation
echo "Running WebHelp Responsive transformation..."
ope/bin/dita -f webhelp-responsive -i sample/space.ditamap -o sample/out/webhelp-responsive -Dwebhelp.publishing.template=publishing  -Dwebhelp.publishing.template.descriptor=basket.opt

echo "Publishing process completed."
