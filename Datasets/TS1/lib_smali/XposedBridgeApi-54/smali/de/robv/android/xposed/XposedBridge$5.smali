.class Lde/robv/android/xposed/XposedBridge$5;
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
    iput-object p1, p0, Lde/robv/android/xposed/XposedBridge$5;->val$latestResKey:Ljava/lang/ThreadLocal;

    .line 295
    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 298
    iget-object v0, p0, Lde/robv/android/xposed/XposedBridge$5;->val$latestResKey:Ljava/lang/ThreadLocal;

    iget-object v1, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 299
    return-void
.end method
