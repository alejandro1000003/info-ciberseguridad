---
tags:
  - nmap
  - cheatsheet
---

## Host discovery

### Escaneo ARP  

-  Escaneo ARP para descubrir hosts en la red local
```
nmap -PR [dirección de red/máscara]
```
-  Escaneo ARP avanzado para descubrir hosts en la red local
```
nmap -PR -sn [dirección de red/máscara]
```
-  Escaneo ARP para descubrir hosts en una subred específica
```
nmap -PR [subred]
```
### Escaneo ICMP

- Escaneo de la red 192.168.1.0/24 con mensaje ICMP Echo:
```
nmap -PE 192.168.1.0/24
```
- Escaneo de la red 192.168.1.0/24 con mensaje ICMP Address Mask:
```
nmap -PM 192.168.1.0/24
```
- Escaneo de la red 192.168.1.0/24 con mensaje ICMP Timestamp:
```
nmap -PP 192.168.1.0/24
```
### Escaneo TCP/UDP

- TCP SYN Ping
```bash
nmap -sP <dirección_IP>
```
- TCP ACK Ping
```bash
nmap -PA <dirección_IP>
```
- UDP Ping
```bash
nmap -sU -p 137 <dirección_IP>
```
### Reverse-DNS

Nmap’s default behaviour is to use reverse-DNS online hosts. Because the hostnames can reveal a lot, this can be a helpful step. However, if you don’t want to send such DNS queries, you use `-n` to skip this step.

By default, Nmap will look up online hosts; however, you can use the option `-R` to query the DNS server even for offline hosts. If you want to use a specific DNS server, you can add the `--dns-servers DNS_SERVER` option.

## Escaneo de puertos básico

Estados en los que puede estar un puerto
1. **Open**: indicates that a service is listening on the specified port.
2. **Closed**: indicates that no service is listening on the specified port, although the port is accessible. By accessible, we mean that it is reachable and is not blocked by a firewall or other security appliances/programs.
3. **Filtered**: means that Nmap cannot determine if the port is open or closed because the port is not accessible. This state is usually due to a firewall preventing Nmap from reaching that port. Nmap’s packets may be blocked from reaching the port; alternatively, the responses are blocked from reaching Nmap’s host.
4. **Unfiltered**: means that Nmap cannot determine if the port is open or closed, although the port is accessible. This state is encountered when using an ACK scan `-sA`.
5. **Open|Filtered**: This means that Nmap cannot determine whether the port is open or filtered.
6. **Closed|Filtered**: This means that Nmap cannot decide whether a port is closed or filtered.

[[Paquete TCP]]
