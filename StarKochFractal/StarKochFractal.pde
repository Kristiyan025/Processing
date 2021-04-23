
// Star Koch Fractal

ArrayList<Line> generation;
int len = 600;

void setup()
{
  size(800, 800);
  generation = new ArrayList<Line>();
  float r = len * sqrt(3) / 2 / 3;
  float l = len * sqrt(3) / 3;
  PVector a = new PVector(width / 2 - l, height / 2 - r);
  PVector b = new PVector(width / 2 + l, height / 2 - r);
  PVector c = new PVector(width / 2, height / 2 + l);
  generation.add(new Line(a, b));
  generation.add(new Line(b, c));
  generation.add(new Line(c, a));
  /*
  generation.add(new Line(a, c));
  generation.add(new Line(c, b));
  generation.add(new Line(b, a));
  //*/
}

void draw()
{
  background(51);
  stroke(255);
  
  for(Line l : generation)
  { 
    l.display();
  }
}

void mousePressed()
{
  generation = generate();
}

float ds = 3;

void keyPressed()
{
  for(Line l : generation)
  {
    l.start.add(random(-ds, ds), random(-ds, ds));
    l.end  .add(random(-ds, ds), random(-ds, ds));
  }
}

ArrayList<Line> generate()
{
  ArrayList<Line> next = new ArrayList<Line>();
  for(Line l : generation)
  {
    PVector a = l.A();
    PVector b = l.B();
    PVector c = l.C();
    PVector d = l.D();
    PVector e = l.E();
    next.add(new Line(a, b));
    next.add(new Line(b, c));
    next.add(new Line(c, d));
    next.add(new Line(d, e));
    /*
    next.add(new Line(e, d));
    next.add(new Line(d, c));
    next.add(new Line(c, b));
    next.add(new Line(b, a));
    //*/
  }
  
  return next;
}
