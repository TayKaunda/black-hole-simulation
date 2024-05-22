


int c = 30;
int G = 2;
float dt = 0.1;

Blackhole m87;

ArrayList<Photon> particles = new ArrayList<Photon>();
float start, end;

void setup() {
  fullScreen();
  m87 = new Blackhole(width / 2, height / 2, 10000);

  start = height / 2;
  end = height / 2 - m87.rs * 2.6;

  for (int y = 0; y < start; y += 10) {
    particles.add(new Photon(width - 20, y));
    
  }
}

void draw() {
  background(255);


  stroke(0);
  strokeWeight(1);
  line(0, start, width, start);
  line(0, end, width, end);

  for (Photon p : particles) {
    m87.pull(p);
    p.update();
    p.show();
  }
  m87.show();
}
