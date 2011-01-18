--- src/models/propulsion/FGForce.h.orig	2011-01-18 23:50:24.000000000 +1030
+++ src/models/propulsion/FGForce.h	2011-01-18 23:51:17.000000000 +1030
@@ -227,7 +227,7 @@
 public:
   /// Constructor
   FGForce(FGFDMExec *FDMExec);
-  FGForce(const FGForce& force) {
+  FGForce(const FGForce& force):FGJSBBase() {
     vFn = force.vFn;
     vXYZn = force.vXYZn;
     ttype = force.ttype;
