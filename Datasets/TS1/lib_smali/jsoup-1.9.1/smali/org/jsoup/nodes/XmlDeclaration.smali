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
    .line 20
    invoke-direct {p0, p2}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;)V

    .line 21
    iget-object v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "declaration"

    invoke-virtual {v0, v1, p1}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    iput-boolean p3, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    .line 23
    return-void
.end method


# virtual methods
.method public getWholeDeclaration()Ljava/lang/String;
    .registers 7

    .prologue
    .line 34
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "declaration"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, "decl":Ljava/lang/String;
    const-string v4, "xml"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_55

    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v4}, Lorg/jsoup/nodes/Attributes;->size()I

    move-result v4

    const/4 v5, 0x1

    if-le v4, v5, :cond_55

    .line 37
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "version"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 40
    .local v3, "version":Ljava/lang/String;
    if-eqz v3, :cond_37

    .line 41
    const-string v4, " version=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    :cond_37
    iget-object v4, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v5, "encoding"

    invoke-virtual {v4, v5}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "encoding":Ljava/lang/String;
    if-eqz v1, :cond_50

    .line 47
    const-string v4, " encoding=\""

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    :cond_50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 53
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
    .line 26
    const-string v0, "#declaration"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 6
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    const-string v0, "<"

    .line 59
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    iget-boolean v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    if-eqz v0, :cond_1e

    const-string v0, "!"

    .line 60
    :goto_c
    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    .line 61
    invoke-virtual {p0}, Lorg/jsoup/nodes/XmlDeclaration;->getWholeDeclaration()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    const-string v1, ">"

    .line 62
    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 63
    return-void

    .line 59
    :cond_1e
    const-string v0, "?"

    goto :goto_c
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 65
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/jsoup/nodes/XmlDeclaration;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
