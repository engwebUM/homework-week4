Some considerations about the work that has been done. Remember that this code is a refactored version of the homewoork-week3.
Throughout the homework were applied some Style Guidelines to make the code also more Readable and Comprehensible.

Code Smells Found

There were some Code Smells that were all over the code. The most noticed were:
-Long Method
-Large Class
-On the last version there was a God Class which was the Bowling class, since that class did all the work for the solution


Refactoring
-The first refactoring to be done was to implement the "Extract Class". Here the code was divided between the class Frame, that handles all the work that a Frame implies. This way the code is much easier to maintain and shoul be more readable. The second class is the Bowlling class wich handles the Bowlling game in its full structure.

-After that, the refactoring technique applied was the "Extract Method" in order to make smaller methods that can be also easily maintained. These methods have as few lines as they can hold.

-Some variable have changed their names in order to make the code more readable and easy to understand.

Patterns

For this homework, my opinion is that no explicit pattern was needed to use since the solution that was looked for is not so complex. If it was a more complex solution, the patterns that I might consider to use were the strategy pattern, the decorator pattern or even the observer observable, beeing this one the last one that I would consider.