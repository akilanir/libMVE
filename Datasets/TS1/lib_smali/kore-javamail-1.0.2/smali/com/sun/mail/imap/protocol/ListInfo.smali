.class public Lcom/sun/mail/imap/protocol/ListInfo;
.super Ljava/lang/Object;
.source "ListInfo.java"


# static fields
.field public static final CHANGED:I = 0x1

.field public static final INDETERMINATE:I = 0x3

.field public static final UNCHANGED:I = 0x2


# instance fields
.field public attrs:[Ljava/lang/String;

.field public canOpen:Z

.field public changeState:I

.field public hasInferiors:Z

.field public name:Ljava/lang/String;

.field public separator:C


# direct methods
.method public constructor <init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V
    .registers 10
    .param p1, "r"    # Lcom/sun/mail/imap/protocol/IMAPResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    .line 57
    const/16 v3, 0x2f

    iput-char v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    .line 58
    iput-boolean v5, p0, Lcom/sun/mail/imap/protocol/ListInfo;->hasInferiors:Z

    .line 59
    iput-boolean v5, p0, Lcom/sun/mail/imap/protocol/ListInfo;->canOpen:Z

    .line 60
    const/4 v3, 0x3

    iput v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->changeState:I

    .line 68
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readSimpleList()[Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "s":[Ljava/lang/String;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .local v2, "v":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v1, :cond_5e

    .line 73
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    array-length v3, v1

    if-ge v0, v3, :cond_5e

    .line 74
    aget-object v3, v1, v0

    const-string v4, "\\Marked"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_37

    .line 75
    iput v5, p0, Lcom/sun/mail/imap/protocol/ListInfo;->changeState:I

    .line 82
    :cond_2f
    :goto_2f
    aget-object v3, v1, v0

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 76
    :cond_37
    aget-object v3, v1, v0

    const-string v4, "\\Unmarked"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_44

    .line 77
    iput v7, p0, Lcom/sun/mail/imap/protocol/ListInfo;->changeState:I

    goto :goto_2f

    .line 78
    :cond_44
    aget-object v3, v1, v0

    const-string v4, "\\Noselect"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_51

    .line 79
    iput-boolean v6, p0, Lcom/sun/mail/imap/protocol/ListInfo;->canOpen:Z

    goto :goto_2f

    .line 80
    :cond_51
    aget-object v3, v1, v0

    const-string v4, "\\Noinferiors"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2f

    .line 81
    iput-boolean v6, p0, Lcom/sun/mail/imap/protocol/ListInfo;->hasInferiors:Z

    goto :goto_2f

    .line 85
    .end local v0    # "i":I
    :cond_5e
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    iput-object v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->attrs:[Ljava/lang/String;

    .line 87
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skipSpaces()V

    .line 88
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readByte()B

    move-result v3

    const/16 v4, 0x22

    if-ne v3, v4, :cond_9e

    .line 89
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readByte()B

    move-result v3

    int-to-char v3, v3

    iput-char v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_89

    .line 91
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readByte()B

    move-result v3

    int-to-char v3, v3

    iput-char v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->separator:C

    .line 92
    :cond_89
    invoke-virtual {p1, v5}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skip(I)V

    .line 96
    :goto_8c
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skipSpaces()V

    .line 97
    invoke-virtual {p1}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtomString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    .line 100
    iget-object v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    invoke-static {v3}, Lcom/sun/mail/imap/protocol/BASE64MailboxDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/sun/mail/imap/protocol/ListInfo;->name:Ljava/lang/String;

    .line 101
    return-void

    .line 94
    :cond_9e
    invoke-virtual {p1, v7}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skip(I)V

    goto :goto_8c
.end method
