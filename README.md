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

## Capturas de funcionamiento.
<img width="635" height="333" alt="Captura de pantalla 2025-10-27 185645" src="https://github.com/user-attachments/assets/c0c520a8-79da-4159-a813-d2ffa5b7d208" />
<img width="744" height="316" alt="Captura de pantalla 2025-10-27 185636" src="https://github.com/user-attachments/assets/6013b147-4af9-41e6-ad8f-1e53c5dce34f" />
<img width="877" height="510" alt="Captura de pantalla 2025-10-27 185620" src="https://github.com/user-attachments/assets/deea013f-9295-4fcf-9df6-2a60485d87b7" />
<img width="1042" height="467" alt="Captura de pantalla 2025-10-27 185605" src="https://github.com/user-attachments/assets/6912f1e0-e74c-45a1-baea-afab76601caa" />

<img width="1042" height="467" alt="Captura de pantalla 2025-10-27 185605" src="https://github.com/user-attachments/assets/cf86d86b-1695-47de-bf9e-4d21baecfd33" />
<img width="635" height="333" alt="Captura de pantalla 2025-10-27 185645" src="https://github.com/user-attachments/assets/df504af6-5782-4457-a5fd-899bd813bfe5" />
<img width="744" height="316" alt="Captura de pantalla 2025-10-27 185636" src="https://github.com/user-attachments/assets/1bcac68e-6fdc-4990-881f-01ab0451d516" />
<img width="877" height="510" alt="Captura de pantalla 2025-10-27 185620" src="https://github.com/user-attachments/assets/91327757-bbd2-4d6b-b47d-6e3ead4cc27c" />

<img width="877" height="510" alt="Captura de pantalla 2025-10-27 185620" src="https://github.com/user-attachments/assets/14e6d658-c9d7-44f2-9be9-5aa941325221" />
<img width="1042" height="467" alt="Captura de pantalla 2025-10-27 185605" src="https://github.com/user-attachments/assets/a9a7db1b-579f-4805-ba7e-e0e37c6035e4" />
<img width="635" height="333" alt="Captura de pantalla 2025-10-27 185645" src="https://github.com/user-attachments/assets/dc8ebad4-b940-4195-8451-83179b093baf" />
<img width="744" height="316" alt="Captura de pantalla 2025-10-27 185636" src="https://github.com/user-attachments/assets/617b9e60-92af-49d9-9785-40e60fe2ed65" />

<img width="744" height="316" alt="Captura de pantalla 2025-10-27 185636" src="https://github.com/user-attachments/assets/6336900a-edd4-4bfd-8117-ed8a5a59f05b" />
<img width="877" height="510" alt="Captura de pantalla 2025-10-27 185620" src="https://github.com/user-attachments/assets/ac304936-0eb6-4265-963c-e24ad8c57c92" />
<img width="1042" height="467" alt="Captura de pantalla 2025-10-27 185605" src="https://github.com/user-attachments/assets/e562cf58-0b31-4aea-9a0c-cf40dd8c9436" />
<img width="635" height="333" alt="Captura de pantalla 2025-10-27 185645" src="https://github.com/user-attachments/assets/18056ceb-b71e-4dd0-be86-99ee0a72d57c" />

