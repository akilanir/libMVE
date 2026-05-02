.class Lde/robv/android/xposed/XposedBridge$3;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "XposedBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/robv/android/xposed/XposedBridge;->initXbridgeZygote()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$loadedPackagesInProcess:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Ljava/util/HashSet;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$3;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    .line 233
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 6
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/app/LoadedApk;

    .line 238
    .local v0, "loadedApk":Landroid/app/LoadedApk;
    invoke-virtual {v0}, Landroid/app/LoadedApk;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 239
    .local v2, "packageName":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/app/LoadedApk;->getResDir()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/content/res/XResources;->setPackageNameForResDir(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v3, "android"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    iget-object v3, p0, Lde/robv/android/xposed/XposedBridge$3;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_20

    .line 253
    :cond_1f
    :goto_1f
    return-void

    .line 243
    :cond_20
    const-string v3, "mIncludeCode"

    invoke-static {v0, v3}, Lde/robv/android/xposed/XposedHelpers;->getBooleanField(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 246
    new-instance v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;

    # getter for: Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->access$2()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    move-result-object v3

    invoke-direct {v1, v3}, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 247
    .local v1, "lpparam":Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
    iput-object v2, v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    .line 248
    invoke-static {}, Landroid/app/AndroidAppHelper;->currentProcessName()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->processName:Ljava/lang/String;

    .line 249
    invoke-virtual {v0}, Landroid/app/LoadedApk;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iput-object v3, v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    .line 250
    invoke-virtual {v0}, Landroid/app/LoadedApk;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iput-object v3, v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->appInfo:Landroid/content/pm/ApplicationInfo;

    .line 251
    const/4 v3, 0x0

    iput-boolean v3, v1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->isFirstApplication:Z

    .line 252
    invoke-static {v1}, Lde/robv/android/xposed/callbacks/XC_LoadPackage;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    goto :goto_1f
.end method
