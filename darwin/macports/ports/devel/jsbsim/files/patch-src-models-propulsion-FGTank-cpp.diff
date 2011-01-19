--- src/models/propulsion/FGTank.cpp.orig	2011-01-18 22:43:33.000000000 +1030
+++ src/models/propulsion/FGTank.cpp	2011-01-18 22:44:09.000000000 +1030
@@ -199,7 +199,7 @@
 
 //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
-const double FGTank::GetXYZ(int idx)
+double FGTank::GetXYZ(int idx)
 {
   return vXYZ_drain(idx) + (Contents/Capacity)*(vXYZ(idx)-vXYZ_drain(idx));
 }
