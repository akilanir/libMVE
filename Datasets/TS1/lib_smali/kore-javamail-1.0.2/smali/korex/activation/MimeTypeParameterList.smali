.class public Lkorex/activation/MimeTypeParameterList;
.super Ljava/lang/Object;
.source "MimeTypeParameterList.java"


# static fields
.field private static final TSPECIALS:Ljava/lang/String; = "()<>@,;:/[]?=\\\""


# instance fields
.field private parameters:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "parameterList"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    .line 68
    invoke-virtual {p0, p1}, Lkorex/activation/MimeTypeParameterList;->parse(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method private static isTokenChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 265
    const/16 v0, 0x20

    if-le p0, v0, :cond_12

    const/16 v0, 0x7f

    if-ge p0, v0, :cond_12

    const-string v0, "()<>@,;:/[]?=\\\""

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

    .line 283
    const/4 v4, 0x0

    .line 286
    .local v4, "needsQuotes":Z
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    .line 287
    .local v3, "length":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a
    if-ge v2, v3, :cond_1e

    if-nez v4, :cond_1e

    .line 288
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lkorex/activation/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v5

    if-nez v5, :cond_1c

    const/4 v4, 0x1

    .line 287
    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 288
    :cond_1c
    const/4 v4, 0x0

    goto :goto_19

    .line 291
    :cond_1e
    if-eqz v4, :cond_4b

    .line 292
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 293
    .local v0, "buffer":Ljava/lang/StringBuffer;
    int-to-double v5, v3

    const-wide/high16 v7, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v5, v7

    double-to-int v5, v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->ensureCapacity(I)V

    .line 296
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 299
    const/4 v2, 0x0

    :goto_31
    if-ge v2, v3, :cond_44

    .line 300
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 301
    .local v1, "c":C
    if-eq v1, v10, :cond_3b

    if-ne v1, v9, :cond_3e

    .line 302
    :cond_3b
    invoke-virtual {v0, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 303
    :cond_3e
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 299
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 307
    .end local v1    # "c":C
    :cond_44
    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 309
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .line 311
    .end local v0    # "buffer":Ljava/lang/StringBuffer;
    .end local p0    # "value":Ljava/lang/String;
    :cond_4b
    return-object p0
.end method

.method private static skipWhiteSpace(Ljava/lang/String;I)I
    .registers 4
    .param p0, "rawdata"    # Ljava/lang/String;
    .param p1, "i"    # I

    .prologue
    .line 273
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .line 274
    .local v0, "length":I
    :goto_4
    if-ge p1, v0, :cond_13

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 275
    add-int/lit8 p1, p1, 0x1

    goto :goto_4

    .line 276
    :cond_13
    return p1
.end method

.method private static unquote(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 320
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    .line 321
    .local v4, "valueLength":I
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 322
    .local v0, "buffer":Ljava/lang/StringBuffer;
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->ensureCapacity(I)V

    .line 324
    const/4 v2, 0x0

    .line 325
    .local v2, "escaped":Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_e
    if-ge v3, v4, :cond_29

    .line 326
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 327
    .local v1, "currentChar":C
    if-nez v2, :cond_20

    const/16 v5, 0x5c

    if-eq v1, v5, :cond_20

    .line 328
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 325
    :goto_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_e

    .line 329
    :cond_20
    if-eqz v2, :cond_27

    .line 330
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 331
    const/4 v2, 0x0

    goto :goto_1d

    .line 333
    :cond_27
    const/4 v2, 0x1

    goto :goto_1d

    .line 337
    .end local v1    # "currentChar":C
    :cond_29
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 207
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

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
    .line 236
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->isEmpty()Z

    move-result v0

    return v0
.end method

.method protected parse(Ljava/lang/String;)V
    .registers 11
    .param p1, "parameterList"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    const/16 v8, 0x22

    .line 77
    if-nez p1, :cond_5

    .line 179
    :cond_4
    return-void

    .line 80
    :cond_5
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 81
    .local v3, "length":I
    if-lez v3, :cond_4

    .line 86
    const/4 v6, 0x0

    invoke-static {p1, v6}, Lkorex/activation/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 87
    .local v1, "i":I
    :goto_10
    if-ge v1, v3, :cond_e8

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .local v0, "c":C
    const/16 v6, 0x3b

    if-ne v0, v6, :cond_e8

    .line 94
    add-int/lit8 v1, v1, 0x1

    .line 99
    invoke-static {p1, v1}, Lkorex/activation/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 102
    if-ge v1, v3, :cond_4

    .line 106
    move v2, v1

    .line 107
    .local v2, "lastIndex":I
    :goto_23
    if-ge v1, v3, :cond_32

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lkorex/activation/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v6

    if-eqz v6, :cond_32

    .line 108
    add-int/lit8 v1, v1, 0x1

    goto :goto_23

    .line 110
    :cond_32
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    .line 113
    .local v4, "name":Ljava/lang/String;
    invoke-static {p1, v1}, Lkorex/activation/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 115
    if-ge v1, v3, :cond_48

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x3d

    if-eq v6, v7, :cond_50

    .line 116
    :cond_48
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    const-string v7, "Couldn\'t find the \'=\' that separates a parameter name from its value."

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 121
    :cond_50
    add-int/lit8 v1, v1, 0x1

    .line 122
    invoke-static {p1, v1}, Lkorex/activation/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    .line 124
    if-lt v1, v3, :cond_71

    .line 125
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Couldn\'t find a value for parameter named "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 129
    :cond_71
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 130
    if-ne v0, v8, :cond_b4

    .line 132
    add-int/lit8 v1, v1, 0x1

    .line 133
    if-lt v1, v3, :cond_83

    .line 134
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    const-string v7, "Encountered unterminated quoted parameter value."

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 137
    :cond_83
    move v2, v1

    .line 140
    :goto_84
    if-ge v1, v3, :cond_8c

    .line 141
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 142
    if-ne v0, v8, :cond_96

    .line 152
    :cond_8c
    if-eq v0, v8, :cond_9f

    .line 153
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    const-string v7, "Encountered unterminated quoted parameter value."

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 144
    :cond_96
    const/16 v6, 0x5c

    if-ne v0, v6, :cond_9c

    .line 148
    add-int/lit8 v1, v1, 0x1

    .line 150
    :cond_9c
    add-int/lit8 v1, v1, 0x1

    goto :goto_84

    .line 156
    :cond_9f
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lkorex/activation/MimeTypeParameterList;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 158
    .local v5, "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    .line 173
    :goto_a9
    iget-object v6, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v6, v4, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    invoke-static {p1, v1}, Lkorex/activation/MimeTypeParameterList;->skipWhiteSpace(Ljava/lang/String;I)I

    move-result v1

    goto/16 :goto_10

    .line 159
    .end local v5    # "value":Ljava/lang/String;
    :cond_b4
    invoke-static {v0}, Lkorex/activation/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v6

    if-eqz v6, :cond_cf

    .line 162
    move v2, v1

    .line 163
    :goto_bb
    if-ge v1, v3, :cond_ca

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lkorex/activation/MimeTypeParameterList;->isTokenChar(C)Z

    move-result v6

    if-eqz v6, :cond_ca

    .line 164
    add-int/lit8 v1, v1, 0x1

    goto :goto_bb

    .line 165
    :cond_ca
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "value":Ljava/lang/String;
    goto :goto_a9

    .line 168
    .end local v5    # "value":Ljava/lang/String;
    :cond_cf
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unexpected character encountered at index "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 175
    .end local v0    # "c":C
    .end local v2    # "lastIndex":I
    .end local v4    # "name":Ljava/lang/String;
    :cond_e8
    if-ge v1, v3, :cond_4

    .line 176
    new-instance v6, Lkorex/activation/MimeTypeParseException;

    const-string v7, "More characters encountered in input than expected."

    invoke-direct {v6, v7}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public remove(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 227
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    return-void
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 218
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 187
    iget-object v0, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 243
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 244
    .local v0, "buffer":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v3

    mul-int/lit8 v3, v3, 0x10

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->ensureCapacity(I)V

    .line 247
    iget-object v3, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3}, Ljava/util/Hashtable;->keys()Ljava/util/Enumeration;

    move-result-object v2

    .line 248
    .local v2, "keys":Ljava/util/Enumeration;
    :goto_16
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 249
    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 250
    .local v1, "key":Ljava/lang/String;
    const-string v3, "; "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 251
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 252
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 253
    iget-object v3, p0, Lkorex/activation/MimeTypeParameterList;->parameters:Ljava/util/Hashtable;

    invoke-virtual {v3, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Lkorex/activation/MimeTypeParameterList;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_16

    .line 256
    .end local v1    # "key":Ljava/lang/String;
    :cond_3f
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
