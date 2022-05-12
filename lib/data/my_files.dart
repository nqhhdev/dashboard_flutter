import 'package:app_desktop/config/colors.dart';
import 'package:app_desktop/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? pathImage, name, totalStorage, work;
  final int? percentage, followIns, followFB, followT;
  final Color? color;

  CloudStorageInfo({
    this.pathImage,
    this.name,
    this.totalStorage,
    this.percentage,
    this.color,
    this.work,
    this.followFB,
    this.followIns,
    this.followT,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    name: "Ava Gregoraci",
    work: "Developer",
    followFB: 1328,
    followIns: 1329,
    followT: 123,
    pathImage: Assets.images.person1.path,
    totalStorage: "1.9GB",
    color: AppColors.primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    name: "Somun Ae-ri",
    work: "Developer",
    followFB: 1328,
    followIns: 1329,
    followT: 123,
    pathImage: Assets.images.person2.path,
    totalStorage: "2.9GB",
    color: AppColors.yellow,
    percentage: 35,
  ),
  CloudStorageInfo(
    name: "Lilah loselev",
    work: "Developer",
    followFB: 1328,
    followIns: 1329,
    followT: 123,
    pathImage: Assets.images.person3.path,
    totalStorage: "1GB",
    color: AppColors.primaryColor,
    percentage: 10,
  ),
  CloudStorageInfo(
    name: "Nguyen Quang Huy",
    work: "Developer",
    followFB: 1328,
    followIns: 1329,
    followT: 123,
    pathImage: Assets.images.person3.path,
    totalStorage: "7.3GB",
    color: AppColors.blue2,
    percentage: 78,
  ),
];
