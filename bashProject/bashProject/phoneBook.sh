#!/bin/bash

    BOOK="phonebook.txt"

    exit=0
    #Main Menu of Contacs Book:
    while [ $exit -ne 1 ]
    do
        echo "Choose your option:"
        echo -e "
        ==========================
        ==1- Add New Contact:   
        ==2- Show All Contacts:  
        ==3- Search in Contacts:   
        ==4- Update Contact:  
        ==5- Remove Contact:  
        ==6- Exit..   
        =========================="
        
        #Detect Choice and Take Action:
        read -p "Please, Enter your choice: " answer

        if [ "$answer" = 1 ]
        then
            ./addContact.sh
        elif [ "$answer" = 2 ]
        then
            ./show.sh
        elif [ "$answer" = 3 ]
        then
            ./search.sh
        elif [ "$answer" = 4 ]
        then
            ./update.sh
        elif [ "$answer" = 5 ]
        then
            ./remove.sh
        elif [ "$answer" = 6 ]
        then
            exit=1
        else
            echo "Wrong Choice.."
        fi
    done

    exit 0