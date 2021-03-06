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

##### List files in the working directory
$ ls
##### Print working directory
$ pwd
##### create directory
$ mkdir ~/
##### navigate to directory
$ cd ~/
Go to home directory
$ cd
$ cd ~ 
$ cd $HOME
##### go back to upper directory
$ cd ..
##### go back to provious directory
$ cd -

#####Go to Sublime directory!!! Now by default %SUBLIME%

```
$ cd /
$ cd c:/"Program Files"/"Sublime Text 3"/"Other"
```

Now you are in the directory and can upload files from here!

#####Initiate a repository and remember the remote directory to git

```
git init
$ git remote add origin https://github.com/absolutoslo/Backup.git
$ git push -u origin master
```

#####Init - Add remote - Push - Clone
git init
$ git remote add origin https://github.com/yourUserNameHere/test-repo.git
$ git push -u origin master

$ git clone https://github.com/yourUserNameHere/repoNameHere.git

#####Add - Commit - Push/Pull/ Branch
git add .
git add -u
git add -A
git commit -m "message"
git push

git pull

git branch

git checkout -b branchname

#####To switch back to the master branch type
$ git checkout master


####Initiate a new repository

* create a new repo in github.com or fork someone else's repo
* with gitbash, navigate to a folder where you want to clone your repo locally
* when creating a central repository, better start with `git init` and follow with `git clone`
* when creating a local repository from someone else, one can also only run `git clone`

```
git init
git init <directory>
```
```
git clone <repo>
git clone <repo> <directory>
```


## CLI (Command Line Interface)
`/` = root directory
`~` = home directory
`pwd` = print working directory (current directory)
`clear` = clear screen
`ls` = list stuff
`-a` = see all (hidden)
`-l` = details
`cd` = change directory
`mkdir` = make directory
`touch` = creates an empty file
`cp` = copy
`cp <file> <directory>` = copy a file to a directory
`cp -r <directory> <newDirectory>` = copy all documents from directory to new Directory
`-r` = recursive
`rm` = remove
`-r` = remove entire directories (no undo)
`mv` = move
`move <file> <directory>` = move file to directory
`move <fileName> <newName>` = rename file
`echo` = print arguments you give/variables
`date` = print current date 



**Error fatal:unable to access github port 443**
`make sure you are out of corporate environment`


###Find differences between files
#####GIT
* place the two files to compare in the same dir
* files compare1.txt compare2.txt
* navigate to the dir where the files are stored
```
diff - u compare1.txt compare2.txt
```
#####Command Prompt
* same as above
```
FC compare1.txt compare2.txt
```
