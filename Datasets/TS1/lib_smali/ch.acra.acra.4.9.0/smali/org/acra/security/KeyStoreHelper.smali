.class public final Lorg/acra/security/KeyStoreHelper;
.super Ljava/lang/Object;
.source "KeyStoreHelper.java"


# static fields
.field private static final ASSET_PREFIX:Ljava/lang/String; = "asset://"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    return-void
.end method

.method public static getKeyStore(Landroid/content/Context;Lorg/acra/config/ACRAConfiguration;)Ljava/security/KeyStore;
    .registers 11
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "config"    # Lorg/acra/config/ACRAConfiguration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->keyStoreFactoryClass()Ljava/lang/Class;

    move-result-object v5

    .line 51
    .local v5, "keyStoreFactory":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/acra/security/KeyStoreFactory;>;"
    const/4 v4, 0x0

    .line 53
    .local v4, "keyStore":Ljava/security/KeyStore;
    :try_start_5
    invoke-virtual {v5}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/acra/security/KeyStoreFactory;

    invoke-interface {v6, p0}, Lorg/acra/security/KeyStoreFactory;->create(Landroid/content/Context;)Ljava/security/KeyStore;
    :try_end_e
    .catch Ljava/lang/InstantiationException; {:try_start_5 .. :try_end_e} :catch_29
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_e} :catch_34

    move-result-object v4

    .line 59
    :goto_f
    if-nez v4, :cond_28

    .line 61
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->resCertificate()I

    move-result v1

    .line 62
    .local v1, "certificateRes":I
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->certificatePath()Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "certificatePath":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/acra/config/ACRAConfiguration;->certificateType()Ljava/lang/String;

    move-result-object v2

    .line 64
    .local v2, "certificateType":Ljava/lang/String;
    if-eqz v1, :cond_3f

    .line 65
    new-instance v6, Lorg/acra/security/ResourceKeyStoreFactory;

    invoke-direct {v6, v2, v1}, Lorg/acra/security/ResourceKeyStoreFactory;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v6, p0}, Lorg/acra/security/ResourceKeyStoreFactory;->create(Landroid/content/Context;)Ljava/security/KeyStore;

    move-result-object v4

    .line 74
    .end local v0    # "certificatePath":Ljava/lang/String;
    .end local v1    # "certificateRes":I
    .end local v2    # "certificateType":Ljava/lang/String;
    :cond_28
    :goto_28
    return-object v4

    .line 54
    :catch_29
    move-exception v3

    .line 55
    .local v3, "e":Ljava/lang/InstantiationException;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Could not get keystore from factory"

    invoke-interface {v6, v7, v8, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f

    .line 56
    .end local v3    # "e":Ljava/lang/InstantiationException;
    :catch_34
    move-exception v3

    .line 57
    .local v3, "e":Ljava/lang/IllegalAccessException;
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Could not get keystore from factory"

    invoke-interface {v6, v7, v8, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f

    .line 66
    .end local v3    # "e":Ljava/lang/IllegalAccessException;
    .restart local v0    # "certificatePath":Ljava/lang/String;
    .restart local v1    # "certificateRes":I
    .restart local v2    # "certificateType":Ljava/lang/String;
    :cond_3f
    const-string v6, ""

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_28

    .line 67
    const-string v6, "asset://"

    invoke-virtual {v0, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_63

    .line 68
    new-instance v6, Lorg/acra/security/AssetKeyStoreFactory;

    const-string v7, "asset://"

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v0, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v2, v7}, Lorg/acra/security/AssetKeyStoreFactory;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Lorg/acra/security/AssetKeyStoreFactory;->create(Landroid/content/Context;)Ljava/security/KeyStore;

    move-result-object v4

    goto :goto_28

    .line 70
    :cond_63
    new-instance v6, Lorg/acra/security/FileKeyStoreFactory;

    invoke-direct {v6, v2, v0}, Lorg/acra/security/FileKeyStoreFactory;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Lorg/acra/security/FileKeyStoreFactory;->create(Landroid/content/Context;)Ljava/security/KeyStore;

    move-result-object v4

    goto :goto_28
.end method
