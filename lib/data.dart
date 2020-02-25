import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Swipe to explore more about the Uz-SLS Apps");
  sliderModel.setTitle("Swipe ");
  sliderModel.setImageAssetPath("assets/undraw_swipe.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Universidad De Zamboanga Science Laboratory Services");
  sliderModel.setTitle("Welcome");
  sliderModel.setImageAssetPath("assets/undraw_welcome.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Login to start Borrowing");
  sliderModel.setTitle("Login");
  sliderModel.setImageAssetPath("assets/undraw_mobile_login.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc("");
  sliderModel.setTitle("Fill up forms");
  sliderModel.setImageAssetPath("assets/undraw_fill_forms.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
