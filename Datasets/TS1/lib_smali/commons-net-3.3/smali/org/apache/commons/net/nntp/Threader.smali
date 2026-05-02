.class public Lorg/apache/commons/net/nntp/Threader;
.super Ljava/lang/Object;
.source "Threader.java"


# instance fields
.field private bogusIdCount:I

.field private idTable:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/commons/net/nntp/ThreadContainer;",
            ">;"
        }
    .end annotation
.end field

.field private root:Lorg/apache/commons/net/nntp/ThreadContainer;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/net/nntp/Threader;->bogusIdCount:I

    return-void
.end method

.method private buildContainer(Lorg/apache/commons/net/nntp/Threadable;)V
    .registers 16
    .param p1, "threadable"    # Lorg/apache/commons/net/nntp/Threadable;

    .prologue
    .line 102
    invoke-interface {p1}, Lorg/apache/commons/net/nntp/Threadable;->messageThreadId()Ljava/lang/String;

    move-result-object v3

    .line 103
    .local v3, "id":Ljava/lang/String;
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v11, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 107
    .local v1, "container":Lorg/apache/commons/net/nntp/ThreadContainer;
    if-eqz v1, :cond_32

    .line 108
    iget-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v11, :cond_7a

    .line 109
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "<Bogus-id:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p0, Lorg/apache/commons/net/nntp/Threader;->bogusIdCount:I

    add-int/lit8 v13, v12, 0x1

    iput v13, p0, Lorg/apache/commons/net/nntp/Threader;->bogusIdCount:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ">"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 110
    const/4 v1, 0x0

    .line 119
    :cond_32
    :goto_32
    if-nez v1, :cond_40

    .line 120
    new-instance v1, Lorg/apache/commons/net/nntp/ThreadContainer;

    .end local v1    # "container":Lorg/apache/commons/net/nntp/ThreadContainer;
    invoke-direct {v1}, Lorg/apache/commons/net/nntp/ThreadContainer;-><init>()V

    .line 121
    .restart local v1    # "container":Lorg/apache/commons/net/nntp/ThreadContainer;
    iput-object p1, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 122
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v11, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    :cond_40
    const/4 v5, 0x0

    .line 129
    .local v5, "parentRef":Lorg/apache/commons/net/nntp/ThreadContainer;
    invoke-interface {p1}, Lorg/apache/commons/net/nntp/Threadable;->messageThreadReferences()[Ljava/lang/String;

    move-result-object v9

    .line 130
    .local v9, "references":[Ljava/lang/String;
    move-object v0, v9

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_48
    if-ge v2, v4, :cond_7d

    aget-object v8, v0, v2

    .line 132
    .local v8, "refString":Ljava/lang/String;
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v11, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 135
    .local v7, "ref":Lorg/apache/commons/net/nntp/ThreadContainer;
    if-nez v7, :cond_60

    .line 136
    new-instance v7, Lorg/apache/commons/net/nntp/ThreadContainer;

    .end local v7    # "ref":Lorg/apache/commons/net/nntp/ThreadContainer;
    invoke-direct {v7}, Lorg/apache/commons/net/nntp/ThreadContainer;-><init>()V

    .line 137
    .restart local v7    # "ref":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v11, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    :cond_60
    if-eqz v5, :cond_76

    iget-object v11, v7, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v11, :cond_76

    if-eq v5, v7, :cond_76

    invoke-virtual {v7, v5}, Lorg/apache/commons/net/nntp/ThreadContainer;->findChild(Lorg/apache/commons/net/nntp/ThreadContainer;)Z

    move-result v11

    if-nez v11, :cond_76

    .line 148
    iput-object v5, v7, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 149
    iget-object v11, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v7, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 150
    iput-object v7, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 152
    :cond_76
    move-object v5, v7

    .line 130
    add-int/lit8 v2, v2, 0x1

    goto :goto_48

    .line 114
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "parentRef":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v7    # "ref":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v8    # "refString":Ljava/lang/String;
    .end local v9    # "references":[Ljava/lang/String;
    :cond_7a
    iput-object p1, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    goto :goto_32

    .line 158
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v4    # "len$":I
    .restart local v5    # "parentRef":Lorg/apache/commons/net/nntp/ThreadContainer;
    .restart local v9    # "references":[Ljava/lang/String;
    :cond_7d
    if-eqz v5, :cond_88

    if-eq v5, v1, :cond_87

    invoke-virtual {v1, v5}, Lorg/apache/commons/net/nntp/ThreadContainer;->findChild(Lorg/apache/commons/net/nntp/ThreadContainer;)Z

    move-result v11

    if-eqz v11, :cond_88

    .line 161
    :cond_87
    const/4 v5, 0x0

    .line 167
    :cond_88
    iget-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v11, :cond_ce

    .line 170
    const/4 v6, 0x0

    .local v6, "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v10, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 171
    .local v10, "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_91
    if-eqz v10, :cond_95

    .line 173
    if-ne v10, v1, :cond_bc

    .line 178
    :cond_95
    if-nez v10, :cond_c0

    .line 179
    new-instance v11, Ljava/lang/RuntimeException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Didnt find "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " in parent"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 172
    :cond_bc
    move-object v6, v10

    iget-object v10, v10, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_91

    .line 187
    :cond_c0
    if-nez v6, :cond_d9

    .line 188
    iget-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v12, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v12, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 193
    :goto_c8
    const/4 v11, 0x0

    iput-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 194
    const/4 v11, 0x0

    iput-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 198
    .end local v6    # "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v10    # "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_ce
    if-eqz v5, :cond_d8

    .line 199
    iput-object v5, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 200
    iget-object v11, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 201
    iput-object v1, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 203
    :cond_d8
    return-void

    .line 190
    .restart local v6    # "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    .restart local v10    # "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_d9
    iget-object v11, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v6, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_c8
.end method

.method private findRootSet()Lorg/apache/commons/net/nntp/ThreadContainer;
    .registers 8

    .prologue
    .line 210
    new-instance v3, Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-direct {v3}, Lorg/apache/commons/net/nntp/ThreadContainer;-><init>()V

    .line 211
    .local v3, "root":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v4, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 213
    .local v1, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_f
    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 214
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 215
    .local v2, "key":Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 216
    .local v0, "c":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v4, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v4, :cond_f

    .line 217
    iget-object v4, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v4, :cond_48

    .line 218
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "c.next is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 221
    :cond_48
    iget-object v4, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v4, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 222
    iput-object v0, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_f

    .line 225
    .end local v0    # "c":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v2    # "key":Ljava/lang/Object;
    :cond_4f
    return-object v3
.end method

.method private gatherSubjects()V
    .registers 16

    .prologue
    const/4 v10, 0x0

    .line 297
    const/4 v1, 0x0

    .line 299
    .local v1, "count":I
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v0, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .local v0, "c":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_6
    if-eqz v0, :cond_d

    .line 300
    add-int/lit8 v1, v1, 0x1

    .line 299
    iget-object v0, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_6

    .line 304
    :cond_d
    new-instance v7, Ljava/util/HashMap;

    int-to-double v11, v1

    const-wide v13, 0x3ff3333333333333L    # 1.2

    mul-double/2addr v11, v13

    double-to-int v11, v11

    const v12, 0x3f666666    # 0.9f

    invoke-direct {v7, v11, v12}, Ljava/util/HashMap;-><init>(IF)V

    .line 305
    .local v7, "subjectTable":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lorg/apache/commons/net/nntp/ThreadContainer;>;"
    const/4 v1, 0x0

    .line 307
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v0, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    :goto_22
    if-eqz v0, :cond_69

    .line 308
    iget-object v9, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 313
    .local v9, "threadable":Lorg/apache/commons/net/nntp/Threadable;
    if-nez v9, :cond_2c

    .line 314
    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v9, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 317
    :cond_2c
    invoke-interface {v9}, Lorg/apache/commons/net/nntp/Threadable;->simplifiedSubject()Ljava/lang/String;

    move-result-object v6

    .line 319
    .local v6, "subj":Ljava/lang/String;
    if-eqz v6, :cond_38

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_3b

    .line 307
    :cond_38
    :goto_38
    iget-object v0, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_22

    .line 323
    :cond_3b
    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 332
    .local v3, "old":Lorg/apache/commons/net/nntp/ThreadContainer;
    if-eqz v3, :cond_63

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v11, :cond_4b

    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v11, :cond_63

    :cond_4b
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v11, :cond_38

    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    invoke-interface {v11}, Lorg/apache/commons/net/nntp/Threadable;->subjectIsReply()Z

    move-result v11

    if-eqz v11, :cond_38

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v11, :cond_38

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    invoke-interface {v11}, Lorg/apache/commons/net/nntp/Threadable;->subjectIsReply()Z

    move-result v11

    if-nez v11, :cond_38

    .line 338
    :cond_63
    invoke-virtual {v7, v6, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    add-int/lit8 v1, v1, 0x1

    goto :goto_38

    .line 344
    .end local v3    # "old":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v6    # "subj":Ljava/lang/String;
    .end local v9    # "threadable":Lorg/apache/commons/net/nntp/Threadable;
    :cond_69
    if-nez v1, :cond_6c

    .line 441
    :goto_6b
    return-void

    .line 351
    :cond_6c
    const/4 v4, 0x0

    .local v4, "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v0, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 352
    .local v5, "rest":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_73
    if-eqz v0, :cond_114

    .line 354
    iget-object v9, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 357
    .restart local v9    # "threadable":Lorg/apache/commons/net/nntp/Threadable;
    if-nez v9, :cond_7d

    .line 358
    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v9, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 361
    :cond_7d
    invoke-interface {v9}, Lorg/apache/commons/net/nntp/Threadable;->simplifiedSubject()Ljava/lang/String;

    move-result-object v6

    .line 364
    .restart local v6    # "subj":Ljava/lang/String;
    if-eqz v6, :cond_89

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_8f

    .line 353
    :cond_89
    :goto_89
    move-object v4, v0

    move-object v0, v5

    if-nez v5, :cond_110

    move-object v5, v10

    :goto_8e
    goto :goto_73

    .line 368
    :cond_8f
    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 370
    .restart local v3    # "old":Lorg/apache/commons/net/nntp/ThreadContainer;
    if-eq v3, v0, :cond_89

    .line 376
    if-nez v4, :cond_b4

    .line 377
    iget-object v11, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v12, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v12, v11, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 381
    :goto_9f
    iput-object v10, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 383
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v11, :cond_cc

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v11, :cond_cc

    .line 386
    iget-object v8, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 387
    .local v8, "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_ab
    if-eqz v8, :cond_b9

    iget-object v11, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v11, :cond_b9

    .line 388
    iget-object v8, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_ab

    .line 379
    .end local v8    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_b4
    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_9f

    .line 392
    .restart local v8    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_b9
    if-eqz v8, :cond_bf

    .line 393
    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 396
    :cond_bf
    iget-object v8, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    :goto_c1
    if-eqz v8, :cond_c8

    .line 397
    iput-object v3, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 396
    iget-object v8, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_c1

    .line 400
    :cond_c8
    iput-object v10, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 435
    .end local v8    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_ca
    move-object v0, v4

    goto :goto_89

    .line 401
    :cond_cc
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v11, :cond_e4

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-eqz v11, :cond_ed

    iget-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    invoke-interface {v11}, Lorg/apache/commons/net/nntp/Threadable;->subjectIsReply()Z

    move-result v11

    if-eqz v11, :cond_ed

    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    invoke-interface {v11}, Lorg/apache/commons/net/nntp/Threadable;->subjectIsReply()Z

    move-result v11

    if-nez v11, :cond_ed

    .line 407
    :cond_e4
    iput-object v3, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 408
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 409
    iput-object v0, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_ca

    .line 413
    :cond_ed
    new-instance v2, Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-direct {v2}, Lorg/apache/commons/net/nntp/ThreadContainer;-><init>()V

    .line 414
    .local v2, "newc":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    iput-object v11, v2, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 415
    iget-object v11, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v11, v2, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 417
    iget-object v8, v2, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 418
    .restart local v8    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_fc
    if-eqz v8, :cond_103

    .line 421
    iput-object v2, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 419
    iget-object v8, v8, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_fc

    .line 424
    :cond_103
    iput-object v10, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 425
    iput-object v10, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 427
    iput-object v3, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 428
    iput-object v3, v2, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 431
    iput-object v0, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 432
    iput-object v2, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_ca

    .line 353
    .end local v2    # "newc":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v3    # "old":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v8    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_110
    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto/16 :goto_8e

    .line 438
    .end local v6    # "subj":Ljava/lang/String;
    .end local v9    # "threadable":Lorg/apache/commons/net/nntp/Threadable;
    :cond_114
    invoke-virtual {v7}, Ljava/util/HashMap;->clear()V

    .line 439
    const/4 v7, 0x0

    .line 441
    goto/16 :goto_6b
.end method

.method private pruneEmptyContainers(Lorg/apache/commons/net/nntp/ThreadContainer;)V
    .registers 8
    .param p1, "parent"    # Lorg/apache/commons/net/nntp/ThreadContainer;

    .prologue
    .line 234
    const/4 v3, 0x0

    .local v3, "prev":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v0, p1, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .local v0, "container":Lorg/apache/commons/net/nntp/ThreadContainer;
    iget-object v2, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 235
    .local v2, "next":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_5
    if-eqz v0, :cond_5e

    .line 241
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v5, :cond_21

    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v5, :cond_21

    .line 242
    if-nez v3, :cond_1c

    .line 243
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v5, p1, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 249
    :goto_15
    move-object v0, v3

    .line 236
    :cond_16
    :goto_16
    move-object v3, v0

    .line 237
    move-object v0, v2

    .line 238
    if-nez v0, :cond_5b

    const/4 v2, 0x0

    :goto_1b
    goto :goto_5

    .line 245
    :cond_1c
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v5, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_15

    .line 253
    :cond_21
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v5, :cond_53

    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v5, :cond_53

    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v5, :cond_33

    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v5, :cond_53

    .line 260
    :cond_33
    iget-object v1, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 263
    .local v1, "kids":Lorg/apache/commons/net/nntp/ThreadContainer;
    if-nez v3, :cond_45

    .line 264
    iput-object v1, p1, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 271
    :goto_39
    move-object v4, v1

    .local v4, "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_3a
    iget-object v5, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v5, :cond_48

    .line 272
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v5, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 271
    iget-object v4, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_3a

    .line 266
    .end local v4    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_45
    iput-object v1, v3, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_39

    .line 275
    .restart local v4    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_48
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v5, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->parent:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 276
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    iput-object v5, v4, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 280
    move-object v2, v1

    .line 283
    move-object v0, v3

    .line 284
    goto :goto_16

    .end local v1    # "kids":Lorg/apache/commons/net/nntp/ThreadContainer;
    .end local v4    # "tail":Lorg/apache/commons/net/nntp/ThreadContainer;
    :cond_53
    iget-object v5, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v5, :cond_16

    .line 287
    invoke-direct {p0, v0}, Lorg/apache/commons/net/nntp/Threader;->pruneEmptyContainers(Lorg/apache/commons/net/nntp/ThreadContainer;)V

    goto :goto_16

    .line 238
    :cond_5b
    iget-object v2, v0, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_1b

    .line 290
    :cond_5e
    return-void
.end method


# virtual methods
.method public thread(Ljava/lang/Iterable;)Lorg/apache/commons/net/nntp/Threadable;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/apache/commons/net/nntp/Threadable;",
            ">;)",
            "Lorg/apache/commons/net/nntp/Threadable;"
        }
    .end annotation

    .prologue
    .local p1, "messages":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/apache/commons/net/nntp/Threadable;>;"
    const/4 v4, 0x0

    .line 58
    if-nez p1, :cond_4

    .line 94
    :goto_3
    return-object v4

    .line 62
    :cond_4
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    .line 65
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_f
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/commons/net/nntp/Threadable;

    .line 66
    .local v3, "t":Lorg/apache/commons/net/nntp/Threadable;
    invoke-interface {v3}, Lorg/apache/commons/net/nntp/Threadable;->isDummy()Z

    move-result v5

    if-nez v5, :cond_f

    .line 67
    invoke-direct {p0, v3}, Lorg/apache/commons/net/nntp/Threader;->buildContainer(Lorg/apache/commons/net/nntp/Threadable;)V

    goto :goto_f

    .line 71
    .end local v3    # "t":Lorg/apache/commons/net/nntp/Threadable;
    :cond_25
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Threader;->findRootSet()Lorg/apache/commons/net/nntp/ThreadContainer;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    .line 72
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    invoke-virtual {v5}, Ljava/util/HashMap;->clear()V

    .line 73
    iput-object v4, p0, Lorg/apache/commons/net/nntp/Threader;->idTable:Ljava/util/HashMap;

    .line 75
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-direct {p0, v5}, Lorg/apache/commons/net/nntp/Threader;->pruneEmptyContainers(Lorg/apache/commons/net/nntp/ThreadContainer;)V

    .line 77
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v5}, Lorg/apache/commons/net/nntp/ThreadContainer;->reverseChildren()V

    .line 78
    invoke-direct {p0}, Lorg/apache/commons/net/nntp/Threader;->gatherSubjects()V

    .line 80
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-eqz v5, :cond_60

    .line 81
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "root node has a next:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 84
    :cond_60
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v1, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    .local v1, "r":Lorg/apache/commons/net/nntp/ThreadContainer;
    :goto_64
    if-eqz v1, :cond_77

    .line 85
    iget-object v5, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    if-nez v5, :cond_74

    .line 86
    iget-object v5, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    invoke-interface {v5}, Lorg/apache/commons/net/nntp/Threadable;->makeDummy()Lorg/apache/commons/net/nntp/Threadable;

    move-result-object v5

    iput-object v5, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    .line 84
    :cond_74
    iget-object v1, v1, Lorg/apache/commons/net/nntp/ThreadContainer;->next:Lorg/apache/commons/net/nntp/ThreadContainer;

    goto :goto_64

    .line 90
    :cond_77
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    if-nez v5, :cond_88

    move-object v2, v4

    .line 91
    .local v2, "result":Lorg/apache/commons/net/nntp/Threadable;
    :goto_7e
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    invoke-virtual {v5}, Lorg/apache/commons/net/nntp/ThreadContainer;->flush()V

    .line 92
    iput-object v4, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    move-object v4, v2

    .line 94
    goto/16 :goto_3

    .line 90
    .end local v2    # "result":Lorg/apache/commons/net/nntp/Threadable;
    :cond_88
    iget-object v5, p0, Lorg/apache/commons/net/nntp/Threader;->root:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v5, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->child:Lorg/apache/commons/net/nntp/ThreadContainer;

    iget-object v2, v5, Lorg/apache/commons/net/nntp/ThreadContainer;->threadable:Lorg/apache/commons/net/nntp/Threadable;

    goto :goto_7e
.end method

.method public thread(Ljava/util/List;)Lorg/apache/commons/net/nntp/Threadable;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/apache/commons/net/nntp/Threadable;",
            ">;)",
            "Lorg/apache/commons/net/nntp/Threadable;"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "messages":Ljava/util/List;, "Ljava/util/List<+Lorg/apache/commons/net/nntp/Threadable;>;"
    invoke-virtual {p0, p1}, Lorg/apache/commons/net/nntp/Threader;->thread(Ljava/lang/Iterable;)Lorg/apache/commons/net/nntp/Threadable;

    move-result-object v0

    return-object v0
.end method

.method public thread([Lorg/apache/commons/net/nntp/Threadable;)Lorg/apache/commons/net/nntp/Threadable;
    .registers 3
    .param p1, "messages"    # [Lorg/apache/commons/net/nntp/Threadable;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 455
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/net/nntp/Threader;->thread(Ljava/util/List;)Lorg/apache/commons/net/nntp/Threadable;

    move-result-object v0

    return-object v0
.end method
