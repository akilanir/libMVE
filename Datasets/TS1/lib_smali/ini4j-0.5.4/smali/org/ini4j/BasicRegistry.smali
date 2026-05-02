.class public Lorg/ini4j/BasicRegistry;
.super Lorg/ini4j/BasicProfile;
.source "BasicRegistry.java"

# interfaces
.implements Lorg/ini4j/Registry;


# static fields
.field private static final serialVersionUID:J = -0x5945fd7718047e62L


# instance fields
.field private _version:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/ini4j/BasicProfile;-><init>()V

    .line 31
    const-string v0, "Windows Registry Editor Version 5.00"

    iput-object v0, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->add(Ljava/lang/String;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public add(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->add(Ljava/lang/String;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->get(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->get(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 51
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public get(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 56
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public getVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    return-object v0
.end method

.method bridge synthetic newSection(Ljava/lang/String;)Lorg/ini4j/Profile$Section;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->newSection(Ljava/lang/String;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method newSection(Ljava/lang/String;)Lorg/ini4j/Registry$Key;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 86
    new-instance v0, Lorg/ini4j/BasicRegistryKey;

    invoke-direct {v0, p0, p1}, Lorg/ini4j/BasicRegistryKey;-><init>(Lorg/ini4j/BasicRegistry;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 24
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/ini4j/Profile$Section;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->put(Ljava/lang/String;Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 5
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;
    .param p3, "x2"    # I

    .prologue
    .line 24
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/ini4j/Profile$Section;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2, p3}, Lorg/ini4j/BasicRegistry;->put(Ljava/lang/String;Lorg/ini4j/Profile$Section;I)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/ini4j/Profile$Section;

    .prologue
    .line 61
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public put(Ljava/lang/String;Lorg/ini4j/Profile$Section;I)Lorg/ini4j/Registry$Key;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Lorg/ini4j/Profile$Section;
    .param p3, "index"    # I

    .prologue
    .line 66
    invoke-super {p0, p1, p2, p3}, Lorg/ini4j/BasicProfile;->put(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->remove(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 24
    invoke-virtual {p0, p1, p2}, Lorg/ini4j/BasicRegistry;->remove(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Profile$Section;
    .registers 3
    .param p1, "x0"    # Lorg/ini4j/Profile$Section;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lorg/ini4j/BasicRegistry;->remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Lorg/ini4j/Registry$Key;
    .registers 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 76
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;I)Lorg/ini4j/Registry$Key;
    .registers 4
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "index"    # I

    .prologue
    .line 81
    invoke-super {p0, p1, p2}, Lorg/ini4j/BasicProfile;->remove(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Registry$Key;
    .registers 3
    .param p1, "section"    # Lorg/ini4j/Profile$Section;

    .prologue
    .line 71
    invoke-super {p0, p1}, Lorg/ini4j/BasicProfile;->remove(Lorg/ini4j/Profile$Section;)Lorg/ini4j/Profile$Section;

    move-result-object v0

    check-cast v0, Lorg/ini4j/Registry$Key;

    return-object v0
.end method

.method public setVersion(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/ini4j/BasicRegistry;->_version:Ljava/lang/String;

    .line 42
    return-void
.end method

.method store(Lorg/ini4j/spi/IniHandler;Lorg/ini4j/Profile$Section;Ljava/lang/String;)V
    .registers 11
    .param p1, "formatter"    # Lorg/ini4j/spi/IniHandler;
    .param p2, "section"    # Lorg/ini4j/Profile$Section;
    .param p3, "option"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-interface {p2, p3}, Lorg/ini4j/Profile$Section;->getComment(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p1, v5}, Lorg/ini4j/BasicRegistry;->store(Lorg/ini4j/spi/IniHandler;Ljava/lang/String;)V

    move-object v5, p2

    .line 92
    check-cast v5, Lorg/ini4j/Registry$Key;

    sget-object v6, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    invoke-interface {v5, p3, v6}, Lorg/ini4j/Registry$Key;->getType(Ljava/lang/Object;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;

    move-result-object v3

    .line 93
    .local v3, "type":Lorg/ini4j/Registry$Type;
    const-string v5, "@"

    invoke-virtual {p3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2e

    move-object v1, p3

    .line 94
    .local v1, "rawName":Ljava/lang/String;
    :goto_19
    invoke-interface {p2, p3}, Lorg/ini4j/Profile$Section;->length(Ljava/lang/Object;)I

    move-result v5

    new-array v4, v5, [Ljava/lang/String;

    .line 96
    .local v4, "values":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_20
    array-length v5, v4

    if-ge v0, v5, :cond_37

    .line 98
    invoke-interface {p2, p3, v0}, Lorg/ini4j/Profile$Section;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v4, v0

    .line 96
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 93
    .end local v0    # "i":I
    .end local v1    # "rawName":Ljava/lang/String;
    .end local v4    # "values":[Ljava/lang/String;
    :cond_2e
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v5

    invoke-virtual {v5, p3}, Lorg/ini4j/spi/RegEscapeTool;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_19

    .line 101
    .restart local v0    # "i":I
    .restart local v1    # "rawName":Ljava/lang/String;
    .restart local v4    # "values":[Ljava/lang/String;
    :cond_37
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v5

    new-instance v6, Lorg/ini4j/spi/TypeValuesPair;

    invoke-direct {v6, v3, v4}, Lorg/ini4j/spi/TypeValuesPair;-><init>(Lorg/ini4j/Registry$Type;[Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Lorg/ini4j/spi/RegEscapeTool;->encode(Lorg/ini4j/spi/TypeValuesPair;)Ljava/lang/String;

    move-result-object v2

    .line 103
    .local v2, "rawValue":Ljava/lang/String;
    invoke-interface {p1, v1, v2}, Lorg/ini4j/spi/IniHandler;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    return-void
.end method
