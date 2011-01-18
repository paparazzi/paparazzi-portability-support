--- src/models/propulsion/FGThruster.h.orig	2011-01-18 22:41:06.000000000 +1030
+++ src/models/propulsion/FGThruster.h	2011-01-18 22:41:51.000000000 +1030
@@ -97,7 +97,7 @@
        return Thrust;
   }
   void SetName(string name) {Name = name;}
-  virtual void SetRPM(double rpm) {};
+  virtual void SetRPM(double rpm __attribute__ ((unused))) {};
   virtual double GetPowerRequired(void) {return 0.0;}
   virtual void SetdeltaT(double dt) {deltaT = dt;}
   double GetThrust(void) const {return Thrust;}
