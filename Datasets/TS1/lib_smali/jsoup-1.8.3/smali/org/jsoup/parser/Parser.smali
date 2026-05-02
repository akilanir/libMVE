.class public Lorg/jsoup/parser/Parser;
.super Ljava/lang/Object;
.source "Parser.java"


# static fields
.field private static final DEFAULT_MAX_ERRORS:I


# instance fields
.field private errors:Lorg/jsoup/parser/ParseErrorList;

.field private maxErrors:I

.field private treeBuilder:Lorg/jsoup/parser/TreeBuilder;


# direct methods
.method public constructor <init>(Lorg/jsoup/parser/TreeBuilder;)V
    .registers 3
    .param p1, "treeBuilder"    # Lorg/jsoup/parser/TreeBuilder;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    .line 25
    iput-object p1, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    .line 26
    return-void
.end method

.method public static htmlParser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 171
    new-instance v0, Lorg/jsoup/parser/Parser;

    new-instance v1, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-direct {v1}, Lorg/jsoup/parser/HtmlTreeBuilder;-><init>()V

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Parser;-><init>(Lorg/jsoup/parser/TreeBuilder;)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 4
    .param p0, "html"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 88
    new-instance v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/HtmlTreeBuilder;-><init>()V

    .line 89
    .local v0, "treeBuilder":Lorg/jsoup/parser/TreeBuilder;
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    invoke-virtual {v0, p0, p1, v1}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 10
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 128
    invoke-static {p1}, Lorg/jsoup/nodes/Document;->createShell(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    .line 129
    .local v1, "doc":Lorg/jsoup/nodes/Document;
    invoke-virtual {v1}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v0

    .line 130
    .local v0, "body":Lorg/jsoup/nodes/Element;
    invoke-static {p0, v0, p1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 131
    .local v4, "nodeList":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Lorg/jsoup/nodes/Node;

    invoke-interface {v4, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lorg/jsoup/nodes/Node;

    .line 132
    .local v5, "nodes":[Lorg/jsoup/nodes/Node;
    array-length v6, v5

    add-int/lit8 v2, v6, -0x1

    .local v2, "i":I
    :goto_1b
    if-lez v2, :cond_25

    .line 133
    aget-object v6, v5, v2

    invoke-virtual {v6}, Lorg/jsoup/nodes/Node;->remove()V

    .line 132
    add-int/lit8 v2, v2, -0x1

    goto :goto_1b

    .line 135
    :cond_25
    array-length v7, v5

    const/4 v6, 0x0

    :goto_27
    if-ge v6, v7, :cond_31

    aget-object v3, v5, v6

    .line 136
    .local v3, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v0, v3}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 135
    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    .line 138
    .end local v3    # "node":Lorg/jsoup/nodes/Node;
    :cond_31
    return-object v1
.end method

.method public static parseBodyFragmentRelaxed(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 3
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 160
    invoke-static {p0, p1}, Lorg/jsoup/parser/Parser;->parse(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p0, "fragmentHtml"    # Ljava/lang/String;
    .param p1, "context"    # Lorg/jsoup/nodes/Element;
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/jsoup/nodes/Element;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    new-instance v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/HtmlTreeBuilder;-><init>()V

    .line 104
    .local v0, "treeBuilder":Lorg/jsoup/parser/HtmlTreeBuilder;
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    invoke-virtual {v0, p0, p1, p2, v1}, Lorg/jsoup/parser/HtmlTreeBuilder;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static parseXmlFragment(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 4
    .param p0, "fragmentXml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/nodes/Node;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    new-instance v0, Lorg/jsoup/parser/XmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/XmlTreeBuilder;-><init>()V

    .line 116
    .local v0, "treeBuilder":Lorg/jsoup/parser/XmlTreeBuilder;
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    invoke-virtual {v0, p0, p1, v1}, Lorg/jsoup/parser/XmlTreeBuilder;->parseFragment(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Ljava/util/List;

    move-result-object v1

    return-object v1
.end method

.method public static unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "inAttribute"    # Z

    .prologue
    .line 148
    new-instance v0, Lorg/jsoup/parser/Tokeniser;

    new-instance v1, Lorg/jsoup/parser/CharacterReader;

    invoke-direct {v1, p0}, Lorg/jsoup/parser/CharacterReader;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/parser/Tokeniser;-><init>(Lorg/jsoup/parser/CharacterReader;Lorg/jsoup/parser/ParseErrorList;)V

    .line 149
    .local v0, "tokeniser":Lorg/jsoup/parser/Tokeniser;
    invoke-virtual {v0, p1}, Lorg/jsoup/parser/Tokeniser;->unescapeEntities(Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static xmlParser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 180
    new-instance v0, Lorg/jsoup/parser/Parser;

    new-instance v1, Lorg/jsoup/parser/XmlTreeBuilder;

    invoke-direct {v1}, Lorg/jsoup/parser/XmlTreeBuilder;-><init>()V

    invoke-direct {v0, v1}, Lorg/jsoup/parser/Parser;-><init>(Lorg/jsoup/parser/TreeBuilder;)V

    return-object v0
.end method


# virtual methods
.method public getErrors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jsoup/parser/ParseError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    return-object v0
.end method

.method public getTreeBuilder()Lorg/jsoup/parser/TreeBuilder;
    .registers 2

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    return-object v0
.end method

.method public isTrackErrors()Z
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    if-lez v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public parseInput(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 5
    .param p1, "html"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0}, Lorg/jsoup/parser/Parser;->isTrackErrors()Z

    move-result v0

    if-eqz v0, :cond_17

    iget v0, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    invoke-static {v0}, Lorg/jsoup/parser/ParseErrorList;->tracking(I)Lorg/jsoup/parser/ParseErrorList;

    move-result-object v0

    :goto_c
    iput-object v0, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    .line 30
    iget-object v0, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    iget-object v1, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v0, p1, p2, v1}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    return-object v0

    .line 29
    :cond_17
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v0

    goto :goto_c
.end method

.method public setTrackErrors(I)Lorg/jsoup/parser/Parser;
    .registers 2
    .param p1, "maxErrors"    # I

    .prologue
    .line 66
    iput p1, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    .line 67
    return-object p0
.end method

.method public setTreeBuilder(Lorg/jsoup/parser/TreeBuilder;)Lorg/jsoup/parser/Parser;
    .registers 2
    .param p1, "treeBuilder"    # Lorg/jsoup/parser/TreeBuilder;

    .prologue
    .line 48
    iput-object p1, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    .line 49
    return-object p0
.end method
