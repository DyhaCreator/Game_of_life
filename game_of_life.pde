int size = 100,gen;
boolean world[][] = new boolean[size][size];
float sizeMesh;
void setup(){
  size(1000,1000);
  frameRate(10);
  noStroke();
  sizeMesh=width/size;
  stroke(255);
  for(int y=0;y<size;y++){
    for(int x=0;x<size;x++){
      if(random(2)<1){world[x][y]=true;}
    }
  }
  /*world[3][3]=true;
  world[2][3]=true;
  world[4][3]=true;
  world[2][1] = true;
  world[3][2] = true;
  world[1][3] = true;
  world[2][3] = true;
  world[3][3] = true;*/
}
void draw(){
  boolean nextWorld[][] = new boolean[size][size];
  background(0);
  for(int x=1;x<size;x++){
    strokeWeight(1);
    noStroke();
    line(x*sizeMesh,0,x*sizeMesh,height);
    line(0,x*sizeMesh,width,x*sizeMesh);
  }
  for(int y=0;y<size;y++){
    for(int x=0;x<size;x++){
      if(world[x][y]==true){square(x*sizeMesh,y*sizeMesh,sizeMesh);}
    }
  }
  for(int y=1;y<size-1;y++){
    for(int x=1;x<size-1;x++){
      int neibor=0;
      if(world[x-1][y]==true){neibor++;}
      if(world[x][y-1]==true){neibor++;}
      if(world[x+1][y]==true){neibor++;}
      if(world[x][y+1]==true){neibor++;}
      if(world[x+1][y+1]==true){neibor++;}
      if(world[x-1][y+1]==true){neibor++;}
      if(world[x+1][y-1]==true){neibor++;}
      if(world[x-1][y-1]==true){neibor++;}
      if(neibor==3){nextWorld[x][y]=true;}
      else if(neibor==2&&world[x][y]==true){nextWorld[x][y]=true;}
      else{nextWorld[x][y]=false;}  
      //println(nextWorld[x][y]);
    }
  }
  world=nextWorld;
  text(gen,0,10);
  gen++;
}
