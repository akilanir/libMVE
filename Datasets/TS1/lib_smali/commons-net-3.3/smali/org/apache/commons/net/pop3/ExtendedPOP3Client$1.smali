.class synthetic Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;
.super Ljava/lang/Object;
.source "ExtendedPOP3Client.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/net/pop3/ExtendedPOP3Client;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 75
    invoke-static {}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->values()[Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;->$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I

    :try_start_9
    sget-object v0, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;->$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I

    sget-object v1, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->PLAIN:Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    invoke-virtual {v1}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_22

    :goto_14
    :try_start_14
    sget-object v0, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$1;->$SwitchMap$org$apache$commons$net$pop3$ExtendedPOP3Client$AUTH_METHOD:[I

    sget-object v1, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->CRAM_MD5:Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;

    invoke-virtual {v1}, Lorg/apache/commons/net/pop3/ExtendedPOP3Client$AUTH_METHOD;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_20

    :goto_1f
    return-void

    :catch_20
    move-exception v0

    goto :goto_1f

    :catch_22
    move-exception v0

    goto :goto_14
.end method
