.class public Lorg/ligi/axt/extensions/InputStreamAXT;
.super Ljava/lang/Object;
.source "InputStreamAXT.java"


# static fields
.field private static final CHARACTER_READ_BUFFER_SIZE:I = 0x400


# instance fields
.field private final inputStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 2
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lorg/ligi/axt/extensions/InputStreamAXT;->inputStream:Ljava/io/InputStream;

    .line 18
    return-void
.end method

.method private readFromInputStreamReaderToString(Ljava/io/InputStreamReader;)Ljava/lang/String;
    .registers 7
    .param p1, "is"    # Ljava/io/InputStreamReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x400

    .line 44
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, p1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 46
    .local v2, "reader":Ljava/io/BufferedReader;
    const/16 v4, 0x400

    :try_start_9
    new-array v0, v4, [C

    .line 47
    .local v0, "buffer":[C
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v3, "sb":Ljava/lang/StringBuilder;
    :goto_10
    invoke-virtual {v2, v0}, Ljava/io/BufferedReader;->read([C)I

    move-result v1

    .local v1, "len":I
    if-ltz v1, :cond_20

    .line 51
    const/4 v4, 0x0

    invoke-virtual {v3, v0, v4, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;
    :try_end_1a
    .catchall {:try_start_9 .. :try_end_1a} :catchall_1b

    goto :goto_10

    .line 56
    .end local v0    # "buffer":[C
    .end local v1    # "len":I
    .end local v3    # "sb":Ljava/lang/StringBuilder;
    :catchall_1b
    move-exception v4

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v4

    .line 54
    .restart local v0    # "buffer":[C
    .restart local v1    # "len":I
    .restart local v3    # "sb":Ljava/lang/StringBuilder;
    :cond_20
    :try_start_20
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_1b

    move-result-object v4

    .line 56
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    return-object v4
.end method


# virtual methods
.method public readToString()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 35
    new-instance v0, Ljava/io/InputStreamReader;

    iget-object v1, p0, Lorg/ligi/axt/extensions/InputStreamAXT;->inputStream:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 37
    .local v0, "is":Ljava/io/InputStreamReader;
    :try_start_7
    invoke-direct {p0, v0}, Lorg/ligi/axt/extensions/InputStreamAXT;->readFromInputStreamReaderToString(Ljava/io/InputStreamReader;)Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_7 .. :try_end_a} :catchall_f

    move-result-object v1

    .line 39
    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    return-object v1

    :catchall_f
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStreamReader;->close()V

    throw v1
.end method

.method public toFile(Ljava/io/File;)V
    .registers 6
    .param p1, "f"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 21
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 23
    .local v1, "fos":Ljava/io/FileOutputStream;
    const/16 v3, 0x400

    :try_start_7
    new-array v0, v3, [B

    .line 26
    .local v0, "buffer":[B
    :goto_9
    iget-object v3, p0, Lorg/ligi/axt/extensions/InputStreamAXT;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v3, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .local v2, "len":I
    if-lez v2, :cond_1b

    .line 27
    const/4 v3, 0x0

    invoke-virtual {v1, v0, v3, v2}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_15
    .catchall {:try_start_7 .. :try_end_15} :catchall_16

    goto :goto_9

    .line 30
    .end local v0    # "buffer":[B
    .end local v2    # "len":I
    :catchall_16
    move-exception v3

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v3

    .restart local v0    # "buffer":[B
    .restart local v2    # "len":I
    :cond_1b
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 32
    return-void
.end method
