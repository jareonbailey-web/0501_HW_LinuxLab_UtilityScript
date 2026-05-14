#!/bin/bash

# ============================================================
# Script : utility_script.sh
# Author : <yourName>
# Date : $(date)
# Purpose : Organizes department files, creates backups,
# moves selected files, and generates a report.
# ============================================================

# --- 1. Show where we're starting from ---
echo "Working directory:"
pwd

# --- 2. Create department directories ---
echo ""
echo "Creating department directories..."
mkdir -p dept_incoming # FLAG 1: -p (no error if exists)
mkdir -p dept_backup dept_archive # FLAG 1 (continued): -p

# --- 3. Create a temp directory (will be deleted later) ---
mkdir -p dept_temp # will be rm -rf'd later

# --- 4. Create sample incoming files ---
echo "Creating sample department files..."
touch dept_incoming/finance_report.txt
touch dept_incoming/hr_roster.txt
touch dept_incoming/it_inventory.txt

# --- 5. Write placeholder content into files ---
echo "Q1 Finance Data - pending review" > dept_incoming/finance_report.txt
echo "HR Roster - active employees" > dept_incoming/hr_roster.txt
echo "IT Inventory - hardware assets" > dept_incoming/it_inventory.txt

# --- 6. Create a temp file inside temp dir ---
touch dept_temp/temp_check.txt
echo "Temporary file - will be deleted with its directory" > dept_temp/temp_check.txt

# --- 7. List incoming files in long/human-readable format before processing ---
echo ""
echo "--- Incoming files (detailed view) ---"
ls -lh dept_incoming # FLAG 2: -lh (long + human-readable sizes)

# --- 8. Backup files individually (verbose so we can see each copy) ---
echo ""
echo "Backing up files to dept_backup..."
cp -v dept_incoming/finance_report.txt dept_backup/ # FLAG 3: -v (verbose copy)
cp -v dept_incoming/hr_roster.txt dept_backup/ # FLAG 3 (continued)
cp -v dept_incoming/it_inventory.txt dept_backup/ # FLAG 3 (continued)

# --- 9. Recursive copy of entire backup dir into archive as a snapshot ---
echo ""
echo "Creating full recursive snapshot in dept_archive..."
cp -r dept_backup dept_archive/snapshot # FLAG 4: -r (recursive copy)

# --- 10. Move (verbose) finance file from incoming to archive ---
echo ""
echo "Moving finance_report.txt to dept_archive..."
mv -v dept_incoming/finance_report.txt dept_archive/ # FLAG 5: -v (verbose move)

# --- 11. Remove temp directory and all its contents ---
echo ""
echo "Removing temporary directory..."
rm -rf dept_temp # FLAG 6: -rf (force recursive delete)

# --- 12. List backup directory (one item per line, clean for report) ---
echo ""
echo "--- dept_backup contents ---"
ls -1 dept_backup # FLAG 7: -1 (one file per line)

# --- 13. List archive directory with full details including hidden files ---
echo ""
echo "--- dept_archive contents (full detail) ---"
ls -al dept_archive # FLAG 8 & 9: -a (all) + -l (long format)

# --- 14. Generate the report ---
REPORT="report.txt"
echo ""
echo "Generating report..."

{
  echo "================================================"
  echo " DEPARTMENT FILE UTILITY - REPORT"
  echo " Generated: $(date)"
  echo "================================================"
  echo ""
  echo "Working Directory:"
  pwd
  echo ""
  echo "Directories Created:"
  echo " - dept_incoming"
  echo " - dept_backup"
  echo " - dept_archive"
  echo ""
  echo "Sample Files Created:"
  echo " - finance_report.txt"
  echo " - hr_roster.txt"
  echo " - it_inventory.txt"
  echo ""
  echo "Files Backed Up (dept_backup):"
  ls -1 dept_backup # FLAG 7 (reuse): clean list in report
  echo ""
  echo "Recursive Snapshot Created:"
  ls -1 dept_archive/snapshot # FLAG 7 (reuse)
  echo ""
  echo "File Moved to dept_archive:"
  echo " - finance_report.txt"
  echo ""
  echo "Removed: dept_temp/ (and all contents)"
  echo "================================================"
} > "$REPORT"

# --- 15. Display the final report ---
echo ""
echo "====== FINAL REPORT ======"
cat "$REPORT"

echo ""
echo "Script complete."