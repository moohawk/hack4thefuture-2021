# Team Moohawk: Food For Thought -

## Problem statement

    We are aiming to attack food waste in restauration/cattering with a mix of tech/charity/marketing.
    The reported figure of food waste in the restauration business per country is reported to be around
    4 to 10%.
    Widely suggested measures are

        * Logistic improvements & planning
        * Inventory systems
        * Alternatives to leftovers

## Our approach

    We are all about the alternatives. We would like to use different aspects of mobile trends,
    social effects and gamification to connect restaurants with patrons/foodbanks/people in need to
    minimalize said waste.

    At a glance the application connects service food industry with patrons/volunteers/people in need.

    Once onboarded a restaurant can:
        * Set Happy Hour pricing to combat lefotvers
          * Be able to specify multiple incentives - e.g. reduced pricing/full pricing(with charity contribution).
          * Stretch: Gamify with social action by patrons taking up the offer in case of charity.
          * Gamify with automatic social sharing/endorsement on FB.

        * Set Food Availability in case of waste
          * Claimed by volunteers for food banks or people in need.
          * Stretch: Send notifications if registered as volunteer.

        * Overall stretch: Being able to measure effect by restaurant.

    Patrons can:
        * Search restaurants in area to check for food waste prevention deals

    Volunteers/People in need can:
        * Search Availability to transport, claim, transport. Record effect
        * Stretch: Gamify contributions as sort of Karma

    People in need can:
        * Browse, claim, consume.


## Tech stack

    Fuck knows? Let's start with Python, Go, Flutter and see where we end.


## Plan of action

    * Scrape Restaurants + Location, build store that is possibly to geo query and place on map
    * Expose entities via api - Restaurants / Users -> done (fastest possible)
    * Check if we can build a Flutter interface with map screen + couple of input screens - claim/submit.
    * Train NN that goes BRRRRR
    * ?????
    * Check what doesn't make sense and fix, go back to the drawing board.
