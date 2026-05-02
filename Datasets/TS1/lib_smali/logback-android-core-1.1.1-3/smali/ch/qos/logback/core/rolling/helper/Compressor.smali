.class public Lch/qos/logback/core/rolling/helper/Compressor;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/rolling/helper/Compressor$1;
    }
.end annotation


# static fields
.field static final BUFFER_SIZE:I = 0x2000


# instance fields
.field final compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;


# direct methods
.method public constructor <init>(Lch/qos/logback/core/rolling/helper/CompressionMode;)V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/rolling/helper/Compressor;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    return-void
.end method

.method public static computeFileNameStr_WCS(Ljava/lang/String;Lch/qos/logback/core/rolling/helper/CompressionMode;)Ljava/lang/String;
    .registers 6

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sget-object v1, Lch/qos/logback/core/rolling/helper/Compressor$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode:[I

    invoke-virtual {p1}, Lch/qos/logback/core/rolling/helper/CompressionMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_36

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Execution should not reach this point"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_18
    const-string v1, ".gz"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    add-int/lit8 v0, v0, -0x3

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_26
    :goto_26
    :pswitch_26
    return-object p0

    :pswitch_27
    const-string v1, ".zip"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    add-int/lit8 v0, v0, -0x4

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_26

    :pswitch_data_36
    .packed-switch 0x1
        :pswitch_18
        :pswitch_27
        :pswitch_26
    .end packed-switch
.end method

.method private gzCompress(Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    const/4 v2, 0x0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2e

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The file to compress named ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V

    :cond_2d
    :goto_2d
    return-void

    :cond_2e
    const-string v1, ".gz"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_49

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".gz"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_49
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_71

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "The target compressed file named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] exist already. Aborting file compression."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addWarn(Ljava/lang/String;)V

    goto :goto_2d

    :cond_71
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "GZ compressing ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] as ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;->createMissingTargetDirsIfNecessary(Ljava/io/File;)V

    :try_start_9a
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_9a .. :try_end_a4} :catch_15a
    .catchall {:try_start_9a .. :try_end_a4} :catchall_138

    :try_start_a4
    new-instance v1, Ljava/util/zip/GZIPOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_ae
    .catch Ljava/lang/Exception; {:try_start_a4 .. :try_end_ae} :catch_15e
    .catchall {:try_start_a4 .. :try_end_ae} :catchall_14d

    const/16 v4, 0x2000

    :try_start_b0
    new-array v4, v4, [B

    :goto_b2
    invoke-virtual {v3, v4}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_fa

    const/4 v6, 0x0

    invoke-virtual {v1, v4, v6, v5}, Ljava/util/zip/GZIPOutputStream;->write([BII)V
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_b0 .. :try_end_bd} :catch_be
    .catchall {:try_start_b0 .. :try_end_bd} :catchall_14f

    goto :goto_b2

    :catch_be
    move-exception v0

    move-object v2, v3

    :goto_c0
    :try_start_c0
    new-instance v3, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error occurred while compressing ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] into ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p0, v0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_eb
    .catchall {:try_start_c0 .. :try_end_eb} :catchall_156

    if-eqz v2, :cond_f0

    :try_start_ed
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_f0
    .catch Ljava/io/IOException; {:try_start_ed .. :try_end_f0} :catch_147

    :cond_f0
    :goto_f0
    if-eqz v1, :cond_2d

    :try_start_f2
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_f5
    .catch Ljava/io/IOException; {:try_start_f2 .. :try_end_f5} :catch_f7

    goto/16 :goto_2d

    :catch_f7
    move-exception v0

    goto/16 :goto_2d

    :cond_fa
    :try_start_fa
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_fd
    .catch Ljava/lang/Exception; {:try_start_fa .. :try_end_fd} :catch_be
    .catchall {:try_start_fa .. :try_end_fd} :catchall_14f

    const/4 v3, 0x0

    :try_start_fe
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_101
    .catch Ljava/lang/Exception; {:try_start_fe .. :try_end_101} :catch_163
    .catchall {:try_start_fe .. :try_end_101} :catchall_152

    const/4 v1, 0x0

    :try_start_102
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_129

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not delete ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_102 .. :try_end_129} :catch_15a
    .catchall {:try_start_102 .. :try_end_129} :catchall_138

    :cond_129
    if-eqz v2, :cond_12e

    :try_start_12b
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_12e
    .catch Ljava/io/IOException; {:try_start_12b .. :try_end_12e} :catch_145

    :cond_12e
    :goto_12e
    if-eqz v2, :cond_2d

    :try_start_130
    invoke-virtual {v1}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_133
    .catch Ljava/io/IOException; {:try_start_130 .. :try_end_133} :catch_135

    goto/16 :goto_2d

    :catch_135
    move-exception v0

    goto/16 :goto_2d

    :catchall_138
    move-exception v0

    move-object v3, v2

    :goto_13a
    if-eqz v3, :cond_13f

    :try_start_13c
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_13f
    .catch Ljava/io/IOException; {:try_start_13c .. :try_end_13f} :catch_149

    :cond_13f
    :goto_13f
    if-eqz v2, :cond_144

    :try_start_141
    invoke-virtual {v2}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_144
    .catch Ljava/io/IOException; {:try_start_141 .. :try_end_144} :catch_14b

    :cond_144
    :goto_144
    throw v0

    :catch_145
    move-exception v0

    goto :goto_12e

    :catch_147
    move-exception v0

    goto :goto_f0

    :catch_149
    move-exception v1

    goto :goto_13f

    :catch_14b
    move-exception v1

    goto :goto_144

    :catchall_14d
    move-exception v0

    goto :goto_13a

    :catchall_14f
    move-exception v0

    move-object v2, v1

    goto :goto_13a

    :catchall_152
    move-exception v0

    move-object v3, v2

    move-object v2, v1

    goto :goto_13a

    :catchall_156
    move-exception v0

    move-object v3, v2

    move-object v2, v1

    goto :goto_13a

    :catch_15a
    move-exception v0

    move-object v1, v2

    goto/16 :goto_c0

    :catch_15e
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto/16 :goto_c0

    :catch_163
    move-exception v0

    goto/16 :goto_c0
.end method

.method private zipCompress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    const/4 v2, 0x0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2e

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The file to compress named ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V

    :cond_2d
    :goto_2d
    return-void

    :cond_2e
    if-nez p3, :cond_3b

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    const-string v1, "The innerEntryName parameter cannot be null"

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_2d

    :cond_3b
    const-string v1, ".zip"

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_56

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ".zip"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_56
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_83

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The target compressed file named ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] exist already."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V

    goto :goto_2d

    :cond_83
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ZIP compressing ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] as ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->addInfo(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lch/qos/logback/core/rolling/helper/Compressor;->createMissingTargetDirsIfNecessary(Ljava/io/File;)V

    :try_start_ac
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_ac .. :try_end_b6} :catch_16f
    .catchall {:try_start_ac .. :try_end_b6} :catchall_151

    :try_start_b6
    new-instance v1, Ljava/util/zip/ZipOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v4}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_c0} :catch_173
    .catchall {:try_start_b6 .. :try_end_c0} :catchall_166

    :try_start_c0
    invoke-virtual {p0, p3}, Lch/qos/logback/core/rolling/helper/Compressor;->computeZipEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    const/16 v4, 0x2000

    new-array v4, v4, [B

    :goto_cb
    invoke-virtual {v3, v4}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_113

    const/4 v6, 0x0

    invoke-virtual {v1, v4, v6, v5}, Ljava/util/zip/ZipOutputStream;->write([BII)V
    :try_end_d6
    .catch Ljava/lang/Exception; {:try_start_c0 .. :try_end_d6} :catch_d7
    .catchall {:try_start_c0 .. :try_end_d6} :catchall_16a

    goto :goto_cb

    :catch_d7
    move-exception v0

    move-object v2, v3

    :goto_d9
    :try_start_d9
    new-instance v3, Lch/qos/logback/core/status/ErrorStatus;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error occurred while compressing ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "] into ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p0, v0}, Lch/qos/logback/core/status/ErrorStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0, v3}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_104
    .catchall {:try_start_d9 .. :try_end_104} :catchall_16d

    if-eqz v2, :cond_109

    :try_start_106
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_109
    .catch Ljava/io/IOException; {:try_start_106 .. :try_end_109} :catch_160

    :cond_109
    :goto_109
    if-eqz v1, :cond_2d

    :try_start_10b
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_10e
    .catch Ljava/io/IOException; {:try_start_10b .. :try_end_10e} :catch_110

    goto/16 :goto_2d

    :catch_110
    move-exception v0

    goto/16 :goto_2d

    :cond_113
    :try_start_113
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_113 .. :try_end_116} :catch_d7
    .catchall {:try_start_113 .. :try_end_116} :catchall_16a

    const/4 v3, 0x0

    :try_start_117
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_11a
    .catch Ljava/lang/Exception; {:try_start_117 .. :try_end_11a} :catch_178
    .catchall {:try_start_117 .. :try_end_11a} :catchall_16d

    const/4 v1, 0x0

    :try_start_11b
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_142

    new-instance v0, Lch/qos/logback/core/status/WarnStatus;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Could not delete ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4, p0}, Lch/qos/logback/core/status/WarnStatus;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addStatus(Lch/qos/logback/core/status/Status;)V
    :try_end_142
    .catch Ljava/lang/Exception; {:try_start_11b .. :try_end_142} :catch_16f
    .catchall {:try_start_11b .. :try_end_142} :catchall_151

    :cond_142
    if-eqz v2, :cond_147

    :try_start_144
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_147
    .catch Ljava/io/IOException; {:try_start_144 .. :try_end_147} :catch_15e

    :cond_147
    :goto_147
    if-eqz v2, :cond_2d

    :try_start_149
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_14c
    .catch Ljava/io/IOException; {:try_start_149 .. :try_end_14c} :catch_14e

    goto/16 :goto_2d

    :catch_14e
    move-exception v0

    goto/16 :goto_2d

    :catchall_151
    move-exception v0

    move-object v1, v2

    :goto_153
    if-eqz v2, :cond_158

    :try_start_155
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_158
    .catch Ljava/io/IOException; {:try_start_155 .. :try_end_158} :catch_162

    :cond_158
    :goto_158
    if-eqz v1, :cond_15d

    :try_start_15a
    invoke-virtual {v1}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_15d
    .catch Ljava/io/IOException; {:try_start_15a .. :try_end_15d} :catch_164

    :cond_15d
    :goto_15d
    throw v0

    :catch_15e
    move-exception v0

    goto :goto_147

    :catch_160
    move-exception v0

    goto :goto_109

    :catch_162
    move-exception v2

    goto :goto_158

    :catch_164
    move-exception v1

    goto :goto_15d

    :catchall_166
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto :goto_153

    :catchall_16a
    move-exception v0

    move-object v2, v3

    goto :goto_153

    :catchall_16d
    move-exception v0

    goto :goto_153

    :catch_16f
    move-exception v0

    move-object v1, v2

    goto/16 :goto_d9

    :catch_173
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto/16 :goto_d9

    :catch_178
    move-exception v0

    goto/16 :goto_d9
.end method


# virtual methods
.method public compress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    sget-object v0, Lch/qos/logback/core/rolling/helper/Compressor$1;->$SwitchMap$ch$qos$logback$core$rolling$helper$CompressionMode:[I

    iget-object v1, p0, Lch/qos/logback/core/rolling/helper/Compressor;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-virtual {v1}, Lch/qos/logback/core/rolling/helper/CompressionMode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1e

    :goto_d
    return-void

    :pswitch_e
    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/rolling/helper/Compressor;->gzCompress(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d

    :pswitch_12
    invoke-direct {p0, p1, p2, p3}, Lch/qos/logback/core/rolling/helper/Compressor;->zipCompress(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d

    :pswitch_16
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "compress method called in NONE compression mode"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_e
        :pswitch_12
        :pswitch_16
    .end packed-switch
.end method

.method computeZipEntry(Ljava/io/File;)Ljava/util/zip/ZipEntry;
    .registers 3

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->computeZipEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v0

    return-object v0
.end method

.method computeZipEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/rolling/helper/Compressor;->compressionMode:Lch/qos/logback/core/rolling/helper/CompressionMode;

    invoke-static {p1, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->computeFileNameStr_WCS(Ljava/lang/String;Lch/qos/logback/core/rolling/helper/CompressionMode;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/zip/ZipEntry;

    invoke-direct {v1, v0}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    return-object v1
.end method

.method createMissingTargetDirsIfNecessary(Ljava/io/File;)V
    .registers 4

    invoke-static {p1}, Lch/qos/logback/core/util/FileUtil;->isParentDirectoryCreationRequired(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_2c

    invoke-static {p1}, Lch/qos/logback/core/util/FileUtil;->createMissingParentDirectories(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_2d

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to create parent directories for ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addError(Ljava/lang/String;)V

    :cond_2c
    :goto_2c
    return-void

    :cond_2d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Created missing parent directories for ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/rolling/helper/Compressor;->addInfo(Ljava/lang/String;)V

    goto :goto_2c
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
