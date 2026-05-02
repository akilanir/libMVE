.class public Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;
.super Ljava/io/IOException;
.source "HttpDataSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer/upstream/HttpDataSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HttpDataSourceException"
.end annotation


# instance fields
.field public final dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .registers 2
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 59
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .registers 3
    .param p1, "cause"    # Ljava/io/IOException;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 68
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    .line 69
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 63
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 64
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/IOException;Lcom/google/android/exoplayer/upstream/DataSpec;)V
    .registers 4
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/io/IOException;
    .param p3, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/HttpDataSource$HttpDataSourceException;->dataSpec:Lcom/google/android/exoplayer/upstream/DataSpec;

    .line 75
    return-void
.end method
