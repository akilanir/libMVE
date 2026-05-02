.class public Lcom/sun/mail/imap/protocol/MODSEQ;
.super Ljava/lang/Object;
.source "MODSEQ.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field static final name:[C


# instance fields
.field public modseq:J

.field public seqnum:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const/4 v0, 0x6

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/MODSEQ;->name:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x4ds
        0x4fs
        0x44s
        0x53s
        0x45s
        0x51s
    .end array-data
.end method

.method public constructor <init>(Lcom/sun/mail/imap/protocol/FetchResponse;)V
    .registers 4
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/FetchResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/MODSEQ;->seqnum:I

    .line 64
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 66
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    const/16 v1, 0x28

    if-eq v0, v1, :cond_1c

    .line 67
    new-instance v0, Lcom/sun/mail/iap/ParsingException;

    const-string v1, "MODSEQ parse error"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_1c
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/imap/protocol/MODSEQ;->modseq:J

    .line 71
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readByte()B

    move-result v0

    const/16 v1, 0x29

    if-eq v0, v1, :cond_32

    .line 72
    new-instance v0, Lcom/sun/mail/iap/ParsingException;

    const-string v1, "MODSEQ parse error"

    invoke-direct {v0, v1}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_32
    return-void
.end method
