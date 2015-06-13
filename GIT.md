#GIT 

file:///C:/Program%20Files/Git/doc/git/html/gittutorial.html
file:///C:/Program%20Files/Git/doc/git/html/everyday.html

https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control

https://github.com/absolutoslo/datasharing/blob/master/Data%20Scientists%20Toolbox%20Course%20Notes.Rmd

## config
$ git config --global user.name "Your Name Here"
$ git config --global user.email "your_email@example.com"

##### config info
$ git config --list

##### create directory
$ mkdir ~/
##### navigate to directory
$ cd ~/
##### go back to upper directory
$ cd ..


###Go to Sublime directory!!!

```
$ cd /
$ cd c:/"Program Files"/"Sublime Text 3"/"Other"
```

Now you are in the directory and can upload files from here!

##Initiate a repository and remember the remote directory to git

```
git init
$ git remote add origin https://github.com/absolutoslo/Backup.git
$ git push -u origin master
```

#Init - Add remote - Push - Clone
git init
$ git remote add origin https://github.com/yourUserNameHere/test-repo.git
$ git push -u origin master

$ git clone https://github.com/yourUserNameHere/repoNameHere.git

#Add - Commit - Push/Pull/ Branch
git add .
git add -u
git add -A
git commit -m "message"
git push

git pull

git branch

git checkout -b branchname

####To switch back to the master branch type
$ git checkout master


## CLI (Command Line Interface)
`/` = root directory
`~` = home directory
`pwd` = print working directory (current directory)
`clear` = clear screen
`ls` = list stuff
  *  `-a` = see all (hidden)
  *  `-l` = details
`cd` = change directory
`mkdir` = make directory
`touch` = creates an empty file
`cp` = copy
  * `cp <file> <directory>` = copy a file to a directory
  * `cp -r <directory> <newDirectory>` = copy all documents from directory to new Directory
          * `-r` = recursive
`rm` = remove
  * `-r` = remove entire directories (no undo)
`mv` = move
  * `move <file> <directory>` = move file to directory
  * `move <fileName> <newName>` = rename file
`echo` = print arguments you give/variables
`date` = print current date 

###Error fatal:unable to access github port 443
`make sure you are out of corporate environment`