ap host:
  ansible-playbook playbooks/host_{{host}}.yml

av-edit-vars:
  ansible-vault edit playbooks/vars/homelab_secret_vars.yml

reqs:
  ansible-galaxy install -r requirements.yml

git-acpush message:
  git add .
  git commit -m "{{message}}"
  git push origin master

git-cpush message:
  git commit -m "{{message}}"
  git push origin master

git-rpull remote:
  ssh root@{{remote}} "cd /etc/nixos && git pull https://github.com/pmontgo33/nixos-config.git"

# this is a comment
another-recipe:
  @echo 'This is another recipe.'