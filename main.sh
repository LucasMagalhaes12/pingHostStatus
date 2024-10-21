#/bin/bash


# Config Values
TIMESLEEP=10


if [ -e hosts.csv ]
then

    while true
    do

        clear 
        echo " ##### PING HOSTS #####"
        echo

        while IFS=";" read -r name ip
        do
            if ping -c 1 $ip -w 1 > /dev/null
            then
                echo " [#]  [ $name ] $ip"
            else
                echo " [ ]  [ $name ] $ip"  
            fi
        done < hosts.csv
        sleep $TIMESLEEP

    done

else
	echo file not found!
	echo creating file hosts.csv
    touch hosts.csv
fi
