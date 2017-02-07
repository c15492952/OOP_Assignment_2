class Player extends GameObject
{
  
  float theta;
  PShape shape;
  char up, down, left, right, shoot;
  int health;
  int ammo;
  float radius = 20;
  float fireRate = 2;
  float toPass =1.0 / fireRate;
  float elapsed = toPass;
  float speed;
  
  Player(float x, float y, float theta, float size, char up, char down, char left ,char right, char shoot)
  {
    this.theta = theta;
    this.size = size;
    pos = new PVector(x,y);
    this.left = left;
    this.right = right;
    this.up = up;
    this.down = down;
    this.shoot = shoot;
    this.health = 100;
    this.ammo = 100;
    speed = 15;
  }
  
  void render()
  {
   pushMatrix();
   translate(pos.x, pos.y,3);
   rotate(theta);
   stroke(0);
   strokeWeight(1);
   fill(255,170,0);
   ellipse(0,0,50,50);
   fill(150);
   rect(-5,-35,10,10);
   popMatrix();
  }
  
  void update()
  {
    
    if(checkKey(up))
    {
      pos.y-=speed;
      theta = radians(0);
    }
    if (checkKey(down))
    {
      pos.y+=speed;
      theta = radians(180);
    }
    if (checkKey(left))  
    {
      pos.x-=speed;
      theta = radians(270);
    }
    if (checkKey(right))
    {
      pos.x+=speed;
      theta = radians(90);
    }
    
    if (checkKey(shoot) && elapsed > toPass && ammo > 0)
    {
      
      Bullet b = new Bullet(pos.x, pos.y, theta, 4);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
    }
    
   if (frameCount % 40 == 0)
    {
      Enemy enemy1 = new Enemy(random(0, width), random(0, height), random(4,10), (float)50);
      gameObjects.add(enemy1);
    }
    elapsed += timeDelta;
    
    
    
    if(pos.y < 25)
    {
      pos.y = 25;
    }
    else if(pos.y > height -25)
    {
      pos.y = height - 25;
    }
    else if(pos.x < 25)
    {
      pos.x = 25;
    }
    else if(pos.x > width - 25)
    {
      pos.x = width - 25;
    }
    
    
    
    if(pos.x > width - 200 && pos.y < 200 && money >= 3000)
    {
      if(keyPressed)
      {
        if(key == 'e')
        {
          health = 150;
          money -= 3000;
        }
      }
    }
    
    if(pos.x < 200 && pos.y < 200 && money >= 3000)
    {
      if(keyPressed)
      {
        if(key == 'e')
        {
          ammo = 100;
          money -= 3000;
        }
      }
    }
    if(health < 30)
    {
      noFill();
      strokeWeight(30);
      stroke(255,0,0);
      rect(0,0,width,height);
    }
    if(health <= 0)
    {
      backdrop = 2;
    }
    pushMatrix();
    translate(0,0,5);
    textFont(font2);
    fill(160,0,0);
    text("Ammo: " + ammo, width - 280, height - 25);
    text("health: " + health, 25, height - 25);
    text("$" + money, width/3, 50);
   // text(score + " points", width - width/3, height -25);
    popMatrix();
  }
}