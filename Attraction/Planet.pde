class Planet{
  PVector pos, vel, acc;
  float m;
  color c;
  
  float diameter;
  
  public Planet(float x, float y, float speed, float direction, float mass, color col){
    pos = new PVector(x,y);
    vel = new PVector(speed * cos(direction), speed * sin(direction));
    acc = new PVector(0,0);
    m = mass;
    c = col;
  } 
  
  void show(){
    noStroke();
    fill(c);
    float diameter = sqrt(m);
    ellipse(pos.x,pos.y,diameter,diameter);
  }
  
  void move(){
    vel.add(acc);
    pos.add(vel);
    acc.set(0,0);
  }
  
  void attract(Planet o){
    //Gravity Equation: f = (G * m1 * m2) / r^2
    
    PVector thisPos = pos.copy();
    PVector otherPos = o.pos.copy();
    
    PVector force = thisPos.sub(otherPos);
    float distSq = force.magSq();
    
    float G = 1;
    
    float strength = G * (m *o.m)/distSq;
    
    force.setMag(strength);
    o.applyForce(force);
  }
  
  void applyForce(PVector force){
    PVector f = force.div(m);
    acc.add(f);
  }

}
