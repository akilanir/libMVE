.class public Lcom/bea/xml/stream/util/NamespaceContextImpl;
.super Ljava/lang/Object;
.source "NamespaceContextImpl.java"

# interfaces
.implements Ljavax/xml/namespace/NamespaceContext;


# instance fields
.field prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

.field rootContext:Ljavax/xml/namespace/NamespaceContext;

.field uriTable:Lcom/bea/xml/stream/util/SymbolTable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/bea/xml/stream/util/SymbolTable;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/SymbolTable;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    .line 28
    new-instance v0, Lcom/bea/xml/stream/util/SymbolTable;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/SymbolTable;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    .line 31
    invoke-virtual {p0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->init()V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljavax/xml/namespace/NamespaceContext;)V
    .registers 3
    .param p1, "rootContext"    # Ljavax/xml/namespace/NamespaceContext;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/bea/xml/stream/util/SymbolTable;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/SymbolTable;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    .line 28
    new-instance v0, Lcom/bea/xml/stream/util/SymbolTable;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/SymbolTable;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->rootContext:Ljavax/xml/namespace/NamespaceContext;

    .line 35
    invoke-virtual {p0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->init()V

    .line 36
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v0, Lcom/bea/xml/stream/util/NamespaceContextImpl;

    invoke-direct {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;-><init>()V

    .line 97
    .local v0, "nci":Lcom/bea/xml/stream/util/NamespaceContextImpl;
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->openScope()V

    .line 98
    const-string v2, "a"

    const-string v3, "uri"

    invoke-virtual {v0, v2, v3}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    const-string v2, "b"

    const-string v3, "uri"

    invoke-virtual {v0, v2, v3}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "a="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "a"

    invoke-virtual {v0, v4}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 101
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "uri="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "uri"

    invoke-virtual {v0, v4}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    const-string v2, "uri"

    invoke-virtual {v0, v2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefixes(Ljava/lang/String;)Ljava/util/Iterator;

    move-result-object v1

    .line 104
    .local v1, "vals":Ljava/util/Iterator;
    :goto_58
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7b

    .line 105
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "1 uri->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_58

    .line 107
    :cond_7b
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->openScope()V

    .line 108
    const-string v2, "a"

    const-string v3, "uri2"

    invoke-virtual {v0, v2, v3}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    const-string v2, "uri"

    invoke-virtual {v0, v2}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getPrefixes(Ljava/lang/String;)Ljava/util/Iterator;

    move-result-object v1

    .line 110
    :goto_8b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_ae

    .line 111
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "2 uri->"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_8b

    .line 112
    :cond_ae
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->closeScope()V

    .line 113
    invoke-virtual {v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->closeScope()V

    .line 114
    return-void
.end method


# virtual methods
.method public bindDefaultNameSpace(Ljava/lang/String;)V
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public bindNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0, p1, p2}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0, p2, p1}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public closeScope()V
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 47
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->closeScope()V

    .line 48
    return-void
.end method

.method public getDefaultNameSpace()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    const-string v0, ""

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDepth()I
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->getDepth()I

    move-result v0

    return v0
.end method

.method public getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 60
    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v1, p1}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 61
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_12

    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->rootContext:Ljavax/xml/namespace/NamespaceContext;

    if-eqz v1, :cond_12

    .line 62
    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->rootContext:Ljavax/xml/namespace/NamespaceContext;

    invoke-interface {v1, p1}, Ljavax/xml/namespace/NamespaceContext;->getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 64
    .end local v0    # "value":Ljava/lang/String;
    :cond_12
    return-object v0
.end method

.method public getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v1, p1}, Lcom/bea/xml/stream/util/SymbolTable;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_12

    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->rootContext:Ljavax/xml/namespace/NamespaceContext;

    if-eqz v1, :cond_12

    .line 70
    iget-object v1, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->rootContext:Ljavax/xml/namespace/NamespaceContext;

    invoke-interface {v1, p1}, Ljavax/xml/namespace/NamespaceContext;->getPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .end local v0    # "value":Ljava/lang/String;
    :cond_12
    return-object v0
.end method

.method public getPrefixes(Ljava/lang/String;)Ljava/util/Iterator;
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0, p1}, Lcom/bea/xml/stream/util/SymbolTable;->getAll(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .registers 3

    .prologue
    .line 38
    const-string v0, "xml"

    const-string v1, "http://www.w3.org/XML/1998/namespace"

    invoke-virtual {p0, v0, v1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    const-string v0, "xmlns"

    const-string v1, "http://www.w3.org/XML/1998/namespace"

    invoke-virtual {p0, v0, v1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public openScope()V
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 43
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->uriTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0}, Lcom/bea/xml/stream/util/SymbolTable;->openScope()V

    .line 44
    return-void
.end method

.method public unbindDefaultNameSpace()V
    .registers 3

    .prologue
    .line 79
    const-string v0, ""

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/bea/xml/stream/util/NamespaceContextImpl;->bindNamespace(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    return-void
.end method

.method public unbindNamespace(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 83
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0, p1, v1}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    iget-object v0, p0, Lcom/bea/xml/stream/util/NamespaceContextImpl;->prefixTable:Lcom/bea/xml/stream/util/SymbolTable;

    invoke-virtual {v0, p2, v1}, Lcom/bea/xml/stream/util/SymbolTable;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    return-void
.end method
