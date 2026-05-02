.class public Lcom/wutka/dtd/DTDEntity;
.super Ljava/lang/Object;
.source "DTDEntity.java"

# interfaces
.implements Lcom/wutka/dtd/DTDOutput;


# instance fields
.field public defaultLocation:Ljava/lang/Object;

.field public externalID:Lcom/wutka/dtd/DTDExternalID;

.field public isParsed:Z

.field public name:Ljava/lang/String;

.field public ndata:Ljava/lang/String;

.field public value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3
    .param p1, "aName"    # Ljava/lang/String;
    .param p2, "aDefaultLocation"    # Ljava/lang/Object;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "ob"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 145
    if-ne p1, p0, :cond_5

    .line 189
    :cond_4
    :goto_4
    return v1

    .line 146
    :cond_5
    instance-of v3, p1, Lcom/wutka/dtd/DTDEntity;

    if-nez v3, :cond_b

    move v1, v2

    goto :goto_4

    :cond_b
    move-object v0, p1

    .line 148
    check-cast v0, Lcom/wutka/dtd/DTDEntity;

    .line 150
    .local v0, "other":Lcom/wutka/dtd/DTDEntity;
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    if-nez v3, :cond_18

    .line 152
    iget-object v3, v0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    if-eqz v3, :cond_24

    move v1, v2

    goto :goto_4

    .line 156
    :cond_18
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_24

    move v1, v2

    goto :goto_4

    .line 159
    :cond_24
    iget-boolean v3, p0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    iget-boolean v4, v0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    if-eq v3, v4, :cond_2c

    move v1, v2

    goto :goto_4

    .line 162
    :cond_2c
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-nez v3, :cond_36

    .line 164
    iget-object v3, v0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-eqz v3, :cond_42

    move v1, v2

    goto :goto_4

    .line 168
    :cond_36
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_42

    move v1, v2

    goto :goto_4

    .line 171
    :cond_42
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    if-nez v3, :cond_4c

    .line 173
    iget-object v3, v0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    if-eqz v3, :cond_58

    move v1, v2

    goto :goto_4

    .line 177
    :cond_4c
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    iget-object v4, v0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    invoke-virtual {v3, v4}, Lcom/wutka/dtd/DTDExternalID;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_58

    move v1, v2

    goto :goto_4

    .line 180
    :cond_58
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    if-nez v3, :cond_62

    .line 182
    iget-object v3, v0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    goto :goto_4

    .line 186
    :cond_62
    iget-object v3, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    iget-object v4, v0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    goto :goto_4
.end method

.method public getExternalID()Lcom/wutka/dtd/DTDExternalID;
    .registers 2

    .prologue
    .line 237
    iget-object v0, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    return-object v0
.end method

.method public getExternalId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    iget-object v0, v0, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getNdata()Ljava/lang/String;
    .registers 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    return-object v0
.end method

.method public getReader()Ljava/io/Reader;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    if-nez v1, :cond_6

    .line 77
    const/4 v0, 0x0

    .line 82
    :goto_5
    return-object v0

    .line 80
    :cond_6
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    iget-object v1, v1, Lcom/wutka/dtd/DTDExternalID;->system:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/wutka/dtd/DTDEntity;->getReader(Ljava/lang/String;)Ljava/io/Reader;

    move-result-object v0

    .line 82
    .local v0, "rd":Ljava/io/Reader;
    goto :goto_5
.end method

.method public getReader(Ljava/lang/String;)Ljava/io/Reader;
    .registers 8
    .param p1, "entityName"    # Ljava/lang/String;

    .prologue
    .line 89
    :try_start_0
    iget-object v4, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    if-eqz v4, :cond_3c

    .line 91
    iget-object v4, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    instance-of v4, v4, Ljava/io/File;

    if-eqz v4, :cond_1e

    .line 93
    iget-object v2, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    check-cast v2, Ljava/io/File;

    .line 95
    .local v2, "loc":Ljava/io/File;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v4, v5}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 140
    .end local v2    # "loc":Ljava/io/File;
    :goto_1d
    return-object v0

    .line 100
    :cond_1e
    iget-object v4, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    instance-of v4, v4, Ljava/net/URL;

    if-eqz v4, :cond_3c

    .line 108
    new-instance v3, Ljava/net/URL;

    iget-object v4, p0, Lcom/wutka/dtd/DTDEntity;->defaultLocation:Ljava/lang/Object;

    check-cast v4, Ljava/net/URL;

    invoke-direct {v3, v4, p1}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 110
    .local v3, "url":Ljava/net/URL;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 113
    .local v0, "in":Ljava/io/BufferedReader;
    goto :goto_1d

    .line 116
    .end local v0    # "in":Ljava/io/BufferedReader;
    .end local v3    # "url":Ljava/net/URL;
    :cond_3c
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_46} :catch_47

    .line 119
    .restart local v0    # "in":Ljava/io/BufferedReader;
    goto :goto_1d

    .line 121
    .end local v0    # "in":Ljava/io/BufferedReader;
    :catch_47
    move-exception v4

    .line 127
    :try_start_48
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 129
    .restart local v3    # "url":Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v1

    .line 131
    .local v1, "inStream":Ljava/io/InputStream;
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_5b} :catch_5c

    .line 134
    .restart local v0    # "in":Ljava/io/BufferedReader;
    goto :goto_1d

    .line 136
    .end local v0    # "in":Ljava/io/BufferedReader;
    .end local v1    # "inStream":Ljava/io/InputStream;
    .end local v3    # "url":Ljava/net/URL;
    :catch_5c
    move-exception v4

    .line 140
    const/4 v0, 0x0

    goto :goto_1d
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isParsed()Z
    .registers 2

    .prologue
    .line 213
    iget-boolean v0, p0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    return v0
.end method

.method public setExternalID(Lcom/wutka/dtd/DTDExternalID;)V
    .registers 2
    .param p1, "anExternalID"    # Lcom/wutka/dtd/DTDExternalID;

    .prologue
    .line 231
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    .line 232
    return-void
.end method

.method public setIsParsed(Z)V
    .registers 2
    .param p1, "flag"    # Z

    .prologue
    .line 207
    iput-boolean p1, p0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    .line 208
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "aName"    # Ljava/lang/String;

    .prologue
    .line 195
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    .line 196
    return-void
.end method

.method public setNdata(Ljava/lang/String;)V
    .registers 2
    .param p1, "anNdata"    # Ljava/lang/String;

    .prologue
    .line 243
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    .line 244
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .registers 2
    .param p1, "aValue"    # Ljava/lang/String;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    .line 220
    return-void
.end method

.method public write(Ljava/io/PrintWriter;)V
    .registers 4
    .param p1, "out"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    const-string v1, "<!ENTITY "

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 40
    iget-boolean v1, p0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    if-eqz v1, :cond_e

    .line 42
    const-string v1, " % "

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 44
    :cond_e
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 46
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-eqz v1, :cond_34

    .line 48
    const/16 v0, 0x22

    .line 49
    .local v0, "quoteChar":C
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_23

    const/16 v0, 0x27

    .line 50
    :cond_23
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(C)V

    .line 51
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 52
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->print(C)V

    .line 63
    .end local v0    # "quoteChar":C
    :cond_2e
    :goto_2e
    const-string v1, ">"

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 64
    return-void

    .line 56
    :cond_34
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    invoke-virtual {v1, p1}, Lcom/wutka/dtd/DTDExternalID;->write(Ljava/io/PrintWriter;)V

    .line 57
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    if-eqz v1, :cond_2e

    .line 59
    const-string v1, " NDATA "

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 60
    iget-object v1, p0, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    goto :goto_2e
.end method
