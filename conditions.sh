# if, if else, else if.

# if example 

fruit_name=mango
quantity=10

# keep the syntax in mind because of the spaces and the "" we are getting error. and also fi in the last

if [ "$fruit_name" == "mango" ];

then

echo mango quantity - $quantity

fi


#if else example

fruit_name=mango
quantity=10

if [ "$fruit_name" == "mango" ];

then

echo mango quantity - $quantity

else

echo fruit not exist

fi

# now instead of using directly the mango we can use any name but for that we need use $1 and $2 ad they are arguments
# now we need to provide the inputs to the function

fruit_name=$1
quantity=$2

if [ "$fruit_name" == "mango" ];

then

echo mango quantity - $quantity

else

echo fruit not exist

fi
