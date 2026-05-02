.class public Lcom/sun/mail/imap/protocol/RFC822DATA;
.super Ljava/lang/Object;
.source "RFC822DATA.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field static final name:[C


# instance fields
.field private final data:Lcom/sun/mail/iap/ByteArray;

.field private final isHeader:Z

.field private final msgno:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 56
    const/4 v0, 0x6

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/RFC822DATA;->name:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x52s
        0x46s
        0x43s
        0x38s
        0x32s
        0x32s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sun/mail/imap/protocol/RFC822DATA;-><init>(Lcom/sun/mail/imap/protocol/FetchResponse;Z)V

    .line 66
    return-void
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;Z)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .param p2, "isHeader"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-boolean p2, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->isHeader:Z

    .line 74
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->msgno:I

    .line 75
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 76
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByteArray()Lcom/sun/mail/iap/ByteArray;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->data:Lcom/sun/mail/iap/ByteArray;

    .line 77
    return-void
.end method


# virtual methods
.method public getByteArray()Lcom/sun/mail/iap/ByteArray;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->data:Lcom/sun/mail/iap/ByteArray;

    return-object v0
.end method

.method public getByteArrayInputStream()Ljava/io/ByteArrayInputStream;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->data:Lcom/sun/mail/iap/ByteArray;

    if-eqz v0, :cond_b

    .line 85
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->data:Lcom/sun/mail/iap/ByteArray;

    invoke-virtual {v0}, Lcom/sun/mail/iap/ByteArray;->toByteArrayInputStream()Ljava/io/ByteArrayInputStream;

    move-result-object v0

    .line 87
    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public isHeader()Z
    .registers 2

    .prologue
    .line 91
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/RFC822DATA;->isHeader:Z

    return v0
.end method
