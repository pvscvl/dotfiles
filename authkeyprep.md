# Preparations for root-ssh login


> `mkdir /home/pi/.ssh`
> `chmod 700 /home/pi/.ssh`
> `echo ssh-rsa AAxsd user@host  >> /home/pi/.ssh/authorized_keys2`
> `chmod 600 /home/pi/.ssh/authorized_keys2`

> `mkdir /root/.ssh && chmod 700 /root/.ssh && echo ssh-rsa AAxsd user@host  >> /root/.ssh/authorized_keys2 && chmod 600 /root/.ssh/authorized_keys2`



> `sudo sed -i "/#PermitRootLogin prohibit-password/ s//PermitRootLogin yes/g" /etc/ssh/sshd_config`
> 
> `sudo sed -i "/#PubkeyAuthentication yes/ s//PubkeyAuthentication yes/g" /etc/ssh/sshd_config`
> 
> `sudo sed -i "/#AuthorizedKeysFile/ s//AuthorizedKeysFile/g" /etc/ssh/sshd_config`


