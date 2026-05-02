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
    .line 172
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
    .line 89
    new-instance v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/HtmlTreeBuilder;-><init>()V

    .line 90
    .local v0, "treeBuilder":Lorg/jsoup/parser/TreeBuilder;
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    invoke-virtual {v0, p0, p1, v1}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 12
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 129
    invoke-static {p1}, Lorg/jsoup/nodes/Document;->createShell(Ljava/lang/String;)Lorg/jsoup/nodes/Document;

    move-result-object v2

    .line 130
    .local v2, "doc":Lorg/jsoup/nodes/Document;
    invoke-virtual {v2}, Lorg/jsoup/nodes/Document;->body()Lorg/jsoup/nodes/Element;

    move-result-object v1

    .line 131
    .local v1, "body":Lorg/jsoup/nodes/Element;
    invoke-static {p0, v1, p1}, Lorg/jsoup/parser/Parser;->parseFragment(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/util/List;

    move-result-object v7

    .line 132
    .local v7, "nodeList":Ljava/util/List;, "Ljava/util/List<Lorg/jsoup/nodes/Node;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Lorg/jsoup/nodes/Node;

    invoke-interface {v7, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Lorg/jsoup/nodes/Node;

    .line 133
    .local v8, "nodes":[Lorg/jsoup/nodes/Node;
    array-length v9, v8

    add-int/lit8 v3, v9, -0x1

    .local v3, "i":I
    :goto_1b
    if-lez v3, :cond_25

    .line 134
    aget-object v9, v8, v3

    invoke-virtual {v9}, Lorg/jsoup/nodes/Node;->remove()V

    .line 133
    add-int/lit8 v3, v3, -0x1

    goto :goto_1b

    .line 136
    :cond_25
    move-object v0, v8

    .local v0, "arr$":[Lorg/jsoup/nodes/Node;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_28
    if-ge v4, v5, :cond_32

    aget-object v6, v0, v4

    .line 137
    .local v6, "node":Lorg/jsoup/nodes/Node;
    invoke-virtual {v1, v6}, Lorg/jsoup/nodes/Element;->appendChild(Lorg/jsoup/nodes/Node;)Lorg/jsoup/nodes/Element;

    .line 136
    add-int/lit8 v4, v4, 0x1

    goto :goto_28

    .line 139
    .end local v6    # "node":Lorg/jsoup/nodes/Node;
    :cond_32
    return-object v2
.end method

.method public static parseBodyFragmentRelaxed(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/Document;
    .registers 3
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 161
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
    .line 104
    new-instance v0, Lorg/jsoup/parser/HtmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/HtmlTreeBuilder;-><init>()V

    .line 105
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
    .line 116
    new-instance v0, Lorg/jsoup/parser/XmlTreeBuilder;

    invoke-direct {v0}, Lorg/jsoup/parser/XmlTreeBuilder;-><init>()V

    .line 117
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
    .line 149
    new-instance v0, Lorg/jsoup/parser/Tokeniser;

    new-instance v1, Lorg/jsoup/parser/CharacterReader;

    invoke-direct {v1, p0}, Lorg/jsoup/parser/CharacterReader;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/parser/Tokeniser;-><init>(Lorg/jsoup/parser/CharacterReader;Lorg/jsoup/parser/ParseErrorList;)V

    .line 150
    .local v0, "tokeniser":Lorg/jsoup/parser/Tokeniser;
    invoke-virtual {v0, p1}, Lorg/jsoup/parser/Tokeniser;->unescapeEntities(Z)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static xmlParser()Lorg/jsoup/parser/Parser;
    .registers 2

    .prologue
    .line 181
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
    .line 76
    iget-object v0, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    return-object v0
.end method

.method public getTreeBuilder()Lorg/jsoup/parser/TreeBuilder;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    return-object v0
.end method

.method public isTrackErrors()Z
    .registers 2

    .prologue
    .line 58
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
    .registers 6
    .param p1, "html"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0}, Lorg/jsoup/parser/Parser;->isTrackErrors()Z

    move-result v1

    if-eqz v1, :cond_17

    iget v1, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    invoke-static {v1}, Lorg/jsoup/parser/ParseErrorList;->tracking(I)Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    :goto_c
    iput-object v1, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    .line 30
    iget-object v1, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    iget-object v2, p0, Lorg/jsoup/parser/Parser;->errors:Lorg/jsoup/parser/ParseErrorList;

    invoke-virtual {v1, p1, p2, v2}, Lorg/jsoup/parser/TreeBuilder;->parse(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/parser/ParseErrorList;)Lorg/jsoup/nodes/Document;

    move-result-object v0

    .line 31
    .local v0, "doc":Lorg/jsoup/nodes/Document;
    return-object v0

    .line 29
    .end local v0    # "doc":Lorg/jsoup/nodes/Document;
    :cond_17
    invoke-static {}, Lorg/jsoup/parser/ParseErrorList;->noTracking()Lorg/jsoup/parser/ParseErrorList;

    move-result-object v1

    goto :goto_c
.end method

.method public setTrackErrors(I)Lorg/jsoup/parser/Parser;
    .registers 2
    .param p1, "maxErrors"    # I

    .prologue
    .line 67
    iput p1, p0, Lorg/jsoup/parser/Parser;->maxErrors:I

    .line 68
    return-object p0
.end method

.method public setTreeBuilder(Lorg/jsoup/parser/TreeBuilder;)Lorg/jsoup/parser/Parser;
    .registers 2
    .param p1, "treeBuilder"    # Lorg/jsoup/parser/TreeBuilder;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/jsoup/parser/Parser;->treeBuilder:Lorg/jsoup/parser/TreeBuilder;

    .line 50
    return-object p0
.end method
