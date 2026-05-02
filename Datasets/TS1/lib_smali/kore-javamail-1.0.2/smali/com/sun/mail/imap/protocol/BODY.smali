.class public Lcom/sun/mail/imap/protocol/BODY;
.super Ljava/lang/Object;
.source "BODY.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field static final name:[C


# instance fields
.field private final data:Lcom/sun/mail/iap/ByteArray;

.field private final isHeader:Z

.field private final msgno:I

.field private final origin:I

.field private final section:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/BODY;->name:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x42s
        0x4fs
        0x44s
        0x59s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 8
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x5d

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/BODY;->msgno:I

    .line 70
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 72
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    const/16 v3, 0x5b

    if-eq v0, v3, :cond_20

    .line 73
    new-instance v0, Lcom/sun/mail/iap/ParsingException;

    const-string v1, "BODY parse error: missing ``[\'\' at section start"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_20
    invoke-virtual {p1, v4}, Lcom/sun/mail/imap/protocol/FetchResponse;->readString(C)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->section:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    if-eq v0, v4, :cond_34

    .line 77
    new-instance v0, Lcom/sun/mail/iap/ParsingException;

    const-string v1, "BODY parse error: missing ``]\'\' at section end"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_34
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->section:Ljava/lang/String;

    const-string v3, "HEADER"

    const/4 v5, 0x6

    move v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sun/mail/imap/protocol/BODY;->isHeader:Z

    .line 81
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    const/16 v3, 0x3c

    if-ne v0, v3, :cond_58

    .line 82
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readNumber()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/BODY;->origin:I

    .line 83
    invoke-virtual {p1, v1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skip(I)V

    .line 87
    :goto_51
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByteArray()Lcom/sun/mail/iap/ByteArray;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->data:Lcom/sun/mail/iap/ByteArray;

    .line 88
    return-void

    .line 85
    :cond_58
    iput v2, p0, Lcom/sun/mail/imap/protocol/BODY;->origin:I

    goto :goto_51
.end method


# virtual methods
.method public getByteArray()Lcom/sun/mail/iap/ByteArray;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->data:Lcom/sun/mail/iap/ByteArray;

    return-object v0
.end method

.method public getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->data:Lcom/sun/mail/iap/ByteArray;

    if-eqz v0, :cond_b

    .line 96
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->data:Lcom/sun/mail/iap/ByteArray;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ByteArray;->toByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v0

    .line 98
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getSection()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/BODY;->section:Ljava/lang/String;

    return-object v0
.end method

.method public isHeader()Z
    .registers 2

    .prologue
    .line 102
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/BODY;->isHeader:Z

    return v0
.end method
