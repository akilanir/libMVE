.class public Lorg/ini4j/spi/RegBuilder;
.super Lorg/ini4j/spi/AbstractProfileBuilder;
.source "RegBuilder.java"


# instance fields
.field private _reg:Lorg/ini4j/Reg;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;-><init>()V

    return-void
.end method

.method private static newInstance()Lorg/ini4j/spi/RegBuilder;
    .registers 1

    .prologue
    .line 71
    const-class v0, Lorg/ini4j/spi/RegBuilder;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/RegBuilder;

    return-object v0
.end method

.method public static newInstance(Lorg/ini4j/Reg;)Lorg/ini4j/spi/RegBuilder;
    .registers 2
    .param p0, "reg"    # Lorg/ini4j/Reg;

    .prologue
    .line 31
    invoke-static {}, Lorg/ini4j/spi/RegBuilder;->newInstance()Lorg/ini4j/spi/RegBuilder;

    move-result-object v0

    .line 33
    .local v0, "instance":Lorg/ini4j/spi/RegBuilder;
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/RegBuilder;->setReg(Lorg/ini4j/Reg;)V

    .line 35
    return-object v0
.end method


# virtual methods
.method public bridge synthetic endIni()V
    .registers 1

    .prologue
    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->endIni()V

    return-void
.end method

.method public bridge synthetic endSection()V
    .registers 1

    .prologue
    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->endSection()V

    return-void
.end method

.method getConfig()Lorg/ini4j/Config;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    invoke-virtual {v0}, Lorg/ini4j/Reg;->getConfig()Lorg/ini4j/Config;

    move-result-object v0

    return-object v0
.end method

.method getProfile()Lorg/ini4j/Profile;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    return-object v0
.end method

.method public bridge synthetic handleComment(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->handleComment(Ljava/lang/String;)V

    return-void
.end method

.method public handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p1, "rawName"    # Ljava/lang/String;
    .param p2, "rawValue"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v6, 0x0

    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x22

    if-ne v6, v7, :cond_3e

    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v6

    invoke-virtual {v6, p1}, Lorg/ini4j/spi/RegEscapeTool;->unquote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 46
    .local v3, "name":Ljava/lang/String;
    :goto_11
    invoke-static {}, Lorg/ini4j/spi/RegEscapeTool;->getInstance()Lorg/ini4j/spi/RegEscapeTool;

    move-result-object v6

    invoke-virtual {v6, p2}, Lorg/ini4j/spi/RegEscapeTool;->decode(Ljava/lang/String;)Lorg/ini4j/spi/TypeValuesPair;

    move-result-object v4

    .line 48
    .local v4, "tv":Lorg/ini4j/spi/TypeValuesPair;
    invoke-virtual {v4}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v6

    sget-object v7, Lorg/ini4j/Registry$Type;->REG_SZ:Lorg/ini4j/Registry$Type;

    if-eq v6, v7, :cond_2e

    .line 50
    invoke-virtual {p0}, Lorg/ini4j/spi/RegBuilder;->getCurrentSection()Lorg/ini4j/Profile$Section;

    move-result-object v6

    check-cast v6, Lorg/ini4j/Registry$Key;

    invoke-virtual {v4}, Lorg/ini4j/spi/TypeValuesPair;->getType()Lorg/ini4j/Registry$Type;

    move-result-object v7

    invoke-interface {v6, v3, v7}, Lorg/ini4j/Registry$Key;->putType(Ljava/lang/String;Lorg/ini4j/Registry$Type;)Lorg/ini4j/Registry$Type;

    .line 53
    :cond_2e
    invoke-virtual {v4}, Lorg/ini4j/spi/TypeValuesPair;->getValues()[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_34
    if-ge v1, v2, :cond_40

    aget-object v5, v0, v1

    .line 55
    .local v5, "value":Ljava/lang/String;
    invoke-super {p0, v3, v5}, Lorg/ini4j/spi/AbstractProfileBuilder;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    add-int/lit8 v1, v1, 0x1

    goto :goto_34

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "tv":Lorg/ini4j/spi/TypeValuesPair;
    .end local v5    # "value":Ljava/lang/String;
    :cond_3e
    move-object v3, p1

    .line 45
    goto :goto_11

    .line 57
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "name":Ljava/lang/String;
    .restart local v4    # "tv":Lorg/ini4j/spi/TypeValuesPair;
    :cond_40
    return-void
.end method

.method public setReg(Lorg/ini4j/Reg;)V
    .registers 2
    .param p1, "value"    # Lorg/ini4j/Reg;

    .prologue
    .line 40
    iput-object p1, p0, Lorg/ini4j/spi/RegBuilder;->_reg:Lorg/ini4j/Reg;

    .line 41
    return-void
.end method

.method public bridge synthetic startIni()V
    .registers 1

    .prologue
    .line 25
    invoke-super {p0}, Lorg/ini4j/spi/AbstractProfileBuilder;->startIni()V

    return-void
.end method

.method public bridge synthetic startSection(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 25
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractProfileBuilder;->startSection(Ljava/lang/String;)V

    return-void
.end method
