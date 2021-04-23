
// Square Koch Fractal

ArrayList<Line> generation;
int offset = 30;

void setup()
{
  size(800, 800);
  generation = new ArrayList<Line>();
  float w = width - 2 * offset;
  float h = height - 2 * offset;
  PVector a = new PVector(offset + w / 4, offset + h / 4);
  PVector b = new PVector(width - (offset + w / 4), offset + h / 4);
  PVector c = new PVector(width - (offset + w / 4), height - (offset + h / 4));
  PVector d = new PVector(offset + w / 4, height - (offset + h / 4));
  //*
  generation.add(new Line(a, b));
  generation.add(new Line(b, c));
  generation.add(new Line(c, d));
  generation.add(new Line(d, a));
  //*/
  //*
  generation.add(new Line(d, c));
  generation.add(new Line(c, b));
  generation.add(new Line(b, a));
  generation.add(new Line(a, d));
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

void mouseClicked()
{
  generation = generate();
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
    PVector f = l.F();
    next.add(new Line(a, b));
    next.add(new Line(b, c));
    next.add(new Line(c, d));
    next.add(new Line(d, e));
    next.add(new Line(e, f));
    //*
    next.add(new Line(f, e));
    next.add(new Line(e, d));
    next.add(new Line(d, c));
    next.add(new Line(c, b));
    next.add(new Line(b, a));
    //*/
  }
  
  return next;
}
