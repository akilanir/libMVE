.class public Lde/robv/android/xposed/IXposedHookCmdInit$StartupParam;
.super Ljava/lang/Object;
.source "IXposedHookCmdInit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lde/robv/android/xposed/IXposedHookCmdInit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StartupParam"
.end annotation


# instance fields
.field public modulePath:Ljava/lang/String;

.field public startClassName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
