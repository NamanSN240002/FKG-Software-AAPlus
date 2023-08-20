void main() {
  String image =
      "[\"http://img5a.flixcart.com/image/air-freshener/f/g/d/01-liquid-itiha-20-set-of-2-potpourri-oil-combo-original-imaegydhmrqghhag.jpeg\", \"http://img6a.flixcart.com/image/air-freshener/f/g/d/01-liquid-itiha-20-set-of-2-potpourri-oil-combo-original-imaegydhmrqghhag.jpeg\", \"http://img6a.flixcart.com/image/air-freshener/z/r/e/bdec-liquid-itiha-400-buddha-electrical-oil-burner-and-potpourri-original-imaefrhg65bmdahf.jpeg\", \"http://img6a.flixcart.com/image/air-freshener/d/e/k/01-liquid-itiha-20-set-of-2-potpourri-oil-combo-original-imaefrhfzzqtutgw.jpeg\", \"http://img5a.flixcart.com/image/air-freshener/x/p/4/01-liquid-itiha-20-set-of-two-oilsr-original-imaefsqtdg2kftkf.jpeg\", \"http://img6a.flixcart.com/image/air-freshener/z/a/f/01-liquid-itiha-20-set-of-2-potpourri-oil-combo-original-imaefsqyfuhg2hbu.jpeg\"]";
  print(image.split(',')[0].split('\"')[1]);
}
