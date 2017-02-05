# The Blue Room Solution
##An iOS app to optimize your purchases

### Inspiration
The Blue Room is a popular eatery at Brown University featuring delicious baked goods and quick snacks. Each food item has a set a la carte price. If a Brown student buys food totaling exactly $7.60, they may use a meal swipe (instead of precious points) for their purchase. However, they must use up points if their food costs less, and they must supplement with points if their food costs more. We have dubbed this the "Blue Room Problem."

### What it does
We have developed The Blue Room Solution -- an iOS app that uses our custom algorithm to determine which combinations of items at the Blue Room will sum to an exact amount that the user specifies. Simply enter the amount that you would ultimately like to pay (likely $7.60, though this app can handle any amount) and, with the tap of a button, discover all the possibilities that will maximize what you get for your money. Too many options? Narrow down the results by entering the name of an item you already know you want to buy, and watch as all the results you were never really considering simply disappear.

### How we built it
The Blue Room Solution is written with Objective C in Xcode. It is based on a recursive algorithm that takes in user input and menu data to determine optimal combinations of items.

### Challenges
Before Hack@Brown, none of The Blue Room Solution's developers had had any experience with iOS development. This led to a very steep learning curve with using Xcode. Fortunately, with the power of mentorship, StackOverflow, and pure sleep-deprivation-fueled determination, the app was still able to become a reality.

### What's next for The Blue Room Solution
We would like to expand the scope of The Blue Room Solution by including menus of more eateries around Brown and on other college campuses. Our app can even extend beyond food; imagine walking into a clothing store with a gift card and knowing exactly what to look out for in order to spend it efficiently. We would like to scrape all this data from company websites and store them in databases. Ideally, we would also implement image processing, allowing users to take pictures of menus and let our algorithm determine the best way to spend their money.