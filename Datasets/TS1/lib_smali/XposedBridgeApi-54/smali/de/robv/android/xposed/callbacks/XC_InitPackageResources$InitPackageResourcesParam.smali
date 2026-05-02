.class public Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;
.super Lde/robv/android/xposed/callbacks/XCallback$Param;
.source "XC_InitPackageResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XC_InitPackageResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InitPackageResourcesParam"
.end annotation


# instance fields
.field public packageName:Ljava/lang/String;

.field public res:Landroid/content/res/XResources;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_InitPackageResources;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p1, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_InitPackageResources;>;"
    invoke-direct {p0, p1}, Lde/robv/android/xposed/callbacks/XCallback$Param;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 18
    return-void
.end method
