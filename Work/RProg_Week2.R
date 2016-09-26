z<-5
while(z >= 3 && z <= 10){
  print(z)
  count<-rbinom(1,1,0.5)
  if(count ==1){ ##Random Walk
    z <- z + 1
  } else{
    z<-z-1
  }
}
for(i in 1:100){
  if(i <= 20){
    ##Skip the first 20 iterations
    next()
  }
  print(i)
}
