# execute-on-all-found-files
A Bash script to execute a custom program on all files of the current directory and its subdirectories (recursively)

## Usage

```
$  x_on_files.sh  program  suffix  [further program arguments]
```
The "further program arguments" are optional.


## Example

Given the following files and directories:

```
file1.txt
file2.wav
dir1-----file3.txt
         file4.wav
         file5.txt
dir2-----file6.wav
         file7.txt
         dir3-----file8.wav
                  file9.txt
```

.. and you want to convert all .wav files into .mp3 files with program "lame".

Instead of several executions:
```
$ lame file2.wav
$ lame ./dir1/file4.wav
$ lame ./dir2/file6.wav
$ lame ./dir2/dir3/file6.wav
```

You can use the script `x_on_files.sh`:

```
$ x_on_files.sh lame .wav
```

You can use options of program "lame" if you use double quotes:

```
$ x_on_files.sh "lame --r3mix" .wav
```

Before `x_on_files.sh` starts its work you will see what will be executed and you will have to enter a number to confirm:

```
You are going to execute the following on all *.wav files that can be found in the current directory and its subdirectories recursively:
lame --r3mix [*.wav file]
Enter '8' to confirm..
```
The number you will have to enter will be randomly chosen each time.

After `x_on_files.sh` is finished your files and directories will look like that:

```
file1.txt
file2.wav
file2.mp3
dir1-----file3.txt
         file4.wav
         file4.mp3
         file5.txt
dir2-----file6.wav
         file6.mp3
         file7.txt
         dir3-----file8.wav
                  file8.mp3
                  file9.txt
```

Well, then you could delete all .wav files with:

```
x_on_files.sh "rm -f" .wav

```

## Example with further program arguments

Given the following files and directories:

```
pic1.svg
pic2.png
dir1-----pic3.svg
         pic4.png
         pic5.svg
dir2-----pic6.png
         pic7.svg
         dir3-----pic8.png
                  pic9.svg
dir3
```

You can copy all *.svg files into directory "dir3" with:
```
$ x_on_files.sh cp .svg ./dir3
```

You will see the following message:

```
You are going to execute the following on all *.svg files that can be found in the current directory and its subdirectories recursively:
cp [*.svg file] ./dir3
Enter '2' to confirm..
```
... where the number you will have to enter could be different, of course.

After `x_on_files.sh` is finished your files and directories will look like that:

```
pic1.svg
pic2.png
dir1-----pic3.svg
         pic4.png
         pic5.svg
dir2-----pic6.png
         pic7.svg
         dir3-----pic8.png
                  pic9.svg
dir3-----pic1.svg
         pic3.svg
         pic5.svg
         pic7.svg
         pic9.svg
```







