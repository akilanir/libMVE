.class public Lkorex/mail/internet/ContentType;
.super Ljava/lang/Object;
.source "ContentType.java"


# instance fields
.field private list:Lkorex/mail/internet/ParameterList;

.field private primaryType:Ljava/lang/String;

.field private subType:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 8
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/ParseException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Lkorex/mail/internet/HeaderTokenizer;

    const-string v3, "()<>@,;:\\\"\t []/?="

    invoke-direct {v0, p1, v3}, Lkorex/mail/internet/HeaderTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .local v0, "h":Lkorex/mail/internet/HeaderTokenizer;
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v2

    .line 95
    .local v2, "tk":Lkorex/mail/internet/HeaderTokenizer$Token;
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v3

    if-eq v3, v5, :cond_42

    .line 96
    new-instance v3, Lkorex/mail/internet/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In Content-Type string <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", expected MIME type, got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 98
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 99
    :cond_42
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    .line 102
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v2

    .line 103
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v3

    int-to-char v3, v3

    const/16 v4, 0x2f

    if-eq v3, v4, :cond_82

    .line 104
    new-instance v3, Lkorex/mail/internet/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In Content-Type string <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", expected \'/\', got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 105
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 108
    :cond_82
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->next()Lkorex/mail/internet/HeaderTokenizer$Token;

    move-result-object v2

    .line 109
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getType()I

    move-result v3

    if-eq v3, v5, :cond_b9

    .line 110
    new-instance v3, Lkorex/mail/internet/ParseException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "In Content-Type string <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ">"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", expected MIME subtype, got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 112
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lkorex/mail/internet/ParseException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 113
    :cond_b9
    invoke-virtual {v2}, Lkorex/mail/internet/HeaderTokenizer$Token;->getValue()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    .line 116
    invoke-virtual {v0}, Lkorex/mail/internet/HeaderTokenizer;->getRemainder()Ljava/lang/String;

    move-result-object v1

    .line 117
    .local v1, "rem":Ljava/lang/String;
    if-eqz v1, :cond_cc

    .line 118
    new-instance v3, Lkorex/mail/internet/ParameterList;

    invoke-direct {v3, v1}, Lkorex/mail/internet/ParameterList;-><init>(Ljava/lang/String;)V

    iput-object v3, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    .line 119
    :cond_cc
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lkorex/mail/internet/ParameterList;)V
    .registers 4
    .param p1, "primaryType"    # Ljava/lang/String;
    .param p2, "subType"    # Ljava/lang/String;
    .param p3, "list"    # Lkorex/mail/internet/ParameterList;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    .line 77
    iput-object p2, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    .line 78
    iput-object p3, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    .line 79
    return-void
.end method


# virtual methods
.method public getBaseType()Ljava/lang/String;
    .registers 3

    .prologue
    .line 145
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 146
    :cond_8
    const-string v0, ""

    .line 147
    :goto_a
    return-object v0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 158
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    if-nez v0, :cond_6

    .line 159
    const/4 v0, 0x0

    .line 161
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0, p1}, Lkorex/mail/internet/ParameterList;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5
.end method

.method public getParameterList()Lkorex/mail/internet/ParameterList;
    .registers 2

    .prologue
    .line 171
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    return-object v0
.end method

.method public getPrimaryType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    return-object v0
.end method

.method public getSubType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 134
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    return-object v0
.end method

.method public match(Ljava/lang/String;)Z
    .registers 4
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 293
    :try_start_0
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-direct {v1, p1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lkorex/mail/internet/ContentType;->match(Lkorex/mail/internet/ContentType;)Z
    :try_end_8
    .catch Lkorex/mail/internet/ParseException; {:try_start_0 .. :try_end_8} :catch_a

    move-result v1

    .line 295
    :goto_9
    return v1

    .line 294
    :catch_a
    move-exception v0

    .line 295
    .local v0, "pex":Lkorex/mail/internet/ParseException;
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public match(Lkorex/mail/internet/ContentType;)Z
    .registers 7
    .param p1, "cType"    # Lkorex/mail/internet/ContentType;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 255
    iget-object v3, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    if-nez v3, :cond_c

    invoke-virtual {p1}, Lkorex/mail/internet/ContentType;->getPrimaryType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_1d

    :cond_c
    iget-object v3, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    if-eqz v3, :cond_1c

    iget-object v3, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    .line 257
    invoke-virtual {p1}, Lkorex/mail/internet/ContentType;->getPrimaryType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1d

    .line 269
    :cond_1c
    :goto_1c
    return v1

    .line 260
    :cond_1d
    invoke-virtual {p1}, Lkorex/mail/internet/ContentType;->getSubType()Ljava/lang/String;

    move-result-object v0

    .line 263
    .local v0, "sType":Ljava/lang/String;
    iget-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    if-eqz v3, :cond_2f

    iget-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    const-string v4, "*"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_39

    :cond_2f
    if-eqz v0, :cond_3b

    const-string v3, "*"

    .line 264
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3b

    :cond_39
    move v1, v2

    .line 265
    goto :goto_1c

    .line 268
    :cond_3b
    iget-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    if-nez v3, :cond_41

    if-eqz v0, :cond_4d

    :cond_41
    iget-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    if-eqz v3, :cond_1c

    iget-object v3, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    .line 269
    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1c

    :cond_4d
    move v1, v2

    goto :goto_1c
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    if-nez v0, :cond_b

    .line 199
    new-instance v0, Lkorex/mail/internet/ParameterList;

    invoke-direct {v0}, Lkorex/mail/internet/ParameterList;-><init>()V

    iput-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    .line 201
    :cond_b
    iget-object v0, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0, p1, p2}, Lkorex/mail/internet/ParameterList;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public setParameterList(Lkorex/mail/internet/ParameterList;)V
    .registers 2
    .param p1, "list"    # Lkorex/mail/internet/ParameterList;

    .prologue
    .line 209
    iput-object p1, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    .line 210
    return-void
.end method

.method public setPrimaryType(Ljava/lang/String;)V
    .registers 2
    .param p1, "primaryType"    # Ljava/lang/String;

    .prologue
    .line 179
    iput-object p1, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    .line 180
    return-void
.end method

.method public setSubType(Ljava/lang/String;)V
    .registers 2
    .param p1, "subType"    # Ljava/lang/String;

    .prologue
    .line 187
    iput-object p1, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    .line 188
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 220
    iget-object v1, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    if-eqz v1, :cond_8

    iget-object v1, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    if-nez v1, :cond_b

    .line 221
    :cond_8
    const-string v1, ""

    .line 231
    :goto_a
    return-object v1

    .line 223
    :cond_b
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 224
    .local v0, "sb":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lkorex/mail/internet/ContentType;->primaryType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x2f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lkorex/mail/internet/ContentType;->subType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 225
    iget-object v1, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    if-eqz v1, :cond_34

    .line 229
    iget-object v1, p0, Lkorex/mail/internet/ContentType;->list:Lkorex/mail/internet/ParameterList;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0xe

    invoke-virtual {v1, v2}, Lkorex/mail/internet/ParameterList;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 231
    :cond_34
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method
