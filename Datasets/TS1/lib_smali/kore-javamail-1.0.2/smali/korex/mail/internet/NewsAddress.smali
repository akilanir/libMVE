.class public Lkorex/mail/internet/NewsAddress;
.super Lkorex/mail/Address;
.source "NewsAddress.java"


# static fields
.field private static final serialVersionUID:J = -0x3a56e35f1bcbec6fL


# instance fields
.field protected host:Ljava/lang/String;

.field protected newsgroup:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 66
    invoke-direct {p0}, Lkorex/mail/Address;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "newsgroup"    # Ljava/lang/String;

    .prologue
    .line 74
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lkorex/mail/internet/NewsAddress;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "newsgroup"    # Ljava/lang/String;
    .param p2, "host"    # Ljava/lang/String;

    .prologue
    .line 83
    invoke-direct {p0}, Lkorex/mail/Address;-><init>()V

    .line 84
    iput-object p1, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    .line 85
    iput-object p2, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    .line 86
    return-void
.end method

.method public static parse(Ljava/lang/String;)[Lkorex/mail/internet/NewsAddress;
    .registers 7
    .param p0, "newsgroups"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 202
    new-instance v4, Ljava/util/StringTokenizer;

    const-string v5, ","

    invoke-direct {v4, p0, v5}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .local v4, "st":Ljava/util/StringTokenizer;
    new-instance v2, Ljava/util/Vector;

    invoke-direct {v2}, Ljava/util/Vector;-><init>()V

    .line 204
    .local v2, "nglist":Ljava/util/Vector;
    :goto_c
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v5

    if-eqz v5, :cond_1f

    .line 205
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 206
    .local v1, "ng":Ljava/lang/String;
    new-instance v5, Lkorex/mail/internet/NewsAddress;

    invoke-direct {v5, v1}, Lkorex/mail/internet/NewsAddress;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_c

    .line 208
    .end local v1    # "ng":Ljava/lang/String;
    :cond_1f
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v3

    .line 209
    .local v3, "size":I
    new-array v0, v3, [Lkorex/mail/internet/NewsAddress;

    .line 210
    .local v0, "na":[Lkorex/mail/internet/NewsAddress;
    if-lez v3, :cond_2a

    .line 211
    invoke-virtual {v2, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 212
    :cond_2a
    return-object v0
.end method

.method public static toString([Lkorex/mail/Address;)Ljava/lang/String;
    .registers 5
    .param p0, "addresses"    # [Lkorex/mail/Address;

    .prologue
    .line 180
    if-eqz p0, :cond_5

    array-length v2, p0

    if-nez v2, :cond_7

    .line 181
    :cond_5
    const/4 v2, 0x0

    .line 188
    :goto_6
    return-object v2

    .line 183
    :cond_7
    new-instance v1, Ljava/lang/StringBuffer;

    const/4 v2, 0x0

    aget-object v2, p0, v2

    check-cast v2, Lkorex/mail/internet/NewsAddress;

    .line 184
    invoke-virtual {v2}, Lkorex/mail/internet/NewsAddress;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 185
    .local v1, "s":Ljava/lang/StringBuffer;
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_16
    array-length v2, p0

    if-ge v0, v2, :cond_2d

    .line 186
    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    aget-object v2, p0, v0

    check-cast v2, Lkorex/mail/internet/NewsAddress;

    invoke-virtual {v2}, Lkorex/mail/internet/NewsAddress;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 185
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 188
    :cond_2d
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_6
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "a"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 145
    instance-of v2, p1, Lkorex/mail/internet/NewsAddress;

    if-nez v2, :cond_6

    .line 152
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 148
    check-cast v0, Lkorex/mail/internet/NewsAddress;

    .line 149
    .local v0, "s":Lkorex/mail/internet/NewsAddress;
    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    if-nez v2, :cond_11

    iget-object v2, v0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    if-eqz v2, :cond_1f

    :cond_11
    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    iget-object v3, v0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    .line 150
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_1f
    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    if-nez v2, :cond_27

    iget-object v2, v0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    if-eqz v2, :cond_39

    :cond_27
    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, v0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    iget-object v3, v0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    .line 152
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_39
    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getHost()Ljava/lang/String;
    .registers 2

    .prologue
    .line 129
    iget-object v0, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getNewsgroup()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 93
    const-string v0, "news"

    return-object v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 159
    const/4 v0, 0x0

    .line 160
    .local v0, "hash":I
    iget-object v1, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    if-eqz v1, :cond_c

    .line 161
    iget-object v1, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 162
    :cond_c
    iget-object v1, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    if-eqz v1, :cond_1d

    .line 163
    iget-object v1, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    .line 164
    :cond_1d
    return v0
.end method

.method public setHost(Ljava/lang/String;)V
    .registers 2
    .param p1, "host"    # Ljava/lang/String;

    .prologue
    .line 120
    iput-object p1, p0, Lkorex/mail/internet/NewsAddress;->host:Ljava/lang/String;

    .line 121
    return-void
.end method

.method public setNewsgroup(Ljava/lang/String;)V
    .registers 2
    .param p1, "newsgroup"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lkorex/mail/internet/NewsAddress;->newsgroup:Ljava/lang/String;

    return-object v0
.end method
