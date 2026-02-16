# MariaDB SMB Docker Error / Container Exit 1

docker mariadb error/exit 1 reason, InnoDB: Plugin initialization aborted with error I/O error

Oof, yeah — that **MariaDB + Docker + “InnoDB: Plugin initialization aborted with error I/O error”** combo is almost always a **storage / filesystem problem**, not a MariaDB config typo. Let’s break it down calmly and get you back up.

***


## **What that error actually means**

MariaDB tried to initialize **InnoDB**, but the **filesystem returned an I/O error**. In Docker setups, this usually points to:

- ❌ MariaDB **cannot write** to its data directory

- ❌ Corrupted InnoDB files

- ❌ Bad volume / mount / permission mismatch

- ❌ Filesystem or disk issue (host or VM)

That’s why the container exits with **code 1**.

***


## **The top causes (in order of likelihood)**

### **1️⃣ Wrong permissions on the data volume (MOST COMMON)**

MariaDB runs as user `mysql` (UID usually **999** inside the container).

If your mounted volume is owned by `root` or another UID → InnoDB dies.


#### **Check:**

    docker logs mariadb_container

Look for:

    Permission denied
    Operating system error number 13


#### **Fix:**

On the **host**:

    sudo chown -R 999:999 /path/to/mariadb-data

Or temporarily test:

    sudo chmod -R 777 /path/to/mariadb-data

(only to confirm — don’t leave it like that)

***


### **2️⃣ Filesystem doesn’t support InnoDB features**

InnoDB **requires**:

- file locking

- fsync

- proper POSIX semantics

🚨 Problem filesystems:

- VirtualBox shared folders (`vboxsf`)

- CIFS / SMB mounts

- NFS (without correct options)

- FAT / exFAT

If your volume is on:

    /media/smb
    /mnt/cifs
    /VirtualBox Shared Folders

👉 **That’s your bug.**

✅ Fix:

- Move MariaDB data to a **local ext4/xfs disk**

- Or use a **Docker named volume**

<!---->

    docker volume create mariadb_data

Then in `docker-compose.yml`:

    volumes:
      - mariadb_data:/var/lib/mysql

***


### **3️⃣ Corrupted InnoDB files**

If the container crashed or disk filled up, InnoDB may be toast.

Files to watch:

    ibdata1
    ib_logfile0
    ib_logfile1


#### **Quick test (non-production):**

    mv ibdata1 ibdata1.bak
    mv ib_logfile* /tmp/

⚠️ This **will lose InnoDB data** — do NOT do this unless you’re OK with data loss.

***


### **4️⃣ Disk full or read-only**

Check on the host:

    df -h

And inside container:

    docker exec -it mariadb_container df -h

If filesystem is mounted **ro**, MariaDB will fail instantly.

***


### **5️⃣ SELinux (on Fedora / RHEL / CentOS)**

SELinux can block writes silently.

Quick test:

    getenforce

If `Enforcing`, try:

    sudo chcon -Rt svirt_sandbox_file_t /path/to/mariadb-data

Or use:

    - /path/to/mariadb-data:/var/lib/mysql:Z

***


## **Fastest way to confirm the root cause**

Answer these (copy/paste is fine):

1. Are you mounting MariaDB data on **SMB / CIFS / VirtualBox shared folder**?

2. Is this **docker-compose** or `docker run`?

3. Host OS? (Linux / Windows / WSL / VM)

4. Exact log lines **above** the I/O error

***


## **TL;DR (most likely fix)**

❌ MariaDB data directory is on SMB / vboxsf / network FS\
&#x20;✅ Move it to a **local Docker volume or ext4 disk**

If you want, paste your `docker-compose.yml` and I’ll mark _exactly_ what to change.

\=================================================================

MariaDB data directory is on SMB

Yep — that’s **100% the root cause**.\
&#x20;MariaDB **cannot run InnoDB on SMB/CIFS** reliably. When it does, you get exactly what you’re seeing:

`InnoDB: Plugin initialization aborted with error I/O error
` container exits with **code 1**

This isn’t a misconfig — it’s a **hard limitation**.

***


## **Why MariaDB + SMB breaks (short & honest)**

InnoDB requires:

- POSIX file locking

- reliable `fsync

  `

- atomic rename semantics

**SMB/CIFS does not guarantee these**, especially through:

- Linux CIFS mounts

- Windows ↔ Linux ↔ Docker

- VirtualBox / VM layers

Result: InnoDB refuses to start (correctly).

👉 No tuning flags can make this safe.

***


## **What WILL work (pick one)**

### **✅ Option 1 — Docker named volume (BEST)**

Keeps data on a local Linux filesystem.

    docker volume create mariadb_data

**docker-compose.yml**

    services:
      mariadb:
        image: mariadb:10.11
        volumes:
          - mariadb_data:/var/lib/mysql

    volumes:
      mariadb_data:

✔ stable\
&#x20;✔ fast\
&#x20;✔ zero SMB weirdness

***


### **✅ Option 2 — Local host directory (ext4/xfs)**

If you need to see files on the host:

    volumes:
      - /var/lib/mariadb:/var/lib/mysql

Make sure:

    sudo chown -R 999:999 /var/lib/mariadb

***


### **⚠️ Option 3 — SMB for BACKUPS ONLY**

This is the **correct** way to use SMB.

Example:

    mysqldump -u root -p mydb > /mnt/smb/mydb.sql

Or automated backups to SMB.

***


## **❌ What NOT to do (even if it “seems to work”)**

- `innodb_flush_method=nosync

  `

- `skip-innodb

  `

- `innodb_force_recovery

  `

- Running MariaDB on `vboxsf`, `cifs`, or NAS SMB mounts

These lead to **silent corruption**.

***


## **If you’re on Windows / VirtualBox / WSL**

Best practice:

    MariaDB data → Docker volume (Linux filesystem)
    Backups → SMB share

***


## **Bottom line**

**SMB is not a database filesystem.** MariaDB is protecting your data by refusing to start.

If you want, paste your current `docker-compose.yml` and I’ll rewrite it cleanly (data + backups split correctly).

\==================================================================

use watch and mysqldump command on linux guest VM where docker mariadb/mysql is running and get backup into windows host via SMB. Explain pros and cons.

Got it — you want to **continuously take backups from a Docker MariaDB/MySQL running on a Linux VM** and push them to a **Windows host via SMB**, using `watch` + `mysqldump`. Let’s break it down **step by step**, then discuss **pros and cons**.

***


## **1️⃣ How it works**

You can use `watch` to run `mysqldump` at intervals:

    watch -n 3600 '/usr/bin/docker exec mariadb_container \
      mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases \
      --single-transaction --routines --events \
      > /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql'


### **Explanation:**

- `watch -n 3600` → runs every 3600 seconds (1 hour)

- `docker exec mariadb_container mysqldump …` → executes `mysqldump` inside container

- `--single-transaction` → ensures consistent snapshot without locking (works if using InnoDB)

- `--all-databases` → backs up all databases

- `> /mnt/smb/...` → writes backup directly to SMB-mounted Windows folder

- `$(date +%F_%H%M%S)` → timestamp to avoid overwriting previous backups

***


## **2️⃣ Setting up SMB mount on Linux VM**

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

- `//WINDOWS_HOST/BackupFolder` → SMB share on Windows

- `/mnt/smb` → local mount point

- `vers=3.0` → SMB version

- `iocharset=utf8` → character encoding

Now your `mysqldump` output will land on Windows safely.

***


## **3️⃣ Pros of this method**

|                           |                                                                        |
| :-----------------------: | :--------------------------------------------------------------------: |
|          **Pros**         |                             **Explanation**                            |
| ✅ Safe for live databases |       `mysqldump --single-transaction` ensures InnoDB consistency      |
|      ✅ Human-readable     |        Backups are SQL files you can inspect or restore anywhere       |
|         ✅ Portable        |       Can restore to any MariaDB/MySQL instance, even on Windows       |
|     ✅ Easy automation     |               `watch` or cron can schedule regular dumps               |
|      ✅ Works over SMB     | Windows sees the backup as a normal file; no special DB tooling needed |

***


## **4️⃣ Cons / Limitations**

|                                        |                                                                                                               |
| :------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|                **Cons**                |                                                **Explanation**                                                |
|      ❌ Not continuous in real-time     |             `watch` only runs at intervals; changes between dumps are not captured until next run             |
|      ❌ Large databases can be slow     |                    Dumping big databases (10GB+) every hour can be heavy and spike CPU/I/O                    |
|           ❌ Disk space usage           |                           Each dump is a full copy; SMB storage may fill up quickly                           |
|          ❌ Network dependency          |                        SMB latency or disconnects may fail backup; you need retry logic                       |
|      ❌ Not point-in-time recovery      |                             You only restore from last dump, not exact transaction                            |
| ❌ Risk of partial backup if dump fails | If SMB write fails mid-dump, the file may be incomplete — consider writing first locally, then copying to SMB |

***


## **5️⃣ Recommended improvements**

1. **Local temp dump first**

<!---->

    docker exec mariadb_container mysqldump ... > /tmp/dump.sql
    mv /tmp/dump.sql /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql

- Ensures partial writes don’t corrupt SMB file

2. **Use** `gzip` **to save space**

<!---->

    mysqldump ... | gzip > /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql.gz

3. **Switch to cron instead of watch**

- Cron is safer for long-term scheduling, logging, retries

4. **Optional rotation**

- Keep last N backups only to save space:

<!---->

    find /mnt/smb/ -name "*.sql.gz" -type f -mtime +7 -delete

***


### **✅ TL;DR**

- **Safe:** This method is **safe for live Docker MariaDB**, because you never copy raw data files.

- **Human-readable:** SQL dumps can be restored anywhere.

- **Flexible:** Works with Windows via SMB.

**Downside:** Not real-time, uses more disk/CPU, requires rotation and error handling.

***

If you want, I can write a **ready-to-use** `watch`**/cron script** that:

1. Dumps the database from Docker

2. Compresses it

3. Copies safely to Windows SMB

4. Keeps only last N backups automatically

It would be fully automated for production use.

Do you want me to do that?

\========================================================================

Do it and also show how to restore from windows host to linux guest docker database via SMB.

Perfect! Let’s create a **complete automated backup + restore workflow** for Docker MariaDB/MySQL running in a Linux VM, with backups stored on a **Windows SMB share**.

This will be **safe, repeatable, and avoids raw file corruption**.

***


## **Part 1: Automatic Backup from Docker MariaDB to Windows SMB**

### **1️⃣ Mount the Windows SMB share in Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

- Replace `WINDOWS_HOST` and `BackupFolder` with your Windows hostname/IP and share

- `vers=3.0` ensures modern SMB compatibility

- Check `mount` is successful: `df -h | grep smb_backups

  `

***


### **2️⃣ Create backup script**

Create a script `/usr/local/bin/mariadb_smb_backup.sh`:

    #!/bin/bash

    # Docker container name
    CONTAINER_NAME=mariadb_container

    # Windows SMB mount point
    BACKUP_DIR=/mnt/smb_backups

    # Create timestamp
    TIMESTAMP=$(date +%F_%H%M%S)

    # Temp file (local first to avoid partial writes on SMB)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Dump all databases safely
    docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
      --all-databases \
      --single-transaction \
      --routines \
      --events \
      2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE

    # Move compressed dump to SMB share
    mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz

    # Optional: keep only last 7 backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +7 -delete

    echo "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_smb_backup.sh

***


### **3️⃣ Schedule automatic backups**

Use **cron** instead of `watch` for production reliability.

    crontab -e

Example: every hour

    0 * * * * /usr/local/bin/mariadb_smb_backup.sh

✅ Now your backups will appear on Windows every hour as compressed SQL files.

***


## **Part 2: Restore backup from Windows SMB to Docker MariaDB**

### **1️⃣ Make sure SMB share is mounted in Linux VM**

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

***


### **2️⃣ Restore command**

Assuming the backup you want is `/mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz`:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

Explanation:

- `gzip -dc` → decompress on the fly

- `docker exec -i` → pipe the SQL directly into the running container

- Safe, no filesystem corruption

- All databases, routines, triggers, and events are restored

***


### **3️⃣ Optional: Restore a single database**

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD" your_database_name

- Only restores `your_database_name

  `

- Works if dump contains multiple DBs; extra DBs will be ignored

***


## **✅ Pros of this method**

- Fully **safe for running Docker MariaDB**

- **Backups stored on Windows SMB** are usable

- **Compresses backups** to save space

- **Automated rotation** keeps last N backups

- **Restoration works safely** back into Linux VM Docker container

***


## **⚠️ Cons / Limitations**

- Not real-time replication — backups are interval-based

- Large databases can take CPU and I/O during dump

- SMB latency may slow down backup copy

- Must handle credentials securely (`MYSQL_ROOT_PASSWORD` should be in a safe env variable or Docker secret)

***


## **TL;DR workflow**

    Docker MariaDB (Linux VM) --> mysqldump --> gzip --> /mnt/smb_backups
    Windows SMB sees backup.sql.gz files
    Restore: gzip -dc backup.sql.gz | docker exec -i mariadb_container mysql

- **Safe**, no raw data file corruption

- **Portable**, readable SQL backups

- **Automated**, with cron

***

If you want, I can also write a **fully ready** `docker-compose.yml` **+ backup script combo** that you can drop in and run immediately — it will handle SMB mount, backup, rotation, and restore automatically.

Do you want me to do that?

\======================================================================

docker run database backup script when docker container stops to backup from linux guest VM to windows host via SMB.

Ah! Now you want **automatic backup triggered when the Docker MariaDB container stops**, instead of using `watch` or cron. Perfect — this is safer than copying raw files and avoids downtime. Let me show a full setup for Linux VM → Windows SMB backup on container stop.

***


## **1️⃣ Overview**

We’ll use **Docker container stop hooks**:

- **Docker event listening** via `docker events

  `

- When `mariadb_container` stops, run a **backup script** from the Linux VM

- Script will `mysqldump` the database and copy it to **Windows SMB share**

Flow:

    MariaDB Container stops
            ↓
    Linux VM executes backup script
            ↓
    Backup saved as SQL.gz on Windows SMB

✅ No raw file copying\
&#x20;✅ Safe for InnoDB\
&#x20;✅ Can keep rotated backups

***


## **2️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional for automatic mount in `/etc/fstab`:

    # Windows SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


## **3️⃣ Backup script (**`/usr/local/bin/mariadb_smb_backup_on_stop.sh`**)**

    #!/bin/bash

    # Configuration
    CONTAINER_NAME=mariadb_container
    BACKUP_DIR=/mnt/smb_backups
    KEEP_DAYS=7

    # Timestamp
    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Check if container exists (optional)
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        echo "Container $CONTAINER_NAME not found"
        exit 1
    fi

    # Backup databases safely
    echo "Backing up $CONTAINER_NAME before shutdown..."
    docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE

    # Move to SMB share
    mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz

    # Rotate old backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete

    echo "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_smb_backup_on_stop.sh

***


## **4️⃣ Listen for Docker container stop events**

Create a small service script `/usr/local/bin/docker_mariadb_event_listener.sh`:

    #!/bin/bash

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_smb_backup_on_stop.sh

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" | while read event
    do
        echo "Detected stop event for $CONTAINER_NAME"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


## **5️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- Now, whenever the container stops (`docker stop mariadb_container`), the **backup runs automatically**

- Output goes to `/mnt/smb_backups` on Windows

***


## **6️⃣ Restore from Windows SMB**

Assuming the backup is:

    /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz

Run:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

- Works for full restore

- Can restore individual databases if needed:

<!---->

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD" your_database_name

***


## **✅ Pros of this approach**

- Backup is **triggered only on stop**, no constant polling or watch loops

- Safe: never touches raw InnoDB files

- Backups stored on Windows SMB, **portable and readable**

- Automatic rotation keeps last N backups

- Works for **both planned stops and container crashes** (if you handle Docker events for `die` as well)

***


## **⚠️ Considerations**

- If the container is killed forcefully (`docker kill`) instead of `docker stop`, the event may be missed — can add `die` event filter

- Backup still requires sufficient disk space during temporary dump

- SMB latency may slow down backup write, ensure network stability

- Large databases can take several seconds or minutes to dump

***

✅ **Summary workflow**

    [Docker MariaDB] stops → Docker event triggers → Linux VM backup script → SMB → Windows backup folder
    Restore: gzip -dc backup.sql.gz | docker exec -i mariadb_container mysql

***

I can also **enhance this to capture** `docker kill` **events**, compress backups in place, and log errors automatically, so it becomes a fully production-ready backup-on-stop system.

Do you want me to do that?

\====================================================================

do it

Perfect! Let’s create a **fully production-ready “backup-on-stop” system** for Docker MariaDB/MySQL running in a Linux VM with backups going to a **Windows SMB share**. This will:

- Trigger backups on **stop or crash (**`die`**) events**

- Compress SQL dumps safely

- Rotate old backups

- Log successes/failures

***


## **1️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional for auto-mount on boot in `/etc/fstab`:

    # Windows SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


## **2️⃣ Backup script (**`/usr/local/bin/mariadb_backup_on_stop.sh`**)**

    #!/bin/bash
    # ====================================================
    # Backup Docker MariaDB to SMB when container stops
    # ====================================================

    # Configuration
    CONTAINER_NAME=mariadb_container
    BACKUP_DIR=/mnt/smb_backups
    KEEP_DAYS=7
    LOG_FILE=/var/log/mariadb_backup.log

    # Timestamp
    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Logging helper
    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    # Check container exists
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        log "Container $CONTAINER_NAME not found. Skipping backup."
        exit 1
    fi

    log "Starting backup of $CONTAINER_NAME..."

    # Perform mysqldump inside container
    if docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE; then
        mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz
        log "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"
    else
        log "Backup failed! Check /tmp/mariadb_backup_$TIMESTAMP.log for details."
        rm -f $TEMP_FILE
        exit 1
    fi

    # Rotate old backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete
    log "Old backups older than $KEEP_DAYS days deleted."

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_backup_on_stop.sh

***


## **3️⃣ Event listener script (**`/usr/local/bin/docker_mariadb_event_listener.sh`**)**

    #!/bin/bash
    # ====================================================
    # Listen for stop/die events for MariaDB container
    # ====================================================

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_backup_on_stop.sh
    LOG_FILE=/var/log/mariadb_backup_listener.log

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    log "Starting Docker event listener for $CONTAINER_NAME..."

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" --filter "event=die" | \
    while read event
    do
        log "Detected container stop/die event: $event"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


## **4️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- This will run continuously in the background

- Automatically triggers backup on **normal stop** (`docker stop`) or **crash** (`docker die`)

You can also make it a **systemd service** for persistence across VM reboots.

***


## **5️⃣ Restore backups from Windows SMB**

Assuming the backup file is:

    /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz

Restore to running Docker container:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

- Full restore of all databases

- Can restore individual databases by appending the database name after `mysql -u root ...

  `

***


## **✅ Advantages of this setup**

- Backup **only runs on stop or crash** → efficient, no constant polling

- Safe: no raw file copying → prevents InnoDB corruption

- Stored on **Windows SMB**, compressed SQL → portable and readable

- Automatic **rotation of old backups**

- Logs for monitoring success/failure

- Handles both **planned and unplanned shutdowns**

***


## **⚠️ Considerations**

- SMB write speed can affect backup time for large DBs

- Container killed with `docker kill` generates `die` event, so it’s captured

- Ensure `MYSQL_ROOT_PASSWORD` is stored safely (environment variable or Docker secrets)

- Test restore regularly to verify backups

***

If you want, I can also **provide a ready-to-use systemd unit** that keeps this listener running as a **service**, so it auto-starts on VM boot and you never have to run it manually.

Do you want me to do that next?

\====================================================================

alongside of previous sync / make full copy of raw mariadb data to windows host from linux guest VM via SMB when docker database container stops normally or crashes.

Perfect! Let’s combine everything into a **single production-ready setup** that does **both**:

1. **Logical backup via** `mysqldump` (safe, readable SQL)

2. **Cold/raw snapshot of MariaDB data directory** (exact files)

And it will **trigger automatically** when the Docker MariaDB container **stops or crashes** (`stop` or `die`).

We’ll also handle **Windows SMB** and **rotation**, and log everything.

***


# **1️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups/sql_backups
    sudo mkdir -p /mnt/smb_backups/raw_data_snapshots

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional `/etc/fstab` for auto-mount:

    # SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


# **2️⃣ Combined backup script**

Create `/usr/local/bin/mariadb_full_backup_on_stop.sh`:

    #!/bin/bash
    # ====================================================
    # Triggered backup of Docker MariaDB on stop or crash
    # ====================================================

    CONTAINER_NAME=mariadb_container
    SQL_BACKUP_DIR=/mnt/smb_backups/sql_backups
    RAW_BACKUP_DIR=/mnt/smb_backups/raw_data_snapshots
    KEEP_DAYS=7
    LOG_FILE=/var/log/mariadb_full_backup.log

    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_SQL=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    # Check container exists
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        log "Container $CONTAINER_NAME not found. Exiting."
        exit 1
    fi

    log "Starting full backup for container $CONTAINER_NAME..."

    # ---------------------------
    # 1️⃣ Logical mysqldump backup
    # ---------------------------
    log "Starting mysqldump backup..."
    if docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_SQL; then
        mv $TEMP_SQL $SQL_BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz
        log "mysqldump backup completed: $SQL_BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"
    else
        log "mysqldump backup FAILED! Check /tmp/mariadb_backup_$TIMESTAMP.log"
    fi

    # ---------------------------
    # 2️⃣ Cold/raw data snapshot
    # ---------------------------
    log "Starting raw data snapshot..."
    docker stop $CONTAINER_NAME

    SNAPSHOT_DIR="$RAW_BACKUP_DIR/mariadb_$TIMESTAMP"
    mkdir -p "$SNAPSHOT_DIR"

    docker run --rm -v mariadb_data:/data -v "$RAW_BACKUP_DIR":/backup busybox \
        sh -c "cp -a /data /backup/mariadb_$TIMESTAMP/"

    docker start $CONTAINER_NAME
    log "Raw snapshot completed: $SNAPSHOT_DIR"

    # ---------------------------
    # 3️⃣ Rotate old backups
    # ---------------------------
    log "Rotating old SQL backups older than $KEEP_DAYS days..."
    find $SQL_BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete

    log "Rotating old raw snapshots older than $KEEP_DAYS days..."
    find $RAW_BACKUP_DIR -name "mariadb_*" -type d -mtime +$KEEP_DAYS -exec rm -rf {} +

    log "Backup process finished."

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_full_backup_on_stop.sh

***


# **3️⃣ Docker event listener**

Create `/usr/local/bin/docker_mariadb_event_listener.sh`:

    #!/bin/bash
    # ====================================================
    # Listen for stop/die events for MariaDB container
    # ====================================================

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_full_backup_on_stop.sh
    LOG_FILE=/var/log/mariadb_backup_listener.log

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    log "Starting Docker event listener for $CONTAINER_NAME..."

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" --filter "event=die" | \
    while read event
    do
        log "Detected container stop/die event: $event"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


# **4️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- This continuously listens for **stop or crash events**

- Automatically triggers both **mysqldump** and **raw snapshot** backups

***


# **5️⃣ Restore Instructions**

### **A. Restore SQL dump**

    gzip -dc /mnt/smb_backups/sql_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"


### **B. Restore raw snapshot**

    docker stop mariadb_container

    docker run --rm -v mariadb_data:/data \
        -v /mnt/smb_backups/raw_data_snapshots/mariadb_2026-02-05_120500:/backup busybox \
        sh -c "cp -a /backup/* /data/"

    docker start mariadb_container

***


# **6️⃣ Advantages**

✅ Automatic on stop or crash (`stop` + `die`)\
&#x20;✅ Safe mysqldump backup (logical)\
&#x20;✅ Cold/raw snapshot backup (exact Docker volume)\
&#x20;✅ Windows SMB storage\
&#x20;✅ Backup rotation for both SQL and raw snapshots\
&#x20;✅ Logging for monitoring

***


# **7️⃣ Notes / Caveats**

- **Do not copy raw data while DB is running**, only safe after stop or via snapshot

- Large databases may take a few minutes for backup or raw snapshot

- SMB latency may affect copy speed

- Always test restores regularly

***

This gives you a **full production-ready system** that automatically keeps:

1. **SQL dumps** (portable, readable, safe)

2. **Raw data snapshots** (exact state, fast restore)

All automatically pushed to **Windows SMB**, triggered **only when the container stops or crashes**.

***

I can also **write a ready-made systemd service unit** to run the event listener on VM boot, so it always monitors MariaDB and never needs manual start.

Do you want me to do that next?

\



# MariaDB SMB Docker Error / Container Exit 1

docker mariadb error/exit 1 reason, InnoDB: Plugin initialization aborted with error I/O error

Oof, yeah — that **MariaDB + Docker + “InnoDB: Plugin initialization aborted with error I/O error”** combo is almost always a **storage / filesystem problem**, not a MariaDB config typo. Let’s break it down calmly and get you back up.

***


## **What that error actually means**

MariaDB tried to initialize **InnoDB**, but the **filesystem returned an I/O error**. In Docker setups, this usually points to:

- ❌ MariaDB **cannot write** to its data directory

- ❌ Corrupted InnoDB files

- ❌ Bad volume / mount / permission mismatch

- ❌ Filesystem or disk issue (host or VM)

That’s why the container exits with **code 1**.

***


## **The top causes (in order of likelihood)**

### **1️⃣ Wrong permissions on the data volume (MOST COMMON)**

MariaDB runs as user `mysql` (UID usually **999** inside the container).

If your mounted volume is owned by `root` or another UID → InnoDB dies.


#### **Check:**

    docker logs mariadb_container

Look for:

    Permission denied
    Operating system error number 13


#### **Fix:**

On the **host**:

    sudo chown -R 999:999 /path/to/mariadb-data

Or temporarily test:

    sudo chmod -R 777 /path/to/mariadb-data

(only to confirm — don’t leave it like that)

***


### **2️⃣ Filesystem doesn’t support InnoDB features**

InnoDB **requires**:

- file locking

- fsync

- proper POSIX semantics

🚨 Problem filesystems:

- VirtualBox shared folders (`vboxsf`)

- CIFS / SMB mounts

- NFS (without correct options)

- FAT / exFAT

If your volume is on:

    /media/smb
    /mnt/cifs
    /VirtualBox Shared Folders

👉 **That’s your bug.**

✅ Fix:

- Move MariaDB data to a **local ext4/xfs disk**

- Or use a **Docker named volume**

<!---->

    docker volume create mariadb_data

Then in `docker-compose.yml`:

    volumes:
      - mariadb_data:/var/lib/mysql

***


### **3️⃣ Corrupted InnoDB files**

If the container crashed or disk filled up, InnoDB may be toast.

Files to watch:

    ibdata1
    ib_logfile0
    ib_logfile1


#### **Quick test (non-production):**

    mv ibdata1 ibdata1.bak
    mv ib_logfile* /tmp/

⚠️ This **will lose InnoDB data** — do NOT do this unless you’re OK with data loss.

***


### **4️⃣ Disk full or read-only**

Check on the host:

    df -h

And inside container:

    docker exec -it mariadb_container df -h

If filesystem is mounted **ro**, MariaDB will fail instantly.

***


### **5️⃣ SELinux (on Fedora / RHEL / CentOS)**

SELinux can block writes silently.

Quick test:

    getenforce

If `Enforcing`, try:

    sudo chcon -Rt svirt_sandbox_file_t /path/to/mariadb-data

Or use:

    - /path/to/mariadb-data:/var/lib/mysql:Z

***


## **Fastest way to confirm the root cause**

Answer these (copy/paste is fine):

1. Are you mounting MariaDB data on **SMB / CIFS / VirtualBox shared folder**?

2. Is this **docker-compose** or `docker run`?

3. Host OS? (Linux / Windows / WSL / VM)

4. Exact log lines **above** the I/O error

***


## **TL;DR (most likely fix)**

❌ MariaDB data directory is on SMB / vboxsf / network FS\
&#x20;✅ Move it to a **local Docker volume or ext4 disk**

If you want, paste your `docker-compose.yml` and I’ll mark _exactly_ what to change.

\=================================================================

MariaDB data directory is on SMB

Yep — that’s **100% the root cause**.\
&#x20;MariaDB **cannot run InnoDB on SMB/CIFS** reliably. When it does, you get exactly what you’re seeing:

`InnoDB: Plugin initialization aborted with error I/O error
` container exits with **code 1**

This isn’t a misconfig — it’s a **hard limitation**.

***


## **Why MariaDB + SMB breaks (short & honest)**

InnoDB requires:

- POSIX file locking

- reliable `fsync

  `

- atomic rename semantics

**SMB/CIFS does not guarantee these**, especially through:

- Linux CIFS mounts

- Windows ↔ Linux ↔ Docker

- VirtualBox / VM layers

Result: InnoDB refuses to start (correctly).

👉 No tuning flags can make this safe.

***


## **What WILL work (pick one)**

### **✅ Option 1 — Docker named volume (BEST)**

Keeps data on a local Linux filesystem.

    docker volume create mariadb_data

**docker-compose.yml**

    services:
      mariadb:
        image: mariadb:10.11
        volumes:
          - mariadb_data:/var/lib/mysql

    volumes:
      mariadb_data:

✔ stable\
&#x20;✔ fast\
&#x20;✔ zero SMB weirdness

***


### **✅ Option 2 — Local host directory (ext4/xfs)**

If you need to see files on the host:

    volumes:
      - /var/lib/mariadb:/var/lib/mysql

Make sure:

    sudo chown -R 999:999 /var/lib/mariadb

***


### **⚠️ Option 3 — SMB for BACKUPS ONLY**

This is the **correct** way to use SMB.

Example:

    mysqldump -u root -p mydb > /mnt/smb/mydb.sql

Or automated backups to SMB.

***


## **❌ What NOT to do (even if it “seems to work”)**

- `innodb_flush_method=nosync

  `

- `skip-innodb

  `

- `innodb_force_recovery

  `

- Running MariaDB on `vboxsf`, `cifs`, or NAS SMB mounts

These lead to **silent corruption**.

***


## **If you’re on Windows / VirtualBox / WSL**

Best practice:

    MariaDB data → Docker volume (Linux filesystem)
    Backups → SMB share

***


## **Bottom line**

**SMB is not a database filesystem.** MariaDB is protecting your data by refusing to start.

If you want, paste your current `docker-compose.yml` and I’ll rewrite it cleanly (data + backups split correctly).

\==================================================================

use watch and mysqldump command on linux guest VM where docker mariadb/mysql is running and get backup into windows host via SMB. Explain pros and cons.

Got it — you want to **continuously take backups from a Docker MariaDB/MySQL running on a Linux VM** and push them to a **Windows host via SMB**, using `watch` + `mysqldump`. Let’s break it down **step by step**, then discuss **pros and cons**.

***


## **1️⃣ How it works**

You can use `watch` to run `mysqldump` at intervals:

    watch -n 3600 '/usr/bin/docker exec mariadb_container \
      mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --all-databases \
      --single-transaction --routines --events \
      > /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql'


### **Explanation:**

- `watch -n 3600` → runs every 3600 seconds (1 hour)

- `docker exec mariadb_container mysqldump …` → executes `mysqldump` inside container

- `--single-transaction` → ensures consistent snapshot without locking (works if using InnoDB)

- `--all-databases` → backs up all databases

- `> /mnt/smb/...` → writes backup directly to SMB-mounted Windows folder

- `$(date +%F_%H%M%S)` → timestamp to avoid overwriting previous backups

***


## **2️⃣ Setting up SMB mount on Linux VM**

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

- `//WINDOWS_HOST/BackupFolder` → SMB share on Windows

- `/mnt/smb` → local mount point

- `vers=3.0` → SMB version

- `iocharset=utf8` → character encoding

Now your `mysqldump` output will land on Windows safely.

***


## **3️⃣ Pros of this method**

|                           |                                                                        |
| :-----------------------: | :--------------------------------------------------------------------: |
|          **Pros**         |                             **Explanation**                            |
| ✅ Safe for live databases |       `mysqldump --single-transaction` ensures InnoDB consistency      |
|      ✅ Human-readable     |        Backups are SQL files you can inspect or restore anywhere       |
|         ✅ Portable        |       Can restore to any MariaDB/MySQL instance, even on Windows       |
|     ✅ Easy automation     |               `watch` or cron can schedule regular dumps               |
|      ✅ Works over SMB     | Windows sees the backup as a normal file; no special DB tooling needed |

***


## **4️⃣ Cons / Limitations**

|                                        |                                                                                                               |
| :------------------------------------: | :-----------------------------------------------------------------------------------------------------------: |
|                **Cons**                |                                                **Explanation**                                                |
|      ❌ Not continuous in real-time     |             `watch` only runs at intervals; changes between dumps are not captured until next run             |
|      ❌ Large databases can be slow     |                    Dumping big databases (10GB+) every hour can be heavy and spike CPU/I/O                    |
|           ❌ Disk space usage           |                           Each dump is a full copy; SMB storage may fill up quickly                           |
|          ❌ Network dependency          |                        SMB latency or disconnects may fail backup; you need retry logic                       |
|      ❌ Not point-in-time recovery      |                             You only restore from last dump, not exact transaction                            |
| ❌ Risk of partial backup if dump fails | If SMB write fails mid-dump, the file may be incomplete — consider writing first locally, then copying to SMB |

***


## **5️⃣ Recommended improvements**

1. **Local temp dump first**

<!---->

    docker exec mariadb_container mysqldump ... > /tmp/dump.sql
    mv /tmp/dump.sql /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql

- Ensures partial writes don’t corrupt SMB file

2. **Use** `gzip` **to save space**

<!---->

    mysqldump ... | gzip > /mnt/smb/mariadb_backup_$(date +%F_%H%M%S).sql.gz

3. **Switch to cron instead of watch**

- Cron is safer for long-term scheduling, logging, retries

4. **Optional rotation**

- Keep last N backups only to save space:

<!---->

    find /mnt/smb/ -name "*.sql.gz" -type f -mtime +7 -delete

***


### **✅ TL;DR**

- **Safe:** This method is **safe for live Docker MariaDB**, because you never copy raw data files.

- **Human-readable:** SQL dumps can be restored anywhere.

- **Flexible:** Works with Windows via SMB.

**Downside:** Not real-time, uses more disk/CPU, requires rotation and error handling.

***

If you want, I can write a **ready-to-use** `watch`**/cron script** that:

1. Dumps the database from Docker

2. Compresses it

3. Copies safely to Windows SMB

4. Keeps only last N backups automatically

It would be fully automated for production use.

Do you want me to do that?

\========================================================================

Do it and also show how to restore from windows host to linux guest docker database via SMB.

Perfect! Let’s create a **complete automated backup + restore workflow** for Docker MariaDB/MySQL running in a Linux VM, with backups stored on a **Windows SMB share**.

This will be **safe, repeatable, and avoids raw file corruption**.

***


## **Part 1: Automatic Backup from Docker MariaDB to Windows SMB**

### **1️⃣ Mount the Windows SMB share in Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

- Replace `WINDOWS_HOST` and `BackupFolder` with your Windows hostname/IP and share

- `vers=3.0` ensures modern SMB compatibility

- Check `mount` is successful: `df -h | grep smb_backups

  `

***


### **2️⃣ Create backup script**

Create a script `/usr/local/bin/mariadb_smb_backup.sh`:

    #!/bin/bash

    # Docker container name
    CONTAINER_NAME=mariadb_container

    # Windows SMB mount point
    BACKUP_DIR=/mnt/smb_backups

    # Create timestamp
    TIMESTAMP=$(date +%F_%H%M%S)

    # Temp file (local first to avoid partial writes on SMB)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Dump all databases safely
    docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
      --all-databases \
      --single-transaction \
      --routines \
      --events \
      2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE

    # Move compressed dump to SMB share
    mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz

    # Optional: keep only last 7 backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +7 -delete

    echo "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_smb_backup.sh

***


### **3️⃣ Schedule automatic backups**

Use **cron** instead of `watch` for production reliability.

    crontab -e

Example: every hour

    0 * * * * /usr/local/bin/mariadb_smb_backup.sh

✅ Now your backups will appear on Windows every hour as compressed SQL files.

***


## **Part 2: Restore backup from Windows SMB to Docker MariaDB**

### **1️⃣ Make sure SMB share is mounted in Linux VM**

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

***


### **2️⃣ Restore command**

Assuming the backup you want is `/mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz`:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

Explanation:

- `gzip -dc` → decompress on the fly

- `docker exec -i` → pipe the SQL directly into the running container

- Safe, no filesystem corruption

- All databases, routines, triggers, and events are restored

***


### **3️⃣ Optional: Restore a single database**

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD" your_database_name

- Only restores `your_database_name

  `

- Works if dump contains multiple DBs; extra DBs will be ignored

***


## **✅ Pros of this method**

- Fully **safe for running Docker MariaDB**

- **Backups stored on Windows SMB** are usable

- **Compresses backups** to save space

- **Automated rotation** keeps last N backups

- **Restoration works safely** back into Linux VM Docker container

***


## **⚠️ Cons / Limitations**

- Not real-time replication — backups are interval-based

- Large databases can take CPU and I/O during dump

- SMB latency may slow down backup copy

- Must handle credentials securely (`MYSQL_ROOT_PASSWORD` should be in a safe env variable or Docker secret)

***


## **TL;DR workflow**

    Docker MariaDB (Linux VM) --> mysqldump --> gzip --> /mnt/smb_backups
    Windows SMB sees backup.sql.gz files
    Restore: gzip -dc backup.sql.gz | docker exec -i mariadb_container mysql

- **Safe**, no raw data file corruption

- **Portable**, readable SQL backups

- **Automated**, with cron

***

If you want, I can also write a **fully ready** `docker-compose.yml` **+ backup script combo** that you can drop in and run immediately — it will handle SMB mount, backup, rotation, and restore automatically.

Do you want me to do that?

\======================================================================

docker run database backup script when docker container stops to backup from linux guest VM to windows host via SMB.

Ah! Now you want **automatic backup triggered when the Docker MariaDB container stops**, instead of using `watch` or cron. Perfect — this is safer than copying raw files and avoids downtime. Let me show a full setup for Linux VM → Windows SMB backup on container stop.

***


## **1️⃣ Overview**

We’ll use **Docker container stop hooks**:

- **Docker event listening** via `docker events

  `

- When `mariadb_container` stops, run a **backup script** from the Linux VM

- Script will `mysqldump` the database and copy it to **Windows SMB share**

Flow:

    MariaDB Container stops
            ↓
    Linux VM executes backup script
            ↓
    Backup saved as SQL.gz on Windows SMB

✅ No raw file copying\
&#x20;✅ Safe for InnoDB\
&#x20;✅ Can keep rotated backups

***


## **2️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional for automatic mount in `/etc/fstab`:

    # Windows SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


## **3️⃣ Backup script (**`/usr/local/bin/mariadb_smb_backup_on_stop.sh`**)**

    #!/bin/bash

    # Configuration
    CONTAINER_NAME=mariadb_container
    BACKUP_DIR=/mnt/smb_backups
    KEEP_DAYS=7

    # Timestamp
    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Check if container exists (optional)
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        echo "Container $CONTAINER_NAME not found"
        exit 1
    fi

    # Backup databases safely
    echo "Backing up $CONTAINER_NAME before shutdown..."
    docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE

    # Move to SMB share
    mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz

    # Rotate old backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete

    echo "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_smb_backup_on_stop.sh

***


## **4️⃣ Listen for Docker container stop events**

Create a small service script `/usr/local/bin/docker_mariadb_event_listener.sh`:

    #!/bin/bash

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_smb_backup_on_stop.sh

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" | while read event
    do
        echo "Detected stop event for $CONTAINER_NAME"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


## **5️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- Now, whenever the container stops (`docker stop mariadb_container`), the **backup runs automatically**

- Output goes to `/mnt/smb_backups` on Windows

***


## **6️⃣ Restore from Windows SMB**

Assuming the backup is:

    /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz

Run:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

- Works for full restore

- Can restore individual databases if needed:

<!---->

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD" your_database_name

***


## **✅ Pros of this approach**

- Backup is **triggered only on stop**, no constant polling or watch loops

- Safe: never touches raw InnoDB files

- Backups stored on Windows SMB, **portable and readable**

- Automatic rotation keeps last N backups

- Works for **both planned stops and container crashes** (if you handle Docker events for `die` as well)

***


## **⚠️ Considerations**

- If the container is killed forcefully (`docker kill`) instead of `docker stop`, the event may be missed — can add `die` event filter

- Backup still requires sufficient disk space during temporary dump

- SMB latency may slow down backup write, ensure network stability

- Large databases can take several seconds or minutes to dump

***

✅ **Summary workflow**

    [Docker MariaDB] stops → Docker event triggers → Linux VM backup script → SMB → Windows backup folder
    Restore: gzip -dc backup.sql.gz | docker exec -i mariadb_container mysql

***

I can also **enhance this to capture** `docker kill` **events**, compress backups in place, and log errors automatically, so it becomes a fully production-ready backup-on-stop system.

Do you want me to do that?

\====================================================================

do it

Perfect! Let’s create a **fully production-ready “backup-on-stop” system** for Docker MariaDB/MySQL running in a Linux VM with backups going to a **Windows SMB share**. This will:

- Trigger backups on **stop or crash (**`die`**) events**

- Compress SQL dumps safely

- Rotate old backups

- Log successes/failures

***


## **1️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups
    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional for auto-mount on boot in `/etc/fstab`:

    # Windows SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


## **2️⃣ Backup script (**`/usr/local/bin/mariadb_backup_on_stop.sh`**)**

    #!/bin/bash
    # ====================================================
    # Backup Docker MariaDB to SMB when container stops
    # ====================================================

    # Configuration
    CONTAINER_NAME=mariadb_container
    BACKUP_DIR=/mnt/smb_backups
    KEEP_DAYS=7
    LOG_FILE=/var/log/mariadb_backup.log

    # Timestamp
    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_FILE=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    # Logging helper
    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    # Check container exists
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        log "Container $CONTAINER_NAME not found. Skipping backup."
        exit 1
    fi

    log "Starting backup of $CONTAINER_NAME..."

    # Perform mysqldump inside container
    if docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_FILE; then
        mv $TEMP_FILE $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz
        log "Backup completed: $BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"
    else
        log "Backup failed! Check /tmp/mariadb_backup_$TIMESTAMP.log for details."
        rm -f $TEMP_FILE
        exit 1
    fi

    # Rotate old backups
    find $BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete
    log "Old backups older than $KEEP_DAYS days deleted."

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_backup_on_stop.sh

***


## **3️⃣ Event listener script (**`/usr/local/bin/docker_mariadb_event_listener.sh`**)**

    #!/bin/bash
    # ====================================================
    # Listen for stop/die events for MariaDB container
    # ====================================================

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_backup_on_stop.sh
    LOG_FILE=/var/log/mariadb_backup_listener.log

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    log "Starting Docker event listener for $CONTAINER_NAME..."

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" --filter "event=die" | \
    while read event
    do
        log "Detected container stop/die event: $event"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


## **4️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- This will run continuously in the background

- Automatically triggers backup on **normal stop** (`docker stop`) or **crash** (`docker die`)

You can also make it a **systemd service** for persistence across VM reboots.

***


## **5️⃣ Restore backups from Windows SMB**

Assuming the backup file is:

    /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz

Restore to running Docker container:

    gzip -dc /mnt/smb_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"

- Full restore of all databases

- Can restore individual databases by appending the database name after `mysql -u root ...

  `

***


## **✅ Advantages of this setup**

- Backup **only runs on stop or crash** → efficient, no constant polling

- Safe: no raw file copying → prevents InnoDB corruption

- Stored on **Windows SMB**, compressed SQL → portable and readable

- Automatic **rotation of old backups**

- Logs for monitoring success/failure

- Handles both **planned and unplanned shutdowns**

***


## **⚠️ Considerations**

- SMB write speed can affect backup time for large DBs

- Container killed with `docker kill` generates `die` event, so it’s captured

- Ensure `MYSQL_ROOT_PASSWORD` is stored safely (environment variable or Docker secrets)

- Test restore regularly to verify backups

***

If you want, I can also **provide a ready-to-use systemd unit** that keeps this listener running as a **service**, so it auto-starts on VM boot and you never have to run it manually.

Do you want me to do that next?

\====================================================================

alongside of previous sync / make full copy of raw mariadb data to windows host from linux guest VM via SMB when docker database container stops normally or crashes.

Perfect! Let’s combine everything into a **single production-ready setup** that does **both**:

1. **Logical backup via** `mysqldump` (safe, readable SQL)

2. **Cold/raw snapshot of MariaDB data directory** (exact files)

And it will **trigger automatically** when the Docker MariaDB container **stops or crashes** (`stop` or `die`).

We’ll also handle **Windows SMB** and **rotation**, and log everything.

***


# **1️⃣ Mount Windows SMB on Linux VM**

    sudo mkdir -p /mnt/smb_backups/sql_backups
    sudo mkdir -p /mnt/smb_backups/raw_data_snapshots

    sudo mount -t cifs //WINDOWS_HOST/BackupFolder /mnt/smb_backups \
      -o username=winuser,password=winpass,vers=3.0,iocharset=utf8

Optional `/etc/fstab` for auto-mount:

    # SMB backup mount
    //WINDOWS_HOST/BackupFolder /mnt/smb_backups cifs username=winuser,password=winpass,vers=3.0,iocharset=utf8 0 0

***


# **2️⃣ Combined backup script**

Create `/usr/local/bin/mariadb_full_backup_on_stop.sh`:

    #!/bin/bash
    # ====================================================
    # Triggered backup of Docker MariaDB on stop or crash
    # ====================================================

    CONTAINER_NAME=mariadb_container
    SQL_BACKUP_DIR=/mnt/smb_backups/sql_backups
    RAW_BACKUP_DIR=/mnt/smb_backups/raw_data_snapshots
    KEEP_DAYS=7
    LOG_FILE=/var/log/mariadb_full_backup.log

    TIMESTAMP=$(date +%F_%H%M%S)
    TEMP_SQL=/tmp/mariadb_backup_$TIMESTAMP.sql.gz

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    # Check container exists
    if ! docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
        log "Container $CONTAINER_NAME not found. Exiting."
        exit 1
    fi

    log "Starting full backup for container $CONTAINER_NAME..."

    # ---------------------------
    # 1️⃣ Logical mysqldump backup
    # ---------------------------
    log "Starting mysqldump backup..."
    if docker exec $CONTAINER_NAME mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" \
        --all-databases --single-transaction --routines --events \
        2>/tmp/mariadb_backup_$TIMESTAMP.log | gzip > $TEMP_SQL; then
        mv $TEMP_SQL $SQL_BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz
        log "mysqldump backup completed: $SQL_BACKUP_DIR/mariadb_backup_$TIMESTAMP.sql.gz"
    else
        log "mysqldump backup FAILED! Check /tmp/mariadb_backup_$TIMESTAMP.log"
    fi

    # ---------------------------
    # 2️⃣ Cold/raw data snapshot
    # ---------------------------
    log "Starting raw data snapshot..."
    docker stop $CONTAINER_NAME

    SNAPSHOT_DIR="$RAW_BACKUP_DIR/mariadb_$TIMESTAMP"
    mkdir -p "$SNAPSHOT_DIR"

    docker run --rm -v mariadb_data:/data -v "$RAW_BACKUP_DIR":/backup busybox \
        sh -c "cp -a /data /backup/mariadb_$TIMESTAMP/"

    docker start $CONTAINER_NAME
    log "Raw snapshot completed: $SNAPSHOT_DIR"

    # ---------------------------
    # 3️⃣ Rotate old backups
    # ---------------------------
    log "Rotating old SQL backups older than $KEEP_DAYS days..."
    find $SQL_BACKUP_DIR -name "mariadb_backup_*.sql.gz" -type f -mtime +$KEEP_DAYS -delete

    log "Rotating old raw snapshots older than $KEEP_DAYS days..."
    find $RAW_BACKUP_DIR -name "mariadb_*" -type d -mtime +$KEEP_DAYS -exec rm -rf {} +

    log "Backup process finished."

Make it executable:

    sudo chmod +x /usr/local/bin/mariadb_full_backup_on_stop.sh

***


# **3️⃣ Docker event listener**

Create `/usr/local/bin/docker_mariadb_event_listener.sh`:

    #!/bin/bash
    # ====================================================
    # Listen for stop/die events for MariaDB container
    # ====================================================

    CONTAINER_NAME=mariadb_container
    BACKUP_SCRIPT=/usr/local/bin/mariadb_full_backup_on_stop.sh
    LOG_FILE=/var/log/mariadb_backup_listener.log

    log() {
        echo "$(date +'%F %T') - $1" | tee -a "$LOG_FILE"
    }

    log "Starting Docker event listener for $CONTAINER_NAME..."

    docker events --filter "container=$CONTAINER_NAME" --filter "event=stop" --filter "event=die" | \
    while read event
    do
        log "Detected container stop/die event: $event"
        $BACKUP_SCRIPT
    done

Make it executable:

    sudo chmod +x /usr/local/bin/docker_mariadb_event_listener.sh

***


# **4️⃣ Run listener in background**

    nohup /usr/local/bin/docker_mariadb_event_listener.sh > /var/log/mariadb_backup_listener.log 2>&1 &

- This continuously listens for **stop or crash events**

- Automatically triggers both **mysqldump** and **raw snapshot** backups

***


# **5️⃣ Restore Instructions**

### **A. Restore SQL dump**

    gzip -dc /mnt/smb_backups/sql_backups/mariadb_backup_2026-02-05_120000.sql.gz | \
    docker exec -i mariadb_container mysql -u root -p"$MYSQL_ROOT_PASSWORD"


### **B. Restore raw snapshot**

    docker stop mariadb_container

    docker run --rm -v mariadb_data:/data \
        -v /mnt/smb_backups/raw_data_snapshots/mariadb_2026-02-05_120500:/backup busybox \
        sh -c "cp -a /backup/* /data/"

    docker start mariadb_container

***


# **6️⃣ Advantages**

✅ Automatic on stop or crash (`stop` + `die`)\
&#x20;✅ Safe mysqldump backup (logical)\
&#x20;✅ Cold/raw snapshot backup (exact Docker volume)\
&#x20;✅ Windows SMB storage\
&#x20;✅ Backup rotation for both SQL and raw snapshots\
&#x20;✅ Logging for monitoring

***


# **7️⃣ Notes / Caveats**

- **Do not copy raw data while DB is running**, only safe after stop or via snapshot

- Large databases may take a few minutes for backup or raw snapshot

- SMB latency may affect copy speed

- Always test restores regularly

***

This gives you a **full production-ready system** that automatically keeps:

1. **SQL dumps** (portable, readable, safe)

2. **Raw data snapshots** (exact state, fast restore)

All automatically pushed to **Windows SMB**, triggered **only when the container stops or crashes**.

***

I can also **write a ready-made systemd service unit** to run the event listener on VM boot, so it always monitors MariaDB and never needs manual start.

Do you want me to do that next?
