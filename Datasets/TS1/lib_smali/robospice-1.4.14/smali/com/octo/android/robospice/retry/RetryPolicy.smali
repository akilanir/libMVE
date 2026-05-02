.class public interface abstract Lcom/octo/android/robospice/retry/RetryPolicy;
.super Ljava/lang/Object;
.source "RetryPolicy.java"


# virtual methods
.method public abstract getDelayBeforeRetry()J
.end method

.method public abstract getRetryCount()I
.end method

.method public abstract retry(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
.end method
