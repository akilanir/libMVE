.class Lretrofit/Platform$Android;
.super Lretrofit/Platform;
.source "Platform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lretrofit/Platform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Android"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lretrofit/Platform$Android$MainThreadExecutor;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 81
    invoke-direct {p0}, Lretrofit/Platform;-><init>()V

    .line 89
    return-void
.end method


# virtual methods
.method defaultCallAdapterFactory(Ljava/util/concurrent/Executor;)Lretrofit/CallAdapter$Factory;
    .registers 3
    .param p1, "callbackExecutor"    # Ljava/util/concurrent/Executor;

    .prologue
    .line 83
    if-nez p1, :cond_7

    .line 84
    new-instance p1, Lretrofit/Platform$Android$MainThreadExecutor;

    .end local p1    # "callbackExecutor":Ljava/util/concurrent/Executor;
    invoke-direct {p1}, Lretrofit/Platform$Android$MainThreadExecutor;-><init>()V

    .line 86
    .restart local p1    # "callbackExecutor":Ljava/util/concurrent/Executor;
    :cond_7
    new-instance v0, Lretrofit/ExecutorCallAdapterFactory;

    invoke-direct {v0, p1}, Lretrofit/ExecutorCallAdapterFactory;-><init>(Ljava/util/concurrent/Executor;)V

    return-object v0
.end method
