.class public Lcom/octo/android/robospice/exception/RequestCancelledException;
.super Lcom/octo/android/robospice/persistence/exception/SpiceException;
.source "RequestCancelledException.java"


# static fields
.field private static final serialVersionUID:J = 0x505a3c0566cce411L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;)V

    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/Throwable;)V

    .line 23
    return-void
.end method
