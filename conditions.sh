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
