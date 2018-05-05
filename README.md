# ArchStrike for Docker

## Using ArchStrike in Docker
`docker run -it archstrike/archstrike`

## More info
For more info about ArchStrike like finding and installing packages, reporting bugs, and contributing please check out https://archstrike.org/wiki

## Example Usage
```
$ docker run -it archstrike/archstrike
Unable to find image 'archstrike/archstrike:latest' locally
latest: Pulling from archstrike/archstrike
dafee9058535: Pull complete 
7251e7690d3a: Pull complete 
a33eee74003e: Pull complete 
6b7810407218: Pull complete 
906f652a1199: Pull complete 
Digest: sha256:fa029b68ae7490f960bc5227dc0aa172502eb696d3992db3ee06fbceb583bc79
Status: Downloaded newer image for archstrike/archstrike:latest
[root@42ad988b04e1 /]# pacman -Syyu
:: Synchronizing package databases...
 core                                                             129.7 KiB  1081K/s 00:00 [#####################################################] 100%
 extra                                                           1596.8 KiB  8.08M/s 00:00 [#####################################################] 100%
 community                                                          4.3 MiB  6.10M/s 00:01 [#####################################################] 100%
 multilib                                                         171.1 KiB  2.29M/s 00:00 [#####################################################] 100%
 archstrike                                                       833.0 KiB  2.83M/s 00:00 [#####################################################] 100%
:: Starting full system upgrade...
 there is nothing to do
[root@42ad988b04e1 /]# pacman -Ss archstrike xss
archstrike/brutexss-git 20161123.r54-2 (archstrike archstrike-exploit archstrike-webapps)
    Cross-Site Scripting BruteForcer
archstrike/mosquito-git 20140320.r39-3 (archstrike archstrike-mitm)
    A XSS exploitation tool allowing an attacker to set up a HTTP proxy and leverage XSS to issue arbitrary HTTP requests through victim browser (and
    victim cookies).
archstrike/paros 3.2.13-3 (archstrike archstrike-webapps)
    Java-based HTTP/HTTPS proxy for assessing web app vulnerabilities. Supports editing/viewing HTTP messages on-the-fly, spiders, client certificates,
    proxy-chaining, intelligent scanning for XSS and SQLi, etc.
archstrike/powerfuzzer 1_beta-4 (archstrike archstrike-fuzzers)
    A highly automated web fuzzer based on many other Open Source fuzzers available (incl. cfuzzer, fuzzled, fuzzer.pl, jbrofuzz, webscarab, wapiti,
    Socket Fuzzer). It can detect XSS, Injections (SQL, LDAP, commands, code, XPATH) and others.
archstrike/wapiti 2.3.0-5 (archstrike archstrike-webapps archstrike-scanners archstrike-fuzzers)
    A vulnerability scanner for web applications. It currently search vulnerabilities like XSS, SQL and XPath injections, file inclusions, command
    execution, LDAP injections, CRLF injections...
archstrike/xsscrapy-git 20161111.r138.f859faa-2 (archstrike archstrike-webapps archstrike-scanners)
    xss spider
archstrike/xsser-git r31.4a55fc8-2 (archstrike archstrike-webapps archstrike-fuzzers archstrike-exploit)
    A penetration testing tool for detecting and exploiting XSS vulnerabilites.
archstrike/xssless-git r45.8e7ebe1-3 (archstrike)
    An automated XSS payload generator written in python.
archstrike/xsspy-git 20170418.r50-1 (archstrike archstrike-scanners)
    A python tool for finding Cross Site Scripting vulnerabilities in websites
archstrike/xsss 0.40b-5 (archstrike archstrike-webapps archstrike-bruteforce)
    brute force cross site scripting scanner
archstrike/xssscan-git r17.7f1ea90-1 (archstrike archstrike-webapps)
    Command line tool for detection of XSS attacks in URLs. Based on ModSecurity rules from OWASP CRS.
archstrike/xsssniper 0.9-3 (archstrike archstrike-webapps)
    An automatic XSS discovery tool
[root@42ad988b04e1 /]# 
```

# Special Thanks
A special thanks to haykuro [Steve Birstok] (https://hub.docker.com/r/haykuro/ && https://github.com/haykuro/) for this great idea and implementation!

Thanks to pritunl for his awesome Arch docker work (https://hub.docker.com/r/pritunl/archlinux/)
