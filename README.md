# Winter 2016 #

##Instructor##

Gamal DeWeever

[Facebook](facebook.com/gdeweever)

[gadeweever@uchicago.edu](mailto:gadeweever@uchicago.edu)

## The Class ##

We go over Rails and the web. I try to place our development in between cutting-edge and how people do it now. The class is four weeks long, and after that just specific office hours (TBA) for things you want your apps to do

## VM Connection ##

You will be assigned a VM (virtual machine). The virtual machine is where your server runs so that you may test your application while you are developing. This relieves you of setting up your own machine. This class will not cover setting up Rails on your own machine. You will login with your credentials through SSH.

### Unix(OSX/Ubuntu) ###

Open Terminal(the Terminal on your computer) and type the following:
```
ssh myusername@vmname.cloudapp.net
```
You will be prompted for a password. Enter it. Your prompt will change and you should see your VM.

### Windows ###

Windows users will want to download an SSH application. I recommend [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html). Open Putty. in the Host Name box, type:
```
vnmane.cloudapp.net
```
Click open. enter your username and password at the prompt. You should be able to access your machine now.

## Git ##

In order to get our files on the server and to get everyone acquainted with the modern development word, we use git to transfer files from the server to our local computers. The git workflow for putting a new file on the server is below:

```
C:\Users\Gamal\Documents\GitHub\Introduction-to-Web-Development> git add .\README.md
C:\Users\Gamal\Documents\GitHub\Introduction-to-Web-Development> git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   Week 1/2015lecture1.md
        modified:   Week 2/2015lecture2.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        README_OLD.md
        Week 2/customer.rb
        Week 3/Anagrams/anagrams.txt
        Week 3/Anagrams/anagramsnew.rb

C:\Users\Gamal\Documents\GitHub\Introduction-to-Web-Development> git commit -m "new readme"
[master f351cb3] new readme
 1 file changed, 37 insertions(+), 101 deletions(-)
 rewrite README.md (99%)
C:\Users\Gamal\Documents\GitHub\Introduction-to-Web-Development> git push origin master
Counting objects: 7, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.04 KiB | 0 bytes/s, done.
Total 3 (delta 1), reused 0 (delta 0)
To https://github.com/edge-academy/Introduction-to-Web-Development.git
```
The flow consists of four commands, add, commit, and push.
```
git status
```
Git status shows you what git is tracking and what it is not. When you want to get your changes on the server, go to your SSH window in Terminal, go into your app's folder and type:
```
git pull
```
This will update all of the files in your app with the changes. **Note**: Git is not magical. What if you have 20 repositories on your computer? Would you expect git to know what code base you are referring to? No. And it doesn't. Git only works inside of a folder with a ".git" folder. Everything it says will be in reference to THAT code base. You can't do a Git pull from your Desktop. What would that even mean?

## Concerns? ##

Email me. Facebook me. Facebook is faster.
