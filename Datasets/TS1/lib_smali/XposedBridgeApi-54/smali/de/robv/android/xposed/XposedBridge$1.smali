.class Lde/robv/android/xposed/XposedBridge$1;
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
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$1;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    .line 183
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 12
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 185
    iget-object v0, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/app/ActivityThread;

    .line 186
    .local v0, "activityThread":Landroid/app/ActivityThread;
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v6, v6, v8

    const-string v7, "appInfo"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ApplicationInfo;

    .line 187
    .local v1, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v6, v6, v8

    const-string v7, "instrumentationName"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/ComponentName;

    .line 188
    .local v3, "instrumentationName":Landroid/content/ComponentName;
    if-eqz v3, :cond_38

    .line 189
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Instrumentation detected, disabling framework for "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 190
    invoke-static {v9}, Lde/robv/android/xposed/XposedBridge;->access$1(Z)V

    .line 212
    :cond_37
    :goto_37
    return-void

    .line 193
    :cond_38
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v6, v6, v8

    const-string v7, "compatInfo"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/res/CompatibilityInfo;

    .line 194
    .local v2, "compatInfo":Landroid/content/res/CompatibilityInfo;
    iget-object v6, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    if-eqz v6, :cond_37

    .line 197
    const-string v6, "mBoundApplication"

    iget-object v7, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v7, v7, v8

    invoke-static {v0, v6, v7}, Lde/robv/android/xposed/XposedHelpers;->setObjectField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 198
    iget-object v6, p0, Lde/robv/android/xposed/XposedBridge$1;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    iget-object v7, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 199
    invoke-virtual {v0, v1, v2}, Landroid/app/ActivityThread;->getPackageInfoNoCheck(Landroid/content/pm/ApplicationInfo;Landroid/content/res/CompatibilityInfo;)Landroid/app/LoadedApk;

    move-result-object v4

    .line 200
    .local v4, "loadedApk":Landroid/app/LoadedApk;
    iget-object v6, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v4}, Landroid/app/LoadedApk;->getResDir()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/content/res/XResources;->setPackageNameForResDir(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    new-instance v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;

    # getter for: Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->access$2()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    move-result-object v6

    invoke-direct {v5, v6}, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 203
    .local v5, "lpparam":Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
    iget-object v6, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    iput-object v6, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    .line 204
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v6, v6, v8

    const-string v7, "processName"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    iput-object v6, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->processName:Ljava/lang/String;

    .line 205
    invoke-virtual {v4}, Landroid/app/LoadedApk;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    iput-object v6, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    .line 206
    iput-object v1, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->appInfo:Landroid/content/pm/ApplicationInfo;

    .line 207
    iput-boolean v9, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->isFirstApplication:Z

    .line 208
    invoke-static {v5}, Lde/robv/android/xposed/callbacks/XC_LoadPackage;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    .line 210
    iget-object v6, v1, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    const-string v7, "de.robv.android.xposed.installer"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_37

    .line 211
    iget-object v6, v5, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    # invokes: Lde/robv/android/xposed/XposedBridge;->hookXposedInstaller(Ljava/lang/ClassLoader;)V
    invoke-static {v6}, Lde/robv/android/xposed/XposedBridge;->access$3(Ljava/lang/ClassLoader;)V

    goto :goto_37
.end method
