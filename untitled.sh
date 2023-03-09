#!/bin/bash
if echo hello; then 
    echo "success";
else 
    echo "failure";
fi    

if rm ttt; then 
    echo "success";
else 
    echo "failure";
fi 

if [ -f runtime.txt ];  then
    echo "runtime.txt exists";
else 
    echo "file missing";
fi

# Causes an error because 'sTest' looks like a command 
# and '=' and '"hello"' become its arguments
#sTest="hello"

# Assigns string variable correctly
sTest="hello"

# Temporary assignment evaluates to true whatever the value
if [ "$sTest" = "hello" ]; then
  echo "Yep"
else
  echo "Nope"
fi

if [[ "Hello?" =~ "?"$ ]]; then 
    echo "Yes"; 
else 
    echo "No"; 
fi


if [ -d my-data ];  then
    echo "directory my-data exists";
else 
    echo "directory missing";
fi
let a=1
let a=a+1
echo $a