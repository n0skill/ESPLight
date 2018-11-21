HEIGHT_BASE = 10;
EDGE = 50;
margin = 4;

module arduino()
{
    translate([(EDGE-27)/2-1    ,(EDGE-35)/2, 4])
    cube([27, 35, 10]);
    
    translate([(EDGE-15)/2,(EDGE-10)/2+20, 4])
    cube([12, 12, 10]);
}
module base()
{
    translate([-margin/2, -margin/2, 0])
    cube([EDGE+margin, EDGE+margin, HEIGHT_BASE]);
}



module plexi(depth)
{
    ma = 0.5;
    // Retirer depth au total pour permettre de mettre une autre pièce après
    cube([40, EDGE-depth, depth]);
    
    translate([-5,10,0])
    cube([5, 2*3+ma, depth+ma]);
    
    translate([-5,30,0])
    cube([5, 2*3+ma, depth+ma]);
}


module plexi_vias(plexi_depth)
{
    rotate([0, -90,0]){
    translate([HEIGHT_BASE, 0, -plexi_depth])
    plexi(plexi_depth);
     
    
    translate([HEIGHT_BASE, EDGE-plexi_depth,0])
    rotate([-90, 0,0])
    plexi(plexi_depth);
  
    translate([HEIGHT_BASE, 0,-plexi_depth])
    rotate([-90, 0,0])
    plexi(plexi_depth);
    
    translate([HEIGHT_BASE,plexi_depth,-EDGE])
    plexi(plexi_depth);
    }
    
}

difference(){
base();
plexi_vias(3.5);
arduino();
}

//plexi(3);
//
//color([10, 0, 20])

//projection(cut=true){
//cube([50, 50, 3]);
//}

//projection(cut=true){
//plexi(3);
//}
