# rememberPWD
saves PWD to disk and sets previous PWD when starting a new BASH shell

The intended use is for systems that have users **su - /  sudo su -** to use the root account (mainly Debian distros).

This script will cd the root/other user into their previous PWD. For example,

Terminal 1
1) user1@Linux:~$
2) user1@Linux:~$ sudo su -  otherUser2
3) otherUser2@Linux:~$
4) otherUser2@Linux:~$ cd /var/log/
5) otherUser2@Linux:/var/log$

Terminal 2 (or TAB)
1) user1@Linux:~$
2) user1@Linux:~$ sudo su -  otherUser2
3) otherUser2@Linux:/var/log$         <--- user is in same directory as before

My script adds this to the end of your .bashrc:

\# save PWD to disk<br>
function cd {<br>
    &emsp;builtin cd "$@"<br>
    &emsp;echo $PWD > ~/.previousPWD<br>
}<br>
cd "\`cat ~/.previousPWD\`"<br>
