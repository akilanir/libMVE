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
    .line 15
    invoke-direct {p0}, Lorg/jsoup/parser/TreeBuilder;-><init>()V

    .line 45
    return-void
.end method

.method private insertNode(Lorg/jsoup/nodes/Node;)V
    .registers 3
    .param p1, "node"    # Lorg/jsoup/nodes/Node;

    .prologue
    .line 51
    invoke-virtual {p0}, Lorg/jsoup/parser/XmlTreeBuilder;->currentElement()Lorg/jsoup/nodes/Element;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 52
    return-void
.end method

.method private popStackToClose(Lorg/jsoup/parser/Token$EndTag;)V
    .registers 7
    .param p1, "endTag"    # Lorg/jsoup/parser/Token$EndTag;

    .prologue
    .line 99
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$EndTag;->name()Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "elName":Ljava/lang/String;
    const/4 v1, 0x0

    .line 102
    .local v1, "firstFound":Lorg/jsoup/nodes/Element;
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .local v3, "pos":I
    :goto_d
    if-ltz v3, :cond_22

    .line 103
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 104
    .local v2, "next":Lorg/jsoup/nodes/Element;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Element;->nodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_25

    .line 105
    move-object v1, v2

    .line 109
    .end local v2    # "next":Lorg/jsoup/nodes/Element;
    :cond_22
    if-nez v1, :cond_28

    .line 118
    :cond_24
    return-void

    .line 102
    .restart local v2    # "next":Lorg/jsoup/nodes/Element;
    :cond_25
    add-int/lit8 v3, v3, -0x1

    goto :goto_d

    .line 112
    .end local v2    # "next":Lorg/jsoup/nodes/Element;
    :cond_28
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    :goto_30
    if-ltz v3, :cond_24

    .line 113
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jsoup/nodes/Element;

    .line 114
    .restart local v2    # "next":Lorg/jsoup/nodes/Element;
    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 115
    if-eq v2, v1, :cond_24

    .line 112
    add-int/lit8 v3, v3, -0x1

    goto :goto_30
.end method


# virtual methods
.method protected initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V
    .registers 6
    .param p1, "input"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "errors"    # Lorg/jsoup/parser/ParseErrorList;

    .prologue
    .line 18
    invoke-super {p0, p1, p2, p3}, Lorg/jsoup/parser/TreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 19
    iget-object v0, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jsoup/parser/XmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    iget-object v0, p0, Lorg/jsoup/parser/XmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->outputSettings()Lorg/jsoup/nodes/Document$OutputSettings;

    move-result-object v0

    sget-object v1, Lorg/jsoup/nodes/Document$OutputSettings$Syntax;->xml:Lorg/jsoup/nodes/Document$OutputSettings$Syntax;

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Document$OutputSettings;->syntax(Lorg/jsoup/nodes/Document$OutputSettings$Syntax;)Lorg/jsoup/nodes/Document$OutputSettings;

    .line 21
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;
    .registers 6
    .param p1, "startTag"    # Lorg/jsoup/parser/Token$StartTag;

    .prologue
    .line 55
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jsoup/parser/Tag;->valueOf(Ljava/lang/String;)Lorg/jsoup/parser/Tag;

    move-result-object v1

    .line 57
    .local v1, "tag":Lorg/jsoup/parser/Tag;
    new-instance v0, Lorg/jsoup/nodes/Element;

    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    iget-object v3, p1, Lorg/jsoup/parser/Token$StartTag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-direct {v0, v1, v2, v3}, Lorg/jsoup/nodes/Element;-><init>(Lorg/jsoup/parser/Tag;Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)V

    .line 58
    .local v0, "el":Lorg/jsoup/nodes/Element;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 59
    invoke-virtual {p1}, Lorg/jsoup/parser/Token$StartTag;->isSelfClosing()Z

    move-result v2

    if-eqz v2, :cond_29

    .line 60
    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->tokeniser:Lorg/jsoup/parser/Tokeniser;

    invoke-virtual {v2}, Lorg/jsoup/parser/Tokeniser;->acknowledgeSelfClosingFlag()V

    .line 61
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->isKnownTag()Z

    move-result v2

    if-nez v2, :cond_28

    .line 62
    invoke-virtual {v1}, Lorg/jsoup/parser/Tag;->setSelfClosing()Lorg/jsoup/parser/Tag;

    .line 66
    :cond_28
    :goto_28
    return-object v0

    .line 64
    :cond_29
    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->stack:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_28
.end method

.method insert(Lorg/jsoup/parser/Token$Character;)V
    .registers 5
    .param p1, "characterToken"    # Lorg/jsoup/parser/Token$Character;

    .prologue
    .line 83
    new-instance v0, Lorg/jsoup/nodes/TextNode;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/TextNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .local v0, "node":Lorg/jsoup/nodes/Node;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 85
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Comment;)V
    .registers 9
    .param p1, "commentToken"    # Lorg/jsoup/parser/Token$Comment;

    .prologue
    const/4 v6, 0x1

    .line 70
    new-instance v0, Lorg/jsoup/nodes/Comment;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Comment;->getData()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v4, v5}, Lorg/jsoup/nodes/Comment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .local v0, "comment":Lorg/jsoup/nodes/Comment;
    move-object v3, v0

    .line 72
    .local v3, "insert":Lorg/jsoup/nodes/Node;
    iget-boolean v4, p1, Lorg/jsoup/parser/Token$Comment;->bogus:Z

    if-eqz v4, :cond_3e

    .line 73
    invoke-virtual {v0}, Lorg/jsoup/nodes/Comment;->getData()Ljava/lang/String;

    move-result-object v1

    .line 74
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

    .line 75
    :cond_2b
    invoke-virtual {v1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 76
    .local v2, "declaration":Ljava/lang/String;
    new-instance v3, Lorg/jsoup/nodes/XmlDeclaration;

    .end local v3    # "insert":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0}, Lorg/jsoup/nodes/Comment;->baseUri()Ljava/lang/String;

    move-result-object v4

    const-string v5, "!"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    invoke-direct {v3, v2, v4, v5}, Lorg/jsoup/nodes/XmlDeclaration;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 79
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "declaration":Ljava/lang/String;
    .restart local v3    # "insert":Lorg/jsoup/nodes/Node;
    :cond_3e
    invoke-direct {p0, v3}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 80
    return-void
.end method

.method insert(Lorg/jsoup/parser/Token$Doctype;)V
    .registers 7
    .param p1, "d"    # Lorg/jsoup/parser/Token$Doctype;

    .prologue
    .line 88
    new-instance v0, Lorg/jsoup/nodes/DocumentType;

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getPublicIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/jsoup/parser/Token$Doctype;->getSystemIdentifier()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jsoup/parser/XmlTreeBuilder;->baseUri:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jsoup/nodes/DocumentType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .local v0, "doctypeNode":Lorg/jsoup/nodes/DocumentType;
    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insertNode(Lorg/jsoup/nodes/Node;)V

    .line 90
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
    .line 121
    invoke-virtual {p0, p1, p2, p3}, Lorg/jsoup/parser/XmlTreeBuilder;->initialiseParse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)V

    .line 122
    invoke-virtual {p0}, Lorg/jsoup/parser/XmlTreeBuilder;->runParser()V

    .line 123
    iget-object v0, p0, Lorg/jsoup/parser/XmlTreeBuilder;->doc:Lorg/jsoup/nodes/Document;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Document;->childNodes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected process(Lorg/jsoup/parser/Token;)Z
    .registers 4
    .param p1, "token"    # Lorg/jsoup/parser/Token;

    .prologue
    .line 26
    sget-object v0, Lorg/jsoup/parser/XmlTreeBuilder$1;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v1, p1, Lorg/jsoup/parser/Token;->type:Lorg/jsoup/parser/Token$TokenType;

    invoke-virtual {v1}, Lorg/jsoup/parser/Token$TokenType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_50

    .line 45
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

    .line 47
    :goto_25
    :pswitch_25
    const/4 v0, 0x1

    return v0

    .line 28
    :pswitch_27
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asStartTag()Lorg/jsoup/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$StartTag;)Lorg/jsoup/nodes/Element;

    goto :goto_25

    .line 31
    :pswitch_2f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asEndTag()Lorg/jsoup/parser/Token$EndTag;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->popStackToClose(Lorg/jsoup/parser/Token$EndTag;)V

    goto :goto_25

    .line 34
    :pswitch_37
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asComment()Lorg/jsoup/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Comment;)V

    goto :goto_25

    .line 37
    :pswitch_3f
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asCharacter()Lorg/jsoup/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Character;)V

    goto :goto_25

    .line 40
    :pswitch_47
    invoke-virtual {p1}, Lorg/jsoup/parser/Token;->asDoctype()Lorg/jsoup/parser/Token$Doctype;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/XmlTreeBuilder;->insert(Lorg/jsoup/parser/Token$Doctype;)V

    goto :goto_25

    .line 26
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

.method public bridge synthetic processStartTag(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)Z
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lorg/jsoup/nodes/Attributes;

    .prologue
    .line 15
    invoke-super {p0, p1, p2}, Lorg/jsoup/parser/TreeBuilder;->processStartTag(Ljava/lang/String;Lorg/jsoup/nodes/Attributes;)Z

    move-result v0

    return v0
.end method
