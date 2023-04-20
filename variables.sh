# echo is used to print 

a=1
name=kc
echo a = $a
echo name = $name
OR WE CAN USE 
echo name = ${name}

# {} are not always important but for some places they are needed like arthematic operations

# for dynamic things which changes daily like date

DATE=$(date +%F)
echo today date = $DATE


# for arthematic expressions

ARTH=$((2-3*4/2))
echo ARTH = ${ARTH}

echo script name - $0

#echo is used for printing

#script name is given by us (random/ related to the code)

#$0 gives the name of the script ( like cart.sh or etc) 

echo first argument - $1

echo second argument - $2

echo all argument - $*

echo all argument - $#