--- src/FGJSBBase.h.orig	2011-01-18 22:44:42.000000000 +1030
+++ src/FGJSBBase.h	2011-01-18 22:46:56.000000000 +1030
@@ -310,7 +310,7 @@
 
   static std::queue <Message> Messages;
 
-  void Debug(int) {};
+  void Debug(int from __attribute__ ((unused))) {};
 
   static unsigned int messageId;
 
