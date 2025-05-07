import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_helper.dart';

class StyleHelper{
  static TextStyle baseElevatedButtonTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColor.textColorWhite,
  );

  static TextStyle createNewAccountTextStyle = GoogleFonts.raleway(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: Colors.black,
  );
  static TextStyle seeMore =GoogleFonts.raleway (fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColor.elevatedButtonBottomCenterBlue);

  static TextStyle  fillTheFollowingToCreateAnAccountOnStayEazy =  GoogleFonts.raleway(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColor.textConfirmationColorBlack,
  );

  // static TextStyle  textFilledInputColor = GoogleFonts.raleway(
  //   fontWeight: FontWeight.w400,
  //   fontSize: 12,
  //   color: AppColor.textColorBlack,
  // );

  static TextStyle iWantToAddAProperty =  GoogleFonts.raleway(
      fontSize: 12,
          fontWeight: FontWeight.w400,
          color:AppColor.inkWellButtonColorSignOutGrey);

  static  TextStyle labelStyleTextField =  GoogleFonts.raleway(
      color: AppColor.textConfirmationColorBlack,
      fontSize: 12,
      fontWeight: FontWeight.w400
  );

  static  TextStyle errorStyleTextField = TextStyle(
  color: Colors.red,
  fontSize: 12);

  static  TextStyle textStyleAlreadyHaveAnAccount=  GoogleFonts.raleway(
      fontWeight: FontWeight.w400, fontSize: 14,
      color: Colors.black);

  static  TextStyle textStyleTextSpanBySigningUpIAgreeTo =
  GoogleFonts.raleway(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColor.inkWellButtonColorSignOutGrey,
  );

  static  TextStyle textStyleTextSpanTermsConditions =
     GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: Colors.black,
  );

  static  TextStyle textStyleInkWellButtonSignIn =
  GoogleFonts.raleway(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color:AppColor.inkWellButtonColorBlue
       );

  static TextStyle textStyleSimpleText1 =  GoogleFonts.raleway(
    color: AppColor.textIconColorBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );


  static TextStyle textStyleSimpleText2 =  GoogleFonts.raleway(
    color: AppColor.inkWellButtonColorSignOutGrey,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static TextStyle textStyleContainerApproved =  GoogleFonts.raleway(
    color: AppColor.textApprovedColorGreen,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static TextStyle simpleTextJohnDoe =  GoogleFonts.raleway(
    color: AppColor.textColorBlack,
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle textStyleGender =  GoogleFonts.raleway(
    color: AppColor.textColorGenderBlack, fontSize: 15, fontWeight: FontWeight.w400,
  );

   static TextStyle textStyleListViewBuilderContainer =  GoogleFonts.redHatDisplay(
     color: AppColor.inkWellButtonColorSignOutGrey,
     fontWeight: FontWeight.w400, fontSize: 12
   );

  static TextStyle  location =  GoogleFonts.raleway(
    fontWeight: FontWeight.w400, fontSize: 14, color: AppColor. textColorsDarkGrey,
  );
  static TextStyle sID001  =  GoogleFonts.redHatDisplay(
      fontWeight: FontWeight.w700,
      fontSize: 10, color:  Colors.white
  );

  static TextStyle text001 =  GoogleFonts.redHatDisplay(
     fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black);

  static TextStyle textSID = GoogleFonts.redHatDisplay(
      fontSize: 12,
      fontWeight: FontWeight.w700 ,
      color: Colors.black);

  static TextStyle addedYesterday =
  GoogleFonts.redHatDisplay(
      fontSize: 11,
      fontWeight: FontWeight.w400 ,color: Colors.grey);

  static TextStyle textM =
  GoogleFonts.redHatDisplay(
      fontSize: 20, fontWeight: FontWeight.w400 ,color: Colors.grey);

  static TextStyle text2000 =  GoogleFonts.redHatDisplay(
     fontSize: 24,
      fontWeight: FontWeight.w700 ,color: Colors.black);

  static TextStyle textFlateMate =  GoogleFonts.redHatDisplay(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColor.textColorGenderBlack);

  static TextStyle dreamsVilleHouse = TextStyle(fontSize: 20,
      fontWeight: FontWeight.w500,
      color:AppColor.textColorWhite);

  static TextStyle jlSultanIskandarMuDajAkArAseLaTan = TextStyle(
      fontWeight:FontWeight.w400 ,fontSize:14,color: AppColor.textColorDarkGrey);

  static TextStyle bathRoom4 = TextStyle(
      fontWeight:FontWeight.w400 ,fontSize:13,
      color: AppColor.textColorDarkGrey);

  static TextStyle description = TextStyle(
      fontWeight:FontWeight.w500 ,fontSize:16,
      color: AppColor.textColorGenderBlack);

  static TextStyle showMore =  GoogleFonts.raleway(
      fontWeight:FontWeight.w500 ,fontSize:12,
      color: AppColor.elevatedButtonBottomCenterBlue);


  static TextStyle garryAllen =  GoogleFonts.raleway(
      fontWeight:FontWeight.w500 ,fontSize:16,color: AppColor.textColorGenderBlack);


  static TextStyle welcomeToStayEazy=  GoogleFonts.raleway(
      fontWeight:FontWeight.w600 ,fontSize:20,color: AppColor.textFieldColorSearchWhite);


  static TextStyle discoverOfPayingGuest=  GoogleFonts.raleway(
      fontWeight:FontWeight.w400 ,fontSize:13,
      color: AppColor.textFieldColorSearchWhite);

  static TextStyle $2000=  GoogleFonts.redHatDisplay(
      fontWeight:FontWeight.w700 ,fontSize:16,
      color: AppColor.textIconColorBlack);

  static TextStyle textMonth=  GoogleFonts.redHatDisplay(
      fontWeight:FontWeight.w400,fontSize:12,
      color: AppColor.greyColor);

  static TextStyle text2BHK=  GoogleFonts.redHatDisplay(
      fontWeight:FontWeight.w600,fontSize:12,
      color: AppColor.textColorGenderBlack);

  static TextStyle text300Sqft =  GoogleFonts.redHatDisplay(
      color: AppColor.inkWellButtonColorSignOutGrey,
      fontWeight: FontWeight.w400, fontSize: 12
  );
  static TextStyle forBoys =  GoogleFonts.redHatDisplay(
  color: AppColor.textColorGenderBlack,
  fontWeight: FontWeight.w400, fontSize: 12);

  static TextStyle geryText300Sqft =  GoogleFonts.redHatDisplay(
      color: AppColor.inkWellButtonColorSignOutGrey,
      fontWeight: FontWeight.w600, fontSize: 11);

  static TextStyle fullyFurnished =  GoogleFonts.redHatDisplay(
       fontSize: 10,
  fontWeight: FontWeight.w600,color: AppColor.textApprovedColorGreen);

  static TextStyle addedYesterday1 =  GoogleFonts.redHatDisplay(
      fontSize: 12,
      fontWeight: FontWeight.w400,color: AppColor.inkWellButtonColorSignOutGrey);

  static TextStyle bestForYou =  GoogleFonts.raleway(
      fontWeight:FontWeight.w500 ,fontSize:16,
      color: AppColor.textColorGenderBlack);

  static TextStyle text1Bedroom =  GoogleFonts.redHatDisplay(
      fontWeight:FontWeight.w500 ,fontSize:16,
      color: AppColor.textColorGenderBlack);

  static TextStyle text3456Sector58Mohali =  GoogleFonts.redHatDisplay(

    color: AppColor.inkWellButtonColorSignOutGrey,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static TextStyle fullyFurnished1 =  GoogleFonts.redHatDisplay(
    color: AppColor.textApprovedColorGreen,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );

  static TextStyle text14W400 =  GoogleFonts.redHatDisplay(
    color: AppColor.inkWellButtonColorSignOutGrey,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );


static TextStyle baseElevatedButtonText = GoogleFonts.raleway(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: AppColor.textColorGrey,
);
}

