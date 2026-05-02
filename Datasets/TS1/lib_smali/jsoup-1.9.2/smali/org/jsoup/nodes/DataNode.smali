.class public Lorg/jsoup/nodes/DataNode;
.super Lorg/jsoup/nodes/Node;
.source "DataNode.java"


# static fields
.field private static final DATA_KEY:Ljava/lang/String; = "data"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p1, "data"    # Ljava/lang/String;
    .param p2, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct {p0, p2}, Lorg/jsoup/nodes/Node;-><init>(Ljava/lang/String;)V

    .line 19
    iget-object v0, p0, Lorg/jsoup/nodes/DataNode;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    return-void
.end method

.method public static createFromEncoded(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/nodes/DataNode;
    .registers 4
    .param p0, "encodedData"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-static {p0}, Lorg/jsoup/nodes/Entities;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 63
    .local v0, "data":Ljava/lang/String;
    new-instance v1, Lorg/jsoup/nodes/DataNode;

    invoke-direct {v1, v0, p1}, Lorg/jsoup/nodes/DataNode;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public getWholeData()Ljava/lang/String;
    .registers 3

    .prologue
    .line 31
    iget-object v0, p0, Lorg/jsoup/nodes/DataNode;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nodeName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 23
    const-string v0, "#data"

    return-object v0
.end method

.method outerHtmlHead(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-virtual {p0}, Lorg/jsoup/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 46
    return-void
.end method

.method outerHtmlTail(Ljava/lang/Appendable;ILorg/jsoup/nodes/Document$OutputSettings;)V
    .registers 4
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "depth"    # I
    .param p3, "out"    # Lorg/jsoup/nodes/Document$OutputSettings;

    .prologue
    .line 48
    return-void
.end method

.method public setWholeData(Ljava/lang/String;)Lorg/jsoup/nodes/DataNode;
    .registers 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jsoup/nodes/DataNode;->attributes:Lorg/jsoup/nodes/Attributes;

    const-string v1, "data"

    invoke-virtual {v0, v1, p1}, Lorg/jsoup/nodes/Attributes;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/jsoup/nodes/DataNode;->outerHtml()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
