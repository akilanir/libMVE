.class public Lezvcard/io/xml/XCardElement;
.super Ljava/lang/Object;
.source "XCardElement.java"


# instance fields
.field private final document:Lorg/w3c/dom/Document;

.field private final element:Lorg/w3c/dom/Element;

.field private final namespace:Ljava/lang/String;

.field private final version:Lezvcard/VCardVersion;


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Element;)V
    .registers 3
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 59
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-direct {p0, p1, v0}, Lezvcard/io/xml/XCardElement;-><init>(Lorg/w3c/dom/Element;Lezvcard/VCardVersion;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Element;Lezvcard/VCardVersion;)V
    .registers 4
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "version"    # Lezvcard/VCardVersion;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardElement;->document:Lorg/w3c/dom/Document;

    .line 69
    iput-object p1, p0, Lezvcard/io/xml/XCardElement;->element:Lorg/w3c/dom/Element;

    .line 70
    iput-object p2, p0, Lezvcard/io/xml/XCardElement;->version:Lezvcard/VCardVersion;

    .line 71
    invoke-virtual {p2}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardElement;->namespace:Ljava/lang/String;

    .line 72
    return-void
.end method

.method private children()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 204
    iget-object v0, p0, Lezvcard/io/xml/XCardElement;->element:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    invoke-static {v0}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private toLocalName(Lezvcard/VCardDataType;)Ljava/lang/String;
    .registers 3
    .param p1, "dataType"    # Lezvcard/VCardDataType;

    .prologue
    .line 208
    if-nez p1, :cond_5

    const-string v0, "unknown"

    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p1}, Lezvcard/VCardDataType;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method


# virtual methods
.method public all(Lezvcard/VCardDataType;)Ljava/util/List;
    .registers 4
    .param p1, "dataType"    # Lezvcard/VCardDataType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCardDataType;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardElement;->toLocalName(Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v0

    .line 111
    .local v0, "dataTypeStr":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lezvcard/io/xml/XCardElement;->all(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public all(Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v1, "childrenText":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lezvcard/io/xml/XCardElement;->children()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 122
    .local v0, "child":Lorg/w3c/dom/Element;
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    iget-object v4, p0, Lezvcard/io/xml/XCardElement;->namespace:Ljava/lang/String;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 123
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "text":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_d

    .line 125
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d

    .line 129
    .end local v0    # "child":Lorg/w3c/dom/Element;
    .end local v3    # "text":Ljava/lang/String;
    :cond_41
    return-object v1
.end method

.method public append(Ljava/lang/String;Ljava/util/Collection;)Ljava/util/List;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "values":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 164
    const/4 v4, 0x0

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, p1, v4}, Lezvcard/io/xml/XCardElement;->append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 165
    .local v0, "element":Lorg/w3c/dom/Element;
    const/4 v4, 0x1

    new-array v4, v4, [Lorg/w3c/dom/Element;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 172
    .end local v0    # "element":Lorg/w3c/dom/Element;
    :cond_17
    return-object v1

    .line 168
    :cond_18
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 169
    .local v1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_25
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 170
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {p0, p1, v3}, Lezvcard/io/xml/XCardElement;->append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_25
.end method

.method public append(Lezvcard/VCardDataType;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 5
    .param p1, "dataType"    # Lezvcard/VCardDataType;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardElement;->toLocalName(Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v0

    .line 140
    .local v0, "dataTypeStr":Ljava/lang/String;
    invoke-virtual {p0, v0, p2}, Lezvcard/io/xml/XCardElement;->append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    return-object v1
.end method

.method public append(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 150
    iget-object v1, p0, Lezvcard/io/xml/XCardElement;->document:Lorg/w3c/dom/Document;

    iget-object v2, p0, Lezvcard/io/xml/XCardElement;->namespace:Ljava/lang/String;

    invoke-interface {v1, v2, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 151
    .local v0, "child":Lorg/w3c/dom/Element;
    invoke-interface {v0, p2}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 152
    iget-object v1, p0, Lezvcard/io/xml/XCardElement;->element:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 153
    return-object v0
.end method

.method public document()Lorg/w3c/dom/Document;
    .registers 2

    .prologue
    .line 180
    iget-object v0, p0, Lezvcard/io/xml/XCardElement;->document:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method public element()Lorg/w3c/dom/Element;
    .registers 2

    .prologue
    .line 188
    iget-object v0, p0, Lezvcard/io/xml/XCardElement;->element:Lorg/w3c/dom/Element;

    return-object v0
.end method

.method public varargs first([Lezvcard/VCardDataType;)Ljava/lang/String;
    .registers 6
    .param p1, "dataTypes"    # [Lezvcard/VCardDataType;

    .prologue
    .line 81
    array-length v3, p1

    new-array v2, v3, [Ljava/lang/String;

    .line 82
    .local v2, "names":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    array-length v3, p1

    if-ge v1, v3, :cond_12

    .line 83
    aget-object v0, p1, v1

    .line 84
    .local v0, "dataType":Lezvcard/VCardDataType;
    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardElement;->toLocalName(Lezvcard/VCardDataType;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 86
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    :cond_12
    invoke-virtual {p0, v2}, Lezvcard/io/xml/XCardElement;->first([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public varargs first([Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 95
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 96
    .local v2, "localNamesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lezvcard/io/xml/XCardElement;->children()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_33

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 97
    .local v0, "child":Lorg/w3c/dom/Element;
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    iget-object v3, p0, Lezvcard/io/xml/XCardElement;->namespace:Ljava/lang/String;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 98
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v3

    .line 101
    .end local v0    # "child":Lorg/w3c/dom/Element;
    :goto_32
    return-object v3

    :cond_33
    const/4 v3, 0x0

    goto :goto_32
.end method

.method public version()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lezvcard/io/xml/XCardElement;->version:Lezvcard/VCardVersion;

    return-object v0
.end method
