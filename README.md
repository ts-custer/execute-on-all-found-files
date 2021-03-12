# execute-on-all-found-files
A Bash script to execute a custom program on all files of the current directory and its subdirectories (recursively)

## Usage

```
$ x_on_files.sh  <program>  <suffix>
```


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

Before `x_on_files.sh` starts its work you will have to enter a number to confirm:

```
WARNING: You are going to execute program "lame --r3mix" on all .wav files that can be found in the current directory and its subdirectories recursively!
Enter '8' to proceed..
```
The number you will have to enter will be randomly choiced each time.

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








