.class public Lcom/sun/mail/imap/protocol/IMAPResponse;
.super Lcom/sun/mail/iap/Response;
.source "IMAPResponse.java"


# instance fields
.field private key:Ljava/lang/String;

.field private number:I


# direct methods
.method public constructor <init>(Lcom/sun/mail/iap/Protocol;)V
    .registers 2
    .param p1, "c"    # Lcom/sun/mail/iap/Protocol;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0, p1}, Lcom/sun/mail/iap/Response;-><init>(Lcom/sun/mail/iap/Protocol;)V

    .line 61
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->init()V

    .line 62
    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/IMAPResponse;

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/sun/mail/iap/Response;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 82
    iget-object v0, p1, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    .line 83
    iget v0, p1, Lcom/sun/mail/imap/protocol/IMAPResponse;->number:I

    iput v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->number:I

    .line 84
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "r"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 90
    invoke-direct {p0, p1}, Lcom/sun/mail/iap/Response;-><init>(Ljava/lang/String;)V

    .line 91
    invoke-direct {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->init()V

    .line 92
    return-void
.end method

.method private init()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isUnTagged()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isOK()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isNO()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isBAD()Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isBYE()Z

    move-result v0

    if-nez v0, :cond_32

    .line 67
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtom()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    .line 71
    :try_start_24
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->number:I

    .line 72
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtom()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;
    :try_end_32
    .catch Ljava/lang/NumberFormatException; {:try_start_24 .. :try_end_32} :catch_33

    .line 75
    :cond_32
    :goto_32
    return-void

    .line 73
    :catch_33
    move-exception v0

    goto :goto_32
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getNumber()I
    .registers 2

    .prologue
    .line 138
    iget v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->number:I

    return v0
.end method

.method public keyEquals(Ljava/lang/String;)Z
    .registers 3
    .param p1, "k"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->key:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 132
    const/4 v0, 0x1

    .line 134
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public readSimpleList()[Ljava/lang/String;
    .registers 7

    .prologue
    const/4 v3, 0x0

    .line 101
    invoke-virtual {p0}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skipSpaces()V

    .line 103
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->buffer:[B

    iget v5, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    aget-byte v4, v4, v5

    const/16 v5, 0x28

    if-eq v4, v5, :cond_f

    .line 123
    :cond_e
    :goto_e
    return-object v3

    .line 105
    :cond_f
    iget v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    .line 107
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v2, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget v1, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    .local v1, "start":I
    :goto_1c
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->buffer:[B

    iget v5, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    aget-byte v4, v4, v5

    const/16 v5, 0x29

    if-eq v4, v5, :cond_46

    .line 110
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->buffer:[B

    iget v5, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    aget-byte v4, v4, v5

    const/16 v5, 0x20

    if-ne v4, v5, :cond_3f

    .line 111
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->buffer:[B

    iget v5, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    invoke-static {v4, v1, v5}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    iget v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    add-int/lit8 v1, v4, 0x1

    .line 109
    :cond_3f
    iget v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    goto :goto_1c

    .line 115
    :cond_46
    iget v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    if-le v4, v1, :cond_55

    .line 116
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->buffer:[B

    iget v5, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    invoke-static {v4, v1, v5}, Lcom/sun/mail/util/ASCIIUtility;->toString([BII)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    :cond_55
    iget v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/sun/mail/imap/protocol/IMAPResponse;->index:I

    .line 119
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v0

    .line 120
    .local v0, "size":I
    if-lez v0, :cond_e

    .line 121
    new-array v3, v0, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    goto :goto_e
.end method
