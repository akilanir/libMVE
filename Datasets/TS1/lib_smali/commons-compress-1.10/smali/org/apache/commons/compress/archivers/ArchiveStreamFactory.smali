.class public Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;
.super Ljava/lang/Object;
.source "ArchiveStreamFactory.java"


# static fields
.field public static final AR:Ljava/lang/String; = "ar"

.field public static final ARJ:Ljava/lang/String; = "arj"

.field public static final CPIO:Ljava/lang/String; = "cpio"

.field public static final DUMP:Ljava/lang/String; = "dump"

.field public static final JAR:Ljava/lang/String; = "jar"

.field public static final SEVEN_Z:Ljava/lang/String; = "7z"

.field public static final TAR:Ljava/lang/String; = "tar"

.field public static final ZIP:Ljava/lang/String; = "zip"


# instance fields
.field private final encoding:Ljava/lang/String;

.field private volatile entryEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 136
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;-><init>(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    .line 148
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->encoding:Ljava/lang/String;

    .line 150
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    .line 151
    return-void
.end method


# virtual methods
.method public createArchiveInputStream(Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    .registers 11
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x200

    .line 331
    if-nez p1, :cond_c

    .line 332
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Stream must not be null."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 335
    :cond_c
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v7

    if-nez v7, :cond_1a

    .line 336
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "Mark is not supported."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 339
    :cond_1a
    const/16 v7, 0xc

    new-array v2, v7, [B

    .line 340
    .local v2, "signature":[B
    array-length v7, v2

    invoke-virtual {p1, v7}, Ljava/io/InputStream;->mark(I)V

    .line 342
    :try_start_22
    invoke-static {p1, v2}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v3

    .line 343
    .local v3, "signatureLength":I
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 344
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 345
    iget-object v7, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v7, :cond_3b

    .line 346
    new-instance v7, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 406
    :goto_3a
    return-object v7

    .line 348
    :cond_3b
    new-instance v7, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    invoke-direct {v7, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_40} :catch_41

    goto :goto_3a

    .line 409
    .end local v3    # "signatureLength":I
    :catch_41
    move-exception v1

    .line 410
    .local v1, "e":Ljava/io/IOException;
    new-instance v7, Lorg/apache/commons/compress/archivers/ArchiveException;

    const-string v8, "Could not use reset and mark operations."

    invoke-direct {v7, v8, v1}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v7

    .line 350
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "signatureLength":I
    :cond_4a
    :try_start_4a
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_62

    .line 351
    iget-object v7, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v7, :cond_5c

    .line 352
    new-instance v7, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_3a

    .line 354
    :cond_5c
    new-instance v7, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    invoke-direct {v7, p1}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_3a

    .line 356
    :cond_62
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_6e

    .line 357
    new-instance v7, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;

    invoke-direct {v7, p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_3a

    .line 358
    :cond_6e
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_86

    .line 359
    iget-object v7, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v7, :cond_80

    .line 360
    new-instance v7, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_3a

    .line 362
    :cond_80
    new-instance v7, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    invoke-direct {v7, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_3a

    .line 364
    :cond_86
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_9e

    .line 365
    iget-object v7, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v7, :cond_98

    .line 366
    new-instance v7, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_3a

    .line 368
    :cond_98
    new-instance v7, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;

    invoke-direct {v7, p1}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_3a

    .line 370
    :cond_9e
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_ac

    .line 371
    new-instance v7, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;

    const-string v8, "7z"

    invoke-direct {v7, v8}, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 375
    :cond_ac
    const/16 v7, 0x20

    new-array v0, v7, [B

    .line 376
    .local v0, "dumpsig":[B
    array-length v7, v0

    invoke-virtual {p1, v7}, Ljava/io/InputStream;->mark(I)V

    .line 377
    invoke-static {p1, v0}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v3

    .line 378
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 379
    invoke-static {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_ca

    .line 380
    new-instance v7, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto/16 :goto_3a

    .line 384
    :cond_ca
    const/16 v7, 0x200

    new-array v6, v7, [B

    .line 385
    .local v6, "tarheader":[B
    array-length v7, v6

    invoke-virtual {p1, v7}, Ljava/io/InputStream;->mark(I)V

    .line 386
    invoke-static {p1, v6}, Lorg/apache/commons/compress/utils/IOUtils;->readFully(Ljava/io/InputStream;[B)I

    move-result v3

    .line 387
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 388
    invoke-static {v6, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->matches([BI)Z

    move-result v7

    if-eqz v7, :cond_e8

    .line 389
    new-instance v7, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_e6
    .catch Ljava/io/IOException; {:try_start_4a .. :try_end_e6} :catch_41

    goto/16 :goto_3a

    .line 392
    :cond_e8
    if-lt v3, v8, :cond_10e

    .line 393
    const/4 v4, 0x0

    .line 395
    .local v4, "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :try_start_eb
    new-instance v5, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    invoke-direct {v7, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_f5
    .catch Ljava/lang/Exception; {:try_start_eb .. :try_end_f5} :catch_116
    .catchall {:try_start_eb .. :try_end_f5} :catchall_11b

    .line 397
    .end local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .local v5, "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :try_start_f5
    invoke-virtual {v5}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextTarEntry()Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/commons/compress/archivers/tar/TarArchiveEntry;->isCheckSumOK()Z

    move-result v7

    if-eqz v7, :cond_10b

    .line 398
    new-instance v7, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    iget-object v8, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->encoding:Ljava/lang/String;

    invoke-direct {v7, p1, v8}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_106
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_106} :catch_123
    .catchall {:try_start_f5 .. :try_end_106} :catchall_120

    .line 406
    :try_start_106
    invoke-static {v5}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto/16 :goto_3a

    :cond_10b
    invoke-static {v5}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_10e
    .catch Ljava/io/IOException; {:try_start_106 .. :try_end_10e} :catch_41

    .line 413
    .end local v5    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :cond_10e
    :goto_10e
    new-instance v7, Lorg/apache/commons/compress/archivers/ArchiveException;

    const-string v8, "No Archiver found for the stream signature"

    invoke-direct {v7, v8}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 400
    .restart local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :catch_116
    move-exception v7

    .line 406
    :goto_117
    :try_start_117
    invoke-static {v4}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_10e

    :catchall_11b
    move-exception v7

    :goto_11c
    invoke-static {v4}, Lorg/apache/commons/compress/utils/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw v7
    :try_end_120
    .catch Ljava/io/IOException; {:try_start_117 .. :try_end_120} :catch_41

    .end local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .restart local v5    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :catchall_120
    move-exception v7

    move-object v4, v5

    .end local v5    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .restart local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    goto :goto_11c

    .line 400
    .end local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .restart local v5    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :catch_123
    move-exception v7

    move-object v4, v5

    .end local v5    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    .restart local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    goto :goto_117
.end method

.method public createArchiveInputStream(Ljava/lang/String;Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    .registers 6
    .param p1, "archiverName"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    .line 198
    if-nez p1, :cond_a

    .line 199
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Archivername must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 202
    :cond_a
    if-nez p2, :cond_14

    .line 203
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "InputStream must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_14
    const-string v0, "ar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 207
    new-instance v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    .line 248
    :goto_21
    return-object v0

    .line 209
    :cond_22
    const-string v0, "arj"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 210
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_36

    .line 211
    new-instance v0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 213
    :cond_36
    new-instance v0, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/arj/ArjArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_21

    .line 216
    :cond_3c
    const-string v0, "zip"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_56

    .line 217
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_50

    .line 218
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 220
    :cond_50
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_21

    .line 223
    :cond_56
    const-string v0, "tar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 224
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_6a

    .line 225
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 227
    :cond_6a
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_21

    .line 230
    :cond_70
    const-string v0, "jar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 231
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_84

    .line 232
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 234
    :cond_84
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_21

    .line 237
    :cond_8a
    const-string v0, "cpio"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a5

    .line 238
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_9e

    .line 239
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 241
    :cond_9e
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto/16 :goto_21

    .line 244
    :cond_a5
    const-string v0, "dump"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c1

    .line 245
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v0, :cond_ba

    .line 246
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto/16 :goto_21

    .line 248
    :cond_ba
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto/16 :goto_21

    .line 251
    :cond_c1
    const-string v0, "7z"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d1

    .line 252
    new-instance v0, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;

    const-string v1, "7z"

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 255
    :cond_d1
    new-instance v0, Lorg/apache/commons/compress/archivers/ArchiveException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Archiver: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createArchiveOutputStream(Ljava/lang/String;Ljava/io/OutputStream;)Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
    .registers 7
    .param p1, "archiverName"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    .line 273
    if-nez p1, :cond_a

    .line 274
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Archivername must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 276
    :cond_a
    if-nez p2, :cond_14

    .line 277
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "OutputStream must not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 280
    :cond_14
    const-string v1, "ar"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    .line 281
    new-instance v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 308
    :cond_21
    :goto_21
    return-object v0

    .line 283
    :cond_22
    const-string v1, "zip"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_39

    .line 284
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 285
    .local v0, "zip":Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v1, :cond_21

    .line 286
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;->setEncoding(Ljava/lang/String;)V

    goto :goto_21

    .line 290
    .end local v0    # "zip":Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;
    :cond_39
    const-string v1, "tar"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_53

    .line 291
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v1, :cond_4d

    .line 292
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 294
    :cond_4d
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_21

    .line 297
    :cond_53
    const-string v1, "jar"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6d

    .line 298
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v1, :cond_67

    .line 299
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 301
    :cond_67
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_21

    .line 304
    :cond_6d
    const-string v1, "cpio"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_87

    .line 305
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    if-eqz v1, :cond_81

    .line 306
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;

    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    invoke-direct {v0, p2, v1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    goto :goto_21

    .line 308
    :cond_81
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_21

    .line 311
    :cond_87
    const-string v1, "7z"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_97

    .line 312
    new-instance v1, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;

    const-string v2, "7z"

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/StreamingNotSupportedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 314
    :cond_97
    new-instance v1, Lorg/apache/commons/compress/archivers/ArchiveException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Archiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getEntryEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public setEntryEncoding(Ljava/lang/String;)V
    .registers 4
    .param p1, "entryEncoding"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 176
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_c

    .line 177
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot overide encoding set by the constructor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 179
    :cond_c
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;->entryEncoding:Ljava/lang/String;

    .line 180
    return-void
.end method
