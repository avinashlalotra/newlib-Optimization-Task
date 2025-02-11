# To test each function run these commands  
~ `Note` : It requires spike simulator with pk to run the "run.sh" script . Alternatively , qemu can be used also.


cmd
```bash
./run.sh memset_asm.asm memset.c
```
Output
```output
Buffer after memset (10 bytes):
A A A A A A A A A A 
Buffer2 after memset (50 bytes):
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
Buffer3 after memset (0 bytes):
                    
Buffer4 after memset (1000 bytes):
D D D D D D D D D D 

```
cmd
``` bash
/run.sh memset_bonus.asm memset.c
```
Output
```output
Buffer after memset (10 bytes):
A A A A A A A A A A 
Buffer2 after memset (50 bytes):
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
Buffer3 after memset (0 bytes):
                    
Buffer4 after memset (1000 bytes):
D D D D D D D D D D 

```
