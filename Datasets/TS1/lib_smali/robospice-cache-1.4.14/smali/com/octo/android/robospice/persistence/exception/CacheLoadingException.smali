.class public Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;
.super Lcom/octo/android/robospice/persistence/exception/SpiceException;
.source "CacheLoadingException.java"


# static fields
.field private static final serialVersionUID:J = -0x1948d6406bd18ba4L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "detailMessage"    # Ljava/lang/String;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "detailMessage"    # Ljava/lang/String;
    .param p2, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/Throwable;)V

    .line 22
    return-void
.end method
