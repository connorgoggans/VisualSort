ArrayList<Integer> BUBBLE_SORT_LIST; //<>//
float frequency = 10.0;
int listSize = 100;

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
    fill(generateRed(BUBBLE_SORT_LIST.get(i)), 0, 0);
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
    list.add(floor(random(100000)));
  }
  System.out.println(list);
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
  int red = round(val/100000 * 255);
  return red;
}

int generateBlue(float val) {
  int blue = round((sin(frequency*(val/100000) + 3)*127 + 128));
  return blue;
}

int generateGreen(float val) {
  int green = round((sin(frequency*(val/100000) + 1)*127 + 128));
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
                                 redraw();
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
            redraw();
        }
}