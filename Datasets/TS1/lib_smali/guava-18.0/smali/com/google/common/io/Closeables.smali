.class public final Lcom/google/common/io/Closeables;
.super Ljava/lang/Object;
.source "Closeables.java"


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation


# static fields
.field static final logger:Ljava/util/logging/Logger;
    .annotation build Lcom/google/common/annotations/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-class v0, Lcom/google/common/io/Closeables;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    sput-object v0, Lcom/google/common/io/Closeables;->logger:Ljava/util/logging/Logger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static close(Ljava/io/Closeable;Z)V
    .registers 6
    .param p0, "closeable"    # Ljava/io/Closeable;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "swallowIOException"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    if-nez p0, :cond_3

    .line 88
    :goto_2
    return-void

    .line 79
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 80
    :catch_7
    move-exception v0

    .line 81
    .local v0, "e":Ljava/io/IOException;
    if-eqz p1, :cond_14

    .line 82
    sget-object v1, Lcom/google/common/io/Closeables;->logger:Ljava/util/logging/Logger;

    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    const-string v3, "IOException thrown while closing Closeable."

    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 85
    :cond_14
    throw v0
.end method

.method public static closeQuietly(Ljava/io/InputStream;)V
    .registers 3
    .param p0, "inputStream"    # Ljava/io/InputStream;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 106
    const/4 v1, 0x1

    :try_start_1
    invoke-static {p0, v1}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4} :catch_5

    .line 110
    return-void

    .line 107
    :catch_5
    move-exception v0

    .line 108
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public static closeQuietly(Ljava/io/Reader;)V
    .registers 3
    .param p0, "reader"    # Ljava/io/Reader;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 127
    const/4 v1, 0x1

    :try_start_1
    invoke-static {p0, v1}, Lcom/google/common/io/Closeables;->close(Ljava/io/Closeable;Z)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4} :catch_5

    .line 131
    return-void

    .line 128
    :catch_5
    move-exception v0

    .line 129
    .local v0, "impossible":Ljava/io/IOException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
