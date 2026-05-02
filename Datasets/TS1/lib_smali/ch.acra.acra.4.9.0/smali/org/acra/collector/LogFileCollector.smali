.class Lorg/acra/collector/LogFileCollector;
.super Ljava/lang/Object;
.source "LogFileCollector.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "fileName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 60
    :try_start_0
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 62
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 73
    :goto_d
    return-object v1

    .line 63
    :cond_e
    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_25

    .line 65
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .local v1, "inputStream":Ljava/io/FileInputStream;
    goto :goto_d

    .line 68
    .end local v1    # "inputStream":Ljava/io/FileInputStream;
    :cond_25
    invoke-virtual {p0, p1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;
    :try_end_28
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_28} :catch_2a

    move-result-object v1

    .restart local v1    # "inputStream":Ljava/io/FileInputStream;
    goto :goto_d

    .line 71
    .end local v1    # "inputStream":Ljava/io/FileInputStream;
    :catch_2a
    move-exception v0

    .line 72
    .local v0, "e":Ljava/io/FileNotFoundException;
    sget-object v2, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v3, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Cannot find application log file : \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x27

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    new-instance v1, Ljava/io/ByteArrayInputStream;

    const/4 v2, 0x0

    new-array v2, v2, [B

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_d
.end method


# virtual methods
.method public collectLogFile(Landroid/content/Context;Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "fileName"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "numberOfLines"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 53
    invoke-static {p1, p2}, Lorg/acra/collector/LogFileCollector;->getStream(Landroid/content/Context;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, p3}, Lorg/acra/util/IOUtils;->streamToString(Ljava/io/InputStream;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
