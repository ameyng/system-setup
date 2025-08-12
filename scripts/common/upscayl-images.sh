#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Initialize the path of the input image directory.
sInputImageDirectory='/home/amey/Pictures'

# Initialize the path of the upscaling models.
sModelPath='/home/amey/Downloads/upscayl/resources/models'

# Initialize the output format.
sOutputFormat='jpg'

# Initlaize the current timestamp.
sTimestamp="$(date +%d-%b-%Y-%I-%M-%S-%p)"

# Iterate over all files in the input directory.
for file in "${sInputImageDirectory}"/*; do

  # Check if the file is an image by searching for the string 'image' within the file's mime type.
  # Extract this string into a variable.
  sImageStringExtracted="$(file --mime-type "${file}" | grep -o 'image')"

  # Check if the string 'image' was extracted.
  if [ 'image' == "${sImageStringExtracted}" ]; then

    # Check if the timestamped output directory does not exist.
    if [ ! -d 'Upscaled-'"${sTimestamp}" ]; then

      # Create the directory.
      mkdir -pv 'Upscaled-'"${sTimestamp}"

    fi

  # Iterate over the '.bin' model files.
  for model_file in 
  fi

done

# Exit with a successful error code.
exit 0
