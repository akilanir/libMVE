.class public Lorg/osmdroid/tileprovider/util/StreamUtils;
.super Ljava/lang/Object;
.source "StreamUtils.java"


# static fields
.field public static final IO_BUFFER_SIZE:I = 0x2000


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static closeStream(Ljava/io/Closeable;)V
    .registers 4
    .param p0, "stream"    # Ljava/io/Closeable;

    .prologue
    .line 76
    if-eqz p0, :cond_5

    .line 78
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 83
    :cond_5
    :goto_5
    return-void

    .line 79
    :catch_6
    move-exception v0

    .line 80
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "OsmDroid"

    const-string v2, "Could not close stream"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_5
.end method

.method public static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .registers 8
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    const-wide/16 v1, 0x0

    .line 60
    .local v1, "length":J
    const/16 v4, 0x2000

    new-array v0, v4, [B

    .line 62
    .local v0, "b":[B
    :goto_6
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "read":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_14

    .line 63
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 64
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_6

    .line 66
    :cond_14
    return-wide v1
.end method
