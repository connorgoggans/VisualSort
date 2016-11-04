ArrayList<Integer> BUBBLE_SORT_LIST; //<>//
float frequency = -10.0;
int listSize = 10;

void setup() {
  size(1400, 800);

  background(0);

  BUBBLE_SORT_LIST = new ArrayList<Integer>();
  generateList(BUBBLE_SORT_LIST);

  noLoop();
  
  redraw();
}

void draw() {
  for (int i = 0; i < BUBBLE_SORT_LIST.size(); i++) {
    fill(generateRed(BUBBLE_SORT_LIST.indexOf(i)), 
      generateBlue(BUBBLE_SORT_LIST.indexOf(i)), 
      generateGreen(BUBBLE_SORT_LIST.indexOf(i)));
    if (i % 2 == 0) {
      triangle((-1.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(1.0/3), 
        (1.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(1.0/3), 
        (0.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(2.0/3));
      
    } else {
      triangle((0.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(1.0/3),
      (1.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(2.0/3), 
      (-1.0*width)/(BUBBLE_SORT_LIST.size()-1), height*(2.0/3));
    }
    translate(floor(((1.0*width)/(BUBBLE_SORT_LIST.size()-1))), 0);
  }
  
}

void generateList(ArrayList<Integer> list) {
  for (int i = 0; i < listSize; i++) {
    list.add(floor(random(255*255*255)));
  }
}

/*ArrayList<Integer> generateRGB(float val) {
 
 int red = (int)(sin(frequency*val)*127 + 128);
 int blue = (int)(sin(frequency*val + 2)*127 + 128);
 int green = (int)(sin(frequency*val + 4)*127 + 128);
 
 ArrayList<Integer> temp = new ArrayList<Integer>();
 temp.add(red);
 temp.add(blue);
 temp.add(green);
 
 return temp;
 }*/

int generateRed(float val) {
  int red = round((sin(frequency*val)*127 + 128));
  return red;
}

int generateBlue(float val) {
  int blue = round((sin(frequency*val + 2)*127 + 128));
  return blue;
}

int generateGreen(float val) {
  int green = round((sin(frequency*val + 4)*127 + 128));
  return green;
}



//Sorts under here