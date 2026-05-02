.class public final Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;
.super Ljava/lang/Object;
.source "NewGroupsOrNewsQuery.java"


# instance fields
.field private final __date:Ljava/lang/String;

.field private __distributions:Ljava/lang/StringBuffer;

.field private final __isGMT:Z

.field private __newsgroups:Ljava/lang/StringBuffer;

.field private final __time:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/util/Calendar;Z)V
    .registers 10
    .param p1, "date"    # Ljava/util/Calendar;
    .param p2, "gmt"    # Z

    .prologue
    const/4 v3, 0x0

    const/16 v6, 0x30

    const/4 v5, 0x1

    const/4 v4, 0x2

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object v3, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    .line 65
    iput-object v3, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    .line 66
    iput-boolean p2, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__isGMT:Z

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {p1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 72
    .local v1, "num":I
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 73
    .local v2, "str":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 75
    if-lt v1, v4, :cond_a8

    .line 76
    add-int/lit8 v3, v1, -0x2

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    :goto_2a
    invoke-virtual {p1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v1, v3, 0x1

    .line 83
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 84
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 86
    if-ne v1, v5, :cond_af

    .line 87
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    :goto_40
    const/4 v3, 0x5

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 97
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 98
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 100
    if-ne v1, v5, :cond_bb

    .line 101
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    :goto_55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__date:Ljava/lang/String;

    .line 111
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 114
    const/16 v3, 0xb

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 115
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 116
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 118
    if-ne v1, v5, :cond_c7

    .line 119
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    :goto_75
    const/16 v3, 0xc

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 129
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 130
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 132
    if-ne v1, v5, :cond_d3

    .line 133
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    :goto_8b
    const/16 v3, 0xd

    invoke-virtual {p1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 144
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 145
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    .line 147
    if-ne v1, v5, :cond_df

    .line 148
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 149
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    :goto_a1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__time:Ljava/lang/String;

    .line 157
    return-void

    .line 78
    :cond_a8
    const-string v3, "00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2a

    .line 89
    :cond_af
    if-ne v1, v4, :cond_b5

    .line 90
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_40

    .line 92
    :cond_b5
    const-string v3, "01"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_40

    .line 103
    :cond_bb
    if-ne v1, v4, :cond_c1

    .line 104
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_55

    .line 106
    :cond_c1
    const-string v3, "01"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_55

    .line 121
    :cond_c7
    if-ne v1, v4, :cond_cd

    .line 122
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_75

    .line 124
    :cond_cd
    const-string v3, "00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_75

    .line 135
    :cond_d3
    if-ne v1, v4, :cond_d9

    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8b

    .line 138
    :cond_d9
    const-string v3, "00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8b

    .line 150
    :cond_df
    if-ne v1, v4, :cond_e5

    .line 151
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a1

    .line 153
    :cond_e5
    const-string v3, "00"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a1
.end method


# virtual methods
.method public addDistribution(Ljava/lang/String;)V
    .registers 4
    .param p1, "distribution"    # Ljava/lang/String;

    .prologue
    .line 217
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_11

    .line 218
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 222
    :goto_b
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 223
    return-void

    .line 220
    :cond_11
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    goto :goto_b
.end method

.method public addNewsgroup(Ljava/lang/String;)V
    .registers 4
    .param p1, "newsgroup"    # Ljava/lang/String;

    .prologue
    .line 172
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    if-eqz v0, :cond_11

    .line 173
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    const/16 v1, 0x2c

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 177
    :goto_b
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 178
    return-void

    .line 175
    :cond_11
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    goto :goto_b
.end method

.method public getDate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__date:Ljava/lang/String;

    return-object v0
.end method

.method public getDistributions()Ljava/lang/String;
    .registers 2

    .prologue
    .line 266
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__distributions:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getNewsgroups()Ljava/lang/String;
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__newsgroups:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getTime()Ljava/lang/String;
    .registers 2

    .prologue
    .line 244
    iget-object v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__time:Ljava/lang/String;

    return-object v0
.end method

.method public isGMT()Z
    .registers 2

    .prologue
    .line 254
    iget-boolean v0, p0, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->__isGMT:Z

    return v0
.end method

.method public omitNewsgroup(Ljava/lang/String;)V
    .registers 4
    .param p1, "newsgroup"    # Ljava/lang/String;

    .prologue
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "!"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/NewGroupsOrNewsQuery;->addNewsgroup(Ljava/lang/String;)V

    .line 202
    return-void
.end method
