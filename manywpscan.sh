#!/bin/bash

while IFS= read -r target; do
  echo "Scanning $target..."

  # Clean filename from URL (remove http://, https://, slashes, colons)
  filename=$(echo "$target" | sed 's~https\?://~~; s~[/:]~_~g')

  # Run WPScan and save to a uniquely named file
  wpscan --url "$target" --api-token=zwUONFgtIpk9q3B6ToZISFTxIkCJmOEgs4FVLWP83j0 > "${filename}_wpscan.txt"

done < targets.txt
