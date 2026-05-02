.class public abstract Lde/robv/android/xposed/callbacks/XC_LayoutInflated;
.super Lde/robv/android/xposed/callbacks/XCallback;
.source "XC_LayoutInflated.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;,
        Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
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
.method protected call(Lde/robv/android/xposed/callbacks/XCallback$Param;)V
    .registers 3
    .param p1, "param"    # Lde/robv/android/xposed/callbacks/XCallback$Param;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 32
    instance-of v0, p1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;

    if-eqz v0, :cond_9

    .line 33
    check-cast p1, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;

    .end local p1    # "param":Lde/robv/android/xposed/callbacks/XCallback$Param;
    invoke-virtual {p0, p1}, Lde/robv/android/xposed/callbacks/XC_LayoutInflated;->handleLayoutInflated(Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;)V

    .line 34
    :cond_9
    return-void
.end method

.method public abstract handleLayoutInflated(Lde/robv/android/xposed/callbacks/XC_LayoutInflated$LayoutInflatedParam;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
