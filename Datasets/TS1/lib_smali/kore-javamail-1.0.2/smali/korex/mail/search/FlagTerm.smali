.class public final Lkorex/mail/search/FlagTerm;
.super Lkorex/mail/search/SearchTerm;
.source "FlagTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x1fc02030d671737L


# instance fields
.field private flags:Lkorex/mail/Flags;

.field private set:Z


# direct methods
.method public constructor <init>(Lkorex/mail/Flags;Z)V
    .registers 3
    .param p1, "flags"    # Lkorex/mail/Flags;
    .param p2, "set"    # Z

    .prologue
    .line 78
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 79
    iput-object p1, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    .line 80
    iput-boolean p2, p0, Lkorex/mail/search/FlagTerm;->set:Z

    .line 81
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 153
    instance-of v2, p1, Lkorex/mail/search/FlagTerm;

    if-nez v2, :cond_6

    .line 156
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 155
    check-cast v0, Lkorex/mail/search/FlagTerm;

    .line 156
    .local v0, "ft":Lkorex/mail/search/FlagTerm;
    iget-boolean v2, v0, Lkorex/mail/search/FlagTerm;->set:Z

    iget-boolean v3, p0, Lkorex/mail/search/FlagTerm;->set:Z

    if-ne v2, v3, :cond_5

    iget-object v2, v0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    iget-object v3, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v2, v3}, Lkorex/mail/Flags;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getFlags()Lkorex/mail/Flags;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0}, Lkorex/mail/Flags;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/Flags;

    return-object v0
.end method

.method public getTestSet()Z
    .registers 2

    .prologue
    .line 98
    iget-boolean v0, p0, Lkorex/mail/search/FlagTerm;->set:Z

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 163
    iget-boolean v0, p0, Lkorex/mail/search/FlagTerm;->set:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0}, Lkorex/mail/Flags;->hashCode()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v0}, Lkorex/mail/Flags;->hashCode()I

    move-result v0

    xor-int/lit8 v0, v0, -0x1

    goto :goto_a
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 10
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 110
    :try_start_2
    invoke-virtual {p1}, Lkorex/mail/Message;->getFlags()Lkorex/mail/Flags;

    move-result-object v1

    .line 111
    .local v1, "f":Lkorex/mail/Flags;
    iget-boolean v7, p0, Lkorex/mail/search/FlagTerm;->set:Z

    if-eqz v7, :cond_15

    .line 112
    iget-object v7, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v1, v7}, Lkorex/mail/Flags;->contains(Lkorex/mail/Flags;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 145
    .end local v1    # "f":Lkorex/mail/Flags;
    :cond_12
    :goto_12
    return v5

    .restart local v1    # "f":Lkorex/mail/Flags;
    :cond_13
    move v5, v6

    .line 115
    goto :goto_12

    .line 122
    :cond_15
    iget-object v7, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v7}, Lkorex/mail/Flags;->getSystemFlags()[Lkorex/mail/Flags$Flag;

    move-result-object v4

    .line 125
    .local v4, "sf":[Lkorex/mail/Flags$Flag;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1c
    array-length v7, v4

    if-ge v2, v7, :cond_2c

    .line 126
    aget-object v7, v4, v2

    invoke-virtual {v1, v7}, Lkorex/mail/Flags;->contains(Lkorex/mail/Flags$Flag;)Z

    move-result v7

    if-eqz v7, :cond_29

    move v5, v6

    .line 128
    goto :goto_12

    .line 125
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 131
    :cond_2c
    iget-object v7, p0, Lkorex/mail/search/FlagTerm;->flags:Lkorex/mail/Flags;

    invoke-virtual {v7}, Lkorex/mail/Flags;->getUserFlags()[Ljava/lang/String;

    move-result-object v3

    .line 134
    .local v3, "s":[Ljava/lang/String;
    const/4 v2, 0x0

    :goto_33
    array-length v7, v3

    if-ge v2, v7, :cond_12

    .line 135
    aget-object v7, v3, v2

    invoke-virtual {v1, v7}, Lkorex/mail/Flags;->contains(Ljava/lang/String;)Z
    :try_end_3b
    .catch Lkorex/mail/MessagingException; {:try_start_2 .. :try_end_3b} :catch_43
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_3b} :catch_46

    move-result v7

    if-eqz v7, :cond_40

    move v5, v6

    .line 137
    goto :goto_12

    .line 134
    :cond_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_33

    .line 142
    .end local v1    # "f":Lkorex/mail/Flags;
    .end local v2    # "i":I
    .end local v3    # "s":[Ljava/lang/String;
    .end local v4    # "sf":[Lkorex/mail/Flags$Flag;
    :catch_43
    move-exception v0

    .local v0, "e":Lkorex/mail/MessagingException;
    move v5, v6

    .line 143
    goto :goto_12

    .line 144
    .end local v0    # "e":Lkorex/mail/MessagingException;
    :catch_46
    move-exception v0

    .local v0, "e":Ljava/lang/RuntimeException;
    move v5, v6

    .line 145
    goto :goto_12
.end method
