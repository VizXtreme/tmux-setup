# Termux Aliases Reference

## Navigation
| Alias   | Command                |
|--------|------------------------|
| ..     | cd ..                  |
| ...    | cd ../..               |
| ....   | cd ../../..            |
| home   | cd ~                   |
| d      | cd ~/downloads         |
| doc    | cd ~/documents         |
| desk   | cd ~/storage/shared/Desktop |
| pic    | cd ~/storage/shared/Pictures |
| vid    | cd ~/storage/shared/Movies |
| music  | cd ~/storage/shared/Music |
| term   | cd ~/../usr             |
| here   | pwd                     |
| roots  | cd /                    |

## File Management
| Alias   | Command                |
|--------|------------------------|
| ls      | ls --color=auto       |
| ll      | ls -lh                |
| la      | ls -A                 |
| l       | ls -CF                |
| mkdir   | mkdir -pv             |
| rm      | rm -i                 |
| cp      | cp -i                 |
| mv      | mv -i                 |
| del     | rm -rf                |
| findf   | find . -type f -name  |
| findd   | find . -type d -name  |
| sz      | stat                  |
| tree    | tree -C               |
| fsize   | du -sh *              |
| ftype   | file *                |

## Package Management
| Alias   | Command                |
|--------|------------------------|
| up      | pkg update && pkg upgrade -y |
| install | pkg install -y        |
| remove  | pkg uninstall -y      |
| search  | pkg search            |
| clean   | apt autoclean && apt autoremove -y |
| pipi    | pip install           |
| pipu    | pip install --upgrade |
| pipr    | pip uninstall         |
| snapup  | pkg update && pkg upgrade && pip install --upgrade pip |

## Git Shortcuts
| Alias   | Command                |
|--------|------------------------|
| gs      | git status            |
| ga      | git add               |
| gc      | git commit -m         |
| gp      | git push              |
| gpl     | git pull              |
| gl      | git log --oneline --graph --decorate |
| gco     | git checkout          |
| gbr     | git branch            |
| gdf     | git diff              |
| gcl     | git clone             |

## Networking & Internet
| Alias   | Command                |
|--------|------------------------|
| pingg   | ping -c 5             |
| myip    | curl ifconfig.me      |
| wgetf   | wget -c               |
| curlf   | curl -O               |
| net     | ifconfig              |
| ns      | nslookup              |
| ports   | netstat -tulnp        |
| speed   | curl -s ... | python3 |
| weather | curl wttr.in          |

## Python & Scripts
| Alias   | Command                |
|--------|------------------------|
| py      | python                |
| py3     | python3               |
| ipy     | ipython               |
| piplist | pip list              |
| pipfreeze | pip freeze > requirements.txt |
| runpy   | python3               |

## Compression / Archives
| Alias   | Command                |
|--------|------------------------|
| untar   | tar -xvf              |
| tgz     | tar -czvf             |
| unzipf  | unzip -q              |
| zipf    | zip -r                |
| rarf    | rar a                 |
| rarx    | unrar x               |
| gz      | gzip -d               |

## System Info & Monitoring
| Alias   | Command                |
|--------|------------------------|
| cls     | clear                 |
| now     | date +"%T"            |
| today   | date +"%Y-%m-%d"      |
| htop    | htop                  |
| mem     | free -h               |
| df1     | df -h                 |
| du1     | du -h --max-depth=1   |
| cpu     | lscpu                 |
| uname   | uname -a              |
| battery | termux-battery-status |

## Media & Audio
| Alias   | Command                |
|--------|------------------------|
| play    | termux-media-player play |
| stop    | termux-media-player stop |
| listm   | termux-media-player list |
| record  | termux-media-recorder audio |
| vidrec  | termux-media-recorder video |

## Quick Shortcuts
| Alias   | Command                |
|--------|------------------------|
| editrc  | nano ~/.bashrc        |
| reload  | source ~/.bashrc      |
| sudo    | tsu                   |
| gohome  | cd ~                  |
| cdpics  | cd ~/storage/shared/Pictures |
| cdvids  | cd ~/storage/shared/Movies  |
| cdsongs | cd ~/storage/shared/Music   |
| ff      | find . -type f -name  |
| fd      | find . -type d -name  |

## Fun / Misc
| Alias   | Command                |
|--------|------------------------|
| cowsay  | cowsay -f tux          |
| sl      | sl -l                  |
| fortune | fortune | cowsay       |
| cheer   | echo "Keep coding!"    |
| lol     | echo "😂😂😂"           |
| shrug   | echo "¯\_(ツ)_/¯"       |

## Advanced / Utilities
| Alias   | Command                |
|--------|------------------------|
| extract | for i in *.zip; do unzip "$i"; done |
| mkcd    | mkdir -p $1 && cd $1   |
| ipinfo  | curl ipinfo.io          |
| jsonfmt | python3 -m json.tool    |
| serve   | python3 -m http.server  |
| pingall | for ip in $(seq 1 254); do ping -c 1 192.168.1.$ip & done |
