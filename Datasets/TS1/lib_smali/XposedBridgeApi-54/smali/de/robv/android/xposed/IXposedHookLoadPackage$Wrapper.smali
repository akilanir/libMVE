.class public Lde/robv/android/xposed/IXposedHookLoadPackage$Wrapper;
.super Lde/robv/android/xposed/callbacks/XC_LoadPackage;
.source "IXposedHookLoadPackage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/IXposedHookLoadPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Wrapper"
.end annotation


# instance fields
.field private final instance:Lde/robv/android/xposed/IXposedHookLoadPackage;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/IXposedHookLoadPackage;)V
    .registers 2
    .param p1, "instance"    # Lde/robv/android/xposed/IXposedHookLoadPackage;

    .prologue
    .line 15
    invoke-direct {p0}, Lde/robv/android/xposed/callbacks/XC_LoadPackage;-><init>()V

    .line 16
    iput-object p1, p0, Lde/robv/android/xposed/IXposedHookLoadPackage$Wrapper;->instance:Lde/robv/android/xposed/IXposedHookLoadPackage;

    .line 17
    return-void
.end method


# virtual methods
.method public handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .registers 3
    .param p1, "lpparam"    # Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lde/robv/android/xposed/IXposedHookLoadPackage$Wrapper;->instance:Lde/robv/android/xposed/IXposedHookLoadPackage;

    invoke-interface {v0, p1}, Lde/robv/android/xposed/IXposedHookLoadPackage;->handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V

    .line 21
    return-void
.end method
