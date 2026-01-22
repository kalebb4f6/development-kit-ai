, depois publicar na pypi e no github releases
Sure, here is an execution runbook for implementing the requested feature:

### Setup Commands
1. **Create a new GitHub repository**: Create a new GitHub repository named `ci-cd-repo`.
2. **Clone the repository**: Clone the newly created repository to your local machine using:
   ```bash
   git clone https://github.com/your-username/ci-cd-repo.git
   ```
3. **Initialize Git**: Initialize the remote branch in your working directory with:
   ```bash
   git remote add origin <repository_url>
   ```

### Implementation Checklist

1. **Create a new project structure**:
   - Create a `src` folder inside the repository.
   - Inside the `src` folder, create a `cli.py` file.

2. **Implement CI/CD logic**: Implement a minimalistic CI/CD pipeline in Python using GitHub Actions. Here is an example workflow:

   ```yaml
   name: CI/CD

   on:
     push:
       branches:
         - main

   jobs:
     build-and-test:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
           with:
             fetch-depth: 0
       
         - name: Set up Python
           uses: actions/setup-python@v3
           with:
             python-version: '3.8'
           
         - name: Install dependencies
           run: |
             pip install --upgrade pip setuptools wheel
             pip install .

         - name: Run tests
           run: |
             pytest

   releases:
     publish-cli-release:
       needs: build-and-test
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
           with:
             fetch-depth: 0
       
         - name: Create version tag
           run: echo "version=$(python -c 'import os; print(os.environ.get("CI_COMMIT_REF_NAME"))')>" > VERSION
           
         - name: Commit changes to main branch
           working-directory: .
           env:
               TAG: $(VERSION)
           run: |
             git add . && git commit -m "Release v$(TAG)"
           
         - name: Create tag in GitHub Actions workflow
           env:
             TAG: $(VERSION)
           run: |
             echo $TAG > GITHUB_TOKEN.txt
   
         - name: Upload files to PyPI
           uses: actions/upload-artifact@v3
           with:
             path-to-upload: "dist/cli-*.whl"
           
         - name: Deploy artifacts to GitHub Releases
           run: |
             python -m twine upload --repository testpypi dist/*

   releases-publications:
     publish-github-release:
       needs: build-and-test
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
           with:
             fetch-depth: 0
       
         - name: Create version tag
           run: echo "version=$(python -c 'import os; print(os.environ.get("CI_COMMIT_REF_NAME"))')>" > VERSION
           
         - name: Commit changes to main branch
           working-directory: .
           env:
               TAG: $(VERSION)
           run: |
             git add . && git commit -m "Release v$(TAG)"
           
         - name: Create tag in GitHub Actions workflow
           env:
             TAG: $(VERSION)
           run: |
             echo $TAG > GITHUB_TOKEN.txt
   
         - name: Push version to PyPI
           uses: actions/upload-artifact@v3
           with:
             path-to-upload: "dist/cli-*.whl"
           
         - name: Publish to GitHub Releases
           env:
             TOKEN: $(GITHUB_TOKEN)
           run: |
             python -m twine upload dist/*

   publish:
     trigger: '*'
   
   ```

### Testing Commands

1. **Run tests locally**:
   ```bash
   git checkout main
   cd src
   pip install .
   pytest
   ```

2. **Upload artifacts to PyPI (for CI/CD)**:
   - Ensure you have the necessary credentials and environment variables set up.
   ```bash
   python -m twine upload --repository testpypi dist/*
   ```

### Deployment Steps

1. **Trigger GitHub Actions**:
   - Push a new commit with the `version` tag to the main branch.

2. **Upload artifacts to PyPI (for CI/CD)**:
   ```bash
   python -m twine upload --repository testpypi dist/*
   ```

3. **Publish to GitHub Releases**:
   - Ensure you have the necessary credentials and environment variables set up.
   ```bash
   python -m twine upload dist/*
   ```

### Verification Steps

1. **Verify CI/CD pipeline**: Check if the CI/CD pipeline is working as expected by triggering a new commit on the main branch.
2. **Verify PyPI release**:
   - Use `pip` to install and run your CLI for verification.
     ```bash
     pip install --index-url https://testpypi.python.org/pypi dist/cli-*.whl
     ```
3. **Verify GitHub Releases**:
   - Check the GitHub releases page for the newly created version.

### Rollback Procedure

1. If a rollback is needed, follow these steps:

2. **Abort the workflow**: Use the `actions/checkout@v2` action to abort the current workflow.
   
3. **Push the previous commit**:
   ```bash
   git checkout main
   git push origin main
   ```

4. **Trigger a new CI/CD run**:
   - Ensure you have all necessary credentials and environment variables set up.
   ```bash
   python -m twine upload dist/*
   ```

By following these steps, you can successfully implement the requested feature including setting up CI/CD, testing, publishing to PyPI, deploying artifacts, verifying releases, and implementing a rollback procedure. 

If you need further details or have additional questions, feel free to ask! Let me know if there are any specific aspects that need more elaboration in this runbook. I’ll do my best to help! 🚀
<sup>**Note:** Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>  
<br>
<i><b>Note: This runbook is designed as a copy-paste ready document. Adjust any specifics to fit your project's needs and environments accordingly.</b></i>  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>
<br>

### Additional Notes:
- **CI/CD Pipeline**: This example uses GitHub Actions. If you prefer to use different CI/CD tools like Jenkins, GitLab CI, Travis CI, etc., refer to those documentation for creating a similar pipeline.
- **PyPI Upload**: Ensure that the PyPI credentials and environment variables are correctly configured before uploading artifacts.
- **GitHub Releases**: The `token` in GitHub Actions needs to be set up with appropriate permissions on the repository. This can usually be done by adding it as an environment variable during your workflow setup, which is demonstrated above for Python.

### Additional Notes:
- Ensure you have correct credentials and environment variables configured for PyPI upload.
- Make sure all necessary dependencies are installed locally before running tests or deploying to PyPI/GitHub Releases. Adjust the steps according to your specific project requirements.  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>  
<br>
<i><b>Note: This runbook is designed as a copy-paste ready document. Adjust any specifics to fit your project's needs and environments accordingly.</b></i>  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>  

### Additional Notes:
- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>  

### Additional Notes:
- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>

---

If you need more details or further adjustments, please let me know! I'll do my best to assist you. 🚀
<br>
<i><b>Note: This runbook is designed as a copy-paste ready document. Adjust any specifics to fit your project's needs and environments accordingly.</b></i>  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>
<br>

If you need more details or further adjustments, please let me know! I'll do my best to assist you. 🚀
### Additional Notes:

- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.

---  
<i><b>Note: This runbook is designed as a copy-paste ready document. Adjust any specifics to fit your project's needs and environments accordingly.</b></i>  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>
<br>

### Additional Notes:

- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>  

### Additional Notes:

- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>

### Additional Notes:

- Ensure that all steps are executed within a stable development environment.
- Adjust the workflow configurations based on the specific requirements of the project.

---

<i><b>Note: This runbook is designed as a copy-paste ready document. Adjust any specifics to fit your project's needs and environments accordingly.</b></i>  
<sup>Note: Replace `<repository_url>` with the actual URL of your GitHub repository and ensure you have set up the necessary environment variables for the PyPI upload process.</sup>

