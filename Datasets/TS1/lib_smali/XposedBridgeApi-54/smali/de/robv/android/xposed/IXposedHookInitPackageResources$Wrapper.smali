.class public Lde/robv/android/xposed/IXposedHookInitPackageResources$Wrapper;
.super Lde/robv/android/xposed/callbacks/XC_InitPackageResources;
.source "IXposedHookInitPackageResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/IXposedHookInitPackageResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Wrapper"
.end annotation


# instance fields
.field private final instance:Lde/robv/android/xposed/IXposedHookInitPackageResources;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/IXposedHookInitPackageResources;)V
    .registers 2
    .param p1, "instance"    # Lde/robv/android/xposed/IXposedHookInitPackageResources;

    .prologue
    .line 15
    invoke-direct {p0}, Lde/robv/android/xposed/callbacks/XC_InitPackageResources;-><init>()V

    .line 16
    iput-object p1, p0, Lde/robv/android/xposed/IXposedHookInitPackageResources$Wrapper;->instance:Lde/robv/android/xposed/IXposedHookInitPackageResources;

    .line 17
    return-void
.end method


# virtual methods
.method public handleInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;)V
    .registers 3
    .param p1, "resparam"    # Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 20
    iget-object v0, p0, Lde/robv/android/xposed/IXposedHookInitPackageResources$Wrapper;->instance:Lde/robv/android/xposed/IXposedHookInitPackageResources;

    invoke-interface {v0, p1}, Lde/robv/android/xposed/IXposedHookInitPackageResources;->handleInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;)V

    .line 21
    return-void
.end method
