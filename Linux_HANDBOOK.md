THE COMPLETE LINUX HANDBOOK
Zero to Hero — A DevOps Learner's Guide
Audience: DevOps beginners and production support engineers
Practice: Killercoda (browser Ubuntu) or any Linux machine
Goal: Linux-fluent for real DevOps work

📖 Table of Contents
Why Linux?

Linux vs Windows

Filesystem Architecture

Setup & Environment

Navigation

Files & Folders

Viewing Files

Editing Files

Searching

Permissions

Users & Groups

Processes & Services

Networking

Disk & Storage

Logs & Debugging

Package Management

Pipes & Redirection

Bash Scripting Basics

Real-World Support Scenarios

Cheat Sheet

1. Why Linux?
🎯 One-Liner
Linux runs the internet. If you work in DevOps, you live in Linux.

📖 Where Linux Runs
Where	Share
Top 1M websites	96%
Cloud VMs (AWS/Azure/GCP)	Majority
Containers (Docker/K8s)	100% Linux-native
Supercomputers	100%
Android phones	Built on Linux
Routers, IoT, smart TVs	Everywhere
💡 Why DevOps Needs It
Servers have no GUI — terminal only

Automation (Bash, Ansible) runs on Linux

Containers are Linux processes

Every cloud VM is Linux by default

Logs, configs, scripts — all Linux

No Linux = no DevOps.

2. Linux vs Windows
📊 Comparison
Aspect	Linux	Windows
Cost	Free, open-source	Paid license
Interface	CLI-first	GUI-first
Paths	/home/user/file	C:\Users\user\file
Case-sensitive	Yes (File ≠ file)	No
Line endings	\n (LF)	\r\n (CRLF)
Stability	Months/years uptime	Frequent reboots
📖 Popular Distros
Distro	Use case
Ubuntu	Beginner-friendly, cloud standard
Debian	Stable, server-focused
RHEL / Rocky / CentOS	Enterprise
Alpine	Tiny, used in Docker
Kali	Security testing
For DevOps: Ubuntu and RHEL-family are what you'll see in jobs.

3. Filesystem Architecture
🎯 One-Liner
Everything starts at /. Learn the top-level folders — they never change.

📊 The Tree
text
/                          ← root of everything
│
├── bin/                   ← essential commands (ls, cat, cp)
├── boot/                  ← kernel + bootloader
├── dev/                   ← devices (disks, terminals)
├── etc/                   ← CONFIGURATION files ⭐
├── home/                  ← user home folders
│   └── username/          ← your stuff
├── lib/                   ← shared libraries
├── media/                 ← USB/CD mounts
├── mnt/                   ← temporary mount point
├── opt/                   ← third-party software
├── proc/                  ← running processes info
├── root/                  ← root user's home
├── run/                   ← runtime data (PIDs)
├── sbin/                  ← system commands (reboot, fdisk)
├── srv/                   ← web/ftp data
├── sys/                   ← kernel info
├── tmp/                   ← temporary (wiped on reboot) ⭐
├── usr/                   ← user-installed programs
└── var/                   ← variable data
    └── log/               ← system logs ⭐⭐⭐
📖 The Three Folders You'll Live In
Folder	Purpose	When
/etc	Config files	Fixing configs
/var/log	Logs	Debugging errors
/opt	Third-party apps (Tomcat, etc.)	App not running
📖 Path Symbols
Symbol	Meaning
/	Root
.	Current folder
..	Parent folder
~	Home folder
-	Previous folder
📖 Absolute vs Relative
bash
cd /var/log/nginx     # absolute — starts with /
cd logs               # relative — from where you are
4. Setup & Environment
🎯 One-Liner
Use Killercoda — free Ubuntu in your browser in 5 seconds.

📖 Options
Option	Pros	Cons
Killercoda ⭐	Free, instant, real Ubuntu, root	Sessions reset
WSL2	Local, persistent	Needs decent laptop
GitHub Codespaces	Persistent, VS Code	60 hrs/month
Cloud VM	Full control	Needs account
Physical machine	Full control	Hardware
📖 Killercoda Steps
Open https://killercoda.com/playgrounds/scenario/ubuntu

Accept cookies → Sign in with GitHub

Click Start

Terminal appears with prompt: root@ubuntu:~#

Reading the prompt:

root = username

ubuntu = hostname

~ = current folder (home)

# = root (a $ means normal user)

Time limit: 60 minutes per session. Reopen URL for fresh machine.

5. Navigation
🎯 One-Liner
pwd shows where you are. ls shows what's here. cd moves.

🔹 pwd — Print Working Directory
bash
pwd
Output: /root — resets your mental map when lost.

🔹 ls — List
bash
ls              # basic
ls -l           # long format (size, date, perms)
ls -a           # show hidden files (starting with .)
ls -la          # both
ls -lh          # human-readable sizes
ls /etc         # list another folder
Reading ls -l:

text
-rw-r--r--  1  root  root  3234  Oct 5 12:29  .bashrc
│└┬┘└┬┘└┬┘  │   │     │    │    │             │
│ │  │  │   │   │     │    │    │             └─ filename
│ │  │  │   │   │     │    │    └─ date
│ │  │  │   │   │     │    └─ size
│ │  │  │   │   │     └─ group
│ │  │  │   │   └─ owner
│ │  │  │   └─ links
│ │  │  └─ others perms
│ │  └─ group perms
│ └─ owner perms
└─ type (- file, d dir, l symlink)
🔹 cd — Change Directory
bash
cd /etc           # go to /etc
cd ..             # up one level
cd ../..          # up two
cd ~              # home
cd -              # previous folder
cd                # same as cd ~
📸 Practice
bash
pwd
ls -la
cd /etc && ls | head -20
cd /var/log && ls -lh
cd /tmp && mkdir -p linux-lab/day1 && cd linux-lab/day1
pwd
cd -
pwd
6. Files & Folders
🎯 One-Liner
mkdir creates folders. touch creates files. cp copies. mv moves. rm deletes.

🔹 mkdir — Make Directory
bash
mkdir myfolder                 # single
mkdir -p a/b/c                 # nested
mkdir f1 f2 f3                 # multiple
🔹 touch — Create Empty File
bash
touch file.txt                 # create
touch file1.txt file2.txt      # multiple
🔹 cp — Copy
bash
cp source.txt dest.txt         # file
cp source.txt /tmp/            # to folder
cp -r folder1 folder2          # folder (recursive)
cp -i source.txt dest.txt      # interactive
cp -p source.txt dest.txt      # preserve perms/time
🔹 mv — Move / Rename
bash
mv old.txt new.txt             # rename
mv file.txt /tmp/              # move
mv folder1 /tmp/               # move folder
🔹 rm — Delete
bash
rm file.txt                    # file
rm -r folder                   # folder + contents
rm -i file.txt                 # interactive
rm -rf folder                  # force ⚠️ DANGEROUS
⚠️ The Danger
bash
rm -rf /          # WIPES ENTIRE SYSTEM
rm -rf *          # deletes everything in current folder
Rules:

ls before rm -rf

Avoid rm -rf on production

Use rm -i if unsure

When in doubt — move to /tmp instead

📸 Practice
bash
cd /tmp && mkdir -p demo/nested
cd demo
touch report.txt && echo "Hello" > report.txt
cp report.txt report-bak.txt
mkdir archive && mv report-bak.txt archive/
ls && ls archive/
rm report.txt
rm -r archive
ls
7. Viewing Files
🎯 One-Liner
cat shows all. head shows top. tail shows bottom. less scrolls.

🔹 cat — Print Entire File
bash
cat file.txt                   # print
cat file1.txt file2.txt        # join
cat -n file.txt                # with line numbers
Best for files < 100 lines.

🔹 less — Scrollable Viewer
bash
less /var/log/syslog
Key	Action
Space / PgDn	Next page
b / PgUp	Previous page
/word	Search forward
n	Next match
g / G	Top / Bottom
q	Quit
🔹 head — First Lines
bash
head file.txt                  # first 10
head -20 file.txt              # first 20
🔹 tail — Last Lines ⭐
bash
tail file.txt                  # last 10
tail -50 file.txt              # last 50
tail -f /var/log/syslog        # FOLLOW live ⭐⭐⭐
tail -F /var/log/syslog        # follow with retry
tail -f is the #1 support command. Live log viewing. Exit with Ctrl+C.

🔹 wc — Count
bash
wc -l file.txt                 # lines
wc -l /var/log/syslog          # how big is the log?
📸 Practice
bash
cd /tmp
cat > story.txt << 'EOF'
Line one
Line two
Line three
Line four
Line five
EOF

cat story.txt
head -3 story.txt
tail -2 story.txt
wc -l story.txt
8. Editing Files
🎯 One-Liner
nano for beginners. vim for pros.

🔹 nano — Simple Editor
bash
nano myfile.txt
Arrow keys to move

Ctrl+O then Enter = save

Ctrl+X = exit

🔹 vim — Powerful Editor
bash
vim myfile.txt
Modes:

Normal — Esc

Insert — i (type)

Command — : from normal

Key	Action
i	Insert mode
Esc	Normal mode
:w	Save
:q	Quit
:wq	Save + quit
:q!	Quit without save
dd	Delete line
yy	Copy line
p	Paste
/text	Search
u	Undo
🔹 echo — Write Without Editor
bash
echo "content" > file.txt       # overwrite
echo "more" >> file.txt         # append
🔹 Heredoc — Multiple Lines
bash
cat > config.conf << 'EOF'
server=localhost
port=8080
debug=false
EOF
🔹 tee — Write + Show
bash
echo "hello" | tee file.txt     # write AND display
echo "more" | tee -a file.txt   # append
9. Searching
🎯 One-Liner
grep searches inside files. find searches for files.

🔹 grep — Search Inside Files ⭐⭐⭐
bash
grep "error" file.txt           # basic
grep -i "error" file.txt        # case-insensitive
grep -n "error" file.txt        # line numbers
grep -c "error" file.txt        # count
grep -r "error" /var/log/       # recursive
grep -v "error" file.txt        # INVERT (lines without)
grep -w "error" file.txt        # whole word
grep -A 3 "error" file.txt      # 3 lines after
grep -B 3 "error" file.txt      # 3 lines before
grep -E "error|warn" file.txt   # regex OR
Real-world:

bash
grep "Failed password" /var/log/auth.log
grep -c "ERROR" /var/log/myapp.log
tail -f /var/log/syslog | grep --color "error"
🔹 find — Search Filesystem
bash
find /etc -name "*.conf"               # by name
find / -name "nginx.conf"              # anywhere
find /tmp -type d -name "lab*"         # directories
find /var/log -size +100M              # >100MB
find /tmp -mtime -1                    # last 24h
🔹 which / whereis
bash
which python3                          # binary path
whereis nginx                          # binary + man pages
10. Permissions
🎯 One-Liner
Every file has 3 permissions (r, w, x) for 3 groups (user, group, others).

📊 Permission Values
Symbol	Meaning	Value
r	Read	4
w	Write	2
x	Execute	1
-	None	0
Examples:

rwx = 7

rw- = 6

r-x = 5

r-- = 4

📖 Common Numbers
Octal	Permissions	Use
755	rwxr-xr-x	Folders, scripts
644	rw-r--r--	Regular files
600	rw-------	Private (keys)
700	rwx------	Private folders
777	rwxrwxrwx	❌ Never on prod
🔹 chmod — Change Mode
bash
chmod 755 script.sh          # octal
chmod 644 file.txt
chmod 600 secret.key
chmod +x script.sh           # add execute
chmod -x script.sh           # remove execute
chmod u+x file.sh            # user only
chmod g-w file.txt           # remove group write
chmod o-r file.txt           # remove other read
🔹 chown — Change Owner
bash
chown user file.txt              # change owner
chown user:group file.txt        # owner + group
chown -R user:group folder/      # recursive
🔹 sudo — Run as Root
bash
sudo apt update              # single command
sudo -i                      # become root
sudo su                      # switch to root
📸 Practice
bash
cd /tmp
touch script.sh
ls -l script.sh                 # 644
chmod 755 script.sh
ls -l script.sh                 # 755

echo '#!/bin/bash' > script.sh
echo 'echo "Hello!"' >> script.sh
./script.sh                     # runs!

chmod 600 script.sh
ls -l script.sh                 # 600
💡 Real-World Scenarios
Problem	Fix
"Permission denied" running script	chmod +x script.sh
SSH: "UNPROTECTED PRIVATE KEY"	chmod 600 ~/.ssh/id_rsa
403 Forbidden on web	chmod 644 /var/www/html/index.html
11. Users & Groups
🎯 One-Liner
Linux is multi-user. Every process runs as someone.

🔹 Identity Commands
bash
whoami                    # current user
id                        # UID, GID, groups
who                       # logged-in users
w                         # logged-in + activity
🔹 User Files
bash
cat /etc/passwd           # users (readable)
cat /etc/shadow           # hashed passwords (root only)
cat /etc/group            # groups
/etc/passwd format:

text
username:x:UID:GID:comment:home:shell
🔹 User Management (root only)
bash
sudo useradd -m username          # create + home
sudo passwd username              # set password
sudo usermod -aG sudo username    # add to sudo
sudo userdel -r username          # delete + home
🔹 Groups
bash
groups                            # your groups
sudo groupadd devteam             # create group
sudo usermod -aG devteam alice    # add user
sudo gpasswd -d alice devteam     # remove user
📸 Real-World: Onboarding
bash
sudo useradd -m alice
sudo passwd alice
sudo usermod -aG devteam alice
sudo usermod -aG docker alice
12. Processes & Services
🎯 One-Liner
ps lists. kill stops. systemctl manages services.

🔹 ps — Processes
bash
ps                          # your processes
ps aux                      # ALL (BSD)
ps -ef                      # ALL (System V)
ps aux | grep nginx         # find process
Reading ps aux:

text
USER   PID  %CPU %MEM  COMMAND
root   1234  0.5  1.2  /usr/sbin/nginx
🔹 top / htop — Live View
bash
top
htop                        # nicer (may need install)
Key	Action
q	Quit
M	Sort by memory
P	Sort by CPU
k	Kill process
🔹 kill — Stop Processes
bash
kill PID                    # SIGTERM (gentle)
kill -9 PID                 # SIGKILL (force)
killall nginx               # all by name
pkill -f "python app.py"    # by pattern
🔹 systemctl — Services ⭐⭐⭐
bash
systemctl status nginx               # check
systemctl start nginx                # start
systemctl stop nginx                 # stop
systemctl restart nginx              # restart
systemctl reload nginx               # reload config
systemctl enable nginx               # auto-start
systemctl disable nginx              # remove auto-start
systemctl list-units --type=service --state=running
Status output:

text
● nginx.service
   Active: active (running) since Wed ...
   Main PID: 1234 (nginx)
States:

active (running) = up ✅

inactive (dead) = stopped

failed = broken ❌

📸 Real-World: App Down
bash
systemctl status myapp              # check state
journalctl -u myapp -n 50           # recent logs
systemctl restart myapp             # restart
systemctl status myapp              # verify
13. Networking
🎯 One-Liner
Check IP, ping, curl, and see ports.

🔹 Check IP
bash
ip a                    # modern
hostname -I             # just IP
🔹 ping — Connectivity
bash
ping google.com
ping -c 4 google.com    # 4 pings only
🔹 curl — HTTP Requests ⭐
bash
curl https://api.github.com              # GET
curl -I https://google.com               # headers only
curl -o file.html https://example.com    # save
curl -X POST -d '{"k":"v"}' https://api/ # POST
Real-world:

bash
curl -I localhost:8080      # is my app responding?
curl -I http://localhost    # is nginx up?
🔹 wget — Download
bash
wget https://example.com/file.zip
🔹 ss / netstat — Ports ⭐
bash
ss -tuln                # listening ports
ss -tulnp               # with processes
Reading:

text
tcp  LISTEN  0.0.0.0:22    ← SSH
tcp  LISTEN  0.0.0.0:80    ← HTTP
Real-world: "Is port 8080 open?" → ss -tuln | grep 8080

🔹 dig / nslookup — DNS
bash
dig google.com +short   # IP
nslookup google.com
📸 Real-World: App Not Reachable
bash
ping <server-ip>                # network up?
curl -I http://<server-ip>:8080 # app responding?
ss -tuln | grep 8080            # port listening?
systemctl status myapp          # service up?
This 4-command chain solves 90% of "app not responding".

14. Disk & Storage
🎯 One-Liner
df shows disk space. du shows folder sizes.

🔹 df — Disk Free
bash
df -h                   # human-readable
df -h /var              # specific mount
Output:

text
Filesystem  Size Used Avail Use% Mounted on
/dev/sda1    50G  20G   30G  40% /
/dev/sdb1   100G  80G   20G  80% /var
🔹 du — Disk Usage
bash
du -sh /var/log                # total
du -sh /var/*                  # each item
du -sh /var/* | sort -rh | head   # top 10
🔹 lsblk
bash
lsblk                   # disks & partitions
💡 Real-World: Disk Full
bash
df -h                                        # which disk full?
du -sh /var/* | sort -rh | head -10          # what's eating it?
du -sh /var/log/* | sort -rh | head -10      # drill in
find /var/log -name "*.log" -mtime +30 -delete   # clean old logs
15. Logs & Debugging
🎯 One-Liner
Logs tell you everything. Learn to read them fast.

📖 Log Locations
Path	Contains
/var/log/syslog	System (Ubuntu/Debian)
/var/log/messages	System (RHEL/CentOS)
/var/log/auth.log	Auth (SSH, sudo)
/var/log/kern.log	Kernel
/var/log/dmesg	Boot
/var/log/nginx/	Nginx
/var/log/apache2/	Apache
/var/log/mysql/	MySQL
🔹 journalctl — Systemd Journal ⭐⭐⭐
bash
journalctl                       # all logs
journalctl -u nginx              # specific service
journalctl -u nginx -n 50        # last 50
journalctl -u nginx -f           # follow live
journalctl --since "1 hour ago"  # time range
journalctl -p err                # only errors
journalctl -b                    # since last boot
🔹 dmesg — Kernel Messages
bash
dmesg                            # all
dmesg | tail                     # recent
dmesg -T | grep -i error         # errors with time
💡 Debug Flows
"Users can't log in"

bash
journalctl --since "30 min ago" | grep -i auth
tail -f /var/log/auth.log
"App slow"

bash
journalctl -u myapp --since "1 hour ago"
tail -f /var/log/myapp/error.log
"Server crashed"

bash
journalctl -b -1            # previous boot
dmesg | tail -50
16. Package Management
🎯 One-Liner
Ubuntu/Debian: apt. RHEL/CentOS: yum/dnf.

🔹 apt (Ubuntu/Debian)
bash
sudo apt update                   # refresh package list
sudo apt upgrade                  # upgrade all
sudo apt install nginx            # install
sudo apt remove nginx             # uninstall
sudo apt search nginx             # search
apt list --installed              # list installed
🔹 yum / dnf (RHEL/CentOS)
bash
sudo yum update
sudo yum install nginx
sudo yum remove nginx
sudo dnf install nginx            # modern version
💡 Real-World
bash
sudo apt update && sudo apt install -y nginx curl wget git
The -y auto-confirms — useful in scripts.

17. Pipes & Redirection
🎯 One-Liner
| chains commands. > writes. >> appends.

🔹 Redirection
Symbol	Meaning
>	Write (overwrite)
>>	Append
<	Read from file
2>	Redirect stderr
&>	Redirect both stdout + stderr
/dev/null	Discard output
Examples:

bash
echo "hello" > file.txt             # overwrite
echo "world" >> file.txt            # append
command > output.txt 2>&1           # stdout + stderr
command > /dev/null 2>&1            # discard all
🔹 Pipes
bash
ls -la | grep ".txt"
ps aux | grep nginx
cat access.log | grep "404" | wc -l
Reading: "Run ls, then send output to grep, which filters for .txt."

📸 Real-World Pipes
bash
# Top 10 largest files in /var
du -sh /var/* | sort -rh | head -10

# Count errors in log
grep -c "ERROR" app.log

# Live tail, filter for errors
tail -f /var/log/syslog | grep --color "error"

# Who's using the most CPU?
ps aux | sort -k3 -rn | head -5

# Show only listening ports with numbers
ss -tuln | awk '{print $5}' | tail -n +2
18. Bash Scripting Basics
🎯 One-Liner
A script = commands in a file. Add logic with variables, if, loops.

🔹 First Script
bash
#!/bin/bash
echo "Hello, world!"
Save as hello.sh, then:

bash
chmod +x hello.sh
./hello.sh
#!/bin/bash = shebang. Tells Linux "use bash to run this."

🔹 Variables
bash
NAME="Alice"
echo "Hello, $NAME"
echo "Today is $(date)"
Note: No spaces around =.

🔹 User Input
bash
read -p "Enter your name: " name
echo "Hi, $name"
🔹 If / Else
bash
if [ -f "/etc/nginx/nginx.conf" ]; then
    echo "Config exists"
else
    echo "Config missing"
fi
Common conditions:

Test	True when
-f file	File exists
-d dir	Directory exists
-z "$x"	String is empty
$a -eq $b	Numbers equal
$a == $b	Strings equal
🔹 Loops
bash
# For loop
for i in 1 2 3 4 5; do
    echo "Number: $i"
done

# Loop through files
for file in *.log; do
    echo "Processing $file"
    wc -l "$file"
done

# While loop
count=1
while [ $count -le 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done
🔹 Real-World Script: Disk Check
bash
#!/bin/bash
# disk-check.sh — Alert if disk > 80%

THRESHOLD=80
df -h | grep -vE '^Filesystem|tmpfs' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    mount=$(echo $line | awk '{print $6}')
    if [ $usage -gt $THRESHOLD ]; then
        echo "WARNING: $mount is ${usage}% full"
    fi
done
Run it:

bash
chmod +x disk-check.sh
./disk-check.sh
This is the kind of script you'll write in DevOps.

19. Real-World Support Scenarios
🎬 Scenario 1: Service Not Starting
Symptom: Users report "app is down."

bash
# 1. Check service status
systemctl status myapp

# 2. If "failed", check recent logs
journalctl -u myapp -n 100 --no-pager

# 3. Common causes
df -h                              # disk full?
ss -tuln | grep 8080               # port taken?
ls -la /etc/myapp/config.conf      # config readable?
id myapp                           # user exists?

# 4. Fix and restart
systemctl restart myapp
systemctl status myapp
🎬 Scenario 2: Disk Full Alert
Symptom: Monitoring says /var is 95% full.

bash
# 1. Confirm
df -h /var

# 2. What's biggest?
du -sh /var/* | sort -rh | head -10

# 3. Drill in
du -sh /var/log/* | sort -rh | head -10

# 4. Clean safely
# Delete logs older than 30 days
find /var/log -name "*.log" -mtime +30 -delete

# Truncate huge active log (don't delete — service holds it open)
truncate -s 0 /var/log/huge.log

# 5. Verify
df -h /var
🎬 Scenario 3: SSH Login Issues
Symptom: "Can't SSH into server."

bash
# 1. Network reachable?
ping <server-ip>

# 2. SSH port open?
ss -tuln | grep 22

# 3. Service running?
systemctl status sshd

# 4. Failed attempts
grep "Failed password" /var/log/auth.log | tail -20

# 5. Root cause — brute force? Locked account?
grep "Invalid user" /var/log/auth.log | tail
🎬 Scenario 4: High CPU Usage
Symptom: Server slow. top shows 90% CPU.

bash
# 1. Find hog
top
# or
ps aux | sort -k3 -rn | head -5

# 2. Get details
ps -p <PID> -o pid,ppid,user,cmd,%cpu,%mem

# 3. What's the parent?
ps -ef | grep <PPID>

# 4. If runaway — kill gently first
kill <PID>
# force only if needed
kill -9 <PID>

# 5. Investigate cause from logs
journalctl -u <service> --since "10 min ago"
🎬 Scenario 5: Application Log Investigation
Symptom: Reports of 500 errors.

bash
# 1. Check app logs
tail -f /var/log/myapp/error.log

# 2. Count errors in last hour
journalctl -u myapp --since "1 hour ago" | grep -c "ERROR"

# 3. Find specific error pattern
grep "NullPointerException" /var/log/myapp/*.log | tail

# 4. Context around error
grep -B 5 -A 5 "ERROR" /var/log/myapp/app.log | tail -40

# 5. Which requests failed?
grep " 500 " /var/log/nginx/access.log | tail
🎬 Scenario 6: Config File Mishap
Symptom: Config was edited, service now broken.

bash
# 1. Check recent changes to config
ls -la /etc/myapp/
stat /etc/myapp/config.conf      # shows last modified

# 2. Look for backup
ls /etc/myapp/*.bak
ls /etc/myapp/*.orig

# 3. Restore from backup
cp /etc/myapp/config.conf.bak /etc/myapp/config.conf

# 4. Test config (if supported)
myapp --test-config

# 5. Restart
systemctl restart myapp
Moral: Always cp config.conf config.conf.bak before editing.

20. Cheat Sheet
🧭 Navigation
bash
pwd                  # where am I
ls -la               # what's here
cd /path             # go
cd ..                # up
cd ~                 # home
cd -                 # back
📁 Files
bash
mkdir -p a/b/c       # make folder
touch file           # empty file
cp -r src dst        # copy
mv old new           # move/rename
rm file              # delete
rm -r folder         # delete folder
👁 Viewing
bash
cat file             # print all
less file            # scroll
head -10 file        # first 10
tail -f file         # live follow ⭐
wc -l file           # line count
🔍 Searching
bash
grep "x" file        # search inside
grep -r "x" dir/     # recursive
find / -name "*.conf"  # find file
which nginx          # binary location
🔐 Permissions
bash
chmod 755 file       # rwxr-xr-x
chmod 644 file       # rw-r--r--
chmod +x script.sh   # make executable
chown user:group f   # change owner
sudo command         # run as root
⚙️ Processes
bash
ps aux               # all processes
top / htop           # live view
kill PID             # stop process
kill -9 PID          # force
systemctl status X   # service state
systemctl restart X  # restart service
🌐 Network
bash
ip a                 # my IP
ping host            # connectivity
curl -I url          # HTTP check
ss -tuln             # open ports
dig domain           # DNS
💾 Disk
bash
df -h                # disk space
du -sh /var/*        # folder sizes
lsblk                # disks
📜 Logs
bash
journalctl -u X      # service logs
journalctl -f        # live system logs
dmesg | tail         # kernel messages
tail -f /var/log/X   # any log live
🔗 Pipes
bash
cmd1 | cmd2          # chain
cmd > file           # write
cmd >> file          # append
cmd 2>&1             # merge stderr
🎓 Final Words
You've covered Linux from zero to solid working knowledge.

What you now know:

✅ Filesystem structure and navigation

✅ File operations (create, copy, move, delete)

✅ Viewing, editing, searching files

✅ Permissions and ownership

✅ Users and groups

✅ Processes and services

✅ Networking basics

✅ Disk and storage

✅ Logs and debugging

✅ Package management

✅ Pipes and redirection

✅ Bash scripting basics

📚 What Comes Next
After Linux:

Bash scripting (deep) — automation

Docker — containers

CI/CD — pipelines

Terraform — infrastructure as code

Kubernetes — orchestration

Monitoring — Prometheus + Grafana

🔑 Golden Rules
pwd and ls before you do anything else

man <command> is your help manual

rm -rf — pause before you press Enter

tail -f on logs beats guessing

Backup configs before editing: cp config config.bak

When stuck: journalctl, dmesg, df -h, ps aux — in that order

💪 Final Note
Linux mastery comes from doing, not reading. Open Killercoda, break things, fix them. Every real DevOps engineer learned this way.

The terminal is your home now.

End of Handbook
