import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  //table note
  static final String TABLE_NOTE = "note";
  static final String COLUMN_NOTE_SNO = "s_no";
  static final String COLUMN_NOTE_TITLE = "title";
  static final String COLUMN_NOTE_DESC = "desc";

  Database? myDB;

  Future<Database> getDB() async {
     myDB = myDB ?? await openDB();
     return myDB!;
  }

  Future<Database> openDB() async {

    Directory appPath = await getApplicationDocumentsDirectory();

    String dbPath = join(appPath.path, "noteDB.db");

    return await openDatabase(dbPath, onCreate: (db, version){

      ///create all your tables here
      db.execute("Create table $TABLE_NOTE( $COLUMN_NOTE_SNO integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text )");



    }, version: 1);

  }

  //Insertion
  Future<bool> addNote({required String mTitle, required String mDesc}) async {
    var db = await getDB();

    int rowsAffected = await db.insert(TABLE_NOTE, {
      COLUMN_NOTE_TITLE : mTitle,
      COLUMN_NOTE_DESC : mDesc
    });

    return rowsAffected>0;
  }

  //Reading
  Future<List<Map<String, dynamic>>> getAllNotes() async{

    var db = await getDB();
    List<Map<String, dynamic>> mData = await db.query(TABLE_NOTE);


    return mData;

  }

}