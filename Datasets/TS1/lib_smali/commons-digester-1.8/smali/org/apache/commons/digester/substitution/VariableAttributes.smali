.class public Lorg/apache/commons/digester/substitution/VariableAttributes;
.super Ljava/lang/Object;
.source "VariableAttributes.java"

# interfaces
.implements Lorg/xml/sax/Attributes;


# instance fields
.field private attrs:Lorg/xml/sax/Attributes;

.field private expander:Lorg/apache/commons/digester/substitution/VariableExpander;

.field private values:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    .line 36
    return-void
.end method


# virtual methods
.method public getIndex(Ljava/lang/String;)I
    .registers 3
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getIndex(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getIndex(Ljava/lang/String;Ljava/lang/String;)I
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localpart"    # Ljava/lang/String;

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1, p2}, Lorg/xml/sax/Attributes;->getIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 113
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v0

    return v0
.end method

.method public getLocalName(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getQName(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getType(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localname"    # Ljava/lang/String;

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1, p2}, Lorg/xml/sax/Attributes;->getType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getURI(I)Ljava/lang/String;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v0, p1}, Lorg/xml/sax/Attributes;->getURI(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue(I)Ljava/lang/String;
    .registers 6
    .param p1, "index"    # I

    .prologue
    .line 59
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_17

    .line 65
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    add-int/lit8 v3, p1, 0x1

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 66
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .local v0, "i":I
    :goto_15
    if-le v0, p1, :cond_35

    .line 71
    .end local v0    # "i":I
    :cond_17
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 73
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_34

    .line 77
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v2, p1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    .line 78
    if-eqz v1, :cond_34

    .line 79
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->expander:Lorg/apache/commons/digester/substitution/VariableExpander;

    invoke-interface {v2, v1}, Lorg/apache/commons/digester/substitution/VariableExpander;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 80
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    invoke-virtual {v2, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 84
    :cond_34
    return-object v1

    .line 67
    .end local v1    # "s":Ljava/lang/String;
    .restart local v0    # "i":I
    :cond_35
    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    add-int/lit8 v0, v0, 0x1

    goto :goto_15
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "qname"    # Ljava/lang/String;

    .prologue
    .line 88
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v1, p1}, Lorg/xml/sax/Attributes;->getIndex(Ljava/lang/String;)I

    move-result v0

    .line 89
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    .line 90
    const/4 v1, 0x0

    .line 92
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/substitution/VariableAttributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localname"    # Ljava/lang/String;

    .prologue
    .line 96
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    invoke-interface {v1, p1, p2}, Lorg/xml/sax/Attributes;->getIndex(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 97
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_b

    .line 98
    const/4 v1, 0x0

    .line 100
    :goto_a
    return-object v1

    :cond_b
    invoke-virtual {p0, v0}, Lorg/apache/commons/digester/substitution/VariableAttributes;->getValue(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public init(Lorg/xml/sax/Attributes;Lorg/apache/commons/digester/substitution/VariableExpander;)V
    .registers 4
    .param p1, "attrs"    # Lorg/xml/sax/Attributes;
    .param p2, "expander"    # Lorg/apache/commons/digester/substitution/VariableExpander;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->attrs:Lorg/xml/sax/Attributes;

    .line 51
    iput-object p2, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->expander:Lorg/apache/commons/digester/substitution/VariableExpander;

    .line 55
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableAttributes;->values:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 56
    return-void
.end method
