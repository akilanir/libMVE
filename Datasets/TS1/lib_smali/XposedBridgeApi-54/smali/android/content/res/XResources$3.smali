.class Landroid/content/res/XResources$3;
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
    .line 204
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 7
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 212
    # getter for: Landroid/content/res/XResources;->sIncludedLayouts:Ljava/lang/ThreadLocal;
    invoke-static {}, Landroid/content/res/XResources;->access$3()Ljava/lang/ThreadLocal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    .line 214
    invoke-virtual {p1}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->hasThrowable()Z

    move-result v3

    if-eqz v3, :cond_14

    .line 228
    :cond_13
    :goto_13
    return-void

    .line 218
    :cond_14
    const-string v3, "xmlInstanceDetails"

    invoke-virtual {p1, v3}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->getObjectExtra(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/XResources$XMLInstanceDetails;

    .line 219
    .local v0, "details":Landroid/content/res/XResources$XMLInstanceDetails;
    if-eqz v0, :cond_13

    .line 220
    new-instance v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;

    iget-object v3, v0, Landroid/content/res/XResources$XMLInstanceDetails;->callbacks:Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;

    invoke-direct {v2, v3}, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 221
    .local v2, "liparam":Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;
    iget-object v3, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v4, 0x1

    aget-object v1, v3, v4

    check-cast v1, Landroid/view/ViewGroup;

    .line 222
    .local v1, "group":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->view:Landroid/view/View;

    .line 223
    iget-object v3, v0, Landroid/content/res/XResources$XMLInstanceDetails;->resNames:Landroid/content/res/XResources$ResourceNames;

    iput-object v3, v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->resNames:Landroid/content/res/XResources$ResourceNames;

    .line 224
    iget-object v3, v0, Landroid/content/res/XResources$XMLInstanceDetails;->variant:Ljava/lang/String;

    iput-object v3, v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->variant:Ljava/lang/String;

    .line 225
    iget-object v3, v0, Landroid/content/res/XResources$XMLInstanceDetails;->res:Landroid/content/res/XResources;

    iput-object v3, v2, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;->res:Landroid/content/res/XResources;

    .line 226
    invoke-static {v2}, Lde/robv/android/xposed/callbacks/XCallback;->callAll(Lde/robv/android/xposed/callbacks/XCallback$Param;)V

    goto :goto_13
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 3
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 207
    # getter for: Landroid/content/res/XResources;->sIncludedLayouts:Ljava/lang/ThreadLocal;
    invoke-static {}, Landroid/content/res/XResources;->access$3()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->push(Ljava/lang/Object;)V

    .line 208
    return-void
.end method
