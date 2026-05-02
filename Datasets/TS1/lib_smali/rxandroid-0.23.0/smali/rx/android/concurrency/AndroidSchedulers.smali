.class public Lrx/android/concurrency/AndroidSchedulers;
.super Ljava/lang/Object;
.source "AndroidSchedulers.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static handlerThread(Landroid/os/Handler;)Lrx/Scheduler;
    .registers 2
    .param p0, "handler"    # Landroid/os/Handler;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 29
    invoke-static {p0}, Lrx/android/schedulers/AndroidSchedulers;->handlerThread(Landroid/os/Handler;)Lrx/Scheduler;

    move-result-object v0

    return-object v0
.end method

.method public static mainThread()Lrx/Scheduler;
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 34
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v0

    return-object v0
.end method
