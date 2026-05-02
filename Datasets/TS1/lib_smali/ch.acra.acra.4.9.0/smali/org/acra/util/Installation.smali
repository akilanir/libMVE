.class public final Lorg/acra/util/Installation;
.super Ljava/lang/Object;
.source "Installation.java"


# static fields
.field private static final INSTALLATION:Ljava/lang/String; = "ACRA-INSTALLATION"

.field private static sID:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized id(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 39
    const-class v3, Lorg/acra/util/Installation;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lorg/acra/util/Installation;->sID:Ljava/lang/String;

    if-nez v2, :cond_21

    .line 40
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v4, "ACRA-INSTALLATION"

    invoke-direct {v1, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_69

    .line 42
    .local v1, "installation":Ljava/io/File;
    :try_start_12
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1b

    .line 43
    invoke-static {v1}, Lorg/acra/util/Installation;->writeInstallationFile(Ljava/io/File;)V

    .line 45
    :cond_1b
    invoke-static {v1}, Lorg/acra/util/Installation;->readInstallationFile(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lorg/acra/util/Installation;->sID:Ljava/lang/String;
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_21} :catch_25
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_21} :catch_47
    .catchall {:try_start_12 .. :try_end_21} :catchall_69

    .line 54
    .end local v1    # "installation":Ljava/io/File;
    :cond_21
    :try_start_21
    sget-object v2, Lorg/acra/util/Installation;->sID:Ljava/lang/String;
    :try_end_23
    .catchall {:try_start_21 .. :try_end_23} :catchall_69

    :goto_23
    monitor-exit v3

    return-object v2

    .line 46
    .restart local v1    # "installation":Ljava/io/File;
    :catch_25
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    :try_start_26
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t retrieve InstallationId for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 48
    const-string v2, "Couldn\'t retrieve InstallationId"

    goto :goto_23

    .line 49
    .end local v0    # "e":Ljava/io/IOException;
    :catch_47
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t retrieve InstallationId for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v4, v5, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 51
    const-string v2, "Couldn\'t retrieve InstallationId"
    :try_end_68
    .catchall {:try_start_26 .. :try_end_68} :catchall_69

    goto :goto_23

    .line 39
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v1    # "installation":Ljava/io/File;
    :catchall_69
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method private static readInstallationFile(Ljava/io/File;)Ljava/lang/String;
    .registers 5
    .param p0, "installation"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p0, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 60
    .local v1, "f":Ljava/io/RandomAccessFile;
    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    long-to-int v2, v2

    new-array v0, v2, [B

    .line 62
    .local v0, "bytes":[B
    :try_start_e
    invoke-virtual {v1, v0}, Ljava/io/RandomAccessFile;->readFully([B)V
    :try_end_11
    .catchall {:try_start_e .. :try_end_11} :catchall_1a

    .line 64
    invoke-static {v1}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    .line 66
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    return-object v2

    .line 64
    :catchall_1a
    move-exception v2

    invoke-static {v1}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v2
.end method

.method private static writeInstallationFile(Ljava/io/File;)V
    .registers 4
    .param p0, "installation"    # Ljava/io/File;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 70
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 72
    .local v1, "out":Ljava/io/FileOutputStream;
    :try_start_5
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 73
    .local v0, "id":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_14
    .catchall {:try_start_5 .. :try_end_14} :catchall_18

    .line 75
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 77
    return-void

    .line 75
    .end local v0    # "id":Ljava/lang/String;
    :catchall_18
    move-exception v2

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v2
.end method
