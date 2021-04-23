class Line
{
  PVector start;
  PVector end;
  
  Line(PVector start, PVector end)
  {
    this.start = start;
    this.end= end;
  }
  
  void display()
  {
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector A()
  {
    return this.start.copy();
  }
  
  PVector B()
  {    
    PVector a = this.start.copy();
    PVector part = PVector.sub(this.end, this.start);
    part.div(3);
    a.add(part);
    return a;
  }
  
  PVector C()
  {
    PVector a = this.start.copy();
    PVector part = PVector.sub(this.end, this.start);
    part.div(3);
    a.add(part);
    part.rotate(-PI / 2);
    a.add(part);
    return a;
  }
  
  PVector D()
  {
    PVector a = this.start.copy();
    PVector part = PVector.sub(this.end, this.start);
    part.div(3);
    a.add(part);
    a.add(part);
    part.rotate(-PI / 2);
    a.add(part);
    return a;
  }
  
  PVector E()
  {
    PVector a = this.start.copy();
    PVector part = PVector.sub(this.end, this.start);
    part.div(3);
    part.mult(2);
    a.add(part);
    return a;
  }
  
  PVector F()
  {
    return this.end.copy();
  }
}
