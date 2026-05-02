.class public final Lcom/sun/mail/imap/Utility;
.super Ljava/lang/Object;
.source "Utility.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/imap/Utility$Condition;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getResyncUIDSet(Lcom/sun/mail/imap/ResyncData;)[Lcom/sun/mail/imap/protocol/UIDSet;
    .registers 2
    .param p0, "rd"    # Lcom/sun/mail/imap/ResyncData;

    .prologue
    .line 188
    invoke-virtual {p0}, Lcom/sun/mail/imap/ResyncData;->getUIDSet()[Lcom/sun/mail/imap/protocol/UIDSet;

    move-result-object v0

    return-object v0
.end method

.method public static toMessageSet([Lkorex/mail/Message;Lcom/sun/mail/imap/Utility$Condition;)[Lcom/sun/mail/imap/protocol/MessageSet;
    .registers 10
    .param p0, "msgs"    # [Lkorex/mail/Message;
    .param p1, "cond"    # Lcom/sun/mail/imap/Utility$Condition;

    .prologue
    .line 75
    new-instance v6, Ljava/util/Vector;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/util/Vector;-><init>(I)V

    .line 79
    .local v6, "v":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    array-length v7, p0

    if-ge v1, v7, :cond_56

    .line 80
    aget-object v2, p0, v1

    check-cast v2, Lcom/sun/mail/imap/IMAPMessage;

    .line 81
    .local v2, "msg":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v7

    if-eqz v7, :cond_17

    .line 79
    :cond_14
    :goto_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 84
    :cond_17
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v0

    .line 86
    .local v0, "current":I
    if-eqz p1, :cond_23

    invoke-interface {p1, v2}, Lcom/sun/mail/imap/Utility$Condition;->test(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v7

    if-eqz v7, :cond_14

    .line 89
    :cond_23
    new-instance v4, Lcom/sun/mail/imap/protocol/MessageSet;

    invoke-direct {v4}, Lcom/sun/mail/imap/protocol/MessageSet;-><init>()V

    .line 90
    .local v4, "set":Lcom/sun/mail/imap/protocol/MessageSet;
    iput v0, v4, Lcom/sun/mail/imap/protocol/MessageSet;->start:I

    .line 93
    add-int/lit8 v1, v1, 0x1

    :goto_2c
    array-length v7, p0

    if-ge v1, v7, :cond_50

    .line 95
    aget-object v2, p0, v1

    .end local v2    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    check-cast v2, Lcom/sun/mail/imap/IMAPMessage;

    .line 97
    .restart local v2    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 93
    :cond_39
    :goto_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_2c

    .line 99
    :cond_3c
    invoke-virtual {v2}, Lcom/sun/mail/imap/IMAPMessage;->getSequenceNumber()I

    move-result v3

    .line 102
    .local v3, "next":I
    if-eqz p1, :cond_48

    invoke-interface {p1, v2}, Lcom/sun/mail/imap/Utility$Condition;->test(Lcom/sun/mail/imap/IMAPMessage;)Z

    move-result v7

    if-eqz v7, :cond_39

    .line 105
    :cond_48
    add-int/lit8 v7, v0, 0x1

    if-ne v3, v7, :cond_4e

    .line 106
    move v0, v3

    goto :goto_39

    .line 111
    :cond_4e
    add-int/lit8 v1, v1, -0x1

    .line 115
    .end local v3    # "next":I
    :cond_50
    iput v0, v4, Lcom/sun/mail/imap/protocol/MessageSet;->end:I

    .line 116
    invoke-virtual {v6, v4}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_14

    .line 119
    .end local v0    # "current":I
    .end local v2    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    .end local v4    # "set":Lcom/sun/mail/imap/protocol/MessageSet;
    :cond_56
    invoke-virtual {v6}, Ljava/util/Vector;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5e

    .line 120
    const/4 v5, 0x0

    .line 124
    :goto_5d
    return-object v5

    .line 122
    :cond_5e
    invoke-virtual {v6}, Ljava/util/Vector;->size()I

    move-result v7

    new-array v5, v7, [Lcom/sun/mail/imap/protocol/MessageSet;

    .line 123
    .local v5, "sets":[Lcom/sun/mail/imap/protocol/MessageSet;
    invoke-virtual {v6, v5}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_5d
.end method

.method public static toUIDSet([Lkorex/mail/Message;)[Lcom/sun/mail/imap/protocol/UIDSet;
    .registers 12
    .param p0, "msgs"    # [Lkorex/mail/Message;

    .prologue
    .line 133
    new-instance v8, Ljava/util/Vector;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Ljava/util/Vector;-><init>(I)V

    .line 137
    .local v8, "v":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    array-length v9, p0

    if-ge v2, v9, :cond_49

    .line 138
    aget-object v3, p0, v2

    check-cast v3, Lcom/sun/mail/imap/IMAPMessage;

    .line 139
    .local v3, "msg":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v3}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v9

    if-eqz v9, :cond_17

    .line 137
    :goto_14
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 142
    :cond_17
    invoke-virtual {v3}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J

    move-result-wide v0

    .line 144
    .local v0, "current":J
    new-instance v6, Lcom/sun/mail/imap/protocol/UIDSet;

    invoke-direct {v6}, Lcom/sun/mail/imap/protocol/UIDSet;-><init>()V

    .line 145
    .local v6, "set":Lcom/sun/mail/imap/protocol/UIDSet;
    iput-wide v0, v6, Lcom/sun/mail/imap/protocol/UIDSet;->start:J

    .line 148
    add-int/lit8 v2, v2, 0x1

    :goto_24
    array-length v9, p0

    if-ge v2, v9, :cond_43

    .line 150
    aget-object v3, p0, v2

    .end local v3    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    check-cast v3, Lcom/sun/mail/imap/IMAPMessage;

    .line 152
    .restart local v3    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    invoke-virtual {v3}, Lcom/sun/mail/imap/IMAPMessage;->isExpunged()Z

    move-result v9

    if-eqz v9, :cond_34

    .line 148
    :goto_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 154
    :cond_34
    invoke-virtual {v3}, Lcom/sun/mail/imap/IMAPMessage;->getUID()J

    move-result-wide v4

    .line 156
    .local v4, "next":J
    const-wide/16 v9, 0x1

    add-long/2addr v9, v0

    cmp-long v9, v4, v9

    if-nez v9, :cond_41

    .line 157
    move-wide v0, v4

    goto :goto_31

    .line 162
    :cond_41
    add-int/lit8 v2, v2, -0x1

    .line 166
    .end local v4    # "next":J
    :cond_43
    iput-wide v0, v6, Lcom/sun/mail/imap/protocol/UIDSet;->end:J

    .line 167
    invoke-virtual {v8, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_14

    .line 170
    .end local v0    # "current":J
    .end local v3    # "msg":Lcom/sun/mail/imap/IMAPMessage;
    .end local v6    # "set":Lcom/sun/mail/imap/protocol/UIDSet;
    :cond_49
    invoke-virtual {v8}, Ljava/util/Vector;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_51

    .line 171
    const/4 v7, 0x0

    .line 175
    :goto_50
    return-object v7

    .line 173
    :cond_51
    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v9

    new-array v7, v9, [Lcom/sun/mail/imap/protocol/UIDSet;

    .line 174
    .local v7, "sets":[Lcom/sun/mail/imap/protocol/UIDSet;
    invoke-virtual {v8, v7}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    goto :goto_50
.end method
