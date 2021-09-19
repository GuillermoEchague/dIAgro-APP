package com.example.diagro


import android.annotation.TargetApi
import android.content.pm.PackageManager
import android.util.Base64
import android.util.Log
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import android.content.ContentValues.TAG
import android.content.Context
import android.content.pm.PackageInfo
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity


class MainActivity : FlutterActivity() {

    // override fun onCreate(savedInstanceState: Bundle?) {
 //       super.onCreate(savedInstanceState)
        //       try {
        //   val info: PackageInfo = packageManager.getPackageInfo(
        //      "com.example.diagro",  //Insert your own package name.
        //      PackageManager.GET_SIGNATURES
        //  )
        //  for (signature in info.signatures) {
        //      val md: MessageDigest = MessageDigest.getInstance("SHA")
        //      md.update(signature.toByteArray())
        //      Log.d("KeyHash:", Base64.encodeToString(md.digest(), Base64.DEFAULT))
        //  }
        //  } catch (e: PackageManager.NameNotFoundException) {
        //} catch (e: NoSuchAlgorithmException) {
        //}
    //}
}

