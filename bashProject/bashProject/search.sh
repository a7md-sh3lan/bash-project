#!/bin/bash

    BOOK="phonebook.txt"

    exit=0
    #Cho way to search:
    while [ $exit -ne 1 ]
    do
        echo "How to search:"
        echo -e "
        ==========================
        ==1- by Name:   
        ==2- by E-mail:  
        ==3- by Phone No.:   
        ==4- Exit search..
        =========================="
        
        #Detect Choice and Take Action:
        read -p "Please, Enter your choice: " answer

        #Detect specifi name and showing his/her all information:
        if [ "$answer" = 1 ]
        then
            read -p "Enter the required name: " name
            flag=$(cat $BOOK | grep -w $name)
                if [[ $flag ]]; 
                then 
                        grep -wi $name $BOOK
                else
                        echo "NOT FOUND!"
                fi
        
        #Detect specifi email and showing his/her all information:
        elif [ "$answer" = 2 ]
        then
            read -p "Enter the required E-mail: " mail
            flag=$(cat $BOOK | grep -w $mail)
                if [[ $flag ]]; 
                then 
                        grep -wi $mail $BOOK
                else
                        echo "NOT FOUND!"
                fi
        
        #Detect specifi phone no. and showing his/her all information:
        elif [ "$answer" = 3 ]
        then
            read -p "Enter the required Phone No.: " mobile
            flag=$(cat $BOOK | grep -w $mobile)
                if [[ $flag ]]; 
                then 
                        grep -wi $mobile $BOOK
                else
                        echo "NOT FOUND!"
                fi
        
        elif [ "$answer" = 4 ]
        then
            exit=1
        else
            echo "Wrong Choice.."
        fi
    done