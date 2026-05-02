.class public Lrx/android/schedulers/AndroidSchedulers;
.super Ljava/lang/Object;
.source "AndroidSchedulers.java"


# static fields
.field private static final MAIN_THREAD_SCHEDULER:Lrx/Scheduler;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 25
    new-instance v0, Lrx/android/schedulers/HandlerThreadScheduler;

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, v1}, Lrx/android/schedulers/HandlerThreadScheduler;-><init>(Landroid/os/Handler;)V

    sput-object v0, Lrx/android/schedulers/AndroidSchedulers;->MAIN_THREAD_SCHEDULER:Lrx/Scheduler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public static handlerThread(Landroid/os/Handler;)Lrx/Scheduler;
    .registers 2
    .param p0, "handler"    # Landroid/os/Handler;

    .prologue
    .line 38
    new-instance v0, Lrx/android/schedulers/HandlerThreadScheduler;

    invoke-direct {v0, p0}, Lrx/android/schedulers/HandlerThreadScheduler;-><init>(Landroid/os/Handler;)V

    return-object v0
.end method

.method public static mainThread()Lrx/Scheduler;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lrx/android/schedulers/AndroidSchedulers;->MAIN_THREAD_SCHEDULER:Lrx/Scheduler;

    return-object v0
.end method
