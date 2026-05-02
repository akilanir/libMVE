.class public Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;
.super Ljava/lang/Object;
.source "XC_LayoutInflated.java"

# interfaces
.implements Lde/robv/android/xposed/callbacks/IXUnhook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/callbacks/XC_LayoutInflated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Unhook"
.end annotation


# instance fields
.field private final id:I

.field private final resDir:Ljava/lang/String;

.field final synthetic this$0:Lde/robv/android/xposed/callbacks/XC_LayoutInflated;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/callbacks/XC_LayoutInflated;Ljava/lang/String;I)V
    .registers 4
    .param p2, "resDir"    # Ljava/lang/String;
    .param p3, "id"    # I

    .prologue
    .line 42
    iput-object p1, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p2, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->resDir:Ljava/lang/String;

    .line 44
    iput p3, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->id:I

    .line 45
    return-void
.end method


# virtual methods
.method public getCallback()Lde/robv/android/xposed/callbacks/XC_LayoutInflated;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    return-object v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 52
    iget v0, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->id:I

    return v0
.end method

.method public getResDir()Ljava/lang/String;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->resDir:Ljava/lang/String;

    return-object v0
.end method

.method public unhook()V
    .registers 4

    .prologue
    .line 61
    iget-object v0, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->resDir:Ljava/lang/String;

    iget v1, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->id:I

    iget-object v2, p0, Lde/robv/android/xposed/callbacks/XC_LayoutInflated$Unhook;->this$0:Lde/robv/android/xposed/callbacks/XC_LayoutInflated;

    invoke-static {v0, v1, v2}, Landroid/content/res/XResources;->unhookLayout(Ljava/lang/String;ILde/robv/android/xposed/callbacks/XC_LayoutInflated;)V

    .line 62
    return-void
.end method
