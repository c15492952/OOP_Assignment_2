class Perks
{
 void display()
 {
   //juggernog and ammo cola  design
   pushMatrix();
   translate(width - 200, 0, 2);
   
   strokeWeight(3);
   image(juggernog,0,0,200,200);
   popMatrix();
   
   pushMatrix();
   translate(0, 0, 2);
   fill(0);
   rect(0,0,200,200);
   image(ammoCola, 0, 0, 200,200);
   popMatrix();
 }
}