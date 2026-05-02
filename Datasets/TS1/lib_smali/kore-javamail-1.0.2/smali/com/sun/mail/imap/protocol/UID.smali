.class public Lcom/sun/mail/imap/protocol/UID;
.super Ljava/lang/Object;
.source "UID.java"

# interfaces
.implements Lcom/sun/mail/imap/protocol/Item;


# static fields
.field static final name:[C


# instance fields
.field public seqnum:I

.field public uid:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 53
    const/4 v0, 0x3

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lcom/sun/mail/imap/protocol/UID;->name:[C

    return-void

    nop

    :array_a
    .array-data 2
        0x55s
        0x49s
        0x44s
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
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->getNumber()I

    move-result v0

    iput v0, p0, Lcom/sun/mail/imap/protocol/UID;->seqnum:I

    .line 63
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->skipSpaces()V

    .line 64
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/FetchResponse;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sun/mail/imap/protocol/UID;->uid:J

    .line 65
    return-void
.end method
