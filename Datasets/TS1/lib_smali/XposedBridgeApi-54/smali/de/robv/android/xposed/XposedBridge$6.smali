.class Lde/robv/android/xposed/XposedBridge$6;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "XposedBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/robv/android/xposed/XposedBridge;->hookResources()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$latestResKey:Ljava/lang/ThreadLocal;


# direct methods
.method constructor <init>(Ljava/lang/ThreadLocal;)V
    .registers 2

    .prologue
    .line 1
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$6;->val$latestResKey:Ljava/lang/ThreadLocal;

    .line 302
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 13
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 310
    iget-object v9, p0, Lde/robv/android/xposed/XposedBridge$6;->val$latestResKey:Ljava/lang/ThreadLocal;

    invoke-virtual {v9}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    .line 311
    .local v1, "key":Ljava/lang/Object;
    if-nez v1, :cond_9

    .line 348
    :cond_8
    :goto_8
    return-void

    .line 314
    :cond_9
    iget-object v9, p0, Lde/robv/android/xposed/XposedBridge$6;->val$latestResKey:Ljava/lang/ThreadLocal;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 316
    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v8

    .line 317
    .local v8, "result":Ljava/lang/Object;
    if-eqz v8, :cond_8

    instance-of v9, v8, Landroid/content/res/XResources;

    if-nez v9, :cond_8

    .line 321
    const-class v9, Landroid/content/res/XResources;

    # invokes: Lde/robv/android/xposed/XposedBridge;->cloneToSubclass(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;
    invoke-static {v8, v9}, Lde/robv/android/xposed/XposedBridge;->access$4(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/res/XResources;

    .line 322
    .local v4, "newRes":Landroid/content/res/XResources;
    const-string v9, "mResDir"

    invoke-static {v1, v9}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 323
    .local v6, "resDir":Ljava/lang/String;
    invoke-virtual {v4, v6}, Landroid/content/res/XResources;->initObject(Ljava/lang/String;)V

    .line 327
    iget-object v9, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v10, "mActiveResources"

    invoke-static {v9, v10}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    .line 328
    .local v3, "mActiveResources":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;>;"
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x12

    if-gt v9, v10, :cond_98

    .line 329
    iget-object v9, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v10, "mPackages"

    invoke-static {v9, v10}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 331
    .local v2, "lockObject":Ljava/lang/Object;
    :goto_44
    monitor-enter v2

    .line 332
    :try_start_45
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 333
    .local v0, "existing":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    if-eqz v0, :cond_70

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_70

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/res/Resources;

    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v4}, Landroid/content/res/XResources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v10

    if-eq v9, v10, :cond_70

    .line 334
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/res/Resources;

    invoke-virtual {v9}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/AssetManager;->close()V

    .line 335
    :cond_70
    new-instance v9, Ljava/lang/ref/WeakReference;

    invoke-direct {v9, v4}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v3, v1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    monitor-exit v2
    :try_end_79
    .catchall {:try_start_45 .. :try_end_79} :catchall_9b

    .line 339
    invoke-virtual {v4}, Landroid/content/res/XResources;->isFirstLoad()Z

    move-result v9

    if-eqz v9, :cond_93

    .line 340
    invoke-virtual {v4}, Landroid/content/res/XResources;->getPackageName()Ljava/lang/String;

    move-result-object v5

    .line 341
    .local v5, "packageName":Ljava/lang/String;
    new-instance v7, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;

    # getter for: Lde/robv/android/xposed/XposedBridge;->sInitPackageResourcesCallbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;
    invoke-static {}, Lde/robv/android/xposed/XposedBridge;->access$5()Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    move-result-object v9

    invoke-direct {v7, v9}, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 342
    .local v7, "resparam":Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;
    iput-object v5, v7, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;->packageName:Ljava/lang/String;

    .line 343
    iput-object v4, v7, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;->res:Landroid/content/res/XResources;

    .line 344
    invoke-static {v7}, Lde/robv/android/xposed/callbacks/XCallback;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    .line 347
    .end local v5    # "packageName":Ljava/lang/String;
    .end local v7    # "resparam":Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;
    :cond_93
    invoke-virtual {p1, v4}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto/16 :goto_8

    .line 329
    .end local v0    # "existing":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/content/res/Resources;>;"
    .end local v2    # "lockObject":Ljava/lang/Object;
    :cond_98
    iget-object v2, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    goto :goto_44

    .line 331
    .restart local v2    # "lockObject":Ljava/lang/Object;
    :catchall_9b
    move-exception v9

    :try_start_9c
    monitor-exit v2
    :try_end_9d
    .catchall {:try_start_9c .. :try_end_9d} :catchall_9b

    throw v9
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 305
    iget-object v0, p0, Lde/robv/android/xposed/XposedBridge$6;->val$latestResKey:Ljava/lang/ThreadLocal;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 306
    return-void
.end method
