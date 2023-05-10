# Generate a cache/compound/check_ftp.txt to check for updates
out="cache/comptox/comptox_realease.txt" 
mkdir -p cache/comptox/ 
wget https://www.epa.gov/chemical-research/comptox-chemicals-dashboard-release-notes -O $out