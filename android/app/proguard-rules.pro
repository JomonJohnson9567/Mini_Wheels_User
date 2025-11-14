# Razorpay Rules
-dontwarn com.razorpay.**
-keep class com.razorpay.** {*;}
-keep class proguard.annotation.** {*;}

# OkHttp (used by Razorpay)
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep class okio.** { *; }

# Retrofit (if used by Razorpay)
-dontwarn retrofit2.**
-keep class retrofit2.** { *; }