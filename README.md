# ip-log-parser / Ruby challenge!
 
Your program must accept two filenames as command-line parameters. These files will contain 7-bit ASCII text, and each line may consist of an IP address, followed by a colon, followed by a comma-separated list of numbers. The two files should be joined on IP address and the numbers from each file should be appended and returned, sorted and without duplicates. The results should be written to stdout as the IP address followed by a colon, followed by a comma separated list of the numbers.

For example, file1:
```
1.2.3.4: 1,3,4
1.2.3.5: 9,8,7,6
```

And file2:
```
1.2.3.4: 4,5,6
1.2.3.6: 1,1,1
``` 

Your program should print:
```
1.2.3.4: 1,3,4,5,6
1.2.3.5: 6,7,8,9
1.2.3.6: 1
```

*Your program should handle errors, including malformed input, appropriately and should be of a sufficient quality that it can run on a production Linux system.*
