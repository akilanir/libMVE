.class public Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;
.super Ljava/lang/Object;
.source "XC_InitPackageResources.java"

# interfaces
.implements Lde/robv/android/xposed/callbacks/IXUnhook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XC_InitPackageResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Unhook"
.end annotation


# instance fields
.field final synthetic this$0:Lde/robv/android/xposed/callbacks/XC_InitPackageResources;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)V
    .registers 2

    .prologue
    .line 33
    iput-object p1, p0, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_InitPackageResources;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCallback()Lde/robv/android/xposed/callbacks/XC_InitPackageResources;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_InitPackageResources;

    return-object v0
.end method

.method public unhook()V
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_InitPackageResources;

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->unhookInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources;)V

    .line 41
    return-void
.end method
