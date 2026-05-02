.class Lkore/awt/datatransfer/MimeType;
.super Ljava/lang/Object;
.source "MimeType.java"

# interfaces
.implements Ljava/io/Externalizable;


# instance fields
.field private parameters:Ljava/util/HashMap;

.field private primaryType:Ljava/lang/String;

.field private subType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    .line 85
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "mime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-direct {p0}, Lkore/awt/datatransfer/MimeType;-><init>()V

    .line 94
    invoke-direct {p0, p1}, Lkore/awt/datatransfer/MimeType;->parse(Ljava/lang/String;)V

    .line 95
    return-void
.end method

.method private parse(Ljava/lang/String;)V
    .registers 10
    .param p1, "mime"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkore/awt/datatransfer/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 231
    new-instance v4, Ljava/util/StringTokenizer;

    invoke-direct {v4, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 233
    .local v4, "tokenizer":Ljava/util/StringTokenizer;
    :try_start_5
    const-string v6, "/"

    invoke-virtual {v4, v6}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    .line 234
    const-string v6, "/;"

    invoke-virtual {v4, v6}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;
    :try_end_15
    .catch Ljava/util/NoSuchElementException; {:try_start_5 .. :try_end_15} :catch_32

    .line 240
    :goto_15
    invoke-virtual {v4}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v6

    if-eqz v6, :cond_54

    .line 241
    const-string v6, ";"

    invoke-virtual {v4, v6}, Ljava/util/StringTokenizer;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 242
    .local v3, "keyValuePair":Ljava/lang/String;
    const/16 v6, 0x3d

    invoke-virtual {v3, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 243
    .local v1, "i":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_3b

    .line 244
    new-instance v6, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v7, "Expected = as parameter separator"

    invoke-direct {v6, v7}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 235
    .end local v1    # "i":I
    .end local v3    # "keyValuePair":Ljava/lang/String;
    :catch_32
    move-exception v0

    .line 236
    .local v0, "ex":Ljava/util/NoSuchElementException;
    new-instance v6, Lkore/awt/datatransfer/MimeTypeParseException;

    const-string v7, "Expected / separator"

    invoke-direct {v6, v7}, Lkore/awt/datatransfer/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 245
    .end local v0    # "ex":Ljava/util/NoSuchElementException;
    .restart local v1    # "i":I
    .restart local v3    # "keyValuePair":Ljava/lang/String;
    :cond_3b
    const/4 v6, 0x0

    invoke-virtual {v3, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 246
    .local v2, "key":Ljava/lang/String;
    add-int/lit8 v6, v1, 0x1

    invoke-virtual {v3, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 247
    .local v5, "value":Ljava/lang/String;
    iget-object v6, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v6, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15

    .line 249
    .end local v1    # "i":I
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "keyValuePair":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_54
    return-void
.end method


# virtual methods
.method addParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "param"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 104
    iget-object v0, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    return-void
.end method

.method getBaseType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 124
    iget-object v0, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method getPrimaryType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    return-object v0
.end method

.method getSubType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    return-object v0
.end method

.method matches(Lkore/awt/datatransfer/MimeType;)Z
    .registers 5
    .param p1, "other"    # Lkore/awt/datatransfer/MimeType;

    .prologue
    .line 160
    const/4 v0, 0x0

    .line 161
    .local v0, "match":Z
    if-eqz p1, :cond_2c

    .line 162
    iget-object v1, p0, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    iget-object v2, p1, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    iget-object v1, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    iget-object v1, p1, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    const-string v2, "*"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    iget-object v1, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    iget-object v2, p1, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    :cond_2b
    const/4 v0, 0x1

    .line 164
    :cond_2c
    :goto_2c
    return v0

    .line 162
    :cond_2d
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 6
    .param p1, "in"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 177
    invoke-interface {p1}, Ljava/io/ObjectInput;->readUTF()Ljava/lang/String;

    move-result-object v2

    .line 178
    .local v2, "mime":Ljava/lang/String;
    iget-object v3, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 180
    :try_start_9
    invoke-direct {p0, v2}, Lkore/awt/datatransfer/MimeType;->parse(Ljava/lang/String;)V
    :try_end_c
    .catch Lkore/awt/datatransfer/MimeTypeParseException; {:try_start_9 .. :try_end_c} :catch_d

    .line 186
    return-void

    .line 181
    :catch_d
    move-exception v0

    .line 182
    .local v0, "ex":Lkore/awt/datatransfer/MimeTypeParseException;
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    .line 183
    .local v1, "ioEx":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 184
    throw v1
.end method

.method removeParameter(Ljava/lang/String;)V
    .registers 3
    .param p1, "param"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v0, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 205
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .local v3, "s":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lkore/awt/datatransfer/MimeType;->primaryType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    const/16 v4, 0x2f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 208
    iget-object v4, p0, Lkore/awt/datatransfer/MimeType;->subType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    iget-object v4, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->size()I

    move-result v4

    if-lez v4, :cond_4b

    .line 210
    iget-object v4, p0, Lkore/awt/datatransfer/MimeType;->parameters:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 211
    .local v0, "entries":Ljava/util/Set;
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_26
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4b

    .line 212
    const-string v4, "; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 214
    .local v1, "entry":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 215
    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 216
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_26

    .line 219
    .end local v0    # "entries":Ljava/util/Set;
    .end local v1    # "entry":Ljava/util/Map$Entry;
    .end local v2    # "i":Ljava/util/Iterator;
    :cond_4b
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-virtual {p0}, Lkore/awt/datatransfer/MimeType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeUTF(Ljava/lang/String;)V

    .line 197
    return-void
.end method
