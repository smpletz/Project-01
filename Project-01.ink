/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR academics = 50
VAR social = 50

-> sample_gates

== sample_gates ==
 Summer is officially over. You're not quite sure how you feel about that right now, but one thing you do know is you're free to make your own choices.
 Your parents drop you off at the sample gates, say their last goodbyes until thanksgiving, and start their long drive home. What now?
 
 + [Make your parents proud and walk your classes] -> franklin
 + [Go down Kirkwood and see what it has to offer] -> kirkwood

== franklin ==
{not lobby: Your academics improved! Academics: { increaseAcademics() }|{not ask_club: Your social went down. Social {decreaseSocial()}}}
{Lucky you! The first class on your schedule is in the building right next to you. You go thorugh the doors to Franklin Hall and look around. Your advisor said that you'd be here pretty often, so you might as well familiarize yourself with the place.|You are back at the entrance to Franklin}

* [Go to the lobby] -> lobby
* [Go downstairs] -> downstairs
+ [leave Franklin] -> sample_gates

== lobby ==
What a massive TV! You're definitely in the media school. 
There are some students gathered in a cirlce. It sounds like they're talking about some club related to games.

* [Ask what club they're talking about] -> ask_club
* [Go back to the entrance] -> franklin
-> END

== ask_club ==
Your social just improved! Social: { increaseSocial() }
Club member - Oh hi! We're all in the game design club! We work together on games and bounce ideas for our own projects off each other. Are you interested in joining?

* [Join the club] -> join
* [Turn down the offer] -> decline

== join ==

-> END

== decline ==

-> END

== downstairs ==

-> END

== kirkwood ==
Hi
-> END




== function increaseAcademics ==
    ~ academics = academics * 1.25
    {
        - academics > 100:
            ~ academics = 100
    }
    ~ return round(academics)
    
== function decreaseAcademics ==
    ~ academics = academics * (2/3)
    ~ return round(academics)
    
== function increaseSocial ==
    ~ social = social * 1.5
    {
        - social > 100:
            ~ social = 100
    }
    ~ return round(social)
== function decreaseSocial ==
    ~ social = social * (2/3)
    ~ return round(social)

== function round(element) ==
    VAR remainder = 0
    ~ remainder = element%1
    {
        - remainder >= 0.5:
            ~ element = element - remainder + 1
        - else:
            ~ element = element - remainder
    }
    






