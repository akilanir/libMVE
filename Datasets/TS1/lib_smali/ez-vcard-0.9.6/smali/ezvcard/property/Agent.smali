.class public Lezvcard/property/Agent;
.super Lezvcard/property/VCardProperty;
.source "Agent.java"


# instance fields
.field private url:Ljava/lang/String;

.field private vcard:Lezvcard/VCard;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 105
    return-void
.end method

.method public constructor <init>(Lezvcard/VCard;)V
    .registers 2
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 119
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 120
    invoke-virtual {p0, p1}, Lezvcard/property/Agent;->setVCard(Lezvcard/VCard;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 111
    invoke-direct {p0}, Lezvcard/property/VCardProperty;-><init>()V

    .line 112
    invoke-virtual {p0, p1}, Lezvcard/property/Agent;->setUrl(Ljava/lang/String;)V

    .line 113
    return-void
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 125
    sget-object v0, Lezvcard/VCardVersion;->V2_1:Lezvcard/VCardVersion;

    sget-object v1, Lezvcard/VCardVersion;->V3_0:Lezvcard/VCardVersion;

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method protected _validate(Ljava/util/List;Lezvcard/VCardVersion;Lezvcard/VCard;)V
    .registers 21
    .param p2, "version"    # Lezvcard/VCardVersion;
    .param p3, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lezvcard/Warning;",
            ">;",
            "Lezvcard/VCardVersion;",
            "Lezvcard/VCard;",
            ")V"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/property/Agent;->url:Ljava/lang/String;

    if-nez v13, :cond_1b

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    if-nez v13, :cond_1b

    .line 165
    new-instance v13, Lezvcard/Warning;

    const/16 v14, 0x8

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-direct {v13, v14, v15}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    :cond_1b
    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    if-eqz v13, :cond_b1

    .line 169
    invoke-static {}, Ljava/text/NumberFormat;->getIntegerInstance()Ljava/text/NumberFormat;

    move-result-object v8

    .line 170
    .local v8, "nf":Ljava/text/NumberFormat;
    const/4 v13, 0x2

    invoke-virtual {v8, v13}, Ljava/text/NumberFormat;->setMinimumIntegerDigits(I)V

    .line 172
    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Lezvcard/VCard;->validate(Lezvcard/VCardVersion;)Lezvcard/ValidationWarnings;

    move-result-object v12

    .line 173
    .local v12, "validationWarnings":Lezvcard/ValidationWarnings;
    invoke-virtual {v12}, Lezvcard/ValidationWarnings;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_37
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 174
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lezvcard/property/VCardProperty;

    .line 175
    .local v11, "property":Lezvcard/property/VCardProperty;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    .line 177
    .local v10, "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_53
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_37

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lezvcard/Warning;

    .line 178
    .local v9, "propViolation":Lezvcard/Warning;
    if-nez v11, :cond_a5

    const-string v1, ""

    .line 180
    .local v1, "className":Ljava/lang/String;
    :goto_63
    invoke-virtual {v9}, Lezvcard/Warning;->getCode()Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 181
    .local v2, "code":I
    if-ltz v2, :cond_ae

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "W"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    int-to-long v14, v2

    invoke-virtual {v8, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, "codeStr":Ljava/lang/String;
    :goto_85
    invoke-virtual {v9}, Lezvcard/Warning;->getMessage()Ljava/lang/String;

    move-result-object v7

    .line 183
    .local v7, "message":Ljava/lang/String;
    new-instance v13, Lezvcard/Warning;

    const/16 v14, 0xa

    const/4 v15, 0x3

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v1, v15, v16

    const/16 v16, 0x1

    aput-object v3, v15, v16

    const/16 v16, 0x2

    aput-object v7, v15, v16

    invoke-direct {v13, v14, v15}, Lezvcard/Warning;-><init>(I[Ljava/lang/Object;)V

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_53

    .line 178
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "code":I
    .end local v3    # "codeStr":Ljava/lang/String;
    .end local v7    # "message":Ljava/lang/String;
    :cond_a5
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    goto :goto_63

    .line 181
    .restart local v1    # "className":Ljava/lang/String;
    .restart local v2    # "code":I
    :cond_ae
    const-string v3, ""

    goto :goto_85

    .line 187
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "code":I
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lezvcard/property/VCardProperty;Ljava/util/List<Lezvcard/Warning;>;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "nf":Ljava/text/NumberFormat;
    .end local v9    # "propViolation":Lezvcard/Warning;
    .end local v10    # "propViolations":Ljava/util/List;, "Ljava/util/List<Lezvcard/Warning;>;"
    .end local v11    # "property":Lezvcard/property/VCardProperty;
    .end local v12    # "validationWarnings":Lezvcard/ValidationWarnings;
    :cond_b1
    return-void
.end method

.method public getUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lezvcard/property/Agent;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getVCard()Lezvcard/VCard;
    .registers 2

    .prologue
    .line 150
    iget-object v0, p0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    return-object v0
.end method

.method public setUrl(Ljava/lang/String;)V
    .registers 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lezvcard/property/Agent;->url:Ljava/lang/String;

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    .line 143
    return-void
.end method

.method public setVCard(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 158
    iput-object p1, p0, Lezvcard/property/Agent;->vcard:Lezvcard/VCard;

    .line 159
    const/4 v0, 0x0

    iput-object v0, p0, Lezvcard/property/Agent;->url:Ljava/lang/String;

    .line 160
    return-void
.end method
