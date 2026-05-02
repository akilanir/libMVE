.class public final Lkorex/mail/search/RecipientTerm;
.super Lkorex/mail/search/AddressTerm;
.source "RecipientTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x5ae1a88c29bef694L


# instance fields
.field private type:Lkorex/mail/Message$RecipientType;


# direct methods
.method public constructor <init>(Lkorex/mail/Message$RecipientType;Lkorex/mail/Address;)V
    .registers 3
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "address"    # Lkorex/mail/Address;

    .prologue
    .line 70
    invoke-direct {p0, p2}, Lkorex/mail/search/AddressTerm;-><init>(Lkorex/mail/Address;)V

    .line 71
    iput-object p1, p0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    .line 72
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 112
    instance-of v2, p1, Lkorex/mail/search/RecipientTerm;

    if-nez v2, :cond_6

    .line 115
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 114
    check-cast v0, Lkorex/mail/search/RecipientTerm;

    .line 115
    .local v0, "rt":Lkorex/mail/search/RecipientTerm;
    iget-object v2, v0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    iget-object v3, p0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-super {p0, p1}, Lkorex/mail/search/AddressTerm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getRecipientType()Lkorex/mail/Message$RecipientType;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 122
    iget-object v0, p0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-super {p0}, Lkorex/mail/search/AddressTerm;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 94
    :try_start_1
    iget-object v4, p0, Lkorex/mail/search/RecipientTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p1, v4}, Lkorex/mail/Message;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_a

    move-result-object v2

    .line 99
    .local v2, "recipients":[Lkorex/mail/Address;
    if-nez v2, :cond_c

    .line 105
    .end local v2    # "recipients":[Lkorex/mail/Address;
    :cond_9
    :goto_9
    return v3

    .line 95
    :catch_a
    move-exception v0

    .line 96
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_9

    .line 102
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "recipients":[Lkorex/mail/Address;
    :cond_c
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    array-length v4, v2

    if-ge v1, v4, :cond_9

    .line 103
    aget-object v4, v2, v1

    invoke-super {p0, v4}, Lkorex/mail/search/AddressTerm;->match(Lkorex/mail/Address;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 104
    const/4 v3, 0x1

    goto :goto_9

    .line 102
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method
