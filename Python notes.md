##Python notes


Calculate meal price (and round to 2 decimals)
```
meal = 44.50
tax = 0.0675
tip = 0.15

meal = meal + meal * tax
total = meal + meal*tip

print("%.2f" % total)
```


Escaping characters

There are some characters that cause problems. For example:
```
'There's a snake in my boot!'
```
This code breaks because Python thinks the apostrophe in 'There's' ends the string. We can use the backslash to fix the problem, like this:
```
'There\'s a snake in my boot!'
```

"""
The string "PYTHON" has six characters,
numbered 0 to 5, as shown below:

+---+---+---+---+---+---+
| P | Y | T | H | O | N |
+---+---+---+---+---+---+
  0   1   2   3   4   5

So if you wanted "Y", you could just type
"PYTHON"[1] (always start counting from 0!)
"""
```
fifth_letter = "PYTHON"[4]

print fifth_letter
```

Prova script .py
```
name = raw_input("What is your name?")
quest = raw_input("What is your quest?")
color = raw_input("What is your favorite color?")

print "Ah, so your name is %s, your quest is %s, " \
"and your favorite color is %s." % (name, quest, color)
```