import os
import subprocess

# Configuration
BATCH_SIZE = 100  # Adjust batch size based on performance
COMMIT_MESSAGE = "Automated batch commit of metadata changes"
BRANCH_NAME = "main"

def get_modified_files():
    """Get the list of modified and untracked files."""
    result = subprocess.run(["git", "status", "--porcelain"], capture_output=True, text=True)
    files = [line.strip().split()[-1] for line in result.stdout.split("\n") if line]
    return files

def stage_commit_push(files):
    """Stage, commit, and push files in batches."""
    for i in range(0, len(files), BATCH_SIZE):
        batch = files[i:i + BATCH_SIZE]
        print(f"Processing batch {i//BATCH_SIZE + 1} with {len(batch)} files...")

        # Stage files
        subprocess.run(["git", "add"] + batch)

        # Commit changes
        commit_msg = f"{COMMIT_MESSAGE} - Batch {i//BATCH_SIZE + 1}"
        subprocess.run(["git", "commit", "-m", commit_msg])

        # Push to GitHub
        subprocess.run(["git", "push", "origin", BRANCH_NAME])

def main():
    modified_files = get_modified_files()
    if not modified_files:
        print("No changes detected.")
        return
    
    print(f"Total files to process: {len(modified_files)}")
    stage_commit_push(modified_files)
    print("Batch push completed successfully!")

if __name__ == "__main__":
    main()
