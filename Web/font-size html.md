

##set relative font size to 10 px instead of 16 px

body {
font-size: 62.5%; /* 1em=10px */
}


##set font size to 24px, in ems, dividing target size (24px) by context (10px) size

h1 {
font-size: 2.4em; /* 24px/10px */
}

##set font for a inside h1 (context 24px) by dividing target size by context size

h1 a {
font-size: 0.6666666666666667em; /* 16px/24px */
}

##set relative font size in ems

h1 {
font-size: 4.375em; /* 70px / 16px */
}
h3 {
font-size: 2.5em; /* 40px / 16px */
}

