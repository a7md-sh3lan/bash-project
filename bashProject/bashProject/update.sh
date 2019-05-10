#!/bin/bash

    BOOK="phonebook.txt"

    exit=0
    #Choose way to update:
    while [ $exit -ne 1 ]
    do
        echo "How to update:"
        echo -e "
        ==========================
        ==1- Update specific Name:   
        ==2- Update specific E-mail:  
        ==3- Update specific Phone No.:
        ==4- Update all information for contact by his/her Name :   
        ==5- Exit update..
        =========================="
        
        #Detect Choice and Take Action:
        read -p "Please, Enter your choice: " answer

        #Take Allready existed name and replace it by new one:
        if [ "$answer" = 1 ]
        then
            nameRegex="\b[A-Za-z0-9]+\b"
            while [[ true ]]; do
            read -p "Enter the target name: " name
            read -p "Enter the new name: " name2
            if [[ $name2 =~ $nameRegex ]];
                then
                    flag=$(cat $BOOK | grep "Name: "$name)
                    flag1=$(cat $BOOK | grep "Name: "$name2)
                    if [[ $flag ]];
                    then
                        if [[ ! $flag1 ]];
                                then 
                                sed -i "s/Name: $name/Name: $name2/g" $BOOK
                                echo "UPDATED.."
                                break
                                else echo "this name is Already Existed! Please enter NEW name.."
                        fi
                    else echo "Your target Name is Not Found. Please Enter Existed one!"
                    fi
            fi
	    done
            
        #Take Allready existed email and replace it by new one:
        elif [ "$answer" = 2 ]
        then
            emailRegex="\b[A-Za-z0-9._-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b"
            while [[ true ]]; do
            read -p "Enter the target email: " email
            read -p "Enter the new email: " email2
            if [[ $email2 =~ $emailRegex ]];
                then
                    flag=$(cat $BOOK | grep "E-mail: "$email)
                    flag1=$(cat $BOOK | grep "E-mail: "$email2)
                    if [[ $flag ]];
                    then
                        if [[ ! $flag1 ]];
                                then 
                                sed -i "s/E-mail: $email/E-mail: $email2/g" $BOOK
                                echo "UPDATED.."
                                break
                                else echo "this email is Already Existed! Please enter NEW email.."
                        fi
                    else echo "Your target E-mail is Not Found. Please Enter Existed one!"
                    fi
            fi
	    done

        #Take Allready existed phone no. and replace it by new one:
        elif [ "$answer" = 3 ]
        then
            phoneRegex="\b01[0|1|2|5][0-9]{8}\b"
            while [[ true ]]; do
            read -p "Enter the target phone: " phone
            read -p "Enter the new phone: " phone2
            if [[ $phone2 =~ $phoneRegex ]];
                then
                    flag=$(cat $BOOK | grep "Phone No: "$phone)
                    flag1=$(cat $BOOK | grep "Phone No: "$phone2)
                    if [[ $flag ]];
                    then
                        if [[ ! $flag1 ]];
                                then 
                                sed -i "s/Phone No: $phone/Phone No: $phone2/g" $BOOK
                                echo "UPDATED.."
                                break
                                else echo "this phone is Already Existed! Please enter NEW phone.."
                        fi
                    else echo "Your target phone is Not Found. Please Enter Existed one!"
                    fi
            fi
	    done

        #Take Allready existed name and rupdate all information about him/her as you added new contact:
        elif [ "$answer" = 4 ]
        then
            nameRegex="\b[A-Za-z0-9]+\b"
            while [[ true ]]; do
            read -p "Enter the target name: " name
            if [[ $name =~ $nameRegex ]];
                then
                    flag=$(cat $BOOK | grep "Name: "$name)
                    if [[ $flag ]];
                    then
                        sed -i "/$name/d" $BOOK
                        echo "Please Insert new information for this contact without any duplicate date for another contacts: "
                        echo " "
                        ./addContact.sh
                        break
                    else echo "Your target Name is Not Found. Please Enter Existed one!"
                    fi
            fi
	    done

        elif [ "$answer" = 5 ]
        then
            exit=1

        else
            echo "Wrong Choice.."
        fi
    done
