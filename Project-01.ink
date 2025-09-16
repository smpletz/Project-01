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

VAR flyer = false
VAR club = false

-> sample_gates

== sample_gates ==
 Summer is officially over. You're not quite sure how you feel about that right now, but one thing you do know is you're free to make your own choices.
 Your parents drop you off at the sample gates, say their last goodbyes until thanksgiving, and start their long drive home. What now?
 
 * [Make your parents proud and check out your classes] -> franklin
 + [Go down Kirkwood and see what it has to offer] -> kirkwood

== franklin ==
The clock in the lobby reads {4 o'clock|5 o'clock|6 o'clock}.
{not lobby or not downstairs: Your academics improved! Academics: { increaseAcademics() }{academics}|{not ask_club: Your social went down. Social {decreaseSocial()}{social}}}
{Lucky you! The first class on your schedule is in the building right next to you. You go thorugh the doors to Franklin Hall and look around. Your advisor said that you'd be here pretty often, so you might as well familiarize yourself with the place.|You are back at the entrance to Franklin}
{lobby and downstairs: It's getting late and now your stomach's talking. Better go find some food.}

* [Go to the lobby] -> lobby
* [Go downstairs] -> downstairs
+ {lobby or downstairs} [Leave Franklin] -> sample_gates

== lobby ==
What a massive TV! You're definitely in the media school. 
There are some students gathered in a cirlce. It sounds like they're talking about some club related to games.

* [Ask what club they're talking about] -> ask_club
* [Go back to the entrance] -> franklin
-> END

== ask_club ==
Your social just improved! Social: { increaseSocial() } {social}
Club member - Oh hi! We're all in the game design club! We work together on games and bounce ideas for our own projects off each other. Are you interested in joining?

* [Join the club] -> join
* [Turn down the offer] -> decline

== join ==
Your social just improved! Social: { increaseSocial() } {social}
Club member - We're happy to have you! Would you like our flyer? It'll help you learn more about us and maybe even spread the word!

* [Take the flyer] -> flyer_pickup
* [Turn it down] -> goodbye

== flyer_pickup ==
~ flyer = true
-> goodbye

== goodbye ==
Sorry to cut this short, but we're heading down Kirkwood right now and you're welcome to come!
* [Go with the group] -> kirk_club
* [Decline and continue to check out your classes] -> decline

== kirk_club ==
~ club = true
-> kirkwood

== decline ==
Club member - {join: Ah, understandable. Have a good time and we hope to hear from you soon!|That's ok, but feel free to reach out if you change your mind!}

-> franklin

== downstairs ==
You descend into the basement and find yourself in what appears to be a small group of people leaving a meeting. You overhear some names, sure that you'll know them all later. You remember your older brother told you about that Chabane guy and said that Andrew has great taste in music, so those names line up.

{social > 75: You're feeling confident. Do you want to talk to the professors?}
* {social > 75} [Talk to the professors] -> professors
* [Continue exploring] -> explore

== professors ==
Your social just improved! Social: { increaseSocial() } {social}
Your academics just improved! Academics: { increaseAcademics() } {academics}
You introduce yourself to the professors and are pleasantly surpised to find out how friendly they are! They seemed in a hurry, but at least you know you can look forward to seeing them agian!
* [Continue exploring] -> explore

== explore ==
You find yourself in a room full of gaming computers. They're from the brand that your brother doesn't like, but what does he know? They look like they can get the job done. You feel some comfort knowing that this school has so much to offer. {flyer: Lucky for you, the handout the club gave you said that they'd meet here sometimes.}

* [Leave to find your next class] -> franklin

== kirkwood ==
{not franklin: Academics can wait. You know what you came for.|Time to explore what Bloomington has to offer outside of school!}
{club: You follow the club down kirkwood, excited as you pass by all these cool places. Some of these places you're already familiar with, but others you can't wait to go to for the first time! You wonder where the group will take you.|Food is a priority, so thats where you decide to go first.}
* {club} -> bagel
* {not club} [Go to Canes] -> canes
* {not club} [Try the weird looking asian place] -> zc

== canes ==
You walk through the doors to canes, excited to taste something familiar in this not-so-familiar place. You order some food and sit down to eat, but are surpised to see your roommate sit across from you!
Roommate - Glad to see we've got similar taste!
You - No kidding! How's your first day in town going?
Roommate - Not bad, I'm pretty academically focused so I just walked my classes and talked with some professors. How about you?

* {academics > 70} [I'd like to think I'm pretty academically focused too] -> academic
* [I'm trying to get the full college experience] -> experience

== academic ==
Your social just improved! Social: { increaseSocial() } {social}
Your academics just improved! Academics: { increaseAcademics() } {academics}
Roommate - Thats great to hear! I've already got a study group going on, so come by and join some time!
You - I'd be happy to!

You and your roommate finish eating and go back to your dorm. You feel like things are looking up and start to feel excited for the semester to start.
Final stats: 
Social: {social} 
Academics: {academics}
-> END

== experience == 
Roommate - Ah, well don't keep me up too late! Just kidding. Kinda.
You - Don't worry, I'm not that crazy.
The two of you finish your meals and go your seperate ways. The mood of the town has changed, and you feel like you'd be amissed if you didn't check out the nightlife scene.
* [Check out the bar] -> bar

== zc ==
You walk into the small resteraunt and immediately know it's gonna be good. The guy behind the counter kind of yells at you, but you get your order in and are pleasantly surpised to get it just moments later. As you're eating, some guys you went to high school with walk in. You smell a bit of alcohol in his breath, but you're not too surpised.
Friend - Yooooooo no way you go here too!
You - Yeah man, first day in town!
Friend - I've been here for a bit already, but I've heard this place is great. I just left the bar above us, but if you're down I'm about to go to the one across the street.

* [Take up the offer] -> bar
* [Turn down the offer and go back to your dorm] -> home

== bar ==
Your social just improved! Social: { increaseSocial() }
{zc: You and your friend go to the bar.} The bar looks so cool! You enjoy a couple drinks, meet some other students, and have a good time. You know that the college life is what you'd hoped for. 
The night changes as your friend gets too drunk. You leave the bar to walk him home. You're happy to find out that his roommates are all guys you knew from high school! You hang out with them for the night, excited for what the future at college holds.
Final stats: 
Social: {social} 
Academics: {academics}
-> END 

== home ==
You go home, calling the night short. It was pretty exhausting moving in earlier, so who can blame you. You await your roommates arrival and start to wonder how else you could have spent your time...
Final stats: 
Social: {social} 
Academics: {academics}
-> END

== bagel ==
You - A bagel place? Is this really the best dinner place around?
Club member - Not really, but they make some amazing bagels, so we come here all the time.

You aren't sure what to think of it, but the bagels really are calling your name.

* [Order a bagel] -> order

== order ==
You order what one of the other club members did, trusting their instinct. To your surprise, it's actually really good! Filling too...
You enjoy the rest of the evening talking with what you imagine will soon come to be your close friends. You're happy with how the day went and decide to head to your dorm to end your first day adventure.
Final stats: 
Social: {social} 
Academics: {academics}
-> END




== function increaseAcademics ==
    ~ academics = academics * 1.25
    {
        - academics > 100:
            ~ academics = 100
    }
    ~ academics = round(academics)
    
== function decreaseAcademics ==
    ~ academics = academics * (2/3)
    ~ academics = round(academics)
    
== function increaseSocial ==
    ~ social = social * 1.5
    {
        - social > 100:
            ~ social = 100
    }
    ~ social = round(social)
    
== function decreaseSocial ==
    ~ social = social * (2/3)
    ~ social = round(social)
    
== function round(element) ==
    VAR remainder = 0
    ~ remainder = element%1
    {
        - remainder >= 0.5:
            ~ element = element - remainder + 1
        - else:
            ~ element = element - remainder
    }
    ~return element
    






