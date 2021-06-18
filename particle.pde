class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;
 
  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }
 
  void addParticle() {
    int multiHolder=1;
    if(random(1)>.99)
      multiHolder=int(random(20));
    particles.add(new Particle(origin, multiHolder));
  }
 
  void applyForce(PVector f) {
    for (Particle p: particles) {
      p.applyForce(f);
    }
  }
 
  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = (Particle) it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}

//particle declaration and constructor
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  int multi=1;
 
  float mass = 1;
 
  Particle(PVector l, int multiNum) {
    
    acceleration = new PVector(random(-a,a), random(-a,a), random(-a,a));
    velocity = new PVector(random(-vel,vel),random(-vel,vel),random(-vel,vel));
    location = l.get();
    lifespan = 255;
    multi = multiNum;
  }
 
 //run update and display for each particle
  void run() {
    update();
    display();
  }

//apply force to partciles
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);
  }
 
 //update particle position
  void update() {
    velocity.add(acceleration);

    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 0.5;
  }
 
 //display particles in psystem
  void display() {
    noFill();
    // fill((((lifespan/colorSpan)%255+colorSpec+inc*500)%255*noise(location.x,location.y,location.z)+90*noise(location.z,location.y,location.x))%255, lifespan*noise(location.x,location.y,location.z), lifespan/2, lifespan/2);
    pushMatrix();
      translate(location.x,location.y,location.z);
      if(random(1)>0.50 && doThicc)
        strokeWeight(random(80));
      else strokeWeight(1);
      pushMatrix();
        //rotate by lifespan and noise
        float damp = 10;
        // rotateX(lifespan*cos(inc2)*sin(inc2)/10*noise(inc2)*location.x/damp);
        // rotateY(lifespan*sin(inc2)*cos(inc2)/10*noise(inc2+PI/3)*location.y/damp);
        // rotateZ(lifespan*sin(inc2)*sin(inc2)/10*noise(inc2+TWO_PI/3)*location.z/damp);

        // amp=gain*fft.getBand(int(lifespan/255)*512);
        // amp=0.0002*gain-gain*getAverageFFT(int(lifespan/255)*512)/50000;
        amp=0.0002*gain-fft.getBand(int((lifespan/255)*512))*gain/1000;

        for(float i=multi; i>0; i--) {      

          if(!doColorChange) 
            // stroke((((lifespan/colorSpan)%255+colorSpec+inc*500)%255*noise(location.x,location.y,location.z)+10*noise(location.z,location.y,location.x))%255, lifespan*2, lifespan*2, lifespan*2);
            // stroke(255,255,180,100);
            // stroke((((seed+lifespan/colorSpan)%255+colorSpec+inc*500)%255*noise(location.x,location.y,location.z)+90*noise(location.z,location.y,location.x))%255,
            stroke((100*noise(location.x,location.y,location.z)+seed+inc+colorSpec)%(255*colorSpan*abs(sin(inc))), 
              lifespan*noise(location.x,location.y,location.z), 
              lifespan/2, 
              lifespan/2);
          else
            stroke(colorChange);

          drawShape(amp,i);
        }
      popMatrix();
    popMatrix();
  }
 
  boolean isDead() {
    if (lifespan < 0.0)
      return true;
    else
      return false;
  }
}