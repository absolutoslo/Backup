###JavaScript *start*

##Code Academy course

To display the content in the document

```
document.write()
```

To do more complex coding, we need a way to "save" these values. We can do this using variables. A variable stores a string, number, or boolean, and gives it a specific, case-sensitive name.

```
var myName = "Chiara";

drawName(myName);
```

Function named ```drawName()``` draws the name on the screen.

#####Arrays store lists of data

Anytime you see data surrounded by ```[]```, it is an array.

Example (with if statement):
```
var red = [0, 100, 63];
var orange = [40, 100, 60];
var green = [75, 100, 40];
var blue = [196, 77, 55];
var purple = [280, 50, 60];

var myName = "Chiara";
var letterColors = [red, orange, green, blue, purple];

if(10 > 3) {
    bubbleShape = "circle";
}

else {
    bubbleShape = "square";
}

drawName(myName, letterColors);
```

Add the function bounceName() as the last line of your program after the drawName() function. Remember that bounceName() is a function that does not take any inputs.
```
bounceName()
bounceBubbles()
```
