.class Landroid/content/res/XResources$2;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/content/res/XResources;->init(Ljava/lang/ThreadLocal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 183
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 8
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 186
    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->hasThrowable()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 201
    :cond_6
    :goto_6
    return-void

    .line 190
    :cond_7
    # getter for: Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;
    invoke-static {}, Landroid/content/res/XResources;->access$2()Ljava/util/WeakHashMap;

    move-result-object v3

    monitor-enter v3

    .line 191
    :try_start_c
    # getter for: Landroid/content/res/XResources;->sXmlInstanceDetails:Ljava/util/WeakHashMap;
    invoke-static {}, Landroid/content/res/XResources;->access$2()Ljava/util/WeakHashMap;

    move-result-object v2

    iget-object v4, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v5, 0x0

    aget-object v4, v4, v5

    invoke-virtual {v2, v4}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/XResources$XMLInstanceDetails;

    .line 190
    .local v0, "details":Landroid/content/res/XResources$XMLInstanceDetails;
    monitor-exit v3
    :try_end_1c
    .catchall {:try_start_c .. :try_end_1c} :catchall_3d

    .line 193
    if-eqz v0, :cond_6

    .line 194
    new-instance v1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;

    iget-object v2, v0, Landroid/content/res/XResources$XMLInstanceDetails;->callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-direct {v1, v2}, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 195
    .local v1, "liparam":Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;
    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getResult()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iput-object v2, v1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->view:Landroid/view/View;

    .line 196
    iget-object v2, v0, Landroid/content/res/XResources$XMLInstanceDetails;->resNames:Landroid/content/res/XResources$ResourceNames;

    iput-object v2, v1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->resNames:Landroid/content/res/XResources$ResourceNames;

    .line 197
    iget-object v2, v0, Landroid/content/res/XResources$XMLInstanceDetails;->variant:Ljava/lang/String;

    iput-object v2, v1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->variant:Ljava/lang/String;

    .line 198
    iget-object v2, v0, Landroid/content/res/XResources$XMLInstanceDetails;->res:Landroid/content/res/XResources;

    iput-object v2, v1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->res:Landroid/content/res/XResources;

    .line 199
    invoke-static {v1}, Lde/robv/android/xposed/callbacks/XCallback;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    goto :goto_6

    .line 190
    .end local v0    # "details":Landroid/content/res/XResources$XMLInstanceDetails;
    .end local v1    # "liparam":Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;
    :catchall_3d
    move-exception v2

    :try_start_3e
    monitor-exit v3
    :try_end_3f
    .catchall {:try_start_3e .. :try_end_3f} :catchall_3d

    throw v2
.end method
