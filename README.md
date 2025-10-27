# Taller Vagrant + Provisionamiento con Shell

Repositorio del taller (fork de jmaquin0) realizado por **danielojedav19**.  
Se crean 2 VMs (web y db) con **Vagrant + VirtualBox** y se provisionan con **Shell**.

## Topologia e IPs
- **web**: 192.168.56.10 (Ubuntu 20.04)  Apache2 + PHP 7.4 + `php-pgsql`
- **db** : 192.168.56.11 (Ubuntu 20.04)  PostgreSQL 12 (BD `demoapp`, user `demo`/`demo123`)
- Red privada: `192.168.56.0/24`

## Requisitos en el host
- VirtualBox, Vagrant, Git (en Windows: instalar y reiniciar).

## Como ejecutar
```bash
git clone https://github.com/danielojedav19/vagrant-web-provisioning.git
cd vagrant-web-provisioning
vagrant up db
vagrant up web
# Reprovisionar si editas scripts:
vagrant provision db
vagrant provision web

