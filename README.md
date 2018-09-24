# nesalot.github.io
## How I made a github Page:
1. Create a new repository named username.github.io, where username is your username (or organization name) on GitHub. If the first part of the repository doesn’t exactly match your username, it won’t work.
2. Clone the repository --> Go to the folder where you want to store your project, and clone the new repository:
  * ```git clone https://github.com/username/username.github.io```
3. Enter the project folder and add an index.html file:
  * ```cd username.github.io```
  * ```echo "Hello World" > index.html```
4. Push it --> Add, commit, and push your changes:
  * ```git add --all```
  * ```git commit -m "Initial commit"```
  * ```git push -u origin master```
5. Fire up a browser and go to https://username.github.io.
