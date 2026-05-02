.class public Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;
.super Ljava/lang/Object;
.source "IXposedHookZygoteInit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/IXposedHookZygoteInit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StartupParam"
.end annotation


# instance fields
.field public modulePath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
