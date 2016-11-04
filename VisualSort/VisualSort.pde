
void setup(){
  //Robby do this
  
  ArrayList<Integer> list = new ArrayList<Integer>();
  list.add(12);
  list.add(10);
  list.add(9);
  list.add(3);
  list.add(1);
  
  System.out.println(list);
  selectionSort(list);
  System.out.println(list);
}

void draw(){
  //Robby do this
}

void redraw(){
  //Robby do this
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
                                 //Redraw
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
            System.out.println(list); //redraw
        }
}