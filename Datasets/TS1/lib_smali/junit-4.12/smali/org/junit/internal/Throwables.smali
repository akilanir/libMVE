.class public final Lorg/junit/internal/Throwables;
.super Ljava/lang/Object;
.source "Throwables.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    return-void
.end method

.method private static rethrow(Ljava/lang/Throwable;)V
    .registers 1
    .param p0, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Throwable;",
            ">(",
            "Ljava/lang/Throwable;",
            ")V^TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 40
    throw p0
.end method

.method public static rethrowAsException(Ljava/lang/Throwable;)Ljava/lang/Exception;
    .registers 2
    .param p0, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    invoke-static {p0}, Lorg/junit/internal/Throwables;->rethrow(Ljava/lang/Throwable;)V

    .line 35
    const/4 v0, 0x0

    return-object v0
.end method
