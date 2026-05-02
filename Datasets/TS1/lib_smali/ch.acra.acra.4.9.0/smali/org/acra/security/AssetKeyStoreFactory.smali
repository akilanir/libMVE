.class final Lorg/acra/security/AssetKeyStoreFactory;
.super Lorg/acra/security/BaseKeyStoreFactory;
.source "AssetKeyStoreFactory.java"


# instance fields
.field private final assetName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "certificateType"    # Ljava/lang/String;
    .param p2, "assetName"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/acra/security/BaseKeyStoreFactory;-><init>(Ljava/lang/String;)V

    .line 45
    iput-object p2, p0, Lorg/acra/security/AssetKeyStoreFactory;->assetName:Ljava/lang/String;

    .line 46
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
    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    iget-object v2, p0, Lorg/acra/security/AssetKeyStoreFactory;->assetName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 55
    :goto_a
    return-object v1

    .line 52
    :catch_b
    move-exception v0

    .line 53
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v2, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not open certificate in asset://"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/acra/security/AssetKeyStoreFactory;->assetName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 55
    const/4 v1, 0x0

    goto :goto_a
.end method
