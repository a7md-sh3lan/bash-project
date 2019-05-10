#!/bin/bash

    BOOK="phonebook.txt"

    exit=0
    #Choose way to remove:
    while [ $exit -ne 1 ]
    do
        echo "How to Remove:"
        echo -e "
        ==========================
        ==1- by Name:   
        ==2- by E-mail:  
        ==3- by Phone No.:   
        ==4- Exit remove..
        =========================="
        
        #Detect Choice and Take Action:
        read -p "Please, Enter your choice: " answer
        
        #Detect target contact by his/her name and removing all his/her information:
        if [ "$answer" = 1 ]
        then
            read -p "Enter the required name: " name
            flag=$(cat $BOOK | grep -w $name)
                if [[ $flag ]]; 
                then 
                        grep -wi $name $BOOK
                        echo -e "
                        Are You want to delete this contact:
                        1 for OK. 
                        2 for NO. "
                        read answer

                        if [ "$answer" -eq 1 ]
                        then
                                sed -i "/$name/d" $BOOK
                                echo "DELETED!"
                        else
                                echo "Removing Cancelled!"
                        fi
                else
                        echo "There is not contact has this name!"
                fi

        #Detect target contact by his/her email and removing all his/her information:
        elif [ "$answer" = 2 ]
        then
            read -p "Enter the required E-mail: " mail
            flag=$(cat $BOOK | grep $mail)
                if [[ $flag ]]; 
                then 
                        grep -wi $mail $BOOK
                        echo -e "
                        Are You want to delete this contact:
                        1 for OK. 
                        2 for NO. "
                        read answer

                        if [ "$answer" -eq 1 ]
                        then
                                sed -i "/$mail/d" $BOOK
                                echo "DELETED!"
                        else
                                echo "Removing Cancelled!"
                        fi
                else
                        echo "There is not contact has this E-mail!"
                fi
        
        #Detect target contact by his/her phone no. and removing all his/her information:
        elif [ "$answer" = 3 ]
        then
            read -p "Enter the required Phone No.: " mobile
            flag=$(cat $BOOK | grep $mobile)
                if [[ $flag ]]; 
                then 
                        grep -wi $mobile $BOOK
                        echo -e "
                        Are You want to delete this contact:
                        1 for OK. 
                        2 for NO. "
                        read answer

                        if [ "$answer" -eq 1 ]
                        then
                                sed -i "/$mobile/d" $BOOK
                                echo "DELETED!"
                        else
                                echo "Removing Cancelled!"
                        fi
                else
                        echo "There is not contact has this Phone No.!"
                fi
        elif [ "$answer" = 4 ]
        then
            exit=1
        else
            echo "Wrong Choice.."
        fi
    done