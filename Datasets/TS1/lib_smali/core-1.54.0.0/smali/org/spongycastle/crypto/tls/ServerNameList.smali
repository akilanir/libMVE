.class public Lorg/spongycastle/crypto/tls/ServerNameList;
.super Ljava/lang/Object;
.source "ServerNameList.java"


# instance fields
.field protected serverNameList:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Ljava/util/Vector;)V
    .registers 4
    .param p1, "serverNameList"    # Ljava/util/Vector;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/util/Vector;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 21
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'serverNameList\' must not be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 24
    :cond_13
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/ServerNameList;->serverNameList:Ljava/util/Vector;

    .line 25
    return-void
.end method

.method public static parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ServerNameList;
    .registers 8
    .param p0, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readUint16(Ljava/io/InputStream;)I

    move-result v3

    .line 68
    .local v3, "length":I
    const/4 v5, 0x1

    if-ge v3, v5, :cond_f

    .line 70
    new-instance v5, Lorg/spongycastle/crypto/tls/TlsFatalAlert;

    const/16 v6, 0x32

    invoke-direct {v5, v6}, Lorg/spongycastle/crypto/tls/TlsFatalAlert;-><init>(S)V

    throw v5

    .line 73
    :cond_f
    invoke-static {v3, p0}, Lorg/spongycastle/crypto/tls/TlsUtils;->readFully(ILjava/io/InputStream;)[B

    move-result-object v1

    .line 75
    .local v1, "data":[B
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 77
    .local v0, "buf":Ljava/io/ByteArrayInputStream;
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 78
    .local v4, "server_name_list":Ljava/util/Vector;
    :goto_1d
    invoke-virtual {v0}, Ljava/io/ByteArrayInputStream;->available()I

    move-result v5

    if-lez v5, :cond_2b

    .line 80
    invoke-static {v0}, Lorg/spongycastle/crypto/tls/ServerName;->parse(Ljava/io/InputStream;)Lorg/spongycastle/crypto/tls/ServerName;

    move-result-object v2

    .line 81
    .local v2, "entry":Lorg/spongycastle/crypto/tls/ServerName;
    invoke-virtual {v4, v2}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1d

    .line 84
    .end local v2    # "entry":Lorg/spongycastle/crypto/tls/ServerName;
    :cond_2b
    new-instance v5, Lorg/spongycastle/crypto/tls/ServerNameList;

    invoke-direct {v5, v4}, Lorg/spongycastle/crypto/tls/ServerNameList;-><init>(Ljava/util/Vector;)V

    return-object v5
.end method


# virtual methods
.method public encode(Ljava/io/OutputStream;)V
    .registers 6
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 46
    .local v0, "buf":Ljava/io/ByteArrayOutputStream;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_6
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/ServerNameList;->serverNameList:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->size()I

    move-result v3

    if-ge v2, v3, :cond_1c

    .line 48
    iget-object v3, p0, Lorg/spongycastle/crypto/tls/ServerNameList;->serverNameList:Ljava/util/Vector;

    invoke-virtual {v3, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/crypto/tls/ServerName;

    .line 49
    .local v1, "entry":Lorg/spongycastle/crypto/tls/ServerName;
    invoke-virtual {v1, v0}, Lorg/spongycastle/crypto/tls/ServerName;->encode(Ljava/io/OutputStream;)V

    .line 46
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 52
    .end local v1    # "entry":Lorg/spongycastle/crypto/tls/ServerName;
    :cond_1c
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    invoke-static {v3}, Lorg/spongycastle/crypto/tls/TlsUtils;->checkUint16(I)V

    .line 53
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v3

    invoke-static {v3, p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->writeUint16(ILjava/io/OutputStream;)V

    .line 54
    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->writeTo(Ljava/io/OutputStream;)V

    .line 55
    return-void
.end method

.method public getServerNameList()Ljava/util/Vector;
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ServerNameList;->serverNameList:Ljava/util/Vector;

    return-object v0
.end method
