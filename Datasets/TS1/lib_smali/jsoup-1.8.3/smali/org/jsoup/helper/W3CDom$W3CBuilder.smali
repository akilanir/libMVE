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
    accessFlags = 0x4
    name = "W3CBuilder"
.end annotation


# instance fields
.field private dest:Lorg/w3c/dom/Element;

.field private final doc:Lorg/w3c/dom/Document;

.field final synthetic this$0:Lorg/jsoup/helper/W3CDom;


# direct methods
.method public constructor <init>(Lorg/jsoup/helper/W3CDom;Lorg/w3c/dom/Document;)V
    .registers 3
    .param p1, "this$0"    # Lorg/jsoup/helper/W3CDom;
    .param p2, "doc"    # Lorg/w3c/dom/Document;

    .prologue
    .line 72
    iput-object p1, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->this$0:Lorg/jsoup/helper/W3CDom;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    iput-object p2, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    .line 74
    return-void
.end method

.method private copyAttributes(Lorg/jsoup/nodes/Node;Lorg/w3c/dom/Element;)V
    .registers 7
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "el"    # Lorg/w3c/dom/Element;

    .prologue
    .line 111
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

    .line 112
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v2, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 114
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    :cond_20
    return-void
.end method


# virtual methods
.method public head(Lorg/jsoup/nodes/Node;I)V
    .registers 13
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    .line 77
    instance-of v8, p1, Lorg/jsoup/nodes/Element;

    if-eqz v8, :cond_26

    move-object v5, p1

    .line 78
    check-cast v5, Lorg/jsoup/nodes/Element;

    .line 79
    .local v5, "sourceEl":Lorg/jsoup/nodes/Element;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v5}, Lorg/jsoup/nodes/Element;->tagName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 80
    .local v1, "el":Lorg/w3c/dom/Element;
    invoke-direct {p0, v5, v1}, Lorg/jsoup/helper/W3CDom$W3CBuilder;->copyAttributes(Lorg/jsoup/nodes/Node;Lorg/w3c/dom/Element;)V

    .line 81
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    if-nez v8, :cond_20

    .line 82
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v8, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 86
    :goto_1d
    iput-object v1, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    .line 102
    .end local v1    # "el":Lorg/w3c/dom/Element;
    .end local v5    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_1f
    :goto_1f
    return-void

    .line 84
    .restart local v1    # "el":Lorg/w3c/dom/Element;
    .restart local v5    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_20
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v8, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_1d

    .line 87
    .end local v1    # "el":Lorg/w3c/dom/Element;
    .end local v5    # "sourceEl":Lorg/jsoup/nodes/Element;
    :cond_26
    instance-of v8, p1, Lorg/jsoup/nodes/TextNode;

    if-eqz v8, :cond_3d

    move-object v6, p1

    .line 88
    check-cast v6, Lorg/jsoup/nodes/TextNode;

    .line 89
    .local v6, "sourceText":Lorg/jsoup/nodes/TextNode;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v6}, Lorg/jsoup/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v7

    .line 90
    .local v7, "text":Lorg/w3c/dom/Text;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v8, v7}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_1f

    .line 91
    .end local v6    # "sourceText":Lorg/jsoup/nodes/TextNode;
    .end local v7    # "text":Lorg/w3c/dom/Text;
    :cond_3d
    instance-of v8, p1, Lorg/jsoup/nodes/Comment;

    if-eqz v8, :cond_54

    move-object v3, p1

    .line 92
    check-cast v3, Lorg/jsoup/nodes/Comment;

    .line 93
    .local v3, "sourceComment":Lorg/jsoup/nodes/Comment;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v3}, Lorg/jsoup/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/w3c/dom/Document;->createComment(Ljava/lang/String;)Lorg/w3c/dom/Comment;

    move-result-object v0

    .line 94
    .local v0, "comment":Lorg/w3c/dom/Comment;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v8, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_1f

    .line 95
    .end local v0    # "comment":Lorg/w3c/dom/Comment;
    .end local v3    # "sourceComment":Lorg/jsoup/nodes/Comment;
    :cond_54
    instance-of v8, p1, Lorg/jsoup/nodes/DataNode;

    if-eqz v8, :cond_1f

    move-object v4, p1

    .line 96
    check-cast v4, Lorg/jsoup/nodes/DataNode;

    .line 97
    .local v4, "sourceData":Lorg/jsoup/nodes/DataNode;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {v4}, Lorg/jsoup/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v2

    .line 98
    .local v2, "node":Lorg/w3c/dom/Text;
    iget-object v8, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v8, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_1f
.end method

.method public tail(Lorg/jsoup/nodes/Node;I)V
    .registers 4
    .param p1, "source"    # Lorg/jsoup/nodes/Node;
    .param p2, "depth"    # I

    .prologue
    .line 105
    instance-of v0, p1, Lorg/jsoup/nodes/Element;

    if-eqz v0, :cond_18

    iget-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    instance-of v0, v0, Lorg/w3c/dom/Element;

    if-eqz v0, :cond_18

    .line 106
    iget-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    iput-object v0, p0, Lorg/jsoup/helper/W3CDom$W3CBuilder;->dest:Lorg/w3c/dom/Element;

    .line 108
    :cond_18
    return-void
.end method
