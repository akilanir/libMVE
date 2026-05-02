.class public Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;
.super Ljava/lang/Object;
.source "XC_LoadPackage.java"

# interfaces
.implements Lde/robv/android/xposed/callbacks/IXUnhook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XC_LoadPackage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Unhook"
.end annotation


# instance fields
.field final synthetic this$0:Lde/robv/android/xposed/callbacks/XC_LoadPackage;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)V
    .registers 2

    .prologue
    .line 39
    iput-object p1, p0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LoadPackage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCallback()Lde/robv/android/xposed/callbacks/XC_LoadPackage;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LoadPackage;

    return-object v0
.end method

.method public unhook()V
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_LoadPackage$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LoadPackage;

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->unhookLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage;)V

    .line 47
    return-void
.end method
