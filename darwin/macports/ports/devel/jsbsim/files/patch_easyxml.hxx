--- src/simgear/xml/easyxml.hxx.orig	2011-01-18 22:24:28.000000000 +1030
+++ src/simgear/xml/easyxml.hxx	2011-01-18 22:38:11.000000000 +1030
@@ -246,7 +246,7 @@
    * @param atts The element's attributes (not null).
    * @see #endElement
    */
-  virtual void startElement (const char * name, const XMLAttributes &atts) {}
+  virtual void startElement (const char * name __attribute__ ((unused)), const XMLAttributes &atts __attribute__ ((unused))) {}
 
   /** Callback for the end of an XML element.
    *
@@ -255,7 +255,7 @@
    * @param name The name of the element that is ending (not null).
    * @see #startElement
    */
-  virtual void endElement (const char * name) {}
+  virtual void endElement (const char * name __attribute__ ((unused))) {}
 
   /** Callback for a chunk of character data.
    *
@@ -270,7 +270,7 @@
    * @param length The number of characters in the chunk (may
    * be zero).
    */
-  virtual void data (const char * s, int length) {}
+  virtual void data (const char * s __attribute__ ((unused)), int length __attribute__ ((unused))) {} 
 
   /** Callback for an XML processing instruction.
    *
@@ -285,7 +285,7 @@
    * @param target The processing instruction target (not null).
    * @param data The processing instruction data (not null).
    */
-  virtual void pi (const char * target, const char * data) {}
+  virtual void pi (const char * target __attribute__ ((unused)), const char * data __attribute__ ((unused))) {}
 
   /** Callback for an XML parsing warning.
    *
@@ -298,7 +298,7 @@
    * @param column The character position in the line that generated
    * the warning.
    */
-  virtual void warning (const char * message, int line, int column) {}
+  virtual void warning (const char * message __attribute__ ((unused)), int line __attribute__ ((unused)), int column __attribute__ ((unused))) {}
 };
 
 /** @relates XMLVisitor
