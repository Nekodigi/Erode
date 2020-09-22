float offInc = 0.01;//offset increment
ArrayList<CircleCut> ccs = new ArrayList<CircleCut>();

void setup(){
  size(500, 500);
  
  for(int i=0; i<height/50+1; i++){
    ccs.add(new CircleCut(new PVector(width/2, i*50)));
  }
}

void draw(){
  noStroke();
  background(0);
  fill(255);
  rect(0, 0, width/2, height);
  fill(0);
  for(CircleCut cc : ccs){
    cc.update();
    cc.show();
  }
}

class CircleCut{
  PVector pos;
  float boff, ioff, r;
  
  CircleCut(PVector pos){
    this.pos = pos;
    this.boff = random(100);
    //boff = pos.y/1000;
    this.r = random(50, 100);
    ioff = boff;
  }
  
  void update(){
    ioff += offInc;
  }
  
  void show(){
    float xoff = -noise(ioff)*r;
    float rt = noise(ioff, 1)*r+r/2;
    //float rt = r;
    ellipse(pos.x+xoff, pos.y, rt*2, rt*2);
    rect(pos.x+xoff, pos.y-rt, width, rt*2);
  }
}
