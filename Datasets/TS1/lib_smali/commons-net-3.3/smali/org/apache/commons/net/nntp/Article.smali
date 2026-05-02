.class public Lorg/apache/commons/net/nntp/Article;
.super Ljava/lang/Object;
.source "Article.java"

# interfaces
.implements Lorg/apache/commons/net/nntp/Threadable;


# instance fields
.field private articleId:Ljava/lang/String;

.field private articleNumber:J

.field private date:Ljava/lang/String;

.field private from:Ljava/lang/String;

.field private isReply:Z

.field public kid:Lorg/apache/commons/net/nntp/Article;

.field public next:Lorg/apache/commons/net/nntp/Article;

.field private references:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private simplifiedSubject:Ljava/lang/String;

.field private subject:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/net/nntp/Article;->isReply:Z

    .line 40
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    .line 41
    return-void
.end method

.method private flushSubjectCache()V
    .registers 2

    .prologue
    .line 234
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    .line 235
    return-void
.end method

.method public static printThread(Lorg/apache/commons/net/nntp/Article;I)V
    .registers 6
    .param p0, "article"    # Lorg/apache/commons/net/nntp/Article;
    .param p1, "depth"    # I

    .prologue
    .line 144
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_d

    .line 145
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "==>"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 144
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 147
    :cond_d
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getSubject()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getFrom()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\t"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getArticleId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 148
    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->kid:Lorg/apache/commons/net/nntp/Article;

    if-eqz v1, :cond_4a

    .line 149
    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->kid:Lorg/apache/commons/net/nntp/Article;

    add-int/lit8 v2, p1, 0x1

    invoke-static {v1, v2}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;I)V

    .line 151
    :cond_4a
    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->next:Lorg/apache/commons/net/nntp/Article;

    if-eqz v1, :cond_53

    .line 152
    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->next:Lorg/apache/commons/net/nntp/Article;

    invoke-static {v1, p1}, Lorg/apache/commons/net/nntp/Article;->printThread(Lorg/apache/commons/net/nntp/Article;I)V

    .line 154
    :cond_53
    return-void
.end method

.method private simplifySubject()V
    .registers 11

    .prologue
    const/16 v9, 0x3a

    const/16 v8, 0x20

    .line 76
    const/4 v4, 0x0

    .line 77
    .local v4, "start":I
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getSubject()Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "subject":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    .line 80
    .local v3, "len":I
    const/4 v0, 0x0

    .line 82
    .local v0, "done":Z
    :goto_e
    if-nez v0, :cond_ca

    .line 83
    const/4 v0, 0x1

    .line 87
    :goto_11
    if-ge v4, v3, :cond_1c

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v8, :cond_1c

    .line 88
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    .line 91
    :cond_1c
    add-int/lit8 v6, v3, -0x2

    if-ge v4, v6, :cond_4f

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x72

    if-eq v6, v7, :cond_30

    invoke-virtual {v5, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x52

    if-ne v6, v7, :cond_4f

    :cond_30
    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x65

    if-eq v6, v7, :cond_44

    add-int/lit8 v6, v4, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x45

    if-ne v6, v7, :cond_4f

    .line 95
    :cond_44
    add-int/lit8 v6, v4, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_6b

    .line 96
    add-int/lit8 v4, v4, 0x3

    .line 97
    const/4 v0, 0x0

    .line 119
    :cond_4f
    :goto_4f
    const-string v6, "(no subject)"

    iget-object v7, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5d

    .line 120
    const-string v6, ""

    iput-object v6, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    .line 123
    :cond_5d
    move v1, v3

    .line 125
    .local v1, "end":I
    :goto_5e
    if-le v1, v4, :cond_ba

    add-int/lit8 v6, v1, -0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ge v6, v8, :cond_ba

    .line 126
    add-int/lit8 v1, v1, -0x1

    goto :goto_5e

    .line 98
    .end local v1    # "end":I
    :cond_6b
    add-int/lit8 v6, v3, -0x2

    if-ge v4, v6, :cond_4f

    add-int/lit8 v6, v4, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5b

    if-eq v6, v7, :cond_83

    add-int/lit8 v6, v4, 0x2

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x28

    if-ne v6, v7, :cond_4f

    .line 103
    :cond_83
    add-int/lit8 v2, v4, 0x3

    .line 105
    .local v2, "i":I
    :goto_85
    if-ge v2, v3, :cond_9a

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x30

    if-lt v6, v7, :cond_9a

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x39

    if-gt v6, v7, :cond_9a

    .line 106
    add-int/lit8 v2, v2, 0x1

    goto :goto_85

    .line 109
    :cond_9a
    add-int/lit8 v6, v3, -0x1

    if-ge v2, v6, :cond_4f

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x5d

    if-eq v6, v7, :cond_ae

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x29

    if-ne v6, v7, :cond_4f

    :cond_ae
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_4f

    .line 113
    add-int/lit8 v4, v2, 0x2

    .line 114
    const/4 v0, 0x0

    goto :goto_4f

    .line 129
    .end local v2    # "i":I
    .restart local v1    # "end":I
    :cond_ba
    if-nez v4, :cond_c2

    if-ne v1, v3, :cond_c2

    .line 130
    iput-object v5, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    goto/16 :goto_e

    .line 132
    :cond_c2
    invoke-virtual {v5, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    goto/16 :goto_e

    .line 135
    .end local v1    # "end":I
    :cond_ca
    return-void
.end method


# virtual methods
.method public addHeaderField(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 269
    return-void
.end method

.method public addReference(Ljava/lang/String;)V
    .registers 7
    .param p1, "msgId"    # Ljava/lang/String;

    .prologue
    .line 48
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_9

    .line 58
    :cond_8
    return-void

    .line 51
    :cond_9
    iget-object v4, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    if-nez v4, :cond_14

    .line 52
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    .line 54
    :cond_14
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/commons/net/nntp/Article;->isReply:Z

    .line 55
    const-string v4, " "

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1f
    if-ge v1, v2, :cond_8

    aget-object v3, v0, v1

    .line 56
    .local v3, "s":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 55
    add-int/lit8 v1, v1, 0x1

    goto :goto_1f
.end method

.method public getArticleId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 157
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    return-object v0
.end method

.method public getArticleNumber()I
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 259
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    long-to-int v0, v0

    return v0
.end method

.method public getArticleNumberLong()J
    .registers 3

    .prologue
    .line 161
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    return-wide v0
.end method

.method public getDate()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->date:Ljava/lang/String;

    return-object v0
.end method

.method public getFrom()Ljava/lang/String;
    .registers 2

    .prologue
    .line 169
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->from:Ljava/lang/String;

    return-object v0
.end method

.method public getReferences()[Ljava/lang/String;
    .registers 3

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    if-nez v0, :cond_8

    .line 66
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 68
    :goto_7
    return-object v0

    :cond_8
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->references:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    goto :goto_7
.end method

.method public getSubject()Ljava/lang/String;
    .registers 2

    .prologue
    .line 173
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    return-object v0
.end method

.method public isDummy()Z
    .registers 5

    .prologue
    .line 199
    iget-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public makeDummy()Lorg/apache/commons/net/nntp/Threadable;
    .registers 2

    .prologue
    .line 247
    new-instance v0, Lorg/apache/commons/net/nntp/Article;

    invoke-direct {v0}, Lorg/apache/commons/net/nntp/Article;-><init>()V

    return-object v0
.end method

.method public messageThreadId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    return-object v0
.end method

.method public messageThreadReferences()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 209
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/Article;->getReferences()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setArticleId(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    .line 178
    return-void
.end method

.method public setArticleNumber(I)V
    .registers 4
    .param p1, "a"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 264
    int-to-long v0, p1

    iput-wide v0, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    .line 265
    return-void
.end method

.method public setArticleNumber(J)V
    .registers 3
    .param p1, "l"    # J

    .prologue
    .line 181
    iput-wide p1, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    .line 182
    return-void
.end method

.method public setChild(Lorg/apache/commons/net/nntp/Threadable;)V
    .registers 2
    .param p1, "child"    # Lorg/apache/commons/net/nntp/Threadable;

    .prologue
    .line 229
    check-cast p1, Lorg/apache/commons/net/nntp/Article;

    .end local p1    # "child":Lorg/apache/commons/net/nntp/Threadable;
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->kid:Lorg/apache/commons/net/nntp/Article;

    .line 230
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->flushSubjectCache()V

    .line 231
    return-void
.end method

.method public setDate(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 185
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->date:Ljava/lang/String;

    .line 186
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->from:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setNext(Lorg/apache/commons/net/nntp/Threadable;)V
    .registers 2
    .param p1, "next"    # Lorg/apache/commons/net/nntp/Threadable;

    .prologue
    .line 240
    check-cast p1, Lorg/apache/commons/net/nntp/Article;

    .end local p1    # "next":Lorg/apache/commons/net/nntp/Threadable;
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->next:Lorg/apache/commons/net/nntp/Article;

    .line 241
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->flushSubjectCache()V

    .line 242
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .registers 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 193
    iput-object p1, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    .line 194
    return-void
.end method

.method public simplifiedSubject()Ljava/lang/String;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 215
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Article;->simplifySubject()V

    .line 217
    :cond_7
    iget-object v0, p0, Lorg/apache/commons/net/nntp/Article;->simplifiedSubject:Ljava/lang/String;

    return-object v0
.end method

.method public subjectIsReply()Z
    .registers 2

    .prologue
    .line 223
    iget-boolean v0, p0, Lorg/apache/commons/net/nntp/Article;->isReply:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lorg/apache/commons/net/nntp/Article;->articleNumber:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->articleId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/commons/net/nntp/Article;->subject:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
