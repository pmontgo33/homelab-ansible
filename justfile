ap host tags="all":
  ansible-playbook playbooks/host_{{host}}.yml --tags "{{tags}}"

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

tf-init host:
  cd terraform/{{host}} && terraform init

tf-apply host:
  cd terraform/{{host}} && terraform apply

tf-destroy host:
  cd terraform/{{host}} && terraform destroy

do-ssh-keys token:
  nix-shell -p doctl --run "doctl -t {{token}} compute ssh-key list"
