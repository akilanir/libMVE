.class public Lorg/jsoup/helper/W3CDom$W3CBuilder;
.super Ljava/lang/Object;
.source "W3CDom.java"

# interfaces
.implements Lorg/jsoup/select/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/helper/W3CDom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "W3CBuilder"
.end annotation


# static fields
.field private static final xmlnsKey:Ljava/lang/String; = "xmlns"

.field private static final xmlnsPrefix:Ljava/lang/String; = "xmlns:"


# instance fields
.field private dest:Lorg/w3c/dom/Element;

.field private final doc:Lorg/w3c/dom/Document;

.field private final namespaces:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .registers 3
    .param p1, "doc"    # Lorg/w3c/dom/Document;

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->namespaces:Ljava/util/HashMap;

    .line 81
    iput-object p1, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    .line 82
    return-void
.end method

.method private copyAttributes(Lorg/jsoup/nodes/Node;Lorg/w3c/dom/Element;)V
    .registers 7
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "el"    # Lorg/w3c/dom/Element;

    .prologue
    .line 123
    invoke-virtual {p1}, Lorg/jsoup/nodes/Node;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 124
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 126
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    :cond_20
    return-void
.end method

.method private updateNamespaces(Lorg/jsoup/nodes/Element;)Ljava/lang/String;
    .registers 10
    .param p1, "el"    # Lorg/jsoup/nodes/Element;

    .prologue
    .line 134
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->attributes()Lorg/jsoup/nodes/Attributes;

    move-result-object v1

    .line 135
    .local v1, "attributes":Lorg/jsoup/nodes/Attributes;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Attributes;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_8
    :goto_8
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3f

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Attribute;

    .line 136
    .local v0, "attr":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v2

    .line 138
    .local v2, "key":Ljava/lang/String;
    const-string v6, "xmlns"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 139
    const-string v4, ""

    .line 145
    :goto_22
    iget-object v6, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8

    .line 140
    :cond_2c
    const-string v6, "xmlns:"

    invoke-virtual {v2, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 141
    const-string v6, "xmlns:"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    goto :goto_22

    .line 149
    .end local v0    # "attr":Lorg/jsoup/nodes/Attribute;
    .end local v2    # "key":Ljava/lang/String;
    :cond_3f
    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 150
    .local v3, "pos":I
    if-lez v3, :cond_55

    invoke-virtual {p1}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    :goto_54
    return-object v5

    :cond_55
    const-string v5, ""

    goto :goto_54
.end method


# virtual methods
.method public head(Lorg/jsoup/nodes/Node;I)V
    .registers 15
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    .line 85
    instance-of v10, p1, Lorg/jsoup/nodes/Element;

    if-eqz v10, :cond_32

    move-object v7, p1

    .line 86
    check-cast v7, Lorg/jsoup/nodes/Element;

    .line 88
    .local v7, "sourceEl":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v7}, Lorg/jsoup/helper/W3CDom$W3CBuilder;->updateNamespaces(Lorg/jsoup/nodes/Element;)Ljava/lang/String;

    move-result-object v4

    .line 89
    .local v4, "prefix":Ljava/lang/String;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->namespaces:Ljava/util/HashMap;

    invoke-virtual {v10, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 91
    .local v2, "namespace":Ljava/lang/String;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v7}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v2, v11}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 92
    .local v1, "el":Lorg/w3c/dom/Element;
    invoke-direct {p0, v7, v1}, Lorg/jsoup/helper/W3CDom$W3CBuilder;->copyAttributes(Lorg/jsoup/nodes/Node;Lorg/w3c/dom/Element;)V

    .line 93
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    if-nez v10, :cond_2c

    .line 94
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v10, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 98
    :goto_29
    iput-object v1, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    .line 114
    .end local v1    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "namespace":Ljava/lang/String;
    .end local v4    # "prefix":Ljava/lang/String;
    .end local v7    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_2b
    :goto_2b
    return-void

    .line 96
    .restart local v1    # "el":Lorg/w3c/dom/Element;
    .restart local v2    # "namespace":Ljava/lang/String;
    .restart local v4    # "prefix":Ljava/lang/String;
    .restart local v7    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_2c
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v10, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_29

    .line 99
    .end local v1    # "el":Lorg/w3c/dom/Element;
    .end local v2    # "namespace":Ljava/lang/String;
    .end local v4    # "prefix":Ljava/lang/String;
    .end local v7    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_32
    instance-of v10, p1, Lorg/jsoup/nodes/TextNode;

    if-eqz v10, :cond_49

    move-object v8, p1

    .line 100
    check-cast v8, Lorg/jsoup/nodes/TextNode;

    .line 101
    .local v8, "sourceText":Lorg/jsoup/nodes/TextNode;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v8}, Lorg/jsoup/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v9

    .line 102
    .local v9, "text":Lorg/w3c/dom/Text;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v10, v9}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_2b

    .line 103
    .end local v8    # "sourceText":Lorg/jsoup/nodes/TextNode;
    .end local v9    # "text":Lorg/w3c/dom/Text;
    :cond_49
    instance-of v10, p1, Lorg/jsoup/nodes/Comment;

    if-eqz v10, :cond_60

    move-object v5, p1

    .line 104
    check-cast v5, Lorg/jsoup/nodes/Comment;

    .line 105
    .local v5, "sourceComment":Lorg/jsoup/nodes/Comment;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v5}, Lorg/jsoup/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createComment(Ljava/lang/String;)Lorg/w3c/dom/Comment;

    move-result-object v0

    .line 106
    .local v0, "comment":Lorg/w3c/dom/Comment;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v10, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_2b

    .line 107
    .end local v0    # "comment":Lorg/w3c/dom/Comment;
    .end local v5    # "sourceComment":Lorg/jsoup/nodes/Comment;
    :cond_60
    instance-of v10, p1, Lorg/jsoup/nodes/DataNode;

    if-eqz v10, :cond_2b

    move-object v6, p1

    .line 108
    check-cast v6, Lorg/jsoup/nodes/DataNode;

    .line 109
    .local v6, "sourceData":Lorg/jsoup/nodes/DataNode;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v6}, Lorg/jsoup/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v3

    .line 110
    .local v3, "node":Lorg/w3c/dom/Text;
    iget-object v10, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v10, v3}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_2b
.end method

.method public tail(Lorg/jsoup/nodes/Node;I)V
    .registers 4
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    .line 117
    instance-of v0, p1, Lorg/jsoup/nodes/Element;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_18

    .line 118
    iget-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    iput-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    .line 120
    :cond_18
    return-void
.end method
