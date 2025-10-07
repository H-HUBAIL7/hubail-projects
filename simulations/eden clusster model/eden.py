import random as rd 

grid=[]
rto=[]
oc=[]
for i in range(-1000,1000):
    for j in range (-1000,1000):
       grid.append((i,j))
       
       
       
oc=[(0,0)] 
grid.remove((0,0))
rto=[(1,0),(0,1),(-1,0),(0,-1)]
for i in rto:
    grid.remove(i)

with open ("eden.txt", "w") as file:
    for p in range (100):
        print(p)
        ch=rd.choice(rto)
        file.write(f"{ch[0]}\t{ch[1]}\n")
        rto.remove(ch)
        if (ch[0]+1,ch[1]) in grid:
            rto.append((ch[0]+1,ch[1]))
            grid.remove((ch[0]+1,ch[1]))
        
        if (ch[0]-1,ch[1]) in grid:
            rto.append((ch[0]-1,ch[1]))
            grid.remove((ch[0]-1,ch[1]))
        
        if (ch[0],ch[1]+1) in grid:
            rto.append((ch[0],ch[1]+1))
            grid.remove((ch[0],ch[1]+1))  
            
        if (ch[0],ch[1]-1) in grid:
            rto.append((ch[0],ch[1]-1))
            grid.remove((ch[0],ch[1]-1))