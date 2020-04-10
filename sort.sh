#!/bin/bash

function random(){
    new_element=$(( $RANDOM % 100 ))
}

function make_list(){
    LIST=()
    for i in {1..10}; do
        random
        LIST+=( "$new_element" )
    done
}

function fsort(){
start=0
end=10
while (( $((end-- >= 0)) )); do
    aa=0
    bb=1
    for ((i=$start; i<=$end; i++)); do
        a="${LIST[$aa]}"
        b="${LIST[$bb]}"
        if  [[ "$i" == "$end" ]]; then
            SLIST+=( "${LIST[$end]}" )
        elif (( $a > $b )); then
            LIST[$aa]=$b
            LIST[$bb]=$a
            ((bb++))
            ((aa++))
        else
            ((aa++))
            ((bb++))    
        fi
    done
done
}


make_list
echo "${LIST[@]}"
fsort
echo "${LIST[@]}"
echo "${SLIST[@]}"
