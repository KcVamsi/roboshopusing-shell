 #how to write a shell script file = file ending with .sh is used as shell script but the for os it does not matter.

 #how to run a shel lscript = bash script.sh
 #for some scripts we need a sudo access so we use = sudo bash script.sh

#for printing = we use echo
 echo hello world 
#this will print the hello world on the output screen

# we can multiple lines in echo command
 echo -e "line1\nline2\nline3" 
 # output will be 
#line1
#line2
#line3

# "\n" is used for going to next line
#if we use two times then two spaces will be provided.

echo -e "line1\n\nline2" 
# output is 
#line1

#line2

 #we can give tab spaces also
 echo -e "line1\tline2\t\tline3" 
 #here the output will be
#line1 line2  line3


#            variables
# for declaring variable we use --> a=10
# for calling or accessing the variable we use echo to print the variable
echo a - $a

# command substituion using variables
DATE=$(date)
echo date = $DATE

#arthematic substituion
 ADD=$((2+4))
echo add - $ADD

#properties of variables
#          a. read-write
a=10
a=12
#a was declared with a=10 and then overwrite by a=12
echo a - $a
#the output will the second a, because the 1st will be overwrite by the 2nd one

#             b. readonly
#sometimes we need to mark a variable as readonly after declaring then we we use readonly cmnd

readonly a
a=20

#here the output will be a=12
#1st a is over written by 2nd a after that we are using readonly then 3rd a will be ignored as we have already given readonly.


  
#local variable
#variables decalred in the script can be access with in the this script, because the default property is local
#variables declared in cli in shell cannot be accesed in script
# but if we want to access this to the script we need to convert that, for that we use the cmnd
 echo c - $c
 export c
 # export c will mark the variable as a enviroment variable.
#then we see the variable in script also even though we declared in cli or viceversa
# if we declare envinorment variable inside the script, all the scripts / cmnds can access that variable

#       Inputs
#inputs can be given to variables as well as functions
# script name - $0
# first argument - $1
# second argument - $2
# all argument - $*
# number of argument - $#



 