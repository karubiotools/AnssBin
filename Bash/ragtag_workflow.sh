#!/bin/bash

# Exit on error
set -e

# Check usage
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <reference_fasta> <query_fasta>"
    exit 1
fi

REFERENCE=$1
QUERY=$2

# Output directories
CORRECT_OUT="ragtag_output_correct"
SCAFFOLD_OUT="ragtag_output_scaffold"
PATCH_OUT="ragtag_output_patch"

echo "Running correction..."
ragtag.py correct "$REFERENCE" "$QUERY" -o "$CORRECT_OUT"

echo "Running scaffolding..."
ragtag.py scaffold "$REFERENCE" "$CORRECT_OUT/ragtag.correct.fasta" -o "$SCAFFOLD_OUT"

echo "Running patching..."
ragtag.py patch "$REFERENCE" "$SCAFFOLD_OUT/ragtag.scaffold.fasta" -o "$PATCH_OUT"

echo "RagTag workflow completed successfully."
