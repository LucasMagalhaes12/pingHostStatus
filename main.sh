#/bin/bash

# CONFIG VALUES
TIMESLEEP=10 # waiting time for the next update
TIMEOUT=3 # timeout for ping each host


function pingHosts {
    clear 
    while IFS=";" read -r name info info2; do
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


function listHosts {
    count=1
    while IFS=";" read -r name info; do
        if [ "$name" = "##TITLE##" ]; then
            echo
            echo "[$count] $info"

        elif ping -c 1 -w $TIMEOUT $info > /dev/null; then
            echo "[$count] [#]  [ $name ] $info"
        else
            echo "[$count] [ ]  [ $name ] $info"  
        fi
        count=$((count+1))

    done < hosts.csv
}


function wakeOnLan {
    count=1
    while IFS=";" read -r name info info2; do
        if [ $count -eq $1 ]; then
            # if [ "$name" = "##TITLE##" ]; then

            # fi
            
            echo $name $info $info2
            break

        elif [ $count -gt $1 ]; then
            echo "was not found!"
            break
        fi

        count=$((count+1))

    done < hosts.csv
}


if [ -e hosts.csv ]; then

    while getopts ":t:w:hpl" opt; do
        case $opt in
        h)
            echo "usage:"
            echo "  main [options]"
            echo 
            echo "options:"
            echo "             loop host status with default time of 10s"
            echo "  -p         print hosts status"
            echo "  -t [n]     set time from update screen and print loop host status"
            echo "  -h         print help display and exit"
            echo "  -l         list hosts from wake on lan"
            echo "  -w [n]     choice number for wake on lan"
            echo
            ;;
        t)
            TIMESLEEP=$OPTARG
            while true; do
                pingHosts
                sleep $TIMESLEEP
            done
            ;;
        p)
            pingHosts
            ;;
        l)
            listHosts
            ;;
        w)
            wakeOnLan $OPTARG
            ;;
        
        :)
            echo "invalid option! -$OPTARG add argumenets"
            ;;
        esac
    done

    if [ $OPTIND -eq 1 ]; then
        while true; do
            pingHosts
            sleep $TIMESLEEP
        done
fi


else
	echo file hosts.csv not found!
	echo creating file... 
    echo "##TITLE##;PING HOSTS" > hosts.csv
    echo done
fi
