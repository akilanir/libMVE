.class final Lorg/acra/security/FileKeyStoreFactory;
.super Lorg/acra/security/BaseKeyStoreFactory;
.source "FileKeyStoreFactory.java"


# instance fields
.field private final filePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "certificateType"    # Ljava/lang/String;
    .param p2, "filePath"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/acra/security/BaseKeyStoreFactory;-><init>(Ljava/lang/String;)V

    .line 46
    iput-object p2, p0, Lorg/acra/security/FileKeyStoreFactory;->filePath:Ljava/lang/String;

    .line 47
    return-void
.end method


# virtual methods
.method public getInputStream(Landroid/content/Context;)Ljava/io/InputStream;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 52
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/acra/security/FileKeyStoreFactory;->filePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_7} :catch_8

    .line 56
    :goto_7
    return-object v1

    .line 53
    :catch_8
    move-exception v0

    .line 54
    .local v0, "e":Ljava/io/FileNotFoundException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not find File "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/security/FileKeyStoreFactory;->filePath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 56
    const/4 v1, 0x0

    goto :goto_7
.end method
