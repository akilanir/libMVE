.class Lde/robv/android/xposed/XposedBridge$2;
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
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$2;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    .line 217
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 5
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 220
    iget-object v1, p0, Lde/robv/android/xposed/XposedBridge$2;->val$loadedPackagesInProcess:Ljava/util/HashSet;

    const-string v2, "android"

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 222
    new-instance v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;

    # getter for: Lde/robv/android/xposed/XposedBridge;->sLoadedPackageCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->access$2()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    move-result-object v1

    invoke-direct {v0, v1}, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 223
    .local v0, "lpparam":Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
    const-string v1, "android"

    iput-object v1, v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    .line 224
    const-string v1, "android"

    iput-object v1, v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->processName:Ljava/lang/String;

    .line 225
    sget-object v1, Lde/robv/android/xposed/XposedBridge;->BOOTCLASSLOADER:Ljava/lang/ClassLoader;

    iput-object v1, v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    .line 226
    const/4 v1, 0x0

    iput-object v1, v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->appInfo:Landroid/content/pm/ApplicationInfo;

    .line 227
    const/4 v1, 0x1

    iput-boolean v1, v0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->isFirstApplication:Z

    .line 228
    invoke-static {v0}, Lde/robv/android/xposed/callbacks/XC_LoadPackage;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    .line 229
    return-void
.end method
