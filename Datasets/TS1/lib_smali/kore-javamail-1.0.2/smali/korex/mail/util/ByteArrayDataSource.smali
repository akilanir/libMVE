.class public Lkorex/mail/util/ByteArrayDataSource;
.super Ljava/lang/Object;
.source "ByteArrayDataSource.java"

# interfaces
.implements Lkorex/activation/DataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;
    }
.end annotation


# instance fields
.field private data:[B

.field private len:I

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 8
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v3, -0x1

    iput v3, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 64
    const-string v3, ""

    iput-object v3, p0, Lkorex/mail/util/ByteArrayDataSource;->name:Ljava/lang/String;

    .line 87
    new-instance v2, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;

    invoke-direct {v2}, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;-><init>()V

    .line 88
    .local v2, "os":Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;
    const/16 v3, 0x2000

    new-array v0, v3, [B

    .line 90
    .local v0, "buf":[B
    :goto_13
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "len":I
    if-lez v1, :cond_1e

    .line 91
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->write([BII)V

    goto :goto_13

    .line 92
    :cond_1e
    invoke-virtual {v2}, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->getBuf()[B

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    .line 93
    invoke-virtual {v2}, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->getCount()I

    move-result v3

    iput v3, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 102
    iget-object v3, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    array-length v3, v3

    iget v4, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    sub-int/2addr v3, v4

    const/high16 v4, 0x40000

    if-le v3, v4, :cond_3f

    .line 103
    invoke-virtual {v2}, Lkorex/mail/util/ByteArrayDataSource$DSByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    .line 104
    iget-object v3, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    array-length v3, v3

    iput v3, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 106
    :cond_3f
    iput-object p2, p0, Lkorex/mail/util/ByteArrayDataSource;->type:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v2, -0x1

    iput v2, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 64
    const-string v2, ""

    iput-object v2, p0, Lkorex/mail/util/ByteArrayDataSource;->name:Ljava/lang/String;

    .line 134
    const/4 v0, 0x0

    .line 136
    .local v0, "charset":Ljava/lang/String;
    :try_start_b
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-direct {v1, p2}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 137
    .local v1, "ct":Lkorex/mail/internet/ContentType;
    const-string v2, "charset"

    invoke-virtual {v1, v2}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;
    :try_end_15
    .catch Lkorex/mail/internet/ParseException; {:try_start_b .. :try_end_15} :catch_29

    move-result-object v0

    .line 141
    .end local v1    # "ct":Lkorex/mail/internet/ContentType;
    :goto_16
    invoke-static {v0}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 142
    if-nez v0, :cond_20

    .line 143
    invoke-static {}, Lkorex/mail/internet/MimeUtility;->getDefaultJavaCharset()Ljava/lang/String;

    move-result-object v0

    .line 145
    :cond_20
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    .line 146
    iput-object p2, p0, Lkorex/mail/util/ByteArrayDataSource;->type:Ljava/lang/String;

    .line 147
    return-void

    .line 138
    :catch_29
    move-exception v2

    goto :goto_16
.end method

.method public constructor <init>([BLjava/lang/String;)V
    .registers 4
    .param p1, "data"    # [B
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    const/4 v0, -0x1

    iput v0, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 64
    const-string v0, ""

    iput-object v0, p0, Lkorex/mail/util/ByteArrayDataSource;->name:Ljava/lang/String;

    .line 117
    iput-object p1, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    .line 118
    iput-object p2, p0, Lkorex/mail/util/ByteArrayDataSource;->type:Ljava/lang/String;

    .line 119
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lkorex/mail/util/ByteArrayDataSource;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    if-nez v0, :cond_c

    .line 159
    new-instance v0, Ljava/io/IOException;

    const-string v1, "no data"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 160
    :cond_c
    iget v0, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    if-gez v0, :cond_15

    .line 161
    iget-object v0, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    array-length v0, v0

    iput v0, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    .line 162
    :cond_15
    new-instance v0, Lkorex/mail/util/SharedByteArrayInputStream;

    iget-object v1, p0, Lkorex/mail/util/ByteArrayDataSource;->data:[B

    const/4 v2, 0x0

    iget v3, p0, Lkorex/mail/util/ByteArrayDataSource;->len:I

    invoke-direct {v0, v1, v2, v3}, Lkorex/mail/util/SharedByteArrayInputStream;-><init>([BII)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lkorex/mail/util/ByteArrayDataSource;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 173
    new-instance v0, Ljava/io/IOException;

    const-string v1, "cannot do this"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 201
    iput-object p1, p0, Lkorex/mail/util/ByteArrayDataSource;->name:Ljava/lang/String;

    .line 202
    return-void
.end method
