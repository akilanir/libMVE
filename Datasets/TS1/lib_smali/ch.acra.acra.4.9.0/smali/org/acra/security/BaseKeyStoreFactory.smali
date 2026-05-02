.class public abstract Lorg/acra/security/BaseKeyStoreFactory;
.super Ljava/lang/Object;
.source "BaseKeyStoreFactory.java"

# interfaces
.implements Lorg/acra/security/KeyStoreFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/security/BaseKeyStoreFactory$Type;
    }
.end annotation


# instance fields
.field private final certificateType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 58
    const-string v0, "X.509"

    invoke-direct {p0, v0}, Lorg/acra/security/BaseKeyStoreFactory;-><init>(Ljava/lang/String;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "certificateType"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lorg/acra/security/BaseKeyStoreFactory;->certificateType:Ljava/lang/String;

    .line 68
    return-void
.end method


# virtual methods
.method public final create(Landroid/content/Context;)Ljava/security/KeyStore;
    .registers 12
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 87
    invoke-virtual {p0, p1}, Lorg/acra/security/BaseKeyStoreFactory;->getInputStream(Landroid/content/Context;)Ljava/io/InputStream;

    move-result-object v4

    .line 88
    .local v4, "inputStream":Ljava/io/InputStream;
    if-eqz v4, :cond_49

    .line 89
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 91
    .local v0, "bufferedInputStream":Ljava/io/BufferedInputStream;
    :try_start_c
    invoke-virtual {p0}, Lorg/acra/security/BaseKeyStoreFactory;->getKeyStoreType()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v5

    .line 92
    .local v5, "keyStore":Ljava/security/KeyStore;
    sget-object v7, Lorg/acra/security/BaseKeyStoreFactory$1;->$SwitchMap$org$acra$security$BaseKeyStoreFactory$Type:[I

    invoke-virtual {p0}, Lorg/acra/security/BaseKeyStoreFactory;->getStreamType()Lorg/acra/security/BaseKeyStoreFactory$Type;

    move-result-object v8

    invoke-virtual {v8}, Lorg/acra/security/BaseKeyStoreFactory$Type;->ordinal()I

    move-result v8

    aget v7, v7, v8
    :try_end_20
    .catch Ljava/security/cert/CertificateException; {:try_start_c .. :try_end_20} :catch_3c
    .catch Ljava/security/KeyStoreException; {:try_start_c .. :try_end_20} :catch_53
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_c .. :try_end_20} :catch_61
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_20} :catch_6f
    .catchall {:try_start_c .. :try_end_20} :catchall_7d

    packed-switch v7, :pswitch_data_82

    .line 112
    :goto_23
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    .line 115
    .end local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .end local v5    # "keyStore":Ljava/security/KeyStore;
    :goto_26
    return-object v5

    .line 94
    .restart local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v5    # "keyStore":Ljava/security/KeyStore;
    :pswitch_27
    :try_start_27
    iget-object v7, p0, Lorg/acra/security/BaseKeyStoreFactory;->certificateType:Ljava/lang/String;

    invoke-static {v7}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v2

    .line 95
    .local v2, "certificateFactory":Ljava/security/cert/CertificateFactory;
    invoke-virtual {v2, v0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v1

    .line 96
    .local v1, "certificate":Ljava/security/cert/Certificate;
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 97
    const-string v7, "ca"

    invoke-virtual {v5, v7, v1}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V
    :try_end_3b
    .catch Ljava/security/cert/CertificateException; {:try_start_27 .. :try_end_3b} :catch_3c
    .catch Ljava/security/KeyStoreException; {:try_start_27 .. :try_end_3b} :catch_53
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_27 .. :try_end_3b} :catch_61
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_3b} :catch_6f
    .catchall {:try_start_27 .. :try_end_3b} :catchall_7d

    goto :goto_23

    .line 103
    .end local v1    # "certificate":Ljava/security/cert/Certificate;
    .end local v2    # "certificateFactory":Ljava/security/cert/CertificateFactory;
    .end local v5    # "keyStore":Ljava/security/KeyStore;
    :catch_3c
    move-exception v3

    .line 104
    .local v3, "e":Ljava/security/cert/CertificateException;
    :try_start_3d
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Could not load certificate"

    invoke-interface {v7, v8, v9, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_46
    .catchall {:try_start_3d .. :try_end_46} :catchall_7d

    .line 112
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    .end local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .end local v3    # "e":Ljava/security/cert/CertificateException;
    :cond_49
    :goto_49
    move-object v5, v6

    .line 115
    goto :goto_26

    .line 100
    .restart local v0    # "bufferedInputStream":Ljava/io/BufferedInputStream;
    .restart local v5    # "keyStore":Ljava/security/KeyStore;
    :pswitch_4b
    :try_start_4b
    invoke-virtual {p0}, Lorg/acra/security/BaseKeyStoreFactory;->getPassword()[C

    move-result-object v7

    invoke-virtual {v5, v0, v7}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V
    :try_end_52
    .catch Ljava/security/cert/CertificateException; {:try_start_4b .. :try_end_52} :catch_3c
    .catch Ljava/security/KeyStoreException; {:try_start_4b .. :try_end_52} :catch_53
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4b .. :try_end_52} :catch_61
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_52} :catch_6f
    .catchall {:try_start_4b .. :try_end_52} :catchall_7d

    goto :goto_23

    .line 105
    .end local v5    # "keyStore":Ljava/security/KeyStore;
    :catch_53
    move-exception v3

    .line 106
    .local v3, "e":Ljava/security/KeyStoreException;
    :try_start_54
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Could not load keystore"

    invoke-interface {v7, v8, v9, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5d
    .catchall {:try_start_54 .. :try_end_5d} :catchall_7d

    .line 112
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    goto :goto_49

    .line 107
    .end local v3    # "e":Ljava/security/KeyStoreException;
    :catch_61
    move-exception v3

    .line 108
    .local v3, "e":Ljava/security/NoSuchAlgorithmException;
    :try_start_62
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Could not load keystore"

    invoke-interface {v7, v8, v9, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6b
    .catchall {:try_start_62 .. :try_end_6b} :catchall_7d

    .line 112
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    goto :goto_49

    .line 109
    .end local v3    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_6f
    move-exception v3

    .line 110
    .local v3, "e":Ljava/io/IOException;
    :try_start_70
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Could not load keystore"

    invoke-interface {v7, v8, v9, v3}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_79
    .catchall {:try_start_70 .. :try_end_79} :catchall_7d

    .line 112
    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    goto :goto_49

    .end local v3    # "e":Ljava/io/IOException;
    :catchall_7d
    move-exception v6

    invoke-static {v0}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v6

    .line 92
    :pswitch_data_82
    .packed-switch 0x1
        :pswitch_27
        :pswitch_4b
    .end packed-switch
.end method

.method protected abstract getInputStream(Landroid/content/Context;)Ljava/io/InputStream;
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method protected getKeyStoreType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPassword()[C
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method protected getStreamType()Lorg/acra/security/BaseKeyStoreFactory$Type;
    .registers 2

    .prologue
    .line 77
    sget-object v0, Lorg/acra/security/BaseKeyStoreFactory$Type;->CERTIFICATE:Lorg/acra/security/BaseKeyStoreFactory$Type;

    return-object v0
.end method
