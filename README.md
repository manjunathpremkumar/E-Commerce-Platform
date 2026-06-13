# E-Commerce Platform — Sample Infrastructure Repo

Dummy infrastructure files for testing the **Autonomous Optimization** Actions workflow (multi-file discover, apply, commit, PR).

## Push to GitHub

```bash
cd sample-git-repo
git init
git add .
git commit -m "Add sample helm, k8s, and terraform configs"
git branch -M main
git remote add origin https://github.com/YOUR_USER/E-Commerce-Platform.git
git push -u origin main
```

Or copy files into your existing repo root.

## Layout

```
values.yaml                          # Root helm values (legacy)
helm/
  login-service/values.yaml
  payment-service/values.yaml
  search-service/values.yaml
k8s/
  login-service/deployment.yaml
  login-service/hpa.yaml
terraform/
  main.tf
  variables.tf
  outputs.tf
  modules/login-service/main.tf
  modules/login-service/variables.tf
```

## Configure in app

1. **Edit Endpoints** → GitHub URL + classic `repo` token  
2. **Actions** → Pull from GitHub (discovers multiple files)  
3. **Apply Recommendation** → updates relevant files  
4. **Commit & Push** → single commit, multiple files  
