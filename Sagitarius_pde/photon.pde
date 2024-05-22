class Photon {
  PVector pos, vel;
  ArrayList<PVector> history;
  boolean stopped;
  float theta;
  Photon(float x, float y) {
    this.pos = new PVector(x, y);
    this.vel = new PVector(-c, 0);
    this.history = new ArrayList<PVector>();
    this.stopped = false;
    this.theta = 0;
  }

  void stop() {
    this.stopped = true;
  }

  void update() {
    if (!this.stopped) {
      //if (frameCount % 5 == 0) {
      this.history.add(this.pos.copy());
      //}
      PVector deltaV = this.vel.copy();
      deltaV.mult(dt);
      this.pos.add(deltaV);
    }

    if (this.history.size() > 500) {
      this.history.remove(0);
    }
  }

  void show() {
    strokeWeight(4);
    stroke(255, 0, 0);
    point(this.pos.x, this.pos.y);

    strokeWeight(2);
    noFill();
    beginShape();
    for (PVector v : this.history) {
      vertex(v.x, v.y);
    }

    endShape();
  }
}
