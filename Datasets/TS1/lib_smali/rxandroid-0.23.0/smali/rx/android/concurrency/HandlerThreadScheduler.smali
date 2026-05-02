.class public Lrx/android/concurrency/HandlerThreadScheduler;
.super Lrx/android/schedulers/HandlerThreadScheduler;
.source "HandlerThreadScheduler.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>(Landroid/os/Handler;)V
    .registers 2
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lrx/android/schedulers/HandlerThreadScheduler;-><init>(Landroid/os/Handler;)V

    .line 28
    return-void
.end method
