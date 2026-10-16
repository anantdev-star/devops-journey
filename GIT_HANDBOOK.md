 THE COMPLETE GIT HANDBOOK
From Zero to Professional Workflow — A DevOps Learner's Guide
Audience: Beginners transitioning to DevOps
Prerequisites: None — we start from scratch
Goal: Master Git to a professional level

📖 Table of Contents
What is Git?

Git vs GitHub

Core Concepts & Vocabulary

Full Setup From Scratch

The Daily Loop — 5 Commands

History & Inspection

Branching

Merging

Merge Conflicts

.gitignore

Syncing

Undo Commands

Pull Requests

Common Errors & Fixes

Cheat Sheet

Real-World Scenarios

1. What is Git?
🎯 The One-Liner
Git is a time machine for your files — it remembers every change you ever made.

📖 The Full Theory
Imagine writing a book. Every time you finish a chapter, you take a photo of the whole book and put it in an album. If you later decide chapter 5 was better before, you flip to an old photo and copy from it.

Git does exactly that — but for computer files. It doesn't just back up files; it remembers who changed what, when, and why (through commit messages). You can:

Go back in time to any previous state

See exactly what changed between two points

Work on experiments without breaking the main version

Collaborate without overwriting each other's work

🌍 Real-World Example
A config file was changed 3 weeks ago and broke a service. You open Git:

Run git log config.yaml

See every change

Find commit abc1234 from 3 weeks ago, by a teammate, with message "update DB port"

Culprit found in 30 seconds

Without Git, this investigation takes hours.

💡 Why DevOps Needs Git
Infrastructure as Code lives in Git (Terraform, Ansible, K8s)

CI/CD pipelines trigger on Git commits

Every tool — Docker, Kubernetes, Jenkins — reads from Git

Rollbacks happen through Git

Audit trails come from Git

No Git = no DevOps.

2. Git vs GitHub
🎯 The One-Liner
Git is the tool. GitHub is the website where you store Git repos.

📖 The Full Comparison
Aspect	Git	GitHub
What	A program on your computer	A website
Maker	Linus Torvalds, 2005	Microsoft, 2008
Offline?	Yes	No
Cost	Free, open-source	Free for public repos
Purpose	Track changes locally	Share + collaborate
🌍 The Analogy
Git = your camera 📷

GitHub = Instagram 📱

You don't need Instagram to take photos. But sharing them requires it.

⚠️ Common Confusion
You can use Git without GitHub. You can use GitHub without Git (browser editing). The real power comes from using both together.

💡 Alternatives to GitHub
GitLab — popular in enterprises

Bitbucket — Jira-friendly

AWS CodeCommit — AWS-native

Azure Repos — Microsoft's version

All work with Git. GitHub is just the most popular.

3. Core Concepts & Vocabulary
🎯 The One-Liner
Repo → Commit → Branch → Remote. These four words are 90% of Git.

📖 Full Definitions
Term	One-liner	Full meaning
Repository (repo)	Project tracked by Git	A folder with a hidden .git/ folder inside
Commit	A snapshot	Saved state with ID, author, date, message
Branch	Parallel timeline	Named pointer to a commit — main is default
Remote	The GitHub copy	Named URL, usually called origin
HEAD	Where you are now	Pointer to current commit
Origin	Alias for GitHub URL	Default remote name
Working directory	Files on your disk	The files you edit
Staging area	Ready-to-commit zone	Where git add puts files
Index	Another name for staging	Same thing
Diff	What changed	Line-by-line comparison
🧠 The Mental Model
text
┌─────────────────────────────────────────────────┐
│  WORKING       →    STAGING   →   REPOSITORY   │
│  (edit)             (add)          (commit)    │
└─────────────────────────────────────────────────┘
Three zones. Every command moves files between them.

📊 Visual — The Git Workflow
text
     edit            git add           git commit
Files ───▶ Modified ───▶ Staged ───▶ Committed
           (red)         (green)          │
                                          │ git push
                                          ▼
                                       GitHub
4. Full Setup From Scratch
🎯 The One-Liner
Install Git, set your identity. Two minutes.

📖 Step-by-Step
4.1 — Install Git
On Windows:

Go to https://git-scm.com/download/win

Download the installer (Git-2.xx.x-64-bit.exe)

Run installer → click Next on every screen

Critical screen: "Adjusting your PATH environment" → keep "Git from the command line and also from 3rd-party software" selected

Click Install → Finish

Close ALL terminal windows (this matters)

Open fresh Git Bash (Windows key → type git bash → Enter)

Verify:

bash
git --version
Expected: git version 2.xx.x.windows.1

Alternative (winget):

bash
winget install --id Git.Git -e --source winget
4.2 — Set Your Identity
Why it matters: Every commit gets stamped with your name and email. This shows on GitHub, in logs, everywhere.

bash
git config --global user.name "your-username"
git config --global user.email "your-email@example.com"
Verify:

bash
git config --global user.name
git config --global user.email
4.3 — The Privacy Trick (Noreply Email)
Why: Your real Gmail appears on every commit forever, visible publicly.

How:

Go to GitHub → Settings → Emails

Enable "Keep my email addresses private"

Copy the noreply email GitHub shows you

Use that for git config --global user.email

Format: 12345678+your-username@users.noreply.github.com

4.4 — The --global Flag
Level	Scope
--global	All repos on this machine
--local (default)	Only one repo
Personal laptop: use --global.
Office/shared machine: use --local per repo.

Example (local, per repo):

bash
cd ~/devops/my-project
git config user.name "your-username"
git config user.email "12345678+your-username@users.noreply.github.com"
4.5 — Recommended Setup
Tool	Purpose
VS Code	Best free editor, great Git integration
Git Bash	Linux-style terminal on Windows
GitHub account	Your cloud home
Bonus: Install the GitLens extension in VS Code for inline Git info.

📸 Snapshot — Setup Verified
text
$ git --version
git version 2.xx.x.windows.1

$ git config --global user.name
your-username

$ git config --global user.email
12345678+your-username@users.noreply.github.com
5. The Daily Loop
🎯 The One-Liner
edit → status → add → commit → push. Every day.

📖 The Five Commands
Command	What it does	Analogy
git status	Shows what changed	Dashboard
git add <file>	Stage file	Put in cart
git commit -m "msg"	Take snapshot	Take photo
git push	Send to GitHub	Upload
git pull	Get from GitHub	Download
📖 Command Deep-Dives
git status
bash
git status
Legend:

🔴 Red "modified" → changed but not staged

🟢 Green "to be committed" → staged, ready

❓ "Untracked files" → Git never seen these

✅ "working tree clean" → nothing to commit

git add <file>
bash
git add README.md      # one file
git add .              # all changed files
git add *.py           # all Python files
Silent on success.

git commit -m "message"
bash
git commit -m "add user login feature"
Anatomy:

text
[main abc1234] add user login feature
 1 file changed, 5 insertions(+), 2 deletions(-)
Good messages:

✅ "fix login redirect loop"

✅ "add Dockerfile for backend"

❌ "fix"

❌ "changes"

Why messages matter: In 6 months, git log is your memory.

git push
bash
git push
First-time push of a new branch:

bash
git push -u origin branch-name
git pull
bash
git pull
When: Every morning, before starting work.

📊 The Full Cycle
text
   Edit files
       ↓
   git status
       ↓
   git add
       ↓
   git commit
       ↓
   git push
💡 Real-World Scenario
Fix a bug in a config file:

Edit in VS Code

git status → shows modified

git add config.yaml

git commit -m "fix broken DB port"

git push

Time: 30 seconds. Value: permanent record.

6. History & Inspection
🎯 The One-Liner
git log shows the story. git show shows the detail.

📖 Commands
git log
bash
git log                    # full history
git log --oneline          # one line per commit
git log --graph --all      # visual branch diagram
git log --oneline -5       # last 5
git log --oneline README.md  # only commits touching this file
Full output example:

text
commit abc1234567890...
Author: your-username <12345678+your-username@users.noreply.github.com>
Date:   Wed Oct 7 18:27:16 2026 +0530

    Initial commit
One-line output:

text
abc1234 (HEAD -> main, origin/main) update README
def5678 Initial commit
Press q to exit the pager.

git show
bash
git show              # latest commit
git show abc1234      # specific commit
Shows: commit metadata + full diff.

Diff legend:

+ (green) = lines added

- (red) = lines removed

📊 Reading the Log Output
text
abc1234 (HEAD -> main, origin/main, origin/HEAD) update README
Part	Meaning
abc1234	Short hash
HEAD -> main	You are here, on main
origin/main	GitHub's main is at same commit
origin/HEAD	GitHub's default branch
If origin/main is behind → you have unpushed commits.
If origin/main is ahead → you need to git pull.

7. Branching
🎯 The One-Liner
A branch is a parallel version of your project where you experiment freely.

📖 Why Branches Exist
Without branches:

Every change goes to main

Break something → everyone's broken

Two people editing = chaos

With branches:

Each feature gets its own branch

main stays stable

Merge when ready

📖 Commands
bash
git branch                    # list
git branch feature-name       # create (no switch)
git switch -c feature-name    # create + switch ⭐
git switch branch-name        # switch
git branch -d branch-name     # safe delete
git branch -D branch-name     # force delete
git branch -a                 # list local + remote
📊 Visual
text
                 main
                  │
       A ─── B ─── C
                    \
                     D ─── E
                          ↑
                    feature-branch
💡 Naming Convention
Bad	Good
test	add-login-test
fix	fix-null-pointer-crash
My Changes	update-readme-setup
Rules: lowercase, hyphens, descriptive, short.

8. Merging
🎯 The One-Liner
Merge = bring one branch's changes into another.

📖 The Command
bash
git switch main           # 1. go to receiving branch
git merge feature-name    # 2. bring feature in
Order matters. You must be on the branch that receives the changes.

📖 The Two Kinds
Fast-forward (easy)
text
Before:  main:    A ─ B
                        \
              feature:   C ─ D

After:   main:    A ─ B ─ C ─ D
Output: Updating abc123..def456 + Fast-forward

Three-way merge (creates merge commit)
text
Before:  main:    A ─ B ─ C
                        \
              feature:   D ─ E

After:   main:    A ─ B ─ C ─ M
                        \     /
              feature:   D ─ E
Output: Merge made by the 'ort' strategy.

📖 After Merging
bash
git branch -d feature-name    # delete merged branch
git push                      # push merge to GitHub
9. Merge Conflicts
🎯 The One-Liner
A conflict is Git asking: "Both branches changed the same line. Which do you want?"

📖 What Causes a Conflict
Different branches

Same file

Same line

Different content

Git can't guess. So it asks you.

📖 What Git Writes
text
<<<<<<< HEAD
Author: main-version
=======
Author: branch-version
>>>>>>> conflict-test
Legend:

Marker	Meaning
<<<<<<< HEAD	Start of your version
=======	Divider
>>>>>>> branch	End of their version
📖 How to Resolve
Open the file in VS Code

Choose:

Keep your version → delete their block + markers

Keep their version → delete your block + markers

Keep both → combine and delete markers

Save the file

Stage it: git add <file>

Commit: git commit -m "resolve conflict"

📸 Error Snapshot — What a Conflict Looks Like
text
$ git merge conflict-test
Auto-merging README.md
CONFLICT (content): Merge conflict in README.md
Automatic merge failed; fix conflicts and then commit the result.
Your prompt changes to (main|MERGING) — signaling you're mid-merge.

💡 The Secret
Conflicts are not errors. They're requests for a decision. Git asks humans when it can't decide. Calmly deciding = resolving.

10. .gitignore
🎯 The One-Liner
Tells Git: "Pretend these files don't exist."

📖 Why It Exists
Files that should never be committed:

Type	Why
.env, secrets.txt	Contain passwords/API keys
*.log	Huge, changes constantly
node_modules/	100,000+ files, re-creatable
__pycache__/, .venv/	Build artifacts
Thumbs.db, .DS_Store	OS junk
*.sqlite	Local databases
📖 How to Create
bash
echo "*.log" > .gitignore
echo "secrets.txt" >> .gitignore
echo "*.env" >> .gitignore
echo "node_modules/" >> .gitignore
Verify:

bash
cat .gitignore
Output:

text
*.log
secrets.txt
*.env
node_modules/
📖 Pattern Cheat Sheet
Pattern	Ignores
*.log	All .log files
secrets.txt	That one file
*.env	All .env files
node_modules/	Whole folder
!important.log	Exception (do NOT ignore)
/build	build/ at repo root only
**/temp	temp folder anywhere
📸 Before/After
Before:

text
$ git status
Untracked files:
        app.log
        secrets.txt
After adding .gitignore:

text
$ git status
Untracked files:
        .gitignore
Two files vanished from Git's view.

⚠️ Golden Rule
Once a file is committed, .gitignore won't untrack it. You must:

bash
git rm --cached secrets.txt
Then add to .gitignore.

💡 Real-World Warning
You build a Django app. .env has the DB password. You forget .gitignore. You push. The password is now public forever — bots scan new repos in seconds. Worst case: DB compromised.

Always add .gitignore first. Every project.

11. Syncing
🎯 The One-Liner
push uploads. pull downloads. fetch peeks.

📖 The Three Commands
Command	Direction	Effect
git push	Local → GitHub	Upload commits
git pull	GitHub → Local	Download + apply
git fetch	GitHub → Local	Download only
📖 fetch vs pull
fetch = "Ask GitHub what's new. Download it. Don't touch my files."

pull = "Fetch, then merge immediately."

git pull = git fetch + git merge origin/main

📖 The Workflow
Morning:

bash
git switch main
git pull
Start work:

bash
git switch -c new-feature
# edit, commit
git push -u origin new-feature
End of day:

bash
git switch main
git pull
git push
📸 Snapshot — After Pull
text
$ git pull
remote: Enumerating objects: 5, done.
Unpacking objects: 100% (3/3), done.
From https://github.com/user/repo
   abc1234..def5678  main       -> origin/main
Updating abc1234..def5678
Fast-forward
 README.md | 1 +
 1 file changed, 1 insertion(+)
Reading it:

abc1234..def5678 = moved from old to new commit

Fast-forward = clean merge

README.md | 1 + = one line added

📖 git pull --rebase (Advanced)
Instead of a merge commit, replays your commits on top. Cleaner history. Skip until comfortable.

12. Undo Commands
🎯 The One-Liner
Three tools: restore (files), reset (commits), revert (pushed commits).

📖 Command Matrix
Situation	Command	Dangerous?
Discard uncommitted changes	git restore <file>	⚠️ Loses work
Unstage a file	git restore --staged <file>	Safe
Undo last commit, keep staged	git reset --soft HEAD~1	Safe (local only)
Undo last commit, keep unstaged	git reset HEAD~1	Safe (local only)
Undo last commit + wipe changes	git reset --hard HEAD~1	🔴 Dangerous
Undo pushed commit	git revert HEAD	Safe
📖 Deep-Dives
git restore <file>
Throw away changes in a file:

bash
git restore README.md
⚠️ Uncommitted changes lost forever.

git restore --staged <file>
Unstage a file:

bash
git restore --staged README.md
git reset --soft HEAD~1
Undo last commit, keep changes staged:

bash
git reset --soft HEAD~1
Commit disappears. Changes staged.

git reset --hard HEAD~1
Nuke the commit AND its changes:

bash
git reset --hard HEAD~1
🔴 All changes in that commit gone forever.

git revert HEAD
Create a new commit that undoes another:

bash
git revert HEAD
git revert abc1234
Output:

text
[main def5678] Revert "bad commit"
 1 file changed, 1 deletion(-)
Safe for pushed commits.

📊 reset vs revert
reset (rewrites history):

text
Before:  A ─ B ─ C ─ D
After:   A ─ B ─ C
revert (adds new commit):

text
Before:  A ─ B ─ C ─ D
After:   A ─ B ─ C ─ D ─ E
💡 Golden Rules
If the commit is...	Use...
Only on your laptop	reset
Already on GitHub	revert
13. Pull Requests
🎯 The One-Liner
A PR is a formal "please review my changes before merging to main."

📖 The Team Workflow
Rule: Never push directly to main. Always through a PR.

Why:

Code review catches bugs

Discussion before merge

Audit trail

CI/CD runs automatically

📖 The Full Workflow
bash
# 1. Create branch
git switch -c add-skills-section

# 2. Make changes
echo "## Skills" >> README.md
git add README.md
git commit -m "add skills section"

# 3. Push branch
git push -u origin add-skills-section
GitHub says:

text
remote: Create a pull request for 'add-skills-section' on GitHub by visiting:
remote:      https://github.com/USER/REPO/pull/new/add-skills-section
4. Open the link in browser.

5. Fill in:

Title (descriptive)

Description (why + what)

6. Click "Create pull request".

7. Review page shows tabs: Conversation, Commits, Files changed.

8. Click "Merge pull request" → "Confirm merge".

9. Delete branch on GitHub (optional cleanup).

10. Sync your laptop:

bash
git switch main
git pull
git branch -d add-skills-section
git fetch --prune
📸 Snapshot — After PR Merge
text
$ git log --oneline -3
abc1234 (HEAD -> main, origin/main) Merge pull request #1 from user/add-skills-section
def5678 add skills section to README
ghi9012 Revert "bad commit"
Two commits from your PR:

def5678 = your change

abc1234 = merge commit

📊 The PR Lifecycle
text
Branch → Push → PR → Review → Merge → Delete → Sync
💡 Why It Matters in DevOps
CI/CD pipelines trigger on PRs (tests, lint, security scan)

GitOps (ArgoCD, Flux) deploys via PRs

Compliance requires PR approval

Recruiters check your PRs for collaboration skills

🎓 Interview Prep
Be ready to answer:

"What's a pull request?"

"How do you handle a PR that breaks tests?"

"Merge commit vs squash merge — what's the difference?"

14. Common Errors & Fixes
❌ Error 1: "not a git repository"
Message:

text
fatal: not a git repository (or any of the parent directories): .git
Cause: Not inside a Git repo.

Fix:

bash
cd ~/devops/your-repo
Lesson: Every new terminal session starts at home. cd into the repo first.

❌ Error 2: "Permission denied"
Message:

text
mkdir: cannot create directory '/devops': Permission denied
Cause: /devops (starting with /) is at filesystem root — a privileged location.

Fix:

bash
mkdir -p ~/devops
Lesson: ~ = home. / = root. Different worlds.

❌ Error 3: Merge was fast-forward instead of conflict
Expected: CONFLICT
Got: Fast-forward

Cause: Branch was created after main's last commit — no divergence.

Fix: Ensure both branches have their own unique commits touching the same line.

Lesson: Conflicts require divergence.

❌ Error 4: Duplicate line in file
Cause: echo ... >> file was run twice. >> appends every time.

Fix: Open file, delete the duplicate.

Lesson: >> appends. > overwrites.

❌ Error 5: "git logs" is not a command
Message:

text
git: 'logs' is not a git command. See 'git --help'.
Cause: Typo. It's log.

Fix:

bash
git log --oneline
❌ Error 6: LF will be replaced by CRLF
Warning:

text
warning: in the working copy of 'README.md', LF will be replaced by CRLF
Cause: Windows uses CRLF (\r\n), Linux uses LF (\n). Git handles automatically.

Fix: Ignore. Not an error.

❌ Error 7: Authentication popup on first push
Cause: First-time auth from new machine.

Fix: Click "Sign in with your browser" → authorize. Once.

❌ Error 8: Push rejected
Message:

text
! [rejected] main -> main (fetch first)
error: failed to push some refs
Cause: GitHub has commits you don't.

Fix:

bash
git pull
# resolve conflicts if any
git push
15. Cheat Sheet
Setup
Command	Purpose
git --version	Check installed
git config --global user.name "name"	Set name
git config --global user.email "email"	Set email
Daily Loop
Command	Purpose
git status	See changes
git add <file>	Stage file
git add .	Stage all
git commit -m "msg"	Commit
git push	Send to GitHub
git pull	Get from GitHub
Branches
Command	Purpose
git branch	List
git branch <name>	Create
git switch <name>	Switch
git switch -c <name>	Create + switch
git branch -d <name>	Safe delete
git branch -D <name>	Force delete
git branch -a	List all
Merging
Command	Purpose
git merge <branch>	Merge into current
git merge --abort	Cancel conflicted merge
History
Command	Purpose
git log	Full history
git log --oneline	One-line
git log --graph --all	Visual branches
git log -5	Last 5
git show	Latest commit detail
git show <hash>	Specific commit
Undo
Command	Purpose
git restore <file>	Discard working changes
git restore --staged <file>	Unstage
git reset --soft HEAD~1	Undo commit, keep staged
git reset --hard HEAD~1	Undo + wipe
git revert HEAD	New commit that undoes last
Remote Sync
Command	Purpose
git remote -v	Show remotes
git fetch	Download only
git fetch --prune	Clean stale refs
git push	Push commits
git push -u origin <branch>	Push new + track
git pull	Fetch + merge
PR Workflow
Step	Action
1	git switch -c feature-name
2	Edit + git add + git commit
3	git push -u origin feature-name
4	Open PR on GitHub
5	Review + merge
6	git switch main && git pull
7	git branch -d feature-name
8	git fetch --prune
16. Real-World Scenarios
🎬 Scenario 1: The Bug Hunter
Situation: Service broke. Find what changed.

bash
git log --oneline -20
git show <suspect-hash>
git log --oneline -- config/
Found the bad commit?

bash
git revert <bad-hash>
git push
🎬 Scenario 2: The Feature Builder
Situation: Add a feature without breaking main.

bash
git switch -c feature-user-auth
# write code
git add .
git commit -m "add user authentication"
git push -u origin feature-user-auth
Open PR on GitHub. Team reviews. Merge.

🎬 Scenario 3: The Secret Leaker (Avoid!)
Mistake: Committed .env with AWS keys. Pushed to public GitHub.

Fix (within 60 seconds):

bash
git rm --cached .env
echo ".env" >> .gitignore
git add .gitignore
git commit -m "remove .env and add to gitignore"
git push
⚠️ Rotate AWS keys immediately. Keys stay in history even after deletion.

🎬 Scenario 4: Rejected Push
Situation:

text
! [rejected] main -> main (fetch first)
Fix:

bash
git pull
git push
🎬 Scenario 5: "I Broke Everything"
Situation: Local mess. Want to reset to GitHub's version.

bash
git fetch origin
git reset --hard origin/main
⚠️ Loses all uncommitted work.

🎬 Scenario 6: Undo After Push
Situation: You pushed a bug. Everyone sees it.

bash
git revert HEAD
git push
A new "Revert..." commit appears. Bug fixed. History preserved.

🎓 Final Words
You've gone from "What is Git?" to handling merge conflicts, undo commands, and PRs.

That's more Git than 90% of people who claim to know Git.

📚 What Comes Next
After Git, DevOps engineers learn:

Linux — the environment

Bash scripting — automation

Docker — containers

CI/CD — pipelines

Kubernetes — orchestration

Terraform — IaC

Monitoring — Prometheus + Grafana

Git is the foundation. Everything builds on it.

🔑 Golden Rules
git status before every command

Commit messages matter — write for future-you

Branch before experimenting

Pull before starting work, push when done

Never commit secrets — .gitignore first

Conflicts aren't errors — they're decisions

Local mistakes → reset. Pushed mistakes → revert

💪 Final Note
The best Git users aren't the ones who never make mistakes. They're the ones who fix them calmly. After this handbook, that's you.