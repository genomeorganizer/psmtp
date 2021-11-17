#!/bin/bash

#virtualenv not necessary -- just install stuff
########################## Virtualenv: ##########################
# install_dir="${PWD}" #update install directory
# source "${install_dir}/env/bin/activate"
cd ${install_dir}

function usage () {
    cat <<EOUSAGE
$(basename $0) hvr:e:
    show usage
EOUSAGE
}

while getopts :t:s: option
do 
    case "${option}"
        in
        t)to=${OPTARG};;
        s)subject=${OPTARG};;
        *)
          echo "Invalid option: -$OPTARG" >&2
          usage
          exit 2;
    esac
done
shift $((OPTIND - 1))
message=$@

echo "Sending email..."
echo "to : $to"
echo "subject   : $subject"
echo "message  : $message"

python pmail.py to=$to subject=$subject message=$message
