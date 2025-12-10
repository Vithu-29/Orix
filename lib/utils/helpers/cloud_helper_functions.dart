import 'package:flutter/material.dart';

class CloudHelperFunctions {
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text("No Data Found"));
    }
    if (snapshot.hasError) {
      return const Center(child: Text("Something went wrong!"));
    }
    return null;
  }

  static Widget? checkMultipleRecordsState<T>({
    required AsyncSnapshot<List<T>> snapshot,
    Widget? loader,
    Widget? error,
    Widget? nothingFound,
  }) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(child: CircularProgressIndicator());
    }
    if (!snapshot.hasData || snapshot.data!.isEmpty || snapshot.data == null) {
      if (nothingFound != null) return nothingFound;
      return const Center(child: Text("No Data Found"));
    }
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(child: Text("Something went wrong!"));
    }
    return null;
  }

  /*
  // create a reference with an initial file path and name and retrive the download URL
  static Future<String> getURLFromFilePathName(String path) async{
    try {
      if(path.isEmpty) return "";
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw DefinedFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw DefinedPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }*/
}
