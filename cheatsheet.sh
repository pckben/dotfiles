# CONDA

conda create --name myenv python=3.7
conda activate myenv
conda env export > one.yml
pip freeze > requirements.txt
conda deactivate

# GitHub CLI
wget https://github.com/cli/cli/releases/download/v0.6.2/gh_0.6.2_linux_amd64.deb
sudo dpkg -i gh_0.6.2_linux_amd64.deb

# gh pr [status, list, view, checkout, create]
# gh issue [status, list, view, create]
# gh repo [view, create, clone, fork]
# gh help
