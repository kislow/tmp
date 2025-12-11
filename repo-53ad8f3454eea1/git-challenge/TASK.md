# 📄 **TASK.md (Updated With Merge Requests)**

## Git Collaboration Challenge

Three participants. Three branches. One main branch that will suffer.

All of you will edit the SAME files in DIFFERENT ways, open Merge Requests,
review each other's work, and then resolve the merge conflicts when merging
everything into `main`.

---

## ✅ Task Steps

### 1. Clone the repository

```sh
git clone <repo-url>
cd <repo>
```

---

### 2. Create your own feature branch

- Participant 1 → `feature-p1`
- Participant 2 → `feature-p2`
- Participant 3 → `feature-p3`
- Participant 4 → `feature-p4`
- Participant 5 → `feature-p5`

---

### 3. Edit ALL of these files (in the WORK AREA sections)

- `scripts/backup.sh`
- `scripts/cleanup.sh`
- `scripts/report.sh`
- `scripts/healthcheck.sh`
- `scripts/rotate_logs.sh`
- `README.md`

**NOTE:** Each participant must apply **different edits** to each file.

---

### 4. Commit & push your branch

**IMPORTANT:** Test script before pushing, scripts should be executable and working!

---

## 🔀 5. Create a Merge Request (Pull Request)

- Create a **Merge Request / Pull Request** from your branch into `main`
- Add a short description of what you changed
- Assign it to another participant for review

All 5 participants must:

- Create their own PR
- Optional: Approve PR (Each PR requires 2 Approvers)

---

## 🔁 6. Merge the branches into main (one by one)

**IMPORTANT:**
Each merge will create conflicts — this is the challenge.

In GitHub/GitLab:

1. Open PR → Click *Merge*
2. When conflicts appear → *Resolve conflicts*
3. Combine everyone’s changes cleanly
4. Commit the conflict resolution

---

## 🧩 7. After all merges, pull the updated main branch locally

```sh
git checkout main
git pull
```

---

## 🧪 8. Test all scripts

```sh
bash scripts/backup.sh
bash scripts/cleanup.sh
bash scripts/report.sh
bash scripts/healthcheck.sh
bash scripts/rotate_logs.sh
```

Scripts must run cleanly after merging all 5 participants' changes.

---

## 🏁 Success Criteria

You are DONE when:

- All 5 merge requests are merged into `main`
- All merge conflicts were resolved correctly
- Final scripts contain **everyone’s contributions**
- No conflict markers remain (`<<<<<<<`, `=======`, `>>>>>>>`)
- All scripts run successfully
