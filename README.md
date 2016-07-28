# StarWars Logger Web Geeklet

Do you like to keep an eye on thing that happen under the hood of your system?

GeekTool allows to view log file on your Macs desktop. This script ads some style to log viewing by utilizing newly added Web Geeklet (it requires [GeekTool](http://www.tynsoe.org/v2/geektool/) 3.3+)

![image](http://havelock-vetinari.github.io/assets/pics/geeklets_screen.png)

##Installation

1. Clone this repository
2. Add new Web Geeklet
3. Under HTML select "Script" 
3. Set interpreter to /bin/sh
4. Set script to ``bash "path/to/starwars_log.sh"``
5. Set refresh rate to 5 seconds (or value of your choice)



##Customalisations

By default last 100 lines of **/var/log/system.log** are displayed. Use option -f to use different file. Use -n to set number of lines.

You can change the way logs are displayed by using any of following options:

* -s to set font size, ie. "10px" or any valid CSS font-size argument.
* -c to set font color, ie. "rgb(196,250,199)" or "red" or any valid CSS color argument
* -x to set perspective, ie. "20deg" or any other valid CSS rotateX transformation argument

##Thanks

This Geeklet uses great [Inconsolata](https://www.google.com/fonts/specimen/Inconsolata) font designed by [Raph Levien](http://levien.com). Copy of this font is located in **assets** directory.


