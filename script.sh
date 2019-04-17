#!/bin/bash
echo "Essecuzione Agent per CMDB"
echo "contattare SysAdmin per chiarimenti"
sleep 3 
#Montaggio unità virtuale NAS
sudo apt-get install -y cifs-utils #installa CIFS per mappare il File System
sudo mkdir TNI
sudo mount -t cifs -o password=Linx_$torage //10.0.0.10/tni TNI/      
#Questo percorso e una share sul NAS in Speronari, i permessi sono concessi 
#esclusivamente al owner.

#Permessi per l'agent / cambio directory

cd TNI/
chmod +x tnilinagent_x64

#lancio agent 

echo y | sudo ./tnilinagent_x64

#Spostamento file scansione

mv *.inv output/

sleep 3
echo RIMOZIONE CIFS..... 
#unmount file system

umount -a -t CIFS -l

#Delete LocalDir

cd

sudo rmdir TNI/


read -n 1 -s -r -p "Premere un tasto per continuare"






