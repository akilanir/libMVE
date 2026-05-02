.class public Lkorex/activation/MimeType;
.super Ljava/lang/Object;
.source "MimeType.java"

# interfaces
.implements Ljava/io/Externalizable;


# static fields
.field private static final TSPECIALS:Ljava/lang/String; = "()<>@,;:/[]?=\\\""


# instance fields
.field private parameters:Lkorex/activation/MimeTypeParameterList;

.field private primaryType:Ljava/lang/String;

.field private subType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-string v0, "application"

    iput-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    .line 55
    const-string v0, "*"

    iput-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 56
    new-instance v0, Lkorex/activation/MimeTypeParameterList;

    invoke-direct {v0}, Lkorex/activation/MimeTypeParameterList;-><init>()V

    iput-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "rawdata"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-direct {p0, p1}, Lkorex/activation/MimeType;->parse(Ljava/lang/String;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "primary"    # Ljava/lang/String;
    .param p2, "sub"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    invoke-direct {p0, p1}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 80
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    .line 86
    invoke-direct {p0, p2}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 87
    invoke-virtual {p2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 92
    new-instance v0, Lkorex/activation/MimeTypeParameterList;

    invoke-direct {v0}, Lkorex/activation/MimeTypeParameterList;-><init>()V

    iput-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    .line 93
    return-void

    .line 82
    :cond_23
    new-instance v0, Lkorex/activation/MimeTypeParseException;

    const-string v1, "Primary type is invalid."

    invoke-direct {v0, v1}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_2b
    new-instance v0, Lkorex/activation/MimeTypeParseException;

    const-string v1, "Sub type is invalid."

    invoke-direct {v0, v1}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isTokenChar(C)Z
    .registers 2
    .param p0, "c"    # C

    .prologue
    .line 305
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

.method private isValidToken(Ljava/lang/String;)Z
    .registers 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 312
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 313
    .local v2, "len":I
    if-lez v2, :cond_14

    .line 314
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v2, :cond_18

    .line 315
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 316
    .local v0, "c":C
    invoke-static {v0}, Lkorex/activation/MimeType;->isTokenChar(C)Z

    move-result v4

    if-nez v4, :cond_15

    .line 322
    .end local v0    # "c":C
    .end local v1    # "i":I
    :cond_14
    :goto_14
    return v3

    .line 314
    .restart local v0    # "c":C
    .restart local v1    # "i":I
    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 320
    .end local v0    # "c":C
    :cond_18
    const/4 v3, 0x1

    goto :goto_14
.end method

.method private parse(Ljava/lang/String;)V
    .registers 6
    .param p1, "rawdata"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 99
    const/16 v2, 0x2f

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 100
    .local v1, "slashIndex":I
    const/16 v2, 0x3b

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 101
    .local v0, "semIndex":I
    if-gez v1, :cond_19

    if-gez v0, :cond_19

    .line 104
    new-instance v2, Lkorex/activation/MimeTypeParseException;

    const-string v3, "Unable to find a sub type."

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 105
    :cond_19
    if-gez v1, :cond_25

    if-ltz v0, :cond_25

    .line 108
    new-instance v2, Lkorex/activation/MimeTypeParseException;

    const-string v3, "Unable to find a sub type."

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 109
    :cond_25
    if-ltz v1, :cond_5e

    if-gez v0, :cond_5e

    .line 111
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    .line 112
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 113
    new-instance v2, Lkorex/activation/MimeTypeParameterList;

    invoke-direct {v2}, Lkorex/activation/MimeTypeParameterList;-><init>()V

    iput-object v2, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    .line 129
    :goto_4e
    iget-object v2, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    invoke-direct {p0, v2}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_92

    .line 130
    new-instance v2, Lkorex/activation/MimeTypeParseException;

    const-string v3, "Primary type is invalid."

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 114
    :cond_5e
    if-ge v1, v0, :cond_8a

    .line 116
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    .line 117
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 118
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 119
    new-instance v2, Lkorex/activation/MimeTypeParameterList;

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParameterList;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    goto :goto_4e

    .line 123
    :cond_8a
    new-instance v2, Lkorex/activation/MimeTypeParseException;

    const-string v3, "Unable to find a sub type."

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 133
    :cond_92
    iget-object v2, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    invoke-direct {p0, v2}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a2

    .line 134
    new-instance v2, Lkorex/activation/MimeTypeParseException;

    const-string v3, "Sub type is invalid."

    invoke-direct {v2, v3}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 135
    :cond_a2
    return-void
.end method


# virtual methods
.method public getBaseType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 237
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    invoke-virtual {v0, p1}, Lkorex/activation/MimeTypeParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParameters()Lkorex/activation/MimeTypeParameterList;
    .registers 2

    .prologue
    .line 189
    iget-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    return-object v0
.end method

.method public getPrimaryType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 143
    iget-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    return-object v0
.end method

.method public getSubType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 166
    iget-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    return-object v0
.end method

.method public match(Ljava/lang/String;)Z
    .registers 3
    .param p1, "rawdata"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 262
    new-instance v0, Lkorex/activation/MimeType;

    invoke-direct {v0, p1}, Lkorex/activation/MimeType;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lkorex/activation/MimeType;->match(Lkorex/activation/MimeType;)Z

    move-result v0

    return v0
.end method

.method public match(Lkorex/activation/MimeType;)Z
    .registers 4
    .param p1, "type"    # Lkorex/activation/MimeType;

    .prologue
    .line 248
    iget-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    invoke-virtual {p1}, Lkorex/activation/MimeType;->getPrimaryType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    const-string v1, "*"

    .line 249
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    .line 250
    invoke-virtual {p1}, Lkorex/activation/MimeType;->getSubType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 251
    invoke-virtual {p1}, Lkorex/activation/MimeType;->getSubType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    :cond_2e
    const/4 v0, 0x1

    :goto_2f
    return v0

    :cond_30
    const/4 v0, 0x0

    goto :goto_2f
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 5
    .param p1, "in"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 293
    :try_start_0
    invoke-interface {p1}, Ljava/io/ObjectInput;->readUTF()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lkorex/activation/MimeType;->parse(Ljava/lang/String;)V
    :try_end_7
    .catch Lkorex/activation/MimeTypeParseException; {:try_start_0 .. :try_end_7} :catch_8

    .line 297
    return-void

    .line 294
    :catch_8
    move-exception v0

    .line 295
    .local v0, "e":Lkorex/activation/MimeTypeParseException;
    new-instance v1, Ljava/io/IOException;

    invoke-virtual {v0}, Lkorex/activation/MimeTypeParseException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public removeParameter(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 220
    iget-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    invoke-virtual {v0, p1}, Lkorex/activation/MimeTypeParameterList;->remove(Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 211
    iget-object v0, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    invoke-virtual {v0, p1, p2}, Lkorex/activation/MimeTypeParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public setPrimaryType(Ljava/lang/String;)V
    .registers 4
    .param p1, "primary"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 155
    iget-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    invoke-direct {p0, v0}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 156
    new-instance v0, Lkorex/activation/MimeTypeParseException;

    const-string v1, "Primary type is invalid."

    invoke-direct {v0, v1}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 157
    :cond_10
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/MimeType;->primaryType:Ljava/lang/String;

    .line 158
    return-void
.end method

.method public setSubType(Ljava/lang/String;)V
    .registers 4
    .param p1, "sub"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/activation/MimeTypeParseException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    invoke-direct {p0, v0}, Lkorex/activation/MimeType;->isValidToken(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_10

    .line 179
    new-instance v0, Lkorex/activation/MimeTypeParseException;

    const-string v1, "Sub type is invalid."

    invoke-direct {v0, v1}, Lkorex/activation/MimeTypeParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_10
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lkorex/activation/MimeType;->subType:Ljava/lang/String;

    .line 181
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lkorex/activation/MimeType;->getBaseType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkorex/activation/MimeType;->parameters:Lkorex/activation/MimeTypeParameterList;

    invoke-virtual {v1}, Lkorex/activation/MimeTypeParameterList;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
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
    .line 275
    invoke-virtual {p0}, Lkorex/activation/MimeType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeUTF(Ljava/lang/String;)V

    .line 276
    invoke-interface {p1}, Ljava/io/ObjectOutput;->flush()V

    .line 277
    return-void
.end method
