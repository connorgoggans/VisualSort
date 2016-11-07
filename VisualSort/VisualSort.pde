ArrayList<Integer> BUBBLE_SORT_LIST; //<>//
int listSize = 20;
float frequency = 5/((float)listSize);
ArrayList<ArrayList<Integer>> steps;
ArrayList<Integer> done;
int counter;
String sortType = "bubble";

void setup() {
  
  size(1400, 800);

  background(0);

  BUBBLE_SORT_LIST = new ArrayList<Integer>();
  done = new ArrayList<Integer>();
  steps = new ArrayList<ArrayList<Integer>>();
  generateList(BUBBLE_SORT_LIST);
  ArrayList<Integer> temp = copy(BUBBLE_SORT_LIST);
  steps.add(BUBBLE_SORT_LIST);
  if(sortType.equals("bubble")){
    bubblesort(BUBBLE_SORT_LIST);
  }else{
    selectionSort(BUBBLE_SORT_LIST);
  }
  done = copy(BUBBLE_SORT_LIST);
  BUBBLE_SORT_LIST= copy(temp);

  noLoop();
}

void draw() {
  background(0);
  for (int i = 0; i < BUBBLE_SORT_LIST.size(); i++) {
    fill(generateRed(done.indexOf(BUBBLE_SORT_LIST.get(i))), generateGreen(done.indexOf(BUBBLE_SORT_LIST.get(i))),generateBlue(done.indexOf(BUBBLE_SORT_LIST.get(i)))); //<>//
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
    list.add(floor(random(listSize)));
  }
  System.out.println(list);
}

int generateRed(int i) {
  float red = sin(frequency * i + 0) * (127) + 128;
  return floor(red); //<>//
}

int generateBlue(int i) {
  float blue = sin(frequency * i + 3) * (127) + 128;
  return floor(blue); //<>//
}

int generateGreen(int i) {
  float green = sin(frequency * i + 1) * (127) + 128;
  return floor(green); //<>//
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