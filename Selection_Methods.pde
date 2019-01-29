ArrayList<Integer> taken = new ArrayList<Integer>();

int pseudoRandom(int last, int rangeMin, int rangeMax) {
  int num = 0;
  num = round(random(rangeMin, rangeMax));
  
  while (num == last) {
    num = round(random(rangeMin, rangeMax));
  }
  
  return num;
}

int pseudoRandom(ArrayList<Integer> taken, int range) {
  boolean free;
  int num = round(random(range));
  
  do {
    free = true;
    num = (num + 1) % (range + 1);
    for (int i = 0; i < taken.size(); i++) {
      if (num == taken.get(i)) free = false;
    }
  } while (!free);
  
  return num;
}



// depending on the requested mood, grab appropritate images/videos for the background
int getBackground(int mood) {
  
  int range = mediaNames.length-1;
  
  // randomly choose an image/video
  int choice = pseudoRandom(taken, range);
  
  switch (mood) {
  
    // depending on what type you're looking for, keep randomly picking an image/video until it's the proper type
    case 1:
      while (!mediaNames[choice].substring(0,1).equals("1")) {
        choice = pseudoRandom(taken, range);
      }
      break;
    
    case 2:
      while (!mediaNames[choice].substring(0,1).equals("2")) {
        choice = pseudoRandom(taken, range);
      }
      break;
    
    case 3:
      while (!mediaNames[choice].substring(0,1).equals("3")) {
        choice = pseudoRandom(taken, range);
      }
      break;
  
  }
  
  taken.add(choice);
  return choice;
}







               //               0             1            2              3           4        5      6       7        8 
final String[] allEffects = {"banner", "black_strips", "bullseye", "colour_strips", "four", "rain", "soup", "space", "wave"};

// depending on the file passed, return a random combination of effects to use
String[] getEffects(String file) {
  String fileName = file.substring(0, file.length() - 4); 
  int[] choices = new int[]{0};
  String[] effects = {};
  
  switch (fileName) {
  
    case "1_image_01":
      choices = new int[]{3,5};
      break;
      
    case "1_image_02":
      choices = new int[]{3,5};
      break;
      
    case "1_image_03":
      choices = new int[]{4,7};
      break;
      
    case "1_image_04":
      choices = new int[]{4,7};
      break;
      
    case "1_image_05":
      choices = new int[]{3,4};
      break;
      
    case "1_image_06":
      choices = new int[]{1};
      break;
      
    case "1_image_07":
      choices = new int[]{4,6};
      break;
      
    case "1_image_08":
      choices = new int[]{4};
      break;
      
    case "1_image_09":
      choices = new int[]{5};
      break;
      
    case "1_image_10":
      choices = new int[]{4};
      break;
      
    case "1_image_11":
      choices = new int[]{1};
      break;
      
    case "1_video_01":
      choices = new int[]{7};
      break;
      
    case "1_video_02":
      choices = new int[]{1};
      break;
      
    case "1_video_04":
      choices = new int[]{6};
      break;
      
    case "1_video_05":
      choices = new int[]{4};
      break;
      
    case "1_video_07":
      choices = new int[]{0};
      break;
      
    case "1_video_08":
      choices = new int[]{6};
      break;
      
    case "2_image_01":
      choices = new int[]{2,7};
      break;
      
    case "2_image_02":
      choices = new int[]{3,4};
      break;
      
    case "2_image_03":
      choices = new int[]{4};
      break;
      
    case "2_image_04":
      choices = new int[]{5};
      break;
      
    case "2_video_01":
      choices = new int[]{7};
      break;
      
    case "2_video_02":
      choices = new int[]{2,7};
      break;
      
    case "2_video_03":
      choices = new int[]{2};
      break;
      
    case "2_video_04":
      choices = new int[]{1,8};
      break;
      
    case "2_video_05":
      choices = new int[]{6,7};
      break;
      
    case "2_video_06":
      choices = new int[]{8};
      break;
      
    case "2_video_07":
      choices = new int[]{3,4};
      break;
      
    case "2_video_08":
      choices = new int[]{3,7};
      break;
      
    case "2_video_10":
      choices = new int[]{4,5};
      break;
      
    case "2_video_11":
      choices = new int[]{1,8};
      break;
      
    case "2_video_12":
      choices = new int[]{6,8};
      break;
      
    case "2_video_13":
      choices = new int[]{2,7};
      break;
      
    case "2_video_14":
      choices = new int[]{5};
      break;
      
    case "2_video_15":
      choices = new int[]{4,7};
      break;
      
    case "2_video_16":
      choices = new int[]{7};
      break;
      
    case "2_video_17":
      choices = new int[]{3,5};
      break;
      
    case "3_image_01":
      choices = new int[]{1};
      break;
      
    case "3_image_02":
      choices = new int[]{2};
      break;
      
    case "3_video_01":
      choices = new int[]{1,4};
      break;
      
    case "3_video_02":
      choices = new int[]{2,6};
      break;
      
    case "3_video_03":
      choices = new int[]{4,8};
      break;
      
    case "3_video_04":
      choices = new int[]{3,8};
      break;
      
    case "3_video_05":
      choices = new int[]{2,7};
      break;
      
    case "3_video_06":
      choices = new int[]{1};
      break;
      
    case "3_video_07":
      choices = new int[]{1,8};
      break;
      
    case "3_video_08":
      choices = new int[]{1,4};
      break;
      
    case "3_video_09":
      choices = new int[]{3};
      break;
  
  }
  
  effects = new String[]{allEffects[choices[round(random(choices.length-1))]]};
  return effects; 
}










final String[] allPatterns = {"vertical", "vertical-up", "vertical-down", "vertical-left", "vertical-right", "vertical-weave", "vertical-inwards", "vertical-outwards", 
                              "radial-edges", "radial-center", "radial-inwards", "radial-outwards", "radial-cycle"};

// depending on the file passed, return a random led pattern
String getLedPattern(String file) {
  String fileName = file.substring(0, file.length() - 4); 
  int[] choices = new int[]{0};
  String arrangement = "vertical";
  
  switch (fileName) {
    
    case "1_image_01":
      choices = new int[]{1};
      break;
      
    case "1_image_02":
      choices = new int[]{1};
      break;
      
    case "1_image_03":
      choices = new int[]{12};
      break;
      
    case "1_image_04":
      choices = new int[]{3,4};
      break;
      
    case "1_image_05":
      choices = new int[]{8,9};
      break;
      
    case "1_image_06":
      choices = new int[]{1,2};
      break;
      
    case "1_image_07":
      choices = new int[]{8};
      break;
      
    case "1_image_08":
      choices = new int[]{3,4};
      break;
      
    case "1_image_09":
      choices = new int[]{5};
      break;
      
    case "1_image_10":
      choices = new int[]{3,4};
      break;
      
    case "1_image_11":
      choices = new int[]{1,2};
      break;
      
    case "1_video_01":
      choices = new int[]{0};
      break;
      
    case "1_video_02":
      choices = new int[]{0};
      break;
      
    case "1_video_04":
      choices = new int[]{3,4};
      break;
      
    case "1_video_05":
      choices = new int[]{7};
      break;
      
    case "1_video_07":
      choices = new int[]{3,4};
      break;
      
    case "1_video_08":
      choices = new int[]{3,4};
      break;
      
    case "2_image_01":
      choices = new int[]{8};
      break;
      
    case "2_image_02":
      choices = new int[]{6,12};
      break;
      
    case "2_image_03":
      choices = new int[]{9};
      break;
      
    case "2_image_04":
      choices = new int[]{8,9};
      break;
      
    case "2_video_01":
      choices = new int[]{0};
      break;
      
    case "2_video_02":
      choices = new int[]{6,7};
      break;
      
    case "2_video_03":
      choices = new int[]{6,7};
      break;
      
    case "2_video_04":
      choices = new int[]{0};
      break;
      
    case "2_video_05":
      choices = new int[]{8,9};
      break;
      
    case "2_video_06":
      choices = new int[]{0};
      break;
      
    case "2_video_07":
      choices = new int[]{8,9};
      break;
      
    case "2_video_08":
      choices = new int[]{8,9};
      break;
      
    case "2_video_10":
      choices = new int[]{1,2};
      break;
      
    case "2_video_11":
      choices = new int[]{0};
      break;
      
    case "2_video_12":
      choices = new int[]{0};
      break;
      
    case "2_video_13":
      choices = new int[]{8,9};
      break;
      
    case "2_video_14":
      choices = new int[]{8,9};
      break;
      
    case "2_video_15":
      choices = new int[]{0};
      break;
      
    case "2_video_16":
      choices = new int[]{8,9,12};
      break;
      
    case "2_video_17":
      choices = new int[]{1,2,3,4};
      break;
      
    case "3_image_01":
      choices = new int[]{5};
      break;
      
    case "3_image_02":
      choices = new int[]{8,9};
      break;
      
    case "3_video_01":
      choices = new int[]{0};
      break;
      
    case "3_video_02":
      choices = new int[]{8,9};
      break;
      
    case "3_video_03":
      choices = new int[]{0};
      break;
      
    case "3_video_04":
      choices = new int[]{0};
      break;
      
    case "3_video_05":
      choices = new int[]{8,9};
      break;
      
    case "3_video_06":
      choices = new int[]{0};
      break;
      
    case "3_video_07":
      choices = new int[]{0,8,9};
      break;
      
    case "3_video_08":
      choices = new int[]{1,2};
      break;
      
    case "3_video_09":
      choices = new int[]{0,9};
      break;
  }
  
  arrangement = allPatterns[choices[round(random(choices.length-1))]];
  return arrangement; 
}
