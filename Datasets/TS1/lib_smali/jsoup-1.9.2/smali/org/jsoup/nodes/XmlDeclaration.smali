.class public Lorg/jsoup/nodes/XmlDeclaration;
.super Lorg/jsoup/nodes/Node;
.source "XmlDeclaration.java"


# instance fields
.field private final isProcessingInstruction:Z

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "isProcessingInstruction"    # Z

    .prologue
    .line 22
    invoke-direct {p0, p2}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;)V

    .line 23
    invoke-static {p1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 24
    iput-object p1, p0, Lorg/jsoup/nodes/XmlDeclaration;->name:Ljava/lang/String;

    .line 25
    iput-boolean p3, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    .line 26
    return-void
.end method


# virtual methods
.method public getWholeDeclaration()Ljava/lang/String;
    .registers 2

    .prologue
    .line 46
    iget-object v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0}, Lorg/jsoup/nodes/Attributes;->html()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public name()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->name:Ljava/lang/String;

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 29
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
    .line 50
    const-string v0, "<"

    .line 51
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    iget-boolean v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    if-eqz v0, :cond_2a

    const-string v0, "!"

    .line 52
    :goto_c
    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    iget-object v1, p0, Lorg/jsoup/nodes/XmlDeclaration;->name:Ljava/lang/String;

    .line 53
    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 54
    iget-object v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v0, p1, p3}, Lorg/jsoup/nodes/Attributes;->html(Ljava/lang/Appendable;Lorg/jsoup/nodes/Document$OutputSettings;)V

    .line 55
    iget-boolean v0, p0, Lorg/jsoup/nodes/XmlDeclaration;->isProcessingInstruction:Z

    if-eqz v0, :cond_2d

    const-string v0, "!"

    .line 56
    :goto_20
    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v0

    const-string v1, ">"

    .line 57
    invoke-interface {v0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 58
    return-void

    .line 51
    :cond_2a
    const-string v0, "?"

    goto :goto_c

    .line 55
    :cond_2d
    const-string v0, "?"

    goto :goto_20
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 60
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    invoke-virtual {p0}, Lorg/jsoup/nodes/XmlDeclaration;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
