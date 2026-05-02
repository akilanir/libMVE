.class public Lch/qos/logback/core/util/FileUtil;
.super Lch/qos/logback/core/spi/ContextAwareBase;


# static fields
.field static final BUF_SIZE:I = 0x8000


# direct methods
.method public constructor <init>(Lch/qos/logback/core/Context;)V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    invoke-virtual {p0, p1}, Lch/qos/logback/core/util/FileUtil;->setContext(Lch/qos/logback/core/Context;)V

    return-void
.end method

.method public static createMissingParentDirectories(Ljava/io/File;)Z
    .registers 4

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " should not have a null parent"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3e

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " should not have existing parent directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3e
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    return v0
.end method

.method public static fileToURL(Ljava/io/File;)Ljava/net/URL;
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->toURI()Ljava/net/URI;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/URI;->toURL()Ljava/net/URL;
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v0

    return-object v0

    :catch_9
    move-exception v0

    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected exception on file ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static isParentDirectoryCreationRequired(Ljava/io/File;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public static prefixRelativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-eqz p0, :cond_2e

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lch/qos/logback/core/util/OptionHelper;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2e

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v0

    if-nez v0, :cond_2e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_2e
    return-object p1
.end method


# virtual methods
.method public copy(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lch/qos/logback/core/rolling/RolloverFailure;
        }
    .end annotation

    const/4 v2, 0x0

    :try_start_1
    new-instance v3, Ljava/io/BufferedInputStream;

    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_b} :catch_85
    .catchall {:try_start_1 .. :try_end_b} :catchall_7b

    :try_start_b
    new-instance v1, Ljava/io/BufferedOutputStream;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_15} :catch_88
    .catchall {:try_start_b .. :try_end_15} :catchall_7e

    const v0, 0x8000

    :try_start_18
    new-array v0, v0, [B

    :goto_1a
    invoke-virtual {v3, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_60

    const/4 v5, 0x0

    invoke-virtual {v1, v0, v5, v4}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_18 .. :try_end_25} :catch_26
    .catchall {:try_start_18 .. :try_end_25} :catchall_82

    goto :goto_1a

    :catch_26
    move-exception v0

    move-object v2, v3

    :goto_28
    :try_start_28
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to copy ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "] to ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v0}, Lch/qos/logback/core/util/FileUtil;->addError(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v0, Lch/qos/logback/core/rolling/RolloverFailure;

    invoke-direct {v0, v3}, Lch/qos/logback/core/rolling/RolloverFailure;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_54
    .catchall {:try_start_28 .. :try_end_54} :catchall_54

    :catchall_54
    move-exception v0

    :goto_55
    if-eqz v2, :cond_5a

    :try_start_57
    invoke-virtual {v2}, Ljava/io/BufferedInputStream;->close()V
    :try_end_5a
    .catch Ljava/io/IOException; {:try_start_57 .. :try_end_5a} :catch_77

    :cond_5a
    :goto_5a
    if-eqz v1, :cond_5f

    :try_start_5c
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_79

    :cond_5f
    :goto_5f
    throw v0

    :cond_60
    :try_start_60
    invoke-virtual {v3}, Ljava/io/BufferedInputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_26
    .catchall {:try_start_60 .. :try_end_63} :catchall_82

    const/4 v0, 0x0

    :try_start_64
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_8c
    .catchall {:try_start_64 .. :try_end_67} :catchall_54

    const/4 v1, 0x0

    if-eqz v2, :cond_6d

    :try_start_6a
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_6d
    .catch Ljava/io/IOException; {:try_start_6a .. :try_end_6d} :catch_73

    :cond_6d
    :goto_6d
    if-eqz v2, :cond_72

    :try_start_6f
    invoke-virtual {v1}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_72
    .catch Ljava/io/IOException; {:try_start_6f .. :try_end_72} :catch_75

    :cond_72
    :goto_72
    return-void

    :catch_73
    move-exception v0

    goto :goto_6d

    :catch_75
    move-exception v0

    goto :goto_72

    :catch_77
    move-exception v2

    goto :goto_5a

    :catch_79
    move-exception v1

    goto :goto_5f

    :catchall_7b
    move-exception v0

    move-object v1, v2

    goto :goto_55

    :catchall_7e
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto :goto_55

    :catchall_82
    move-exception v0

    move-object v2, v3

    goto :goto_55

    :catch_85
    move-exception v0

    move-object v1, v2

    goto :goto_28

    :catch_88
    move-exception v0

    move-object v1, v2

    move-object v2, v3

    goto :goto_28

    :catch_8c
    move-exception v0

    goto :goto_28
.end method
