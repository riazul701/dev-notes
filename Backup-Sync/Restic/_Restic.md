# Restic

## Website

* [Restic Website](https://restic.net/)
* [Restic GitHub](https://github.com/restic/restic)
* [Restic Browser](https://github.com/emuell/restic-browser)
* [Backrest => Web UI and orchestrator for restic backup](https://github.com/garethgeorge/backrest)
* [restic-automatic-backup-scheduler GitHub](https://github.com/erikw/restic-automatic-backup-scheduler)

## Tutorials

* [Rclone serve Restic](https://rclone.org/commands/rclone_serve_restic/)

## Note
* To make Git Bash interactive, enable "Experimental pseudo" during git installation.
* [If previous step does not work] Git Bash is non-interactive terminal. If Git Bash is used for restic backup then upload progress is not shown. To see upload progress use Windows-Powershell terminal.
* For Google-Drive "root_folder_id" is the last part of URL.
* For Microsoft-OneDrive "root_folder_id" is this value of "id=" parameter.

## Problem and Solution
* If `restic init --repo /d/test/restic-repo/test-repo-1` command does not work then use following commands:
  * Set local repository location: `export RESTIC_REPOSITORY=/d/test/restic-repo/test-repo-1`
  * Set password: `export RESTIC_PASSWORD=yourpassword`
  * Initialize: `restic init`
* 

## Setup

### General
* Restic Browser Settings for Rclone
  * Click on "Open Repository". Here are settings:
  * Type: REST Server
  * URL: rest:http://localhost:8080/
  * Repository Password: yourpassword

### Windows-OS
* Download "restic" from "https://github.com/restic/restic/releases" and unzip it to "C:\restic"
* This PC (right click) -> Properties -> Advanced system settings -> Environment Variables -> User variable for <user_name> -> Path -> Edit -> Append text ";C:\restic" [On Windows 10 click on "New" button. In "New user variable" dialog, set "Variable name: Path" and "Variable value: C:\restic"]
* Open Terminal and enter command "restic" to check it is installed.

### Linux-OS
* On Ubuntu/Debian
  * First install restic: `sudo apt install restic` [This will install old version of restic like "12.0"]
  * Then update restic: `sudo restic self-update` [This will install restic version "15.0"]

## Specific Workflow
* Folder and File Tree for "Restic with Rclone (Both Single and Multiple Repository)"
* d (Drive Letter)
  * test (Folder)
    * restic (Folder)
	  * test-restic-1 (Folder)
	  * test-restic-2 (Folder)
	  * test-restic-3 (Folder)
	  * test-restic-4 (Folder)
	  * exclude-test-restic-1.txt (File)
	* restic-repo (Folder)
	  * test-repo-1 (Folder)

* Restice with Rclone (Single Repository)
  * Rclone serve format: `rclone serve restic -v remote:backup` [Keep this process running in a separate terminal]
  * Rclone serve format: `rclone serve restic -v testrc:/d/test/restic/test-restic-1`
  * `export RESTIC_REPOSITORY=rest:http://localhost:8080/`
  * `export RESTIC_PASSWORD=yourpassword`
  * Initialize repository: `restic init`
  * Restic backup format: `restic backup /path/to/files/to/backup`
  * Restic backup command: `restic backup /d/test/restic/test-restic-1` [Files are saved in Google-Drive-Root-Folder{/d/test/restic/test-restic-1} folder] **[Here {/d/test/restic/test-restic-1} path is added for file backup, because it is used during `rclone serve restic -v testrc:/d/test/restic/test-restic-1`]**  [Google-Drive-Root-Folder is set during `rclone config`. It is the last part of Google Drive URL]
  * Show snapshots: `restic -r rest:http://localhost:8080/ snapshots`
  
* Restic with Rclone (Multiple Repository)
  * `rclone serve restic -v remote:backup` [Keep this process running in a separate terminal]
  * `rclone serve restic -v testrc:/d/test/restic`
	```bash
	$ export RESTIC_REPOSITORY=rest:http://localhost:8080/test-restic-1/
	# backup test-restic-1 stuff
	$ export RESTIC_REPOSITORY=rest:http://localhost:8080/test-restic-2/
	# backup test-restic-2 stuff
	```
  * `export RESTIC_PASSWORD=yourpassword`	
  * Initialize repository: `restic init`
  * Restic backup format: `restic backup /path/to/files/to/backup`
  * Restic backup command: `restic backup /d/test/restic/test-restic-1` [Files are saved in Google-Drive-Root-Folder/d/test/restic/test-restic-1 folder] **[Here {/d/test/restic/test-restic-1} path is added for file backup, it is used during `rclone serve restic -v testrc:/d/test/restic`]** [Google-Drive-Root-Folder is set during `rclone config`. It is the last part of Google Drive URL]
  * Show snapshots: `restic -r rest:http://localhost:8080/test-restic-1/ snapshots`  

* Restic with Local Repository
  * Initialize Repository:
    * Set local repository location: `export RESTIC_REPOSITORY=/d/test/restic-repo/test-repo-1`
    * Set password: `export RESTIC_PASSWORD=yourpassword`
    * Initialize: `restic init`
  * Backup:
    * Check files to backup from current directory: `restic backup --dry-run .`
	* Check backup files with exclude: `restic backup --dry-run . --exclude-file=/d/test/restic/exclude-test-restic-1.txt`
	* Create backup: `restic backup . --exclude-file=/d/test/restic/exclude-test-restic-1.txt`
	* Create backup with tag: `restic backup . --exclude-file=/d/test/restic/exclude-test-restic-1.txt --tag "git-commit:<git_commit_id>" --tag "<other_tag_name>"`
	* Content of "/d/test/restic/exclude-test-restic-1.txt"
	```
	  *
      !upload
	```
  * Snapshot:
    * Snapshot list: `restic snapshots`
	* Remove snapshot: `restic forget <snapshot_id>` [Get "<snapshot_id>" from command `restic snapshots`]
  * Restore:
    * Restore to current directory: `restic restore <snapshot_id> --target .` [Get "<snapshot_id>" from command `restic snapshots`]

* Working with Repos 
  * Filter the listing by directory path: `restic -r /srv/restic-repo snapshots --path="/srv"`
  * Filter the listing by host: `restic -r /srv/restic-repo snapshots --host luigi`
  * Group the output by the same filters (host, paths, tags): `restic -r /srv/restic-repo snapshots --group-by host`
  * Copying snapshots between repositories: `restic -r /srv/restic-repo-copy copy --from-repo /srv/restic-repo`
  * Verify the structure of the repository: `restic -r /srv/restic-repo check`
  * Verify the integrity of the pack files in the repository: `restic -r /srv/restic-repo check --read-data`
  * Upgrading the repository format version: `migrate upgrade_repo_v2`
  
* Restic with Git
  * Create file "restic-git", without any file extension. During file save, choose "Save as type: All Files"
  * Move "restic-git" script to "C:\Program Files\Git\usr\bin" folder. If git is installed using Scoop then this path is "C:\ProgramData\scoop\apps\git\2.39.0.windows.2\usr\bin"
  * Restart Git Bash

# Commands

# Command Reference
* backup
  * Check which files are going to backup: `restic backup --dry-run /d/test/restic/test-restic-1`
  * 
