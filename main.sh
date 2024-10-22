#/bin/bash

# CONFIG VALUES
TIMESLEEP=10 # waiting time for the next update
TIMEOUT=1 # timeout for ping each host


if [ -e hosts.csv ]
then

    while true
    do
        clear 

        while IFS=";" read -r name info 
        do
            if [ "$name" = "##TITLE##" ]
            then

            echo
            echo " $info"

            elif ping -c 1 -w $TIMEOUT $info > /dev/null
            then
                echo " [#]  [ $name ] $info"
            else
                echo " [ ]  [ $name ] $info"  
            fi
        done < hosts.csv
        sleep $TIMESLEEP
    done

else
	echo file hosts.csv not found!
	echo creating file... 
    echo "##TITLE##;##### PING HOSTS #####" > hosts.csv
    echo done
fi
