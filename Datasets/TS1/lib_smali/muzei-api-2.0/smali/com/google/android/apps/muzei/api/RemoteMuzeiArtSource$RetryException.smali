.class public Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource$RetryException;
.super Ljava/lang/Exception;
.source "RemoteMuzeiArtSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/apps/muzei/api/RemoteMuzeiArtSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RetryException"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 145
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 146
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 149
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 150
    return-void
.end method
