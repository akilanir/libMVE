.class public Lde/robv/android/xposed/XC_MethodHook$Unhook;
.super Ljava/lang/Object;
.source "XC_MethodHook.java"

# interfaces
.implements Lde/robv/android/xposed/callbacks/IXUnhook;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/XC_MethodHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Unhook"
.end annotation


# instance fields
.field private final hookMethod:Ljava/lang/reflect/Member;

.field final synthetic this$0:Lde/robv/android/xposed/XC_MethodHook;


# direct methods
.method public constructor <init>(Lde/robv/android/xposed/XC_MethodHook;Ljava/lang/reflect/Member;)V
    .registers 3
    .param p2, "hookMethod"    # Ljava/lang/reflect/Member;

    .prologue
    .line 91
    iput-object p1, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->this$0:Lde/robv/android/xposed/XC_MethodHook;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p2, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->hookMethod:Ljava/lang/reflect/Member;

    .line 93
    return-void
.end method


# virtual methods
.method public getCallback()Lde/robv/android/xposed/XC_MethodHook;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->this$0:Lde/robv/android/xposed/XC_MethodHook;

    return-object v0
.end method

.method public getHookedMethod()Ljava/lang/reflect/Member;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->hookMethod:Ljava/lang/reflect/Member;

    return-object v0
.end method

.method public unhook()V
    .registers 3

    .prologue
    .line 105
    iget-object v0, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->hookMethod:Ljava/lang/reflect/Member;

    iget-object v1, p0, Lde/robv/android/xposed/XC_MethodHook$Unhook;->this$0:Lde/robv/android/xposed/XC_MethodHook;

    invoke-static {v0, v1}, Lde/robv/android/xposed/XposedBridge;->unhookMethod(Ljava/lang/reflect/Member;Lde/robv/android/xposed/XC_MethodHook;)V

    .line 106
    return-void
.end method
