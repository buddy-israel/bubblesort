#!/bin/bash

function random(){
    new_element=$(( $RANDOM % 100 ))
}

function make_list(){
    LIST=()
    for i in {1..1000}; do
        random
        LIST+=( "$new_element" )
    done
}
make_list

function lsort(){
start=0
end="${#LEFT[@]}"
while (( $((end-- >= 0)) )); do
    aa=0
    bb=1
    for ((i=$start; i<=$end; i++)); do
        a="${LEFT[$aa]}"
        b="${LEFT[$bb]}"
        if [[ $a > $b ]]; then
            LEFT[$aa]=$b
            LEFT[$bb]=$a
            ((bb++))
            ((aa++))
        else
            ((aa++))
            ((bb++))
        fi
    done
done
}

function rsort(){
start=0
end="${#RIGHT[@]}"
while (( $((end-- >= 0)) )); do
    aa=0
    bb=1
    for ((i=$start; i<=$end; i++)); do
        a="${RIGHT[$aa]}"
        b="${RIGHT[$bb]}"
        if [[ $a > $b ]]; then
            RIGHT[$aa]=$b
            RIGHT[$bb]=$a
            ((bb++))
            ((aa++))
        else
            ((aa++))
            ((bb++))
        fi
    done
done
}


len="${#LIST[@]}"
LEFT+=( "${LIST[0]}" )
RIGHT+=()

for (( i=0; i<$len; i++ )); do
    xx=0
    x="${LIST[$i]}"
    if [[ "${LIST[0]}" >=$x ]]; then
        LEFT+=( "$x" )       
    else
        RIGHT+=( "$x" )       
    fi  
done







#fsort
echo "LIST:" "${LIST[@]}"

echo "LEFT:" "${LEFT[@]}"
echo "RIGHT:" "${RIGHT[@]}"
echo "LEFT:" "${#LEFT[@]}"
echo "RIGHT:" "${#RIGHT[@]}"
lsort && rsort
echo "#######"
NEWLIST=("${LEFT[@]}""${RIGHT[@]}")
echo "LEFT:" "${LEFT[@]}"
echo "RIGHT:" "${RIGHT[@]}"

echo "NEWLIST:" "${NEWLIST[@]}"
