.class Lde/robv/android/xposed/XposedBridge$7;
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


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 352
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    .line 1
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
    .line 355
    iget-object v1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v1, Landroid/content/res/TypedArray;

    .line 356
    .local v1, "typedArray":Landroid/content/res/TypedArray;
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 357
    .local v0, "res":Landroid/content/res/Resources;
    instance-of v2, v0, Landroid/content/res/XResources;

    if-eqz v2, :cond_1a

    .line 358
    iget-object v2, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-class v3, Landroid/content/res/XResources$XTypedArray;

    # invokes: Lde/robv/android/xposed/XposedBridge;->setObjectClass(Ljava/lang/Object;Ljava/lang/Class;)V
    invoke-static {v2, v3}, Lde/robv/android/xposed/XposedBridge;->access$6(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 359
    check-cast v1, Landroid/content/res/XResources$XTypedArray;

    .end local v1    # "typedArray":Landroid/content/res/TypedArray;
    check-cast v0, Landroid/content/res/XResources;

    .end local v0    # "res":Landroid/content/res/Resources;
    invoke-virtual {v1, v0}, Landroid/content/res/XResources$XTypedArray;->initObject(Landroid/content/res/XResources;)V

    .line 361
    :cond_1a
    return-void
.end method
