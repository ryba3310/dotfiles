
#   show space usage
alias disk='df -h';

#   search in current dir
alias path='find $PWD -type f,d -name $1'

#   sshuttle start connection
alias sshvpn="sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" /usr/local/bin/sshuttle --ssh-cmd 'ssh -J phone' --auto-nets --method=tproxy --tmark 0x01 --dns --daemon --pidfile=/tmp/sshuttle.pid -v -r linode2 0/0 -x 139.162.223.103 -x 192.168.0.1/16"

#   kill sshuttle daemon
alias vpnkill='[[ -f /tmp/sshuttle.pid ]] && sudo kill $(cat /tmp/sshuttle.pid) && echo "Disconnected"'

#   deciaml to hex
alias dec2hex='printf "%x\n"'

#   mount mega VFS with rclone
alias mega_mount='rclone mount --daemon --vfs-cache-mode full mega: /home/ryba/MEGA'

#   unmount mega VFS
alias mega_unmount='fusermount -u /home/ryba/MEGA'

#   get public IP
alias public_ip='curl -w "\n" ifconfig.me'

#   vim = nvim
alias vim='nvim'

