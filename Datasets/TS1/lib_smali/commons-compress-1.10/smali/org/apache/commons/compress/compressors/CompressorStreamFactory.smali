.class public Lorg/apache/commons/compress/compressors/CompressorStreamFactory;
.super Ljava/lang/Object;
.source "CompressorStreamFactory.java"


# static fields
.field public static final BZIP2:Ljava/lang/String; = "bzip2"

.field public static final DEFLATE:Ljava/lang/String; = "deflate"

.field public static final GZIP:Ljava/lang/String; = "gz"

.field public static final LZMA:Ljava/lang/String; = "lzma"

.field public static final PACK200:Ljava/lang/String; = "pack200"

.field public static final SNAPPY_FRAMED:Ljava/lang/String; = "snappy-framed"

.field public static final SNAPPY_RAW:Ljava/lang/String; = "snappy-raw"

.field public static final XZ:Ljava/lang/String; = "xz"

.field public static final Z:Ljava/lang/String; = "z"


# instance fields
.field private volatile decompressConcatenated:Z

.field private final decompressUntilEOF:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    .line 150
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressUntilEOF:Ljava/lang/Boolean;

    .line 151
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "decompressUntilEOF"    # Z

    .prologue
    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    .line 164
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressUntilEOF:Ljava/lang/Boolean;

    .line 166
    iput-boolean p1, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    .line 167
    return-void
.end method


# virtual methods
.method public createCompressorInputStream(Ljava/io/InputStream;)Lorg/apache/commons/compress/compressors/CompressorInputStream;
    .registers 7
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/compressors/CompressorException;
        }
    .end annotation

    .prologue
    .line 206
    if-nez p1, :cond_a

    .line 207
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Stream must not be null."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 210
    :cond_a
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v3

    if-nez v3, :cond_18

    .line 211
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Mark is not supported."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 214
    :cond_18
    const/16 v3, 0xc

    new-array v1, v3, [B

    .line 215
    .local v1, "signature":[B
    array-length v3, v1

    invoke-virtual {p1, v3}, Ljava/io/InputStream;->mark(I)V

    .line 217
    :try_start_20
    invoke-static {p1, v1}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v2

    .line 218
    .local v2, "signatureLength":I
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 220
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 221
    new-instance v3, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    iget-boolean v4, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v3, p1, v4}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 251
    :goto_34
    return-object v3

    .line 224
    :cond_35
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_4c

    .line 225
    new-instance v3, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;

    iget-boolean v4, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v3, p1, v4}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V
    :try_end_42
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_42} :catch_43

    goto :goto_34

    .line 254
    .end local v2    # "signatureLength":I
    :catch_43
    move-exception v0

    .line 255
    .local v0, "e":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/compress/compressors/CompressorException;

    const-string v4, "Failed to detect Compressor from InputStream."

    invoke-direct {v3, v4, v0}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 228
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v2    # "signatureLength":I
    :cond_4c
    :try_start_4c
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_58

    .line 229
    new-instance v3, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_34

    .line 232
    :cond_58
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 233
    new-instance v3, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_34

    .line 236
    :cond_64
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_70

    .line 237
    new-instance v3, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_34

    .line 240
    :cond_70
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_7c

    .line 241
    new-instance v3, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_34

    .line 244
    :cond_7c
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/xz/XZUtils;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_90

    invoke-static {}, Lorg/apache/commons/compress/compressors/xz/XZUtils;->isXZCompressionAvailable()Z

    move-result v3

    if-eqz v3, :cond_90

    .line 246
    new-instance v3, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;

    iget-boolean v4, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v3, p1, v4}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    goto :goto_34

    .line 249
    :cond_90
    invoke-static {v1, v2}, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->matches([BI)Z

    move-result v3

    if-eqz v3, :cond_a2

    invoke-static {}, Lorg/apache/commons/compress/compressors/lzma/LZMAUtils;->isLZMACompressionAvailable()Z

    move-result v3

    if-eqz v3, :cond_a2

    .line 251
    new-instance v3, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;

    invoke-direct {v3, p1}, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_4c .. :try_end_a1} :catch_43

    goto :goto_34

    .line 258
    :cond_a2
    new-instance v3, Lorg/apache/commons/compress/compressors/CompressorException;

    const-string v4, "No Compressor found for the stream signature."

    invoke-direct {v3, v4}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public createCompressorInputStream(Ljava/lang/String;Ljava/io/InputStream;)Lorg/apache/commons/compress/compressors/CompressorInputStream;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/compressors/CompressorException;
        }
    .end annotation

    .prologue
    .line 275
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 276
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Compressor name and stream must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 282
    :cond_c
    :try_start_c
    const-string v1, "gz"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 283
    new-instance v1, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;

    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v1, p2, v2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 315
    :goto_1b
    return-object v1

    .line 286
    :cond_1c
    const-string v1, "bzip2"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 287
    new-instance v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;

    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v1, p2, v2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream;-><init>(Ljava/io/InputStream;Z)V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_2b} :catch_2c

    goto :goto_1b

    .line 318
    :catch_2c
    move-exception v0

    .line 319
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/commons/compress/compressors/CompressorException;

    const-string v2, "Could not create CompressorInputStream."

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 290
    .end local v0    # "e":Ljava/io/IOException;
    :cond_35
    :try_start_35
    const-string v1, "xz"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_45

    .line 291
    new-instance v1, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;

    iget-boolean v2, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    invoke-direct {v1, p2, v2}, Lorg/apache/commons/compress/compressors/xz/XZCompressorInputStream;-><init>(Ljava/io/InputStream;Z)V

    goto :goto_1b

    .line 294
    :cond_45
    const-string v1, "lzma"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 295
    new-instance v1, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/lzma/LZMACompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1b

    .line 298
    :cond_53
    const-string v1, "pack200"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_61

    .line 299
    new-instance v1, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1b

    .line 302
    :cond_61
    const-string v1, "snappy-raw"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6f

    .line 303
    new-instance v1, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1b

    .line 306
    :cond_6f
    const-string v1, "snappy-framed"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7d

    .line 307
    new-instance v1, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1b

    .line 310
    :cond_7d
    const-string v1, "z"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8b

    .line 311
    new-instance v1, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/z/ZCompressorInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1b

    .line 314
    :cond_8b
    const-string v1, "deflate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_99

    .line 315
    new-instance v1, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_98
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_98} :catch_2c

    goto :goto_1b

    .line 322
    :cond_99
    new-instance v1, Lorg/apache/commons/compress/compressors/CompressorException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Compressor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public createCompressorOutputStream(Ljava/lang/String;Ljava/io/OutputStream;)Lorg/apache/commons/compress/compressors/CompressorOutputStream;
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/compressors/CompressorException;
        }
    .end annotation

    .prologue
    .line 339
    if-eqz p1, :cond_4

    if-nez p2, :cond_c

    .line 340
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Compressor name and stream must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 346
    :cond_c
    :try_start_c
    const-string v1, "gz"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 347
    new-instance v1, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 363
    :goto_19
    return-object v1

    .line 350
    :cond_1a
    const-string v1, "bzip2"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    .line 351
    new-instance v1, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_27} :catch_28

    goto :goto_19

    .line 366
    :catch_28
    move-exception v0

    .line 367
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/apache/commons/compress/compressors/CompressorException;

    const-string v2, "Could not create CompressorOutputStream"

    invoke-direct {v1, v2, v0}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 354
    .end local v0    # "e":Ljava/io/IOException;
    :cond_31
    :try_start_31
    const-string v1, "xz"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 355
    new-instance v1, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/xz/XZCompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_19

    .line 358
    :cond_3f
    const-string v1, "pack200"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4d

    .line 359
    new-instance v1, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_19

    .line 362
    :cond_4d
    const-string v1, "deflate"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5b

    .line 363
    new-instance v1, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;

    invoke-direct {v1, p2}, Lorg/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_5a} :catch_28

    goto :goto_19

    .line 370
    :cond_5b
    new-instance v1, Lorg/apache/commons/compress/compressors/CompressorException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Compressor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/compressors/CompressorException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getDecompressConcatenated()Z
    .registers 2

    .prologue
    .line 375
    iget-boolean v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    return v0
.end method

.method public setDecompressConcatenated(Z)V
    .registers 4
    .param p1, "decompressConcatenated"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressUntilEOF:Ljava/lang/Boolean;

    if-eqz v0, :cond_c

    .line 188
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot override the setting defined by the constructor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 190
    :cond_c
    iput-boolean p1, p0, Lorg/apache/commons/compress/compressors/CompressorStreamFactory;->decompressConcatenated:Z

    .line 191
    return-void
.end method
