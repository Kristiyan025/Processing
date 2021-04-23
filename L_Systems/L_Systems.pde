
// L-Systems

PVector start;
float startAngle;
String axiom;
ArrayList<Rule> rules; 
float angle;
float len;
float coef = .8;

void setup()
{
  size(800, 800);
  rules = new ArrayList<Rule>();
  /*
  start = new PVector(6 * width / 7, height / 7);
  startAngle = 0;
  axiom= "X+X+X+X+X+X+X+X";
  angle = radians(45);
  len = 3;
  rules.add(new Rule('X', "X+YF++YF-FX--FXFX-YF+X"));
  rules.add(new Rule('Y', "-FX+YFYF++YF+FX--FX-YF"));
  //*/
  //*
  start = new PVector(width / 2, 0.95 * height);
  startAngle = 0;
  axiom= "F";
  angle = radians(35);
  len = 3;
  rules.add(new Rule('F', "F[+FF][-FF]F[-F][+F]F"));
  //*/
  /*
  start = new PVector(width / 3, 0.95 * height);
  startAngle = PI / 8;
  axiom = "X";
  angle = radians(25);
  len = 10;
  rules.add(new Rule('X', "F+[[X]-X]-F[-FX]+X"));
  rules.add(new Rule('F', "FF"));
  //*/
}

void draw()
{
  background(51);
  stroke(255, 100);
  
  push();
  translate(start.x, start.y);
  rotate(-PI / 2);
  rotate(startAngle);
  for(int i = 0; i < axiom.length(); i++)
  {
    char c = axiom.charAt(i);
    if(c == 'F')
    {
      line(0, 0, len, 0);
      translate(len, 0);
    }
    else if(c == '+')
    {
      rotate(-angle);
    }
    else if(c == '-')
    {
      rotate(angle);
    }
    else if(c == '[')
    {
      push();
      len *= coef;
    }
    else if(c == ']')
    {
      pop();
      len /= coef;
    }
  }
  pop();
}

void mousePressed()
{
  axiom = generate();
}

String generate()
{
  String next = "";
  for(int i = 0; i < axiom.length(); i++)
  {
     char c = axiom.charAt(i);
     boolean found = false;
     for(Rule r : rules)
     {
       if(c == r.from)
       {
         next += r.to;
         found = true;
         break;
       }
     }
     if(!found)
     {
       next += c;
     }
  }
  
  return next;
}
