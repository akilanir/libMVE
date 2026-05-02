.class public abstract Lezvcard/io/StreamWriter;
.super Ljava/lang/Object;
.source "StreamWriter.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field protected addProdId:Z

.field protected index:Lezvcard/io/scribe/ScribeIndex;

.field protected versionStrict:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Lezvcard/io/scribe/ScribeIndex;

    invoke-direct {v0}, Lezvcard/io/scribe/ScribeIndex;-><init>()V

    iput-object v0, p0, Lezvcard/io/StreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    .line 57
    iput-boolean v1, p0, Lezvcard/io/StreamWriter;->addProdId:Z

    .line 58
    iput-boolean v1, p0, Lezvcard/io/StreamWriter;->versionStrict:Z

    return-void
.end method

.method private prepare(Lezvcard/VCard;)Ljava/util/List;
    .registers 15
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            ")",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;"
        }
    .end annotation

    .prologue
    .line 168
    invoke-virtual {p0}, Lezvcard/io/StreamWriter;->getTargetVersion()Lezvcard/VCardVersion;

    move-result-object v8

    .line 169
    .local v8, "targetVersion":Lezvcard/VCardVersion;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v6, "propertiesToAdd":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 171
    .local v9, "unregistered":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Lezvcard/property/VCardProperty;>;>;"
    invoke-virtual {p1}, Lezvcard/VCard;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_7d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lezvcard/property/VCardProperty;

    .line 172
    .local v7, "property":Lezvcard/property/VCardProperty;
    iget-boolean v10, p0, Lezvcard/io/StreamWriter;->addProdId:Z

    if-eqz v10, :cond_26

    instance-of v10, v7, Lezvcard/property/ProductId;

    if-nez v10, :cond_12

    .line 177
    :cond_26
    iget-boolean v10, p0, Lezvcard/io/StreamWriter;->versionStrict:Z

    if-eqz v10, :cond_34

    invoke-virtual {v7}, Lezvcard/property/VCardProperty;->getSupportedVersions()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_12

    .line 183
    :cond_34
    iget-object v10, p0, Lezvcard/io/StreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v10, v7}, Lezvcard/io/scribe/ScribeIndex;->hasPropertyScribe(Lezvcard/property/VCardProperty;)Z

    move-result v10

    if-nez v10, :cond_44

    .line 184
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 188
    :cond_44
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    instance-of v10, v7, Lezvcard/property/Address;

    if-eqz v10, :cond_12

    sget-object v10, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-eq v8, v10, :cond_53

    sget-object v10, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    if-ne v8, v10, :cond_12

    :cond_53
    move-object v0, v7

    .line 192
    check-cast v0, Lezvcard/property/Address;

    .line 193
    .local v0, "adr":Lezvcard/property/Address;
    invoke-virtual {v0}, Lezvcard/property/Address;->getLabel()Ljava/lang/String;

    move-result-object v5

    .line 194
    .local v5, "labelStr":Ljava/lang/String;
    if-eqz v5, :cond_12

    .line 198
    new-instance v4, Lezvcard/property/Label;

    invoke-direct {v4, v5}, Lezvcard/property/Label;-><init>(Ljava/lang/String;)V

    .line 199
    .local v4, "label":Lezvcard/property/Label;
    invoke-virtual {v0}, Lezvcard/property/Address;->getTypes()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_69
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_79

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lezvcard/parameter/AddressType;

    .line 200
    .local v1, "adrType":Lezvcard/parameter/AddressType;
    invoke-virtual {v4, v1}, Lezvcard/property/Label;->addType(Lezvcard/parameter/AddressType;)V

    goto :goto_69

    .line 202
    .end local v1    # "adrType":Lezvcard/parameter/AddressType;
    :cond_79
    invoke-interface {v6, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_12

    .line 206
    .end local v0    # "adr":Lezvcard/property/Address;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "label":Lezvcard/property/Label;
    .end local v5    # "labelStr":Ljava/lang/String;
    .end local v7    # "property":Lezvcard/property/VCardProperty;
    :cond_7d
    invoke-interface {v9}, Ljava/util/Set;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_9c

    .line 208
    new-instance v10, Ljava/lang/IllegalArgumentException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "No scribes were found the following property classes: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 212
    :cond_9c
    iget-boolean v10, p0, Lezvcard/io/StreamWriter;->addProdId:Z

    if-eqz v10, :cond_c3

    .line 214
    sget-object v10, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    if-ne v8, v10, :cond_c4

    .line 215
    new-instance v7, Lezvcard/property/RawProperty;

    const-string v10, "X-PRODID"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "ez-vcard "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-object v12, Lezvcard/Ezvcard;->VERSION:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v7, v10, v11}, Lezvcard/property/RawProperty;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .restart local v7    # "property":Lezvcard/property/VCardProperty;
    :goto_c0
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 222
    .end local v7    # "property":Lezvcard/property/VCardProperty;
    :cond_c3
    return-object v6

    .line 217
    :cond_c4
    new-instance v7, Lezvcard/property/ProductId;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ez-vcard "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lezvcard/Ezvcard;->VERSION:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v7, v10}, Lezvcard/property/ProductId;-><init>(Ljava/lang/String;)V

    .restart local v7    # "property":Lezvcard/property/VCardProperty;
    goto :goto_c0
.end method


# virtual methods
.method protected abstract _write(Lezvcard/VCard;Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getScribeIndex()Lezvcard/io/scribe/ScribeIndex;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lezvcard/io/StreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    return-object v0
.end method

.method protected abstract getTargetVersion()Lezvcard/VCardVersion;
.end method

.method public isAddProdId()Z
    .registers 2

    .prologue
    .line 95
    iget-boolean v0, p0, Lezvcard/io/StreamWriter;->addProdId:Z

    return v0
.end method

.method public isVersionStrict()Z
    .registers 2

    .prologue
    .line 117
    iget-boolean v0, p0, Lezvcard/io/StreamWriter;->versionStrict:Z

    return v0
.end method

.method public registerScribe(Lezvcard/io/scribe/VCardPropertyScribe;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 140
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    iget-object v0, p0, Lezvcard/io/StreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v0, p1}, Lezvcard/io/scribe/ScribeIndex;->register(Lezvcard/io/scribe/VCardPropertyScribe;)V

    .line 141
    return-void
.end method

.method public setAddProdId(Z)V
    .registers 2
    .param p1, "addProdId"    # Z

    .prologue
    .line 107
    iput-boolean p1, p0, Lezvcard/io/StreamWriter;->addProdId:Z

    .line 108
    return-void
.end method

.method public setScribeIndex(Lezvcard/io/scribe/ScribeIndex;)V
    .registers 2
    .param p1, "index"    # Lezvcard/io/scribe/ScribeIndex;

    .prologue
    .line 156
    iput-object p1, p0, Lezvcard/io/StreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    .line 157
    return-void
.end method

.method public setVersionStrict(Z)V
    .registers 2
    .param p1, "versionStrict"    # Z

    .prologue
    .line 127
    iput-boolean p1, p0, Lezvcard/io/StreamWriter;->versionStrict:Z

    .line 128
    return-void
.end method

.method public write(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-direct {p0, p1}, Lezvcard/io/StreamWriter;->prepare(Lezvcard/VCard;)Ljava/util/List;

    move-result-object v0

    .line 69
    .local v0, "properties":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    invoke-virtual {p0, p1, v0}, Lezvcard/io/StreamWriter;->_write(Lezvcard/VCard;Ljava/util/List;)V

    .line 70
    return-void
.end method
