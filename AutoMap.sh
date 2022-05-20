#!/bin/bash

echo "

    |                .           '||    ||'                  
   |||    ... ...  .||.    ...    |||  |||   ....   ... ...  
  |  ||    ||  ||   ||   .|  '|.  |'|..'||  '' .||   ||'  || 
 .''''|.   ||  ||   ||   ||   ||  | '|' ||  .|' ||   ||    | 
.|.  .||.  '|..'|.  '|.'  '|..|' .|. | .||. '|..'|'  ||...'  
                                                     ||      
{ Developed by Th3 BlackHol3 }                      ''''     
https://twitter.com/Th3BlackHol3_
"

while getopts ":d:" input;do
        case "$input" in
                d) domain=${OPTARG}
                        ;;
                esac
        done
if [ -z "$domain" ]     
        then
                echo "Please Give Domain or IP like \"-d domainname.com\" or IP \"-d 192.168.0.1\""
                echo "Disclaimers: This tool is only for Security Researchers and Cyber Security Students, Do Not Use it in any illegal activities!!"
                exit 0
fi

mkdir AutoMap_Data
cd AutoMap_Data
echo "Disclaimers: This tool is only for Security Researchers and Cyber Security Students, Do Not Use it in any illegal activities!!"
echo "AutoMap is Starting..."
echo "Note: Results will save as txt file in /AutoMap_Data/ folder."
nmap $domain | tee -a basic1.txt
nmap -vv $domain | tee -a verbosity.txt
nmap -sS $domain | tee -a tcp.txt
nmap -sU $domain | tee -a udp.txt
echo "This process may take time... \"Intensity 9\""
nmap -sV --version-intensity 9 $domain | tee -a version.txt
nmap -sC $domain | tee -a scr.txt
nmap -O $domain | tee -a os.txt
echo "This process may take time... \"65535 Ports are scanning...\""
nmap -A -f -p 1-65535 -v $domain | tee -a ports+arg.txt
echo "This process may take long time... \"Scripting Engines are started!\""
nmap --script=dns* $domain | tee -a sc_dns.txt
nmap --script=dns-zone-transfer.nse $domain | tee -a sc_dnszonetr.txt
nmap --script=fingerprint-strings.nse $domain | tee -a sc_finpri.txt
nmap --script=firewalk.nse $domain | tee -a sc_firewalk.txt
nmap --script=firewall-bypass.nse $domain | tee -a sc_firepass.txt
echo "Chill! You can take 10 cups of coffee..."
nmap --script=ftp* $domain | tee -a sc_ftp.txt
nmap --script=http* $domain | tee -a sc_http.txt
nmap --script=maxdb-info.nse $domain | tee -a sc_maxdb.txt
nmap --script=metasploit* $domain | tee -a sc_metasploit.txt
nmap --script=ms* $domain | tee -a sc_ms.txt
nmap --script=mysql* $domain | tee -a sc_mysql.txt
nmap --script=oracle* $domain | tee -a sc_oracle.txt
nmap --script=pop3* $domain | tee -a sc_pop3.txt
nmap --script=samba-vuln-cve-2012-1182.nse $domain | tee -a sc_samba.txt
echo "Don't be so angry, Good Things Take Time..."
nmap --script=smb* $domain | tee -a sc_smbs.txt
nmap --script=smb2* $domain | tee -a sc_smb2.txt
nmap --script=smtp* $domain | tee -a sc_smtps.txt 
nmap --script=snmp* $domain | tee -a sc_snmps.txt
nmap --script=ssh* $domain | tee -a sc_ssg.txt
nmap --script=ssh2-enum-algos.nse $domain | tee -a sc_ssh2.txt
nmap --script=sshv1.nse $domain | tee -a sc_sshv1.txt
nmap --script=telnet-brute.nse $domain | tee -a sc_telbrute.txt
nmap --script=telnet-encryption.nse $domain | tee -a sc_telexcrypt.txt
nmap --script=telnet-ntlm-info.nse $domain | tee -a sc_ntlm.txt
nmap -sV --script vulners $domain | tee -a sc_vulners.txt
nmap -sV --script vuln $domain | tee -a sc_vulns.txt

echo "| AutoMapping Accomplished | Respect Hackers | Happy Hacking! | Peace! |"
