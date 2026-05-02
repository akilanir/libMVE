.class Lorg/apache/commons/compress/archivers/sevenz/Coders$DeflateDecoder;
.super Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.source "Coders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/sevenz/Coders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DeflateDecoder"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 4

    .prologue
    .line 150
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    const-class v2, Ljava/lang/Number;

    aput-object v2, v0, v1

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;-><init>([Ljava/lang/Class;)V

    .line 151
    return-void
.end method


# virtual methods
.method decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .registers 11
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
    .line 157
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    new-instance v1, Lorg/apache/commons/compress/archivers/sevenz/Coders$DummyByteAddingInputStream;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v2}, Lorg/apache/commons/compress/archivers/sevenz/Coders$DummyByteAddingInputStream;-><init>(Ljava/io/InputStream;Lorg/apache/commons/compress/archivers/sevenz/Coders$1;)V

    new-instance v2, Ljava/util/zip/Inflater;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Ljava/util/zip/Inflater;-><init>(Z)V

    invoke-direct {v0, v1, v2}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    return-object v0
.end method

.method encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
    .registers 7
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # Ljava/lang/Object;

    .prologue
    .line 162
    const/16 v1, 0x9

    invoke-static {p2, v1}, Lorg/apache/commons/compress/archivers/sevenz/Coders$DeflateDecoder;->numberOptionOrDefault(Ljava/lang/Object;I)I

    move-result v0

    .line 163
    .local v0, "level":I
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    new-instance v2, Ljava/util/zip/Deflater;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Ljava/util/zip/Deflater;-><init>(IZ)V

    invoke-direct {v1, p1, v2}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    return-object v1
.end method
