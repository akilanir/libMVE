.class public Lorg/jsoup/nodes/XmlDeclaration;
.super Lorg/jsoup/nodes/Node;
.source "XmlDeclaration.java"


# static fields
.field static final DECL_KEY:Ljava/lang/String; = "declaration"


# instance fields
.field private final isProcessingInstruction:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "isProcessingInstruction"    # Z

    .prologue
    .line 18
    invoke-direct {p0, p2}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;)V

    .line 19
    iget-object v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "declaration"

    invoke-virtual {v0, v1, p1}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    iput-boolean p3, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    .line 21
    return-void
.end method


# virtual methods
.method public getWholeDeclaration()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 32
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "declaration"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 34
    .local v0, "decl":Ljava/lang/String;
    const-string v4, "xml"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-ne v4, v6, :cond_55

    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Attributes;->size()I

    move-result v4

    if-le v4, v6, :cond_55

    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "version"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 38
    .local v3, "version":Ljava/lang/String;
    if-eqz v3, :cond_37

    .line 39
    const-string v4, " version=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    :cond_37
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "encoding"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 44
    .local v1, "encoding":Ljava/lang/String;
    if-eqz v1, :cond_50

    .line 45
    const-string v4, " encoding=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    :cond_50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 51
    .end local v1    # "encoding":Ljava/lang/String;
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    .end local v3    # "version":Ljava/lang/String;
    :goto_54
    return-object v4

    :cond_55
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "declaration"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_54
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 24
    const-string v0, "#declaration"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 56
    const-string v0, "<"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    if-eqz v0, :cond_1e

    const-string v0, "!"

    :goto_c
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jsoup/nodes/XmlDeclaration;->getWholeDeclaration()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    return-void

    .line 56
    :cond_1e
    const-string v0, "?"

    goto :goto_c
.end method

.method outerHtmlTail(Ljava/lang/StringBuilder;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/StringBuilder;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 63
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    invoke-virtual {p0}, Lorg/jsoup/nodes/XmlDeclaration;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
