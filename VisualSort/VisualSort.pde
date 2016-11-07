ArrayList<Integer> BUBBLE_SORT_LIST;
int listSize = 10;
float frequency = 10;//listSize/(2*PI);
ArrayList<ArrayList<Integer>> steps;
int counter;
String sortType = "selection";

void setup() {
  
  size(1400, 800);
  
  frameRate(24);

  background(0);

  BUBBLE_SORT_LIST = new ArrayList<Integer>();
  steps = new ArrayList<ArrayList<Integer>>();
  generateList(BUBBLE_SORT_LIST);
  ArrayList<Integer> temp = copy(BUBBLE_SORT_LIST);
  steps.add(BUBBLE_SORT_LIST);
  if(sortType.equals("bubble")){
    bubblesort(BUBBLE_SORT_LIST);
  }else{
    selectionSort(BUBBLE_SORT_LIST);
  }
  BUBBLE_SORT_LIST= copy(temp);

  noLoop();
}

void draw() {
  if (counter >= steps.size()) {
    randomize();
  } else {
  background(0);
  for (int i = 0; i < BUBBLE_SORT_LIST.size(); i++) {
    fill(generateGreen(BUBBLE_SORT_LIST.get(i)),//generateRed(BUBBLE_SORT_LIST.get(i)), 
      generateGreen(BUBBLE_SORT_LIST.get(i)),//generateGreen(BUBBLE_SORT_LIST.get(i)), 
      generateGreen(BUBBLE_SORT_LIST.get(i)));//generateBlue(BUBBLE_SORT_LIST.get(i)));
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
}

void generateList(ArrayList<Integer> list) {
  for (int i = 0; i < listSize; i++) {
    list.add(round(random(frequency)));
  }
}

int generateRed(float val) {
  println(round(((sin(frequency*val)*127) + 128)));
  int red = round(((sin(frequency*val)*127) + 128));
  return red;
}

int generateBlue(float val) {
  println(round((sin(frequency*val + (PI/3))*127 + 128)));
  int blue = round((sin(frequency*val + (PI/3))*127 + 128));
  return blue;
}

int generateGreen(float val) {
  //println(round((sin(frequency*val + (2*PI/3))*127 + 128)));
  int green = round(val/frequency * 255);//round((sin(frequency*val + (2*PI/3))*127 + 128));
  return green;
}



//Sorts under here
void bubblesort(ArrayList<Integer> list){
  int n = list.size();  
        int temp = 0;  
         for(int i=0; i < n; i++){  
                 for(int j=1; j < (n-i); j++){  
                          if(list.get(j-1) > list.get(j)){  
                                 //swap elements  
                                 temp = list.get(j-1);  
                                 list.set(j-1,list.get(j));
                                 list.set(j, temp);
                                 steps.add(copy(list));
                         }  
                          
                 }  
         }
}

void selectionSort(ArrayList<Integer> list){
  for( int k=0; k<list.size()-1; k++ )
        {
            // find the smallest value in arr[k..size-1]
            int minIndex = k;
            for( int j=k+1; j<list.size(); j++ )
            {
                if(list.get(j) < list.get(minIndex) )
                {
                    minIndex = j;
                }
            }
            
            // swap arr[k] with arr[minIndex]
            int temp = list.get(k);
            list.set(k, list.get(minIndex) );
            list.set(minIndex, temp );
            steps.add(copy(list));
        }
}

void mousePressed() {
  if(counter == 0){
    counter++;
    redraw();
  }else if(counter < steps.size()){
    BUBBLE_SORT_LIST = steps.get(counter);
    counter++;
    redraw();
  } else {
    loop();
  } //<>//
  
}

ArrayList<Integer> copy(ArrayList<Integer> or){
 ArrayList<Integer> l1 = new ArrayList<Integer>();
 for(Integer i: or){
   l1.add(i);
 }
 return l1;
}

void randomize() {
    for (float i = 0; i < random(frameRate); i++) {
    
    stroke(random(255),random(255),random(255));
    fill(random(255),random(360),random(360));
    arc(random(width),random(height),random(360),random(360),random(360),random(360));
  }
}