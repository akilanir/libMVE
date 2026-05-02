.class public abstract Lde/robv/android/xposed/callbacks/XC_InitPackageResources;
.super Lde/robv/android/xposed/callbacks/XCallback;
.source "XC_InitPackageResources.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;,
        Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;
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
    .line 27
    instance-of v0, p1, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;

    if-eqz v0, :cond_9

    .line 28
    check-cast p1, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;

    .end local p1    # "param":Lde/robv/android/xposed/callbacks/XCallback$Param;
    invoke-virtual {p0, p1}, Lde/robv/android/xposed/callbacks/XC_InitPackageResources;->handleInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;)V

    .line 29
    :cond_9
    return-void
.end method

.method public abstract handleInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation
.end method
