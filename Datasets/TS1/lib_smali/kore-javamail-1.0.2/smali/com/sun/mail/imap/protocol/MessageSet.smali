.class public Lcom/sun/mail/imap/protocol/MessageSet;
.super Ljava/lang/Object;
.source "MessageSet.java"


# instance fields
.field public end:I

.field public start:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 3
    .param p1, "start"    # I
    .param p2, "end"    # I

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput p1, p0, Lcom/sun/mail/imap/protocol/MessageSet;->start:I

    .line 58
    iput p2, p0, Lcom/sun/mail/imap/protocol/MessageSet;->end:I

    .line 59
    return-void
.end method

.method public static createMessageSets([I)[Lcom/sun/mail/imap/protocol/MessageSet;
    .registers 7
    .param p0, "msgs"    # [I

    .prologue
    .line 72
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .local v3, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/MessageSet;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    array-length v4, p0

    if-ge v0, v4, :cond_32

    .line 76
    new-instance v2, Lcom/sun/mail/imap/protocol/MessageSet;

    invoke-direct {v2}, Lcom/sun/mail/imap/protocol/MessageSet;-><init>()V

    .line 77
    .local v2, "ms":Lcom/sun/mail/imap/protocol/MessageSet;
    aget v4, p0, v0

    iput v4, v2, Lcom/sun/mail/imap/protocol/MessageSet;->start:I

    .line 80
    add-int/lit8 v1, v0, 0x1

    .local v1, "j":I
    :goto_14
    array-length v4, p0

    if-ge v1, v4, :cond_21

    .line 81
    aget v4, p0, v1

    add-int/lit8 v5, v1, -0x1

    aget v5, p0, v5

    add-int/lit8 v5, v5, 0x1

    if-eq v4, v5, :cond_2f

    .line 84
    :cond_21
    add-int/lit8 v4, v1, -0x1

    aget v4, p0, v4

    iput v4, v2, Lcom/sun/mail/imap/protocol/MessageSet;->end:I

    .line 85
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v0, v1, -0x1

    .line 75
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 80
    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 88
    .end local v1    # "j":I
    .end local v2    # "ms":Lcom/sun/mail/imap/protocol/MessageSet;
    :cond_32
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lcom/sun/mail/imap/protocol/MessageSet;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Lcom/sun/mail/imap/protocol/MessageSet;

    return-object v4
.end method

.method public static size([Lcom/sun/mail/imap/protocol/MessageSet;)I
    .registers 4
    .param p0, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;

    .prologue
    .line 126
    const/4 v0, 0x0

    .line 128
    .local v0, "count":I
    if-nez p0, :cond_5

    .line 129
    const/4 v2, 0x0

    .line 134
    :goto_4
    return v2

    .line 131
    :cond_5
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    array-length v2, p0

    if-ge v1, v2, :cond_13

    .line 132
    aget-object v2, p0, v1

    invoke-virtual {v2}, Lcom/sun/mail/imap/protocol/MessageSet;->size()I

    move-result v2

    add-int/2addr v0, v2

    .line 131
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_13
    move v2, v0

    .line 134
    goto :goto_4
.end method

.method public static toString([Lcom/sun/mail/imap/protocol/MessageSet;)Ljava/lang/String;
    .registers 8
    .param p0, "msgsets"    # [Lcom/sun/mail/imap/protocol/MessageSet;

    .prologue
    .line 95
    if-eqz p0, :cond_5

    array-length v5, p0

    if-nez v5, :cond_7

    .line 96
    :cond_5
    const/4 v5, 0x0

    .line 118
    :goto_6
    return-object v5

    .line 98
    :cond_7
    const/4 v1, 0x0

    .line 99
    .local v1, "i":I
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 100
    .local v2, "s":Ljava/lang/StringBuffer;
    array-length v3, p0

    .line 104
    .local v3, "size":I
    :goto_e
    aget-object v5, p0, v1

    iget v4, v5, Lcom/sun/mail/imap/protocol/MessageSet;->start:I

    .line 105
    .local v4, "start":I
    aget-object v5, p0, v1

    iget v0, v5, Lcom/sun/mail/imap/protocol/MessageSet;->end:I

    .line 107
    .local v0, "end":I
    if-le v0, v4, :cond_2e

    .line 108
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const/16 v6, 0x3a

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 112
    :goto_25
    add-int/lit8 v1, v1, 0x1

    .line 113
    if-lt v1, v3, :cond_32

    .line 118
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_6

    .line 110
    :cond_2e
    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    goto :goto_25

    .line 116
    :cond_32
    const/16 v5, 0x2c

    invoke-virtual {v2, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_e
.end method


# virtual methods
.method public size()I
    .registers 3

    .prologue
    .line 65
    iget v0, p0, Lcom/sun/mail/imap/protocol/MessageSet;->end:I

    iget v1, p0, Lcom/sun/mail/imap/protocol/MessageSet;->start:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    return v0
.end method
