#/bin/bash

# CONFIG VALUES
TIMESLEEP=10 # waiting time for the next update
TIMEOUT=1 # timeout for ping each host


function pingHosts {
    clear 
    while IFS=";" read -r name info; do
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
}


if [ -e hosts.csv ]; then

    while getopts ":t:hl" opt; do
        case $opt in
        t)
            TIMESLEEP=$OPTARG
            while true; do
                pingHosts
                sleep $TIMESLEEP
            done
            ;;
        l)
            while true; do
                pingHosts
                sleep $TIMESLEEP
            done
            ;;
        h)
            echo "usage:"
            echo "  main [options]"

            echo 
            echo "options:"
            echo "  -t         set time from update screen and print loop host status"
            echo "  -p         print hosts status"
            echo "  -h         print help and exit"
            ;;
        :)
            echo "invalid option! -$OPTARG add argumenets"
            ;;
        *)
            echo "teste"
            ;;
        esac
    done


else
	echo file hosts.csv not found!
	echo creating file... 
    echo "##TITLE##;##### PING HOSTS #####" > hosts.csv
    echo done
fi
