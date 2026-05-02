.class public final Lkorex/mail/search/HeaderTerm;
.super Lkorex/mail/search/StringTerm;
.source "HeaderTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x73c690dfba9d2142L


# instance fields
.field private headerName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0, p2}, Lkorex/mail/search/StringTerm;-><init>(Ljava/lang/String;)V

    .line 72
    iput-object p1, p0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    .line 73
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 112
    instance-of v2, p1, Lkorex/mail/search/HeaderTerm;

    if-nez v2, :cond_6

    .line 116
    :cond_5
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 114
    check-cast v0, Lkorex/mail/search/HeaderTerm;

    .line 116
    .local v0, "ht":Lkorex/mail/search/HeaderTerm;
    iget-object v2, v0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    iget-object v3, p0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-super {p0, v0}, Lkorex/mail/search/StringTerm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    const/4 v1, 0x1

    goto :goto_5
.end method

.method public getHeaderName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 124
    iget-object v0, p0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 125
    invoke-super {p0}, Lkorex/mail/search/StringTerm;->hashCode()I

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
    iget-object v4, p0, Lkorex/mail/search/HeaderTerm;->headerName:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lkorex/mail/Message;->getHeader(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_a

    move-result-object v1

    .line 99
    .local v1, "headers":[Ljava/lang/String;
    if-nez v1, :cond_c

    .line 105
    .end local v1    # "headers":[Ljava/lang/String;
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
    .restart local v1    # "headers":[Ljava/lang/String;
    :cond_c
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    array-length v4, v1

    if-ge v2, v4, :cond_9

    .line 103
    aget-object v4, v1, v2

    invoke-super {p0, v4}, Lkorex/mail/search/StringTerm;->match(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 104
    const/4 v3, 0x1

    goto :goto_9

    .line 102
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_d
.end method
