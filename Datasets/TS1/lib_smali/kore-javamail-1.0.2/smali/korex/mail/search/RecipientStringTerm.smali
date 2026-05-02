.class public final Lkorex/mail/search/RecipientStringTerm;
.super Lkorex/mail/search/AddressStringTerm;
.source "RecipientStringTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x7318a6c781f26a21L


# instance fields
.field private type:Lkorex/mail/Message$RecipientType;


# direct methods
.method public constructor <init>(Lkorex/mail/Message$RecipientType;Ljava/lang/String;)V
    .registers 3
    .param p1, "type"    # Lkorex/mail/Message$RecipientType;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-direct {p0, p2}, Lkorex/mail/search/AddressStringTerm;-><init>(Ljava/lang/String;)V

    .line 76
    iput-object p1, p0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    .line 77
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 118
    instance-of v2, p1, Lkorex/mail/search/RecipientStringTerm;

    if-nez v2, :cond_6

    .line 121
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 120
    check-cast v0, Lkorex/mail/search/RecipientStringTerm;

    .line 121
    .local v0, "rst":Lkorex/mail/search/RecipientStringTerm;
    iget-object v2, v0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    iget-object v3, p0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-super {p0, p1}, Lkorex/mail/search/AddressStringTerm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getRecipientType()Lkorex/mail/Message$RecipientType;
    .registers 2

    .prologue
    .line 85
    iget-object v0, p0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 128
    iget-object v0, p0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-super {p0}, Lkorex/mail/search/AddressStringTerm;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 100
    :try_start_1
    iget-object v4, p0, Lkorex/mail/search/RecipientStringTerm;->type:Lkorex/mail/Message$RecipientType;

    invoke-virtual {p1, v4}, Lkorex/mail/Message;->getRecipients(Lkorex/mail/Message$RecipientType;)[Lkorex/mail/Address;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_a

    move-result-object v2

    .line 105
    .local v2, "recipients":[Lkorex/mail/Address;
    if-nez v2, :cond_c

    .line 111
    .end local v2    # "recipients":[Lkorex/mail/Address;
    :cond_9
    :goto_9
    return v3

    .line 101
    :catch_a
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_9

    .line 108
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "recipients":[Lkorex/mail/Address;
    :cond_c
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    array-length v4, v2

    if-ge v1, v4, :cond_9

    .line 109
    aget-object v4, v2, v1

    invoke-super {p0, v4}, Lkorex/mail/search/AddressStringTerm;->match(Lkorex/mail/Address;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 110
    const/4 v3, 0x1

    goto :goto_9

    .line 108
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method
