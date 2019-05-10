#!/bin/bash
BOOK="phonebook.txt" 

        # Showing all Contacts with Details:
        nl --number-separator=":    " $BOOK | less