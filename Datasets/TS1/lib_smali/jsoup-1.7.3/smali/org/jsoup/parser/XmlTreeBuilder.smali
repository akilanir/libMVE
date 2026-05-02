.class public Lorg/jsoup/parser/XmlTreeBuilder;
.super Lorg/jsoup/parser/TreeBuilder;
.source "XmlTreeBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jsoup/parser/XmlTreeBuilder$1;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Lorg/jsoup/parser/TreeBuilder;-><init>()V

    .line 41
    return-void
.end method

.method private insertNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 47
    invoke-virtual {p0}, Lorg/jsoup/parser/XmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 48
    return-void
.end method

.method private popStackToClose(Lorg/jsoup/parser/Token$EndTag;)V
    .registers 7
    .param p1, "endTag"    # Lorg/jsoup/parser/Token$EndTag;

    .prologue
    .line 95
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "elName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 98
    .local v1, "firstFound":Lorg/jsoup/nodes/Element;
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v4}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v2

    .line 99
    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jsoup/nodes/Element;>;"
    :cond_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_22

    .line 100
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 101
    .local v3, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v3}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 102
    move-object v1, v3

    .line 106
    .end local v3    # "next":Lorg/jsoup/nodes/Element;
    :cond_22
    if-nez v1, :cond_25

    .line 119
    :cond_24
    :goto_24
    return-void

    .line 109
    :cond_25
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v4}, Lorg/jsoup/helper/DescendableLinkedList;->descendingIterator()Ljava/util/Iterator;

    move-result-object v2

    .line 110
    :goto_2b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 111
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jsoup/nodes/Element;

    .line 112
    .restart local v3    # "next":Lorg/jsoup/nodes/Element;
    if-ne v3, v1, :cond_3d

    .line 113
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_24

    .line 116
    :cond_3d
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_2b
.end method


# virtual methods
.method protected initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V
    .registers 6
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    .line 15
    invoke-super {p0, p1, p2, p3}, Lorg/jsoup/parser/TreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 16
    iget-object v0, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    iget-object v1, p0, Lorg/jsoup/parser/XmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0, v1}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    .line 17
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 51
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 53
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/Element;

    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 54
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 55
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 56
    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 57
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isKnownTag()Z

    move-result v2

    if-nez v2, :cond_28

    .line 58
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->setSelfClosing()Lorg/jsoup/parser/Tag;

    .line 62
    :cond_28
    :goto_28
    return-object v0

    .line 60
    :cond_29
    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Lorg/jsoup/helper/DescendableLinkedList;

    invoke-virtual {v2, v0}, Lorg/jsoup/helper/DescendableLinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_28
.end method

.method insert(Lorg/jsoup/parser/Token$Character;)V
    .registers 5
    .param p1, "characterToken"    # Lorg/jsoup/parser/Token$Character;

    .prologue
    .line 79
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .local v0, "node":Lorg/jsoup/nodes/Node;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 81
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Comment;)V
    .registers 9
    .param p1, "commentToken"    # Lorg/jsoup/parser/Token$Comment;

    .prologue
    const/4 v6, 0x1

    .line 66
    new-instance v0, Lorg/jsoup/nodes/Comment;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v4, v5}, Lorg/jsoup/nodes/Comment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .local v0, "comment":Lorg/jsoup/nodes/Comment;
    move-object v3, v0

    .line 68
    .local v3, "insert":Lorg/jsoup/nodes/Node;
    iget-boolean v4, p1, Lorg/jsoup/parser/Token$Comment;->bogus:Z

    if-eqz v4, :cond_3e

    .line 69
    invoke-virtual {v0}, Lorg/jsoup/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v1

    .line 70
    .local v1, "data":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v6, :cond_3e

    const-string v4, "!"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    const-string v4, "?"

    invoke-virtual {v1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3e

    .line 71
    :cond_2b
    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "declaration":Ljava/lang/String;
    new-instance v3, Lorg/jsoup/nodes/XmlDeclaration;

    .end local v3    # "insert":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Comment;->baseUri()Ljava/lang/String;

    move-result-object v4

    const-string v5, "!"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {v3, v2, v4, v5}, Lorg/jsoup/nodes/XmlDeclaration;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 75
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "declaration":Ljava/lang/String;
    .restart local v3    # "insert":Lorg/jsoup/nodes/Node;
    :cond_3e
    invoke-direct {p0, v3}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 76
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Doctype;)V
    .registers 7
    .param p1, "d"    # Lorg/jsoup/parser/Token$Doctype;

    .prologue
    .line 84
    new-instance v0, Lorg/jsoup/nodes/DocumentType;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getPublicIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getSystemIdentifier()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jsoup/nodes/DocumentType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .local v0, "doctypeNode":Lorg/jsoup/nodes/DocumentType;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 86
    return-void
.end method

.method parseFragment(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Ljava/util/List;
    .registers 5
    .param p1, "inputFragment"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errors"    # Lorg/jsoup/parser/ParseErrorList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lorg/jsoup/parser/ParseErrorList;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/parser/XmlTreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 123
    invoke-virtual {p0}, Lorg/jsoup/parser/XmlTreeBuilder;->runParser()V

    .line 124
    iget-object v0, p0, Lorg/jsoup/parser/XmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected process(Lorg/jsoup/parser/Token;)Z
    .registers 4
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 22
    sget-object v0, Lorg/jsoup/parser/XmlTreeBuilder$1;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_50

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unexpected token type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jsoup/helper/Validate;->fail(Ljava/lang/String;)V

    .line 43
    :goto_25
    :pswitch_25
    const/4 v0, 0x1

    return v0

    .line 24
    :pswitch_27
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto :goto_25

    .line 27
    :pswitch_2f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->popStackToClose(Lorg/jsoup/parser/Token$EndTag;)V

    goto :goto_25

    .line 30
    :pswitch_37
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_25

    .line 33
    :pswitch_3f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_25

    .line 36
    :pswitch_47
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asDoctype()Lorg/jsoup/parser/Token$Doctype;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Doctype;)V

    goto :goto_25

    .line 22
    nop

    :pswitch_data_50
    .packed-switch 0x1
        :pswitch_27
        :pswitch_2f
        :pswitch_37
        :pswitch_3f
        :pswitch_47
        :pswitch_25
    .end packed-switch
.end method
