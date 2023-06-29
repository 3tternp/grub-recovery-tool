#!/bin/bash
echo -e "

 \e[0;36;55m   _____  ______   __    __ ______    ______    _____  ____  ____   __    __   _____ ______ __      __   _____  ________  ____   ______  ________   
   / ___ \(   __ \  ) )  ( ((_   _ \  (   __ \  / ___/ / ___)/ __ \  ) )  ( (  / ___/(   __ \) \    / (  / ____\(___  ___)(    ) (   __ \(___  ___)  
  / /   \_)) (__) )( (    ) ) ) (_) )  ) (__) )( (__  / /   / /  \ \( (    ) )( (__   ) (__) )\ \  / /  ( (___      ) )   / /\ \  ) (__) )   ) )     
 ( (  ____(    __/  ) )  ( (  \   _/  (    __/  ) __)( (   ( ()  () )\ \  / /  ) __) (    __/  \ \/ /    \___ \    ( (   ( (__) )(    __/   ( (      
 ( ( (__  )) \ \  _( (    ) ) /  _ \   ) \ \  _( (   ( (   ( ()  () ) \ \/ /  ( (     ) \ \  _  \  /         ) )    ) )   )    (  ) \ \  _   ) )     
  \ \__/ /( ( \ \_))) \__/ ( _) (_) ) ( ( \ \_))\ \___\ \___\ \__/ /   \  /    \ \___( ( \ \_))  )(      ___/ /    ( (   /  /\  \( ( \ \_)) ( (  __  
   \____/  )_) \__/ \______/(______/   )_) \__/  \____\\____)\____/     \/      \____\)_) \__/  /__\    /____/     /__\ /__(  )__\)_) \__/  /__\(__) 
                                                                                                                                                        
\e[1m"
 

eax=$(cat /etc/os-release)
if [[ $eax = *"KALI"* ]]; then
        echo "[+] kali OS detected"
	sudo grub-install /dev/sda
	sudo update-grub
	echo -e "\e[0;36;32m you have successfully recover your system grub"
	echo -e "\e[0;36;33m Now reboot your system by removing bootable device and check your grub"
	exit
elif [[ $eax = *"UBUNTU"* ]]
then
        echo "[+] Ubuntu OS detected"
	sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
	sudo apt-get install -y boot-repair && boot-repair
	echo -e "\e[0;36;35m you have successfully recover your system grub"
	echo -e "\e[0;36;34m Now reboot your system by removing bootable device and check your grub"
	exit
else:
        echo "Unkown OS"
fi
