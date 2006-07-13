
$FreeBSD$

--- make/lib.mak
+++ make/lib.mak
@@ -130,12 +127,18 @@
 #
 
 ifneq ($(OSTYPE),Darwin)
-  LIBNAME_MAJ	= $(LIB_FILENAME).$(MAJOR_VERSION)
-  LIBNAME_MIN	= $(LIBNAME_MAJ).$(MINOR_VERSION)
-  ifeq ($(BUILD_TYPE),.)
-    LIBNAME_PAT	= $(LIBNAME_MIN).$(BUILD_NUMBER)
+  ifeq ($(OSTYPE),FreeBSD)
+    LIBNAME_MAJ   = $(LIB_FILENAME).$(MAJOR_VERSION)
+    LIBNAME_MIN   = $(LIBNAME_MAJ)
+    LIBNAME_PAT   = $(LIBNAME_MAJ)
   else
-    LIBNAME_PAT	= $(LIBNAME_MIN)-$(BUILD_TYPE)$(BUILD_NUMBER)
+    LIBNAME_MAJ	= $(LIB_FILENAME).$(MAJOR_VERSION)
+    LIBNAME_MIN	= $(LIBNAME_MAJ).$(MINOR_VERSION)
+    ifeq ($(BUILD_TYPE),.)
+      LIBNAME_PAT	= $(LIBNAME_MIN).$(BUILD_NUMBER)
+    else
+      LIBNAME_PAT	= $(LIBNAME_MIN)-$(BUILD_TYPE)$(BUILD_NUMBER)
+    endif
   endif
 else
   LIBNAME_MAJ	= $(subst .$(LIB_SUFFIX),.$(MAJOR_VERSION).$(LIB_SUFFIX),$(LIB_FILENAME))
@@ -212,8 +215,10 @@
 
   $(LIBDIR)/$(LIB_FILENAME): $(LIBDIR)/$(LIBNAME_PAT)
 	cd $(LIBDIR) ; rm -f $(LIB_FILENAME) ; ln -sf $(LIBNAME_PAT) $(LIB_FILENAME)
+ifneq ($(OSTYPE),FreeBSD)
 	cd $(LIBDIR) ; rm -f $(LIBNAME_MAJ) ;  ln -sf $(LIBNAME_PAT) $(LIBNAME_MAJ)
 	cd $(LIBDIR) ; rm -f $(LIBNAME_MIN) ;  ln -sf $(LIBNAME_PAT) $(LIBNAME_MIN)
+endif
 
   $(LIBDIR)/$(LIBNAME_PAT): $(STATIC_LIB_FILE)
 	@echo EXTLIBS = $(EXTLIBS)
@@ -224,8 +229,10 @@
   install: $(LIBDIR)/$(LIBNAME_PAT)
 	$(INSTALL) $(LIBDIR)/$(LIBNAME_PAT) $(INSTALLLIB_DIR)/$(LIBNAME_PAT)
 	ln -sf $(LIBNAME_PAT) $(INSTALLLIB_DIR)/$(LIB_FILENAME)
+ifneq ($(OSTYPE),FreeBSD)
 	ln -sf $(LIBNAME_PAT) $(INSTALLLIB_DIR)/$(LIBNAME_MAJ)
 	ln -sf $(LIBNAME_PAT) $(INSTALLLIB_DIR)/$(LIBNAME_MIN)
+endif
 
 endif # P_SHAREDLIB
 
