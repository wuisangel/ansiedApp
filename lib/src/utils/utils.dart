
hexColor(String colorHex){
  
  String colorn = '0xff' + colorHex;
  colorn = colorn.replaceAll('#', '');
  int colorint = int.parse(colorn);
  return colorint;
}


class goEjercicios{

  int goE=0;

  setGoE(int x){
    goE=x;
  }

  int getGoE(){
    return goE;
  }
}