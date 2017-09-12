size(400, 400);
// bezier Line
bezier(10, 10, 390, 10, 190, 390, 390, 390);
ellipse(390, 10, 10, 10); //control point
line(10, 10, 390, 10);

// curveVertex
fill(100, 32, 200);
ellipse(10, 0, 5, 5);
beginShape();
curveVertex(100, 200); //invisible Control
curveVertex(100, 200);
curveVertex(200, 50);
curveVertex(300, 200);
curveVertex(390, 200);
curveVertex(390, 200);
endShape();