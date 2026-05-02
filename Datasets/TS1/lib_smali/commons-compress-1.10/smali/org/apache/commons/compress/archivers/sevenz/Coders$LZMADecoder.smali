.class Lorg/apache/commons/compress/archivers/sevenz/Coders$LZMADecoder;
.super Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.source "Coders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/sevenz/Coders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LZMADecoder"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 102
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;-><init>([Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .registers 16
    .param p1, "archiveName"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "uncompressedLength"    # J
    .param p5, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p6, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p5, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    const/4 v1, 0x0

    aget-byte v4, v0, v1

    .line 107
    .local v4, "propsByte":B
    iget-object v0, p5, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    const/4 v1, 0x1

    aget-byte v0, v0, v1

    int-to-long v6, v0

    .line 108
    .local v6, "dictSize":J
    const/4 v8, 0x1

    .local v8, "i":I
    :goto_c
    const/4 v0, 0x4

    if-ge v8, v0, :cond_20

    .line 109
    iget-object v0, p5, Lorg/apache/commons/compress/archivers/sevenz/Coder;->properties:[B

    add-int/lit8 v1, v8, 0x1

    aget-byte v0, v0, v1

    int-to-long v0, v0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    mul-int/lit8 v2, v8, 0x8

    shl-long/2addr v0, v2

    or-long/2addr v6, v0

    .line 108
    add-int/lit8 v8, v8, 0x1

    goto :goto_c

    .line 111
    :cond_20
    const-wide/32 v0, 0x7ffffff0

    cmp-long v0, v6, v0

    if-lez v0, :cond_40

    .line 112
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Dictionary larger than 4GiB maximum size used in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_40
    new-instance v0, Lorg/tukaani/xz/LZMAInputStream;

    long-to-int v5, v6

    move-object v1, p2

    move-wide v2, p3

    invoke-direct/range {v0 .. v5}, Lorg/tukaani/xz/LZMAInputStream;-><init>(Ljava/io/InputStream;JBI)V

    return-object v0
.end method
