.class public abstract Lde/robv/android/xposed/XC_MethodHook;
.super Lde/robv/android/xposed/callbacks/XCallback;
.source "XC_MethodHook.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;,
        Lde/robv/android/xposed/XC_MethodHook$Unhook;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Lde/robv/android/xposed/callbacks/XCallback;-><init>()V

    .line 11
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lde/robv/android/xposed/callbacks/XCallback;-><init>(I)V

    .line 14
    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 2
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 28
    return-void
.end method

.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .registers 2
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 21
    return-void
.end method
