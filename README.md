This project is a bash utility script developed as part of the Cloud Foundations course.
The script simulates a real-world junior systems administrator (JSA) task: organising incoming files, creating a backup location, moving certain files to archive, and generating a final report of all actions taken.

mkdir -p (×2)Creates parent directories silently; no error if folder already exists
ls -l Long format — shows permissions, owner, size, date
ls -h Human-readable sizes (KB/MB instead of raw bytes)
ls -a Shows hidden files (dotfiles) — important for sysadmin audits
cp -v Verbose copy — prints each filename as it transfers
mv -v Verbose rename — confirms exactly what moved where
rm -r Recursive delete — required to remove a directory and its contents
rm -v Verbose delete — shows each file being removed

Before running script, it must be executable: chmod +x jsa_utility.sh
To run the shell script: ./jsa_utility.sh# 0501_HW_LinuxLab_UtilityScript
