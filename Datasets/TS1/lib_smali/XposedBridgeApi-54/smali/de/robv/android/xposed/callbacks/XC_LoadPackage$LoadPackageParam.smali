.class public Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
.super Lde/robv/android/xposed/callbacks/XCallback$Param;
.source "XC_LoadPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XC_LoadPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LoadPackageParam"
.end annotation


# instance fields
.field public appInfo:Landroid/content/pm/ApplicationInfo;

.field public classLoader:Ljava/lang/ClassLoader;

.field public isFirstApplication:Z

.field public packageName:Ljava/lang/String;

.field public processName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet",
            "<",
            "Lde/robv/android/xposed/callbacks/XC_LoadPackage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 17
    .local p1, "callbacks":Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;, "Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet<Lde/robv/android/xposed/callbacks/XC_LoadPackage;>;"
    invoke-direct {p0, p1}, Lde/robv/android/xposed/callbacks/XCallback$Param;-><init>(Lde/robv/android/xposed/XposedBridge$CopyOnWriteSortedSet;)V

    .line 18
    return-void
.end method
