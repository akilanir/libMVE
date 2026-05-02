.class Lde/robv/android/xposed/XC_MethodReplacement$1;
.super Lde/robv/android/xposed/XC_MethodReplacement;
.source "XC_MethodReplacement.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/XC_MethodReplacement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(I)V
    .registers 2
    .param p1, "$anonymous0"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1}, Lde/robv/android/xposed/XC_MethodReplacement;-><init>(I)V

    .line 1
    return-void
.end method


# virtual methods
.method protected replaceHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)Ljava/lang/Object;
    .registers 3
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    return-object v0
.end method
