#!/bin/bash

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <zipfile>"
  exit 1
fi

zipfile="$1"

# Extract to a temporary directory
tempdir=$(mktemp -d)
unzip -q "$zipfile" -d "$tempdir"

# Recursively remove protection strings
if [[ $(uname) == "Darwin" ]]; then  # macOS
  find "$tempdir" -type f -exec sed -i '' -E 's/<sheetProtection[^>]*>//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/<protection hidden="1"\/>//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/<protection[^>]*>//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/state="hidden"//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/visibility:hidden//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/hidden="1"/hidden="0"/g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/showSheetTabs="0"//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/hiddenRows="1"//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/hiddenColumns="1"//g' {} \;
  find "$tempdir" -type f -exec sed -i '' -E 's/<protectedRange [^>]*>//g' {} \;
else  # Assumed to be Linux (or another system with GNU sed-like behavior) 
  find "$tempdir" -type f -exec sed -i -E 's/<sheetProtection[^>]*>//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/<protection hidden="1"\/>//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/<protection[^>]*>//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/state="hidden"//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/visibility:hidden//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/hidden="1"/hidden="0"/g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/showSheetTabs="0"//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/hiddenRows="1"//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/hiddenColumns="1"//g' {} \;
  find "$tempdir" -type f -exec sed -i -E 's/<protectedRange [^>]*>//g' {} \;
fi

# Create the unprotected zip file
# Get the original extension (everything after the last '.')
extension="${zipfile##*.}"

# Construct the unprotected filename with the original extension
unprotected_filename="${zipfile%.*}_unprotected.$extension"

thispath=$(pwd)
cd $tempdir

zip -qr "$unprotected_filename" .

mv "$unprotected_filename" $thispath

# Clean up temporary directory
rm -rf "$tempdir"

echo "Unprotected file created: $unprotected_filename"
