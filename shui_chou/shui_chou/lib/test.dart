main() {
  loadAssetImg("aaa.png", 20);
  loadAssetImg("bbb.png", 20,prePath: "login/");
}


void loadAssetImg(String imgName, double imgWidth, {String prePath}) {

  if (prePath == null) {
    print("home/" + imgName);
  }else{
    print("home/" +prePath +  imgName);
  }
}
