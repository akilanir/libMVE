.class Lkore/awt/datatransfer/MimeTypeParameterList;
.super Ljava/lang/Object;
.source "MimeTypeParameterList.java"

# interfaces
.implements Ljava/lang/Cloneable;


# static fields
.field private static final TSPECIALS:Ljava/lang/String; = "()<>@,;:\\\"/[]?="


# instance fields
.field private parameters:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "rawdata"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    .line 54
    invoke-virtual {p0, p1}, Lkore/awt/datatransfer/MimeTypeParameterList;->parse(Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method private static isTokenChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 315
    const/16 v0, 0x20

    if-le p0, v0, :cond_12

    const/16 v0, 0x7f

    if-ge p0, v0, :cond_12

    const-string v0, "()<>@,;:\\\"/[]?="

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method private static quote(Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    const/16 v10, 0x5c

    const/16 v9, 0x22

    .line 339
    const/4 v4, 0x0

    .line 342
    .local v4, "needsQuotes":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 343
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v3, :cond_1e

    if-nez v4, :cond_1e

    .line 344
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lkore/awt/datatransfer/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v5

    if-nez v5, :cond_1c

    const/4 v4, 0x1

    .line 343
    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 344
    :cond_1c
    const/4 v4, 0x0

    goto :goto_19

    .line 347
    :cond_1e
    if-eqz v4, :cond_48

    .line 348
    new-instance v0, Ljava/lang/StringBuilder;

    int-to-double v5, v3

    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v5, v7

    double-to-int v5, v5

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 351
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 354
    const/4 v2, 0x0

    :goto_2e
    if-ge v2, v3, :cond_41

    .line 355
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 356
    .local v1, "c":C
    if-eq v1, v10, :cond_38

    if-ne v1, v9, :cond_3b

    .line 357
    :cond_38
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 359
    :cond_3b
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 354
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 363
    .end local v1    # "c":C
    :cond_41
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 365
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 367
    .end local v0    # "buffer":Ljava/lang/StringBuilder;
    .end local p0    # "value":Ljava/lang/String;
    :cond_48
    return-object p0
.end method

.method private static skipWhiteSpace(Ljava/lang/String;I)I
    .registers 5
    .param p0, "rawdata"    # Ljava/lang/String;
    .param p1, "i"    # I

    .prologue
    .line 323
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 324
    .local v1, "length":I
    if-ge p1, v1, :cond_19

    .line 325
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 326
    .local v0, "c":C
    :goto_a
    if-ge p1, v1, :cond_19

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 327
    add-int/lit8 p1, p1, 0x1

    .line 328
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_a

    .line 332
    .end local v0    # "c":C
    :cond_19
    return p1
.end method

.method private static unquote(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 375
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 376
    .local v4, "valueLength":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 378
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 379
    .local v2, "escaped":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_b
    if-ge v3, v4, :cond_26

    .line 380
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 381
    .local v1, "currentChar":C
    if-nez v2, :cond_1d

    const/16 v5, 0x5c

    if-eq v1, v5, :cond_1d

    .line 382
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 379
    :goto_1a
    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 383
    :cond_1d
    if-eqz v2, :cond_24

    .line 384
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 385
    const/4 v2, 0x0

    goto :goto_1a

    .line 387
    :cond_24
    const/4 v2, 0x1

    goto :goto_1a

    .line 391
    .end local v1    # "currentChar":C
    :cond_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 4

    .prologue
    .line 298
    const/4 v1, 0x0

    .line 300
    .local v1, "newObj":Lkore/awt/datatransfer/MimeTypeParameterList;
    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, Lkore/awt/datatransfer/MimeTypeParameterList;

    move-object v1, v0
    :try_end_9
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_9} :catch_14

    .line 303
    :goto_9
    iget-object v2, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->clone()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Hashtable;

    iput-object v2, v1, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    .line 304
    return-object v1

    .line 301
    :catch_14
    move-exception v2

    goto :goto_9
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 12
    .param p1, "thatObject"    # Ljava/lang/Object;

    .prologue
    const/4 v7, 0x0

    .line 78
    instance-of v8, p1, Lkore/awt/datatransfer/MimeTypeParameterList;

    if-nez v8, :cond_6

    .line 106
    :cond_5
    :goto_5
    return v7

    :cond_6
    move-object v4, p1

    .line 81
    check-cast v4, Lkore/awt/datatransfer/MimeTypeParameterList;

    .line 82
    .local v4, "that":Lkore/awt/datatransfer/MimeTypeParameterList;
    invoke-virtual {p0}, Lkore/awt/datatransfer/MimeTypeParameterList;->size()I

    move-result v8

    invoke-virtual {v4}, Lkore/awt/datatransfer/MimeTypeParameterList;->size()I

    move-result v9

    if-ne v8, v9, :cond_5

    .line 85
    const/4 v3, 0x0

    .line 86
    .local v3, "name":Ljava/lang/String;
    const/4 v6, 0x0

    .line 87
    .local v6, "thisValue":Ljava/lang/String;
    const/4 v5, 0x0

    .line 88
    .local v5, "thatValue":Ljava/lang/String;
    iget-object v8, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v8}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 89
    .local v0, "entries":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 90
    .local v2, "iterator":Ljava/util/Iterator;
    const/4 v1, 0x0

    .line 91
    .local v1, "entry":Ljava/util/Map$Entry;
    :cond_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4f

    .line 92
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "entry":Ljava/util/Map$Entry;
    check-cast v1, Ljava/util/Map$Entry;

    .line 93
    .restart local v1    # "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "name":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 94
    .restart local v3    # "name":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "thisValue":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 95
    .restart local v6    # "thisValue":Ljava/lang/String;
    iget-object v8, v4, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v8, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "thatValue":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 96
    .restart local v5    # "thatValue":Ljava/lang/String;
    if-eqz v6, :cond_45

    if-nez v5, :cond_48

    .line 98
    :cond_45
    if-eq v6, v5, :cond_21

    goto :goto_5

    .line 101
    :cond_48
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_21

    goto :goto_5

    .line 106
    :cond_4f
    const/4 v7, 0x1

    goto :goto_5
.end method

.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 251
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getNames()Ljava/util/Enumeration;
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    .line 58
    const v0, 0x2d82d82

    .line 59
    .local v0, "code":I
    const/4 v2, 0x0

    .line 60
    .local v2, "paramName":Ljava/lang/String;
    invoke-virtual {p0}, Lkore/awt/datatransfer/MimeTypeParameterList;->getNames()Ljava/util/Enumeration;

    move-result-object v1

    .line 62
    .local v1, "enum_":Ljava/util/Enumeration;
    :goto_8
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_23

    .line 63
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "paramName":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 64
    .restart local v2    # "paramName":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    .line 65
    invoke-virtual {p0, v2}, Lkore/awt/datatransfer/MimeTypeParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    add-int/2addr v0, v3

    goto :goto_8

    .line 68
    :cond_23
    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 243
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method protected parse(Ljava/lang/String;)V
    .registers 12
    .param p1, "rawdata"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/MimeTypeParseException;
        }
    .end annotation

    .prologue
    const/16 v9, 0x22

    .line 113
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 114
    .local v4, "length":I
    if-lez v4, :cond_10e

    .line 115
    const/4 v7, 0x0

    invoke-static {p1, v7}, Lkore/awt/datatransfer/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 116
    .local v1, "currentIndex":I
    const/4 v3, 0x0

    .line 118
    .local v3, "lastIndex":I
    if-ge v1, v4, :cond_10e

    .line 119
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 120
    .local v0, "currentChar":C
    :cond_14
    :goto_14
    if-ge v1, v4, :cond_104

    const/16 v7, 0x3b

    if-ne v0, v7, :cond_104

    .line 126
    add-int/lit8 v1, v1, 0x1

    .line 131
    invoke-static {p1, v1}, Lkore/awt/datatransfer/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 133
    if-ge v1, v4, :cond_fc

    .line 135
    move v3, v1

    .line 136
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 137
    :goto_27
    if-ge v1, v4, :cond_36

    invoke-static {v0}, Lkore/awt/datatransfer/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v7

    if-eqz v7, :cond_36

    .line 138
    add-int/lit8 v1, v1, 0x1

    .line 139
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_27

    .line 141
    :cond_36
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    .line 146
    .local v5, "name":Ljava/lang/String;
    invoke-static {p1, v1}, Lkore/awt/datatransfer/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 148
    if-ge v1, v4, :cond_f4

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x3d

    if-ne v7, v8, :cond_f4

    .line 150
    add-int/lit8 v1, v1, 0x1

    .line 153
    invoke-static {p1, v1}, Lkore/awt/datatransfer/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 155
    if-ge v1, v4, :cond_db

    .line 157
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 158
    if-ne v0, v9, :cond_a2

    .line 160
    add-int/lit8 v1, v1, 0x1

    .line 161
    move v3, v1

    .line 163
    if-ge v1, v4, :cond_9a

    .line 165
    const/4 v2, 0x0

    .line 166
    .local v2, "foundit":Z
    :goto_60
    if-ge v1, v4, :cond_76

    if-nez v2, :cond_76

    .line 167
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 168
    const/16 v7, 0x5c

    if-ne v0, v7, :cond_6f

    .line 170
    add-int/lit8 v1, v1, 0x2

    goto :goto_60

    .line 171
    :cond_6f
    if-ne v0, v9, :cond_73

    .line 173
    const/4 v2, 0x1

    goto :goto_60

    .line 175
    :cond_73
    add-int/lit8 v1, v1, 0x1

    goto :goto_60

    .line 178
    :cond_76
    if-ne v0, v9, :cond_92

    .line 179
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lkore/awt/datatransfer/MimeTypeParameterList;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 181
    .local v6, "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 208
    :goto_82
    iget-object v7, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v7, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    invoke-static {p1, v1}, Lkore/awt/datatransfer/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 221
    if-ge v1, v4, :cond_14

    .line 222
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    goto :goto_14

    .line 183
    .end local v6    # "value":Ljava/lang/String;
    :cond_92
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v8, "Encountered unterminated quoted parameter value."

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 186
    .end local v2    # "foundit":Z
    :cond_9a
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v8, "Encountered unterminated quoted parameter value."

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 188
    :cond_a2
    invoke-static {v0}, Lkore/awt/datatransfer/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v7

    if-eqz v7, :cond_c2

    .line 190
    move v3, v1

    .line 191
    const/4 v2, 0x0

    .line 192
    .restart local v2    # "foundit":Z
    :goto_aa
    if-ge v1, v4, :cond_bd

    if-nez v2, :cond_bd

    .line 193
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 195
    invoke-static {v0}, Lkore/awt/datatransfer/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v7

    if-eqz v7, :cond_bb

    .line 196
    add-int/lit8 v1, v1, 0x1

    goto :goto_aa

    .line 198
    :cond_bb
    const/4 v2, 0x1

    goto :goto_aa

    .line 201
    :cond_bd
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .restart local v6    # "value":Ljava/lang/String;
    goto :goto_82

    .line 204
    .end local v2    # "foundit":Z
    .end local v6    # "value":Ljava/lang/String;
    :cond_c2
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unexpected character encountered at index "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 210
    :cond_db
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Couldn\'t find a value for parameter named "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 213
    :cond_f4
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v8, "Couldn\'t find the \'=\' that separates a parameter name from its value."

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 216
    .end local v5    # "name":Ljava/lang/String;
    :cond_fc
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v8, "Couldn\'t find parameter name"

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 225
    :cond_104
    if-ge v1, v4, :cond_10e

    .line 226
    new-instance v7, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v8, "More characters encountered in input than expected."

    invoke-direct {v7, v8}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 230
    .end local v0    # "currentChar":C
    .end local v1    # "currentIndex":I
    .end local v3    # "lastIndex":I
    :cond_10e
    return-void
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 266
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 259
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 260
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 236
    iget-object v0, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 278
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v3, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    mul-int/lit8 v3, v3, 0x10

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 280
    .local v0, "buffer":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v2

    .line 281
    .local v2, "keys":Ljava/util/Enumeration;
    :goto_13
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 282
    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 285
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 287
    iget-object v3, p0, Lkore/awt/datatransfer/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lkore/awt/datatransfer/MimeTypeParameterList;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_13

    .line 290
    .end local v1    # "key":Ljava/lang/String;
    :cond_3c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
