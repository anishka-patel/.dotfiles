
# Table of Contents

1.  [Linux Fundamentals](#org5779c48)
    1.  [Bash Prompt Commands](#org230b6b7)
    2.  [Vim Style Bindings in terminal - Add `set -o vi` to `.bashrc` or `.bash-profile`](#orga266388)
    3.  [Package managers -](#org7adba52)
2.  [System access and file system](#org19e718a)
    1.  [File system structure](#org1d35d2e)
    2.  [Navigation](#orgfc4cc8a)
        1.  [Commands](#orgbea9d80)
        2.  [Aliases](#orge61ed59)
        3.  [File types](#orgac7b18c)
        4.  [File/Dir creation, cut, copy, remove](#org28f77f0)
        5.  [Finding files and directories](#org1efd9d4)
        6.  [Links](#orge9cf2a6)
        7.  [File permissions](#org8ce34aa)
        8.  [File ownership](#org53f07a7)
        9.  [Help commands](#orgfdc1510)
        10. [Input and output redirection](#org53bca82)
        11. [Pipes |](#orgd64a22f)
        12. [File display commands](#org7623449)
        13. [Filters/Processors commands](#orgb713dd9)
        14. [Compare files](#org70f8a09)
        15. [Compress/extract files](#orgba9388a)
        16. [Combine/split files](#org4a4ef75)
3.  [Linux System Administration](#org18cbb58)
    1.  [Linux file editor](#org83b3ce0)
    2.  [Linux stream editor `sed`](#org66e2c6d)
    3.  [User Account management](#orga4ef8bd)
        1.  [`useradd`](#org76cbe4f)
        2.  [`groupadd`](#orgd845071)
        3.  [`userdel`](#org612c1ff)
        4.  [`groupdel`](#org85f47fe)
        5.  [`usermod`](#org52c6e55)
        6.  [`chage`](#orgcd1405b)
        7.  [Files to know](#org19d633f)
        8.  [switch user](#org9c34687)
        9.  [Monitor users](#org61b979b)
        10. [Communication between users](#org2b7eb6d)
        11. [System utility commands](#org329bf91)
        12. [Process / service commands](#org3f0bc2f)
        13. [Job management](#org19fe542)
        14. [System monitoring](#org8d45271)
        15. [System management](#org019443d)
        16. [Terminal commands](#org0095e7a)
        17. [Special permissions](#org024f92b)
        18. [PATH and ENV](#org60e5c2f)
4.  [Bash and Shell Scripting](#org46f4810)
    1.  [Types of shells](#org2ab19ab)
    2.  [Shells entry and exit](#orgb7726e7)
    3.  [Shell scripting](#orgc6a3bc0)
        1.  [Components of shell script](#orgf456efe)
        2.  [Exit codes:](#org8203c06)
        3.  [Requirements:](#org6e91360)
        4.  [Variables and shell expansions:](#org99dfd4c)
        5.  [Bash command processing:](#org9e8d018)
        6.  [IO:](#org25e88cd)
        7.  [Branching logic:](#org71f9295)
        8.  [Looping logic;](#org391d22c)
        9.  [Arrays](#orga38005c)
        10. [Debugging](#org011c460)
        11. [Automation](#orgce2eb4b)
        12. [Remote connection](#orgdd6f5ed)
5.  [Linux Networking](#org41e9330)
    1.  [Network Management](#org796c56e)
        1.  [`ping`](#org09a407e)
        2.  [`ip`](#org85fca01)
        3.  [`netstat`](#org7155f4d)
        4.  [`route`](#orgc098a5c)
        5.  [`traceroute`](#orge066fda)
        6.  [`tcpdump`](#orge34c58e)
        7.  [`netstat`](#orgde73c19)
        8.  [`nmtui`](#orgacaa01c)
        9.  [`nmcli`](#orgbb484e7)
    2.  [Remote management](#org570cec8)
        1.  [`ssh`](#orgb1f2e77)
        2.  [`scp`](#org7e97e7a)
        3.  [`rsync`](#org46e977c)
        4.  [`sendmail`](#org5aaad33)
    3.  [Firewall](#orgf69bb0a)
        1.  [`ufw`](#orgacb6dab)
        2.  [`iptables`](#orge3a7b58)
    4.  [LDAP](#org6c2c361)
    5.  [NFS](#org61dd6f2)
    6.  [FTP](#org8192adb)
    7.  [HTTP](#org266b477)
    8.  [Linux Hardening](#org1a946d8)
    9.  [System performance](#org65035b3)
    10. [Containers](#org201c200)
    11. [Automate Linux Installation](#org9c85756)
    12. [DHCP](#org36ca3c3)
6.  [Disk Management](#org0c77742)
    1.  [Disk `mount`, `umount`](#org7cc4b10)
    2.  [Disk usage](#org08546fc)
    3.  [Disk partition](#orgeb380eb)
    4.  [Disk file system](#org64b96f2)
    5.  [Persistence `/etc/fstab`, `genfstab`](#org45db7a9)
    6.  [`mkswap`, `swapon`](#org4929770)
    7.  [LVM](#org572067b)
    8.  [RAID](#org6cfcfb1)
    9.  [NFS and SAMBA](#org367e398)
    10. [SATA vs SAS](#org882e99f)
7.  [Linux Services management](#orgfc5125e)
    1.  [Init. system `ststemd`](#orgd385d35)
    2.  [Run levels](#org29ac467)
    3.  [Service Management `systemctl`](#org3ec43f4)
    4.  [Hardware management](#org9411281)



<a id="org5779c48"></a>

# Linux Fundamentals


<a id="org230b6b7"></a>

## Bash Prompt Commands

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Commands</th>
<th scope="col" class="org-left">Action</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">^c (Ctrl - c)</td>
<td class="org-left">kill the process</td>
</tr>


<tr>
<td class="org-left">^z (Ctrl - z)</td>
<td class="org-left">suspend the process</td>
</tr>
</tbody>
</table>


<a id="orga266388"></a>

## Vim Style Bindings in terminal - Add `set -o vi` to `.bashrc` or `.bash-profile`


<a id="org7adba52"></a>

## Package managers -

-   `.deb` packages: apt, nala (Debian based distros)
-   `.snap` packages: snapd (Ubuntu based distros)
-   `.pacman` packages: pacman, yay(AUR) (Arch based distros)
-   `.rpm` packages: yum, dnf (Fedora based distros)
-   `.flatpak` packages: flatpak (\*) MoreInfo: [Flathub—An app store and build service for Linux](https://flathub.org/home)
-   `.nix` packages: nix-env (\*) MoreInfo: [Nix Install](https://nixos.org/manual/nix/stable/installation/installing-binary.html)
-   `.cask` packages: brew (\*) MoreInfo: [HomeBrew-Homepage](https://brew.sh/)
-   Development related package manager
    -   NPM: Node package manager
    -   PIP: Python package manager
    -   CARGO: Rust package manager
    -   NUGET: DOTNET package manager
    -   ELPA, MELPA: Emacs package manager
    -   Packer, Vimplug: Vim/Neovim package manager


<a id="org19e718a"></a>

# System access and file system


<a id="org1d35d2e"></a>

## File system structure

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Dir</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">/boot</td>
<td class="org-left">contains boot loader i.e. grub.cfg</td>
</tr>


<tr>
<td class="org-left">/root</td>
<td class="org-left">root user home directory</td>
</tr>


<tr>
<td class="org-left">/dev</td>
<td class="org-left">system devices i.e. disk, speakers, thumb-drives, etc.</td>
</tr>


<tr>
<td class="org-left">/etc</td>
<td class="org-left">Configuration files</td>
</tr>


<tr>
<td class="org-left">/bin</td>
<td class="org-left">non root users binaries</td>
</tr>


<tr>
<td class="org-left">/sbin</td>
<td class="org-left">root user binaries</td>
</tr>


<tr>
<td class="org-left">/opt</td>
<td class="org-left">Optional add-on applications (usually not part of os apps)</td>
</tr>


<tr>
<td class="org-left">/proc</td>
<td class="org-left">Running processes (only exists in memory)</td>
</tr>


<tr>
<td class="org-left">/lib</td>
<td class="org-left">library files for users</td>
</tr>


<tr>
<td class="org-left">/tmp</td>
<td class="org-left">temporary files</td>
</tr>


<tr>
<td class="org-left">/home</td>
<td class="org-left">home directory for non root users</td>
</tr>


<tr>
<td class="org-left">/var</td>
<td class="org-left">system logs</td>
</tr>


<tr>
<td class="org-left">/mnt</td>
<td class="org-left">mount point for external file systems</td>
</tr>


<tr>
<td class="org-left">/media</td>
<td class="org-left">mount for removable media i.e. flash-drives, etc.</td>
</tr>


<tr>
<td class="org-left">&#xa0;</td>
<td class="org-left">&#xa0;</td>
</tr>
</tbody>
</table>


<a id="orgfc4cc8a"></a>

## Navigation


<a id="orgbea9d80"></a>

### Commands

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">command</th>
<th scope="col" class="org-left">options</th>
<th scope="col" class="org-left">description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">cd</td>
<td class="org-left">nil</td>
<td class="org-left">Change directory</td>
</tr>


<tr>
<td class="org-left">pwd</td>
<td class="org-left">nil</td>
<td class="org-left">print working director</td>
</tr>


<tr>
<td class="org-left">ls</td>
<td class="org-left">nil</td>
<td class="org-left">print items of current directory</td>
</tr>


<tr>
<td class="org-left">ls</td>
<td class="org-left">-a</td>
<td class="org-left">print all items including hidden</td>
</tr>


<tr>
<td class="org-left">ls</td>
<td class="org-left">-l</td>
<td class="org-left">list items of current directory</td>
</tr>


<tr>
<td class="org-left">ls</td>
<td class="org-left">-h</td>
<td class="org-left">print in human readable format</td>
</tr>
</tbody>
</table>


<a id="orge61ed59"></a>

### Aliases

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">alias</th>
<th scope="col" class="org-left">expansion</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">~</td>
<td class="org-left">current user home directory</td>
</tr>


<tr>
<td class="org-left">~+</td>
<td class="org-left">pwd - current working directory</td>
</tr>


<tr>
<td class="org-left">~-</td>
<td class="org-left">oldpwd - older working directory</td>
</tr>
</tbody>
</table>


<a id="orgac7b18c"></a>

### File types

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">File symbol</th>
<th scope="col" class="org-left">Meaning</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">-</td>
<td class="org-left">Regular file</td>
</tr>


<tr>
<td class="org-left">d</td>
<td class="org-left">directory</td>
</tr>


<tr>
<td class="org-left">l</td>
<td class="org-left">link</td>
</tr>


<tr>
<td class="org-left">c</td>
<td class="org-left">special file or device file</td>
</tr>


<tr>
<td class="org-left">s</td>
<td class="org-left">socket</td>
</tr>


<tr>
<td class="org-left">p</td>
<td class="org-left">named pipe</td>
</tr>


<tr>
<td class="org-left">b</td>
<td class="org-left">block device</td>
</tr>
</tbody>
</table>


<a id="org28f77f0"></a>

### File/Dir creation, cut, copy, remove

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">command</th>
<th scope="col" class="org-left">description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">mkdir</td>
<td class="org-left">create dir</td>
</tr>


<tr>
<td class="org-left">rmdir</td>
<td class="org-left">remove empty dir</td>
</tr>


<tr>
<td class="org-left">cp -R</td>
<td class="org-left">copy dir</td>
</tr>


<tr>
<td class="org-left">rm -R</td>
<td class="org-left">remove dir</td>
</tr>


<tr>
<td class="org-left">touch</td>
<td class="org-left">create file</td>
</tr>


<tr>
<td class="org-left">cp</td>
<td class="org-left">copy files</td>
</tr>


<tr>
<td class="org-left">mv</td>
<td class="org-left">move files/dir</td>
</tr>


<tr>
<td class="org-left">rm</td>
<td class="org-left">remove</td>
</tr>
</tbody>
</table>


<a id="org1efd9d4"></a>

### Finding files and directories

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">command</th>
<th scope="col" class="org-left">usage</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">find</td>
<td class="org-left">find ~ -name &ldquo;*.org&rdquo;</td>
</tr>


<tr>
<td class="org-left">locate</td>
<td class="org-left">locate *.org</td>
</tr>
</tbody>
</table>

Note : Wildcard character

1.  \* - represents zero or more characters
2.  ? - represents a single character
3.  [] - represents a range of character


<a id="orge9cf2a6"></a>

### Links

-   ln : hard links
-   ln -s : soft links


<a id="org8ce34aa"></a>

### File permissions

1.  Types - r: read, w: write, x: execute

    Example: `drwxrwxrwx`
    
    -   &ldquo;d----&#x2013;&#x2014;&rdquo;: &ldquo;first byte&rdquo; represents [File types](#orgac7b18c)
    -   &ldquo;-rwx-&#x2013;&#x2014;&rdquo;: &ldquo;next 3 bytes&rdquo; represents permissions for user &ldquo;u&rdquo;
    -   &ldquo;d&#x2014;rwx&#x2014;&rdquo;: &ldquo;middle 3 bytes&rdquo; represents permission for group &ldquo;g&rdquo;
    -   &ldquo;d-&#x2013;&#x2014;rwx&rdquo;: &ldquo;last 3 bytes&rdquo; represents permission for others &ldquo;o&rdquo;

2.  `chmod` - changing permissions

    Usage does the same thing
    
    -   `chmod ugo+r file`
        
        <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
        
        
        <colgroup>
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        
        <col  class="org-left" />
        </colgroup>
        <thead>
        <tr>
        <th scope="col" class="org-left">symbol</th>
        <th scope="col" class="org-left">meaning</th>
        <th scope="col" class="org-left">&#xa0;</th>
        <th scope="col" class="org-left">symbol</th>
        <th scope="col" class="org-left">operation</th>
        <th scope="col" class="org-left">&#xa0;</th>
        <th scope="col" class="org-left">symbol</th>
        <th scope="col" class="org-left">permission type</th>
        </tr>
        </thead>
        
        <tbody>
        <tr>
        <td class="org-left">u</td>
        <td class="org-left">user</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">-</td>
        <td class="org-left">remove</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">r</td>
        <td class="org-left">read</td>
        </tr>
        
        
        <tr>
        <td class="org-left">g</td>
        <td class="org-left">group</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">+</td>
        <td class="org-left">add</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">w</td>
        <td class="org-left">write</td>
        </tr>
        
        
        <tr>
        <td class="org-left">o</td>
        <td class="org-left">other</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">&#xa0;</td>
        <td class="org-left">x</td>
        <td class="org-left">execute</td>
        </tr>
        </tbody>
        </table>
    -   `chmod 444 file`
        
        -   &ldquo;4&#x2013;&rdquo;: &ldquo;first byte&rdquo; represents user permission
        -   &ldquo;-4-&rdquo;: &ldquo;mid byte&rdquo; represents group permission
        -   &ldquo;&#x2013;4&rdquo;: &ldquo;last byte&rdquo; represents other permission
        
        Octal value meaning
        
        -   0: no permission
        -   1: execute permission
        -   4: read permission
        -   5: read(4) and execute(1) permission
        -   6: read(4) and write(2) permission
        -   7: read(5), write(2) and execute(1) permission
    
    777 - gives complete permission to a file in linux environment


<a id="org53f07a7"></a>

### File ownership

There are 2 owner of a file or directory: user and group

-   `chown` changes user ownership
-   `chgrp` changes group ownership

Use -R for recursive/cascade ownership changes to directory


<a id="orgfdc1510"></a>

### Help commands

1.  `whatis` command

2.  `which` command

3.  `whereis` command

4.  command &#x2013;help and command &#x2013;usage

5.  `man` command

6.  `tldr` command

7.  `curl cheat.sh/<command>` command


<a id="org53bca82"></a>

### Input and output redirection

1.  Stdin 0, stdout 1, stderr 2, >, >>

2.  `tee` command

    Redirect to a file and pipe forward


<a id="orgd64a22f"></a>

### Pipes |


<a id="org7623449"></a>

### File display commands

1.  `cat`

2.  `more`

3.  `less`

4.  `head`

5.  `tail`


<a id="orgb713dd9"></a>

### Filters/Processors commands

1.  `cut`

2.  `awk`

3.  `grep`

4.  `sort`

5.  `uniq`

6.  `wc`


<a id="org70f8a09"></a>

### Compare files

1.  `diff`

2.  `cmp`


<a id="orgba9388a"></a>

### Compress/extract files

1.  `tar`

    Example:
    
    -   Make a tar file from file1 file2 file3
        `tar cvf target.tar file1 file2 file3` -> `target.tar`
    -   Make a tar file and compress file1 file2 file3
        `tar czvf target.tar.xz file1 file2 file3` -> `target.tar.xz`
    -   Extract a  tar file
        `tar xvf file.tar`
    -   Extract a compressed tar file
        `tar xzvf file.tar.xz`

2.  `gzip`

3.  `zip`


<a id="org4a4ef75"></a>

### Combine/split files

1.  `cat` : Concatenates files

2.  `split` : Splits a file


<a id="org18cbb58"></a>

# Linux System Administration


<a id="org83b3ce0"></a>

## Linux file editor

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Editor</th>
<th scope="col" class="org-left">Description</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">Vi/Vim/Nvim</td>
<td class="org-left">Modal text editor</td>
</tr>


<tr>
<td class="org-left">Emacs</td>
<td class="org-left">Advanced text editor with gui client</td>
</tr>


<tr>
<td class="org-left">AstroNvim/LunarVim</td>
<td class="org-left">Nvim based editor with advanced features</td>
</tr>


<tr>
<td class="org-left">nano/micor/pico</td>
<td class="org-left">No modal basic text editors</td>
</tr>
</tbody>
</table>


<a id="org66e2c6d"></a>

## Linux stream editor `sed`


<a id="orga4ef8bd"></a>

## User Account management


<a id="org76cbe4f"></a>

### `useradd`


<a id="orgd845071"></a>

### `groupadd`


<a id="org612c1ff"></a>

### `userdel`


<a id="org85f47fe"></a>

### `groupdel`


<a id="org52c6e55"></a>

### `usermod`


<a id="orgcd1405b"></a>

### `chage`


<a id="org19d633f"></a>

### Files to know

-   `/etc/passwd`
-   `/etc/group`
-   `/etc/shadow`
-   `/etc/login.def`


<a id="org9c34687"></a>

### switch user

-   `su -username`
-   `sudo`
-   `doas`
-   Files: `/etc/sudoers`


<a id="org61b979b"></a>

### Monitor users

-   `who`
-   `last`
-   `w`
-   `finger`
-   `id`


<a id="org2b7eb6d"></a>

### Communication between users

-   `users`
-   `wall`
-   `write`


<a id="org329bf91"></a>

### System utility commands

-   `date`
-   `uptime`
-   `hostname`
-   `uname`
-   `which`
-   `cal`
-   `bc`


<a id="org3f0bc2f"></a>

### Process / service commands

-   `systemctl`
    -   `systemctl start|stop|status|enable|disable|restart|reload`
-   `ps`
-   `top` or `htop`
-   `kill`
-   `crontab`
-   `at`


<a id="org19fe542"></a>

### Job management

-   `ctrl-z`
-   `bg`
-   `fg`
-   `jobs`
-   `kill`
-   `command &`


<a id="org8d45271"></a>

### System monitoring

-   `top/htop`
-   `df/du`
-   `dmesg`
-   `iostat`
-   `netstat`
-   `free`
-   `cat /proc/cpuinfo`
-   `cat /proc/meminfo`
-   `cat /var/log`


<a id="org019443d"></a>

### System management

-   `shutdown`
-   `halt`
-   `reboot`
-   `init 0-6`


<a id="org0095e7a"></a>

### Terminal commands

-   `ctrl-c`
-   `ctrl-d`
-   `ctrl-z`
-   `exit`
-   `clear`
-   `script`


<a id="org024f92b"></a>

### Special permissions

-   `setuid`
-   `setgid`
-   `sitckybit`


<a id="org60e5c2f"></a>

### PATH and ENV


<a id="org46f4810"></a>

# Bash and Shell Scripting


<a id="org2ab19ab"></a>

## Types of shells

-   `sh` : Bourne shell
-   `bash`: Bourne Again Shell
-   `zsh`:
-   `fish`:
-   `dash`:


<a id="orgb7726e7"></a>

## Shells entry and exit

-   Enter: Type shell name: `bash` in the terminal or command line
-   Exit: Type `exit` in the terminal or command line


<a id="orgc6a3bc0"></a>

## Shell scripting


<a id="orgf456efe"></a>

### Components of shell script

-   Header/ shebang :
    -   `#!/bin/bash`: looks at specific location provider for interpreter
    -   `#!/usr/bin/env bash`: looks at the `PATH` variable for the interpreter
-   Comments: `# Comment`
-   Commands: `echo, cp, mv, rm, etc.`
-   Statements: `if, while, for, etc.`
-   Professional components:
    1.  Author: `Name`
    2.  Created: `Date`
    3.  Last Modified: `Date`
    4.  Description: `Text`
    5.  Usage: `Text`


<a id="org8203c06"></a>

### Exit codes:

-   `0`: exit without error
-   More info: [Exit Code Reference](https://tldp.org/LDP/abs/html/exitcodes.html)


<a id="org6e91360"></a>

### Requirements:

-   Execute permissions required: `-rwxr-xr-x`: will execute for everyone
    Click [File permissions](#org8ce34aa) for more info.
-   Need to call with correct absolute path or relative path
-   Availability from everywhere
    -   add to `$PATH` in `.profile` or `.bashrc`


<a id="org99dfd4c"></a>

### Variables and shell expansions:


<a id="org9e8d018"></a>

### Bash command processing:


<a id="org25e88cd"></a>

### IO:

-   Requesting user input
-   `read`: input from user
-   `echo`: output from script
-   Reading options
-   Processing files


<a id="org71f9295"></a>

### Branching logic:

-   `if-elif-else`:
-   `case`:
-   Test statements


<a id="org391d22c"></a>

### Looping logic;

-   `for`:
-   `while`:


<a id="orga38005c"></a>

### Arrays


<a id="org011c460"></a>

### Debugging


<a id="orgce2eb4b"></a>

### Automation

-   `cron-tab`
-   `at`


<a id="orgdd6f5ed"></a>

### Remote connection

-   `ssh`
-   `scp`
-   `rsync`
-   `vnc`


<a id="org41e9330"></a>

# Linux Networking


<a id="org796c56e"></a>

## Network Management


<a id="org09a407e"></a>

### `ping`


<a id="org85fca01"></a>

### `ip`


<a id="org7155f4d"></a>

### `netstat`


<a id="orgc098a5c"></a>

### `route`


<a id="orge066fda"></a>

### `traceroute`


<a id="orge34c58e"></a>

### `tcpdump`


<a id="orgde73c19"></a>

### `netstat`


<a id="orgacaa01c"></a>

### `nmtui`


<a id="orgbb484e7"></a>

### `nmcli`


<a id="org570cec8"></a>

## Remote management


<a id="orgb1f2e77"></a>

### `ssh`


<a id="org7e97e7a"></a>

### `scp`


<a id="org46e977c"></a>

### `rsync`


<a id="org5aaad33"></a>

### `sendmail`


<a id="orgf69bb0a"></a>

## Firewall


<a id="orgacb6dab"></a>

### `ufw`


<a id="orge3a7b58"></a>

### `iptables`


<a id="org6c2c361"></a>

## LDAP


<a id="org61dd6f2"></a>

## NFS


<a id="org8192adb"></a>

## FTP


<a id="org266b477"></a>

## HTTP


<a id="org1a946d8"></a>

## Linux Hardening


<a id="org65035b3"></a>

## System performance


<a id="org201c200"></a>

## Containers


<a id="org9c85756"></a>

## Automate Linux Installation


<a id="org36ca3c3"></a>

## DHCP


<a id="org0c77742"></a>

# Disk Management


<a id="org7cc4b10"></a>

## Disk `mount`, `umount`


<a id="org08546fc"></a>

## Disk usage

-   `df`
-   `du`
-   `dd`


<a id="orgeb380eb"></a>

## Disk partition

-   `fdisk`


<a id="org64b96f2"></a>

## Disk file system

-   `mkfs`
-   `fsck`


<a id="org45db7a9"></a>

## Persistence `/etc/fstab`, `genfstab`


<a id="org4929770"></a>

## `mkswap`, `swapon`


<a id="org572067b"></a>

## LVM


<a id="org6cfcfb1"></a>

## RAID


<a id="org367e398"></a>

## NFS and SAMBA


<a id="org882e99f"></a>

## SATA vs SAS


<a id="orgfc5125e"></a>

# Linux Services management


<a id="orgd385d35"></a>

## Init. system `ststemd`


<a id="org29ac467"></a>

## Run levels


<a id="org3ec43f4"></a>

## Service Management `systemctl`


<a id="org9411281"></a>

## Hardware management

-   `lscpu`
-   `lsmem`
-   `lspci`
-   `lsblk`
-   `lsfd`
-   `lsof`
-   `lsusb`
-   `lsb_release -a`
-   `lsmod`
-   `lsinitcpio`

