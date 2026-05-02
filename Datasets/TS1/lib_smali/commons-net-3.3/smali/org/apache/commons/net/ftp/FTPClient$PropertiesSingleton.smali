.class Lorg/apache/commons/net/ftp/FTPClient$PropertiesSingleton;
.super Ljava/lang/Object;
.source "FTPClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/ftp/FTPClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropertiesSingleton"
.end annotation


# static fields
.field static final PROPERTIES:Ljava/util/Properties;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 416
    const-class v2, Lorg/apache/commons/net/ftp/FTPClient;

    const-string v3, "/systemType.properties"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .line 417
    .local v1, "resourceAsStream":Ljava/io/InputStream;
    const/4 v0, 0x0

    .line 418
    .local v0, "p":Ljava/util/Properties;
    if-eqz v1, :cond_16

    .line 419
    new-instance v0, Ljava/util/Properties;

    .end local v0    # "p":Ljava/util/Properties;
    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 421
    .restart local v0    # "p":Ljava/util/Properties;
    :try_start_10
    invoke-virtual {v0, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_19
    .catchall {:try_start_10 .. :try_end_13} :catchall_20

    .line 425
    :try_start_13
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_25

    .line 431
    :cond_16
    :goto_16
    sput-object v0, Lorg/apache/commons/net/ftp/FTPClient$PropertiesSingleton;->PROPERTIES:Ljava/util/Properties;

    .line 432
    return-void

    .line 422
    :catch_19
    move-exception v2

    .line 425
    :try_start_1a
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_16

    .line 426
    :catch_1e
    move-exception v2

    goto :goto_16

    .line 424
    :catchall_20
    move-exception v2

    .line 425
    :try_start_21
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_24} :catch_27

    .line 428
    :goto_24
    throw v2

    .line 426
    :catch_25
    move-exception v2

    goto :goto_16

    :catch_27
    move-exception v3

    goto :goto_24
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
