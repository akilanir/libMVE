.class public Lcom/sun/mail/imap/protocol/MailboxInfo;
.super Ljava/lang/Object;
.source "MailboxInfo.java"


# instance fields
.field public availableFlags:Lkorex/mail/Flags;

.field public first:I

.field public highestmodseq:J

.field public mode:I

.field public permanentFlags:Lkorex/mail/Flags;

.field public recent:I

.field public responses:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/sun/mail/imap/protocol/IMAPResponse;",
            ">;"
        }
    .end annotation
.end field

.field public total:I

.field public uidnext:J

.field public uidvalidity:J


# direct methods
.method public constructor <init>([Lcom/sun/mail/iap/Response;)V
    .registers 11
    .param p1, "r"    # [Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const-wide/16 v7, -0x1

    const/4 v4, -0x1

    const/4 v6, 0x0

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object v6, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->availableFlags:Lkorex/mail/Flags;

    .line 61
    iput-object v6, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    .line 63
    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->total:I

    .line 65
    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->recent:I

    .line 67
    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->first:I

    .line 69
    iput-wide v7, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidvalidity:J

    .line 71
    iput-wide v7, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidnext:J

    .line 73
    iput-wide v7, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->highestmodseq:J

    .line 87
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_18
    array-length v4, p1

    if-ge v1, v4, :cond_10f

    .line 88
    aget-object v4, p1, v1

    if-eqz v4, :cond_25

    aget-object v4, p1, v1

    instance-of v4, v4, Lcom/sun/mail/imap/protocol/IMAPResponse;

    if-nez v4, :cond_28

    .line 87
    :cond_25
    :goto_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    .line 91
    :cond_28
    aget-object v2, p1, v1

    check-cast v2, Lcom/sun/mail/imap/protocol/IMAPResponse;

    .line 93
    .local v2, "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    const-string v4, "EXISTS"

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 94
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v4

    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->total:I

    .line 95
    aput-object v6, p1, v1

    goto :goto_25

    .line 96
    :cond_3d
    const-string v4, "RECENT"

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4e

    .line 97
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->getNumber()I

    move-result v4

    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->recent:I

    .line 98
    aput-object v6, p1, v1

    goto :goto_25

    .line 99
    :cond_4e
    const-string v4, "FLAGS"

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_60

    .line 100
    new-instance v4, Lcom/sun/mail/imap/protocol/FLAGS;

    invoke-direct {v4, v2}, Lcom/sun/mail/imap/protocol/FLAGS;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->availableFlags:Lkorex/mail/Flags;

    .line 101
    aput-object v6, p1, v1

    goto :goto_25

    .line 102
    :cond_60
    const-string v4, "VANISHED"

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 103
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    if-nez v4, :cond_73

    .line 104
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    .line 105
    :cond_73
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    aput-object v6, p1, v1

    goto :goto_25

    .line 107
    :cond_7b
    const-string v4, "FETCH"

    invoke-virtual {v2, v4}, Lcom/sun/mail/imap/protocol/IMAPResponse;->keyEquals(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_96

    .line 108
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    if-nez v4, :cond_8e

    .line 109
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    .line 110
    :cond_8e
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->responses:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    aput-object v6, p1, v1

    goto :goto_25

    .line 112
    :cond_96
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isUnTagged()Z

    move-result v4

    if-eqz v4, :cond_25

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->isOK()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 121
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->skipSpaces()V

    .line 123
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readByte()B

    move-result v4

    const/16 v5, 0x5b

    if-eq v4, v5, :cond_b2

    .line 124
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->reset()V

    goto/16 :goto_25

    .line 128
    :cond_b2
    const/4 v0, 0x1

    .line 129
    .local v0, "handled":Z
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readAtom()Ljava/lang/String;

    move-result-object v3

    .line 130
    .local v3, "s":Ljava/lang/String;
    const-string v4, "UNSEEN"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_cb

    .line 131
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readNumber()I

    move-result v4

    iput v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->first:I

    .line 143
    :goto_c5
    if-eqz v0, :cond_10a

    .line 144
    aput-object v6, p1, v1

    goto/16 :goto_25

    .line 132
    :cond_cb
    const-string v4, "UIDVALIDITY"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_da

    .line 133
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidvalidity:J

    goto :goto_c5

    .line 134
    :cond_da
    const-string v4, "PERMANENTFLAGS"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ea

    .line 135
    new-instance v4, Lcom/sun/mail/imap/protocol/FLAGS;

    invoke-direct {v4, v2}, Lcom/sun/mail/imap/protocol/FLAGS;-><init>(Lcom/sun/mail/imap/protocol/IMAPResponse;)V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    goto :goto_c5

    .line 136
    :cond_ea
    const-string v4, "UIDNEXT"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f9

    .line 137
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->uidnext:J

    goto :goto_c5

    .line 138
    :cond_f9
    const-string v4, "HIGHESTMODSEQ"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_108

    .line 139
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->readLong()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->highestmodseq:J

    goto :goto_c5

    .line 141
    :cond_108
    const/4 v0, 0x0

    goto :goto_c5

    .line 146
    :cond_10a
    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/IMAPResponse;->reset()V

    goto/16 :goto_25

    .line 155
    .end local v0    # "handled":Z
    .end local v2    # "ir":Lcom/sun/mail/imap/protocol/IMAPResponse;
    .end local v3    # "s":Ljava/lang/String;
    :cond_10f
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    if-nez v4, :cond_120

    .line 156
    iget-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->availableFlags:Lkorex/mail/Flags;

    if-eqz v4, :cond_121

    .line 157
    new-instance v4, Lkorex/mail/Flags;

    iget-object v5, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->availableFlags:Lkorex/mail/Flags;

    invoke-direct {v4, v5}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags;)V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    .line 161
    :cond_120
    :goto_120
    return-void

    .line 159
    :cond_121
    new-instance v4, Lkorex/mail/Flags;

    invoke-direct {v4}, Lkorex/mail/Flags;-><init>()V

    iput-object v4, p0, Lcom/sun/mail/imap/protocol/MailboxInfo;->permanentFlags:Lkorex/mail/Flags;

    goto :goto_120
.end method
