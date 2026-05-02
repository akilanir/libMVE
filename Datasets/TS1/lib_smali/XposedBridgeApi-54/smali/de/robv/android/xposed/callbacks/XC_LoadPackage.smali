.class public abstract Lde/robv/android/xposed/callbacks/XC_LoadPackage;
.super Lde/robv/android/xposed/callbacks/XCallback;
.source "XC_LoadPackage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;,
        Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Lde/robv/android/xposed/callbacks/XCallback;-><init>()V

    .line 10
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "priority"    # I

    .prologue
    .line 12
    invoke-direct {p0, p1}, Lde/robv/android/xposed/callbacks/XCallback;-><init>(I)V

    .line 13
    return-void
.end method


# virtual methods
.method protected call(Lde/robv/android/xposed/callbacks/XCallback$Param;)V
    .registers 3
    .param p1, "param"    # Lde/robv/android/xposed/callbacks/XCallback$Param;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 33
    instance-of v0, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;

    if-eqz v0, :cond_9

    .line 34
    check-cast p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;

    .end local p1    # "param":Lde/robv/android/xposed/callbacks/XCallback$Param;
    invoke-virtual {p0, p1}, Lde/robv/android/xposed/callbacks/XC_LoadPackage;->handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V

    .line 35
    :cond_9
    return-void
.end method

.method public abstract handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
