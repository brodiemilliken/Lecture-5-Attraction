Planet[] planets;
Planet sun;

void setup(){
  fullScreen();
  planets = new Planet[60];
  //Sun at middle of screen with no velocity, 1000 mass and yellow
  sun = new Planet(width/2,height/2,0,0,1000,color(255,255,0));
  planets[0] = sun;
  
  //Loop through remaining planets and give random attributes
  for (int i = 1; i < planets.length; i++){
    
    //set minimum maximum distance of planet from sun
    float d = random(50,height/2);
    float dir = random(0,TWO_PI);
    
    float x = width/2 + d * cos(dir);
    float y = height/2 + d * sin(dir);
    
    float m = random(1,10);
    
    float speed = sqrt(sun.m/d);
    color col = color(random(0,255),random(0,255),random(0,255));
    
    planets[i] = new Planet(x,y,speed,dir + PI/2, m, col);
  }
}

void draw(){
  background(0);
  //Make planets attract each other
  //Need double loop so that each planet can attract every other planet
  for (int i = 0; i < planets.length; i++){
    for (int j = 0; j < planets.length; j++){
      if (i==j) j++; //A planet should not be able to attract itself
      else planets[i].attract(planets[j]);
    }
    planets[i].move();
    planets[i].show();
  }
}
