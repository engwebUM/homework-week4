# Long Method
In the solution of this project have a smell long method because we have the method `score` very long, so we need split method into many auxiliary methods, and we can see that in file `bowling.rb`.

# Large Class
We have only class (Bowling), and it's smaller, simple and have a single responsability, so this smell is not in this class.

# Feature Envy
This smell have 4 symptoms, they are:

1. Many references to the same object
2. Local variables or params that are used more than instance variables and methods
3. Methods that include a class name in their name
4. Private methods on the same class with the same parameter

And we can't find any symptom inside the class Bowling.