.class public Lorg/osmdroid/tileprovider/util/StreamUtils;
.super Ljava/lang/Object;
.source "StreamUtils.java"


# static fields
.field public static final IO_BUFFER_SIZE:I = 0x2000

.field private static final logger:Lorg/slf4j/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 18
    const-class v0, Lorg/osmdroid/tileprovider/util/StreamUtils;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/osmdroid/tileprovider/util/StreamUtils;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static closeStream(Ljava/io/Closeable;)V
    .registers 5
    .param p0, "stream"    # Ljava/io/Closeable;

    .prologue
    .line 79
    if-eqz p0, :cond_5

    .line 81
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 86
    :cond_5
    :goto_5
    return-void

    .line 82
    :catch_6
    move-exception v0

    .line 83
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/osmdroid/tileprovider/util/StreamUtils;->logger:Lorg/slf4j/Logger;

    const-string v2, "IO"

    const-string v3, "Could not close stream"

    invoke-interface {v1, v2, v3, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

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
    .line 62
    const-wide/16 v1, 0x0

    .line 63
    .local v1, "length":J
    const/16 v4, 0x2000

    new-array v0, v4, [B

    .line 65
    .local v0, "b":[B
    :goto_6
    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .local v3, "read":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_14

    .line 66
    const/4 v4, 0x0

    invoke-virtual {p1, v0, v4, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 67
    int-to-long v4, v3

    add-long/2addr v1, v4

    goto :goto_6

    .line 69
    :cond_14
    return-wide v1
.end method
