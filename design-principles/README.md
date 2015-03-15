# Single Responsability Principle (SRP)
If I using frames in my project, the better way for this is create a new class called "Frame" for separate the responsabilities. And then use this class inside the class "Bowling".

# Open Closed Principle (OCP)
The definition of this principle said that a class or module must be open for extension but closed for modification. So we look the files `violatesOCP.rb` and `OCP.rb`, in first case for the roll we need a "HardBall" for execute the roll, now imagine that we need a "EasyBall", we need change the class for resolution this problem, but if we follow the OCP is more easy, so in method roll we can pass a parameter that define the type of the ball (type_ball), look the code in file `OCP.rb`. In this way we can roll with any type of ball without change class.

# Liskov Substitution Principle (LSP)
We can see the example of LSP in file `pin.rb`. Imagine that we need a pin, so we using the class "Pin", now imagine that we need add diferents pins with colors, so with class "PinColor" we can create pins with color without change class "Pin". The Class "PinColor" inherits the behavior of class "Pin" and is added the color atribute, so we can create normal pins and pins with colors without change the funcionalities of normal pins. 

# Interface Segragation Principle (ISP)
We can see the example of ISP in files `violateISP.rb` and `ISP.rb`. In first file we can see that the normal player and the professional player have access of all methods of the class "Ball" but both not using all methods, so in this file we can see a violation of ISP. For resolution this problem we can see the file `ISP.rb`, that the methods of the class "Ball" were separated in diferents classes, so the normal player use instances of class "Ball" that include the methods really necessary, the same happen with the professional player, using only the methods of class "ProBall".

# Dependency of Inversion Principle (DIP)
We can see the example of DIP in files `violateDIP.rb` and `DIP.rb`. In first file if we want create a player we need pass a shoe to him. But we do not want that the player is dependent of shoe for follow de DIP, and for this we just look the file `DIP.rb`, that the player not have dependency of shoe, when we created the player, is created a shoe for default. We can easily swap the shoe at run time. 