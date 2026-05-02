.class public abstract Lorg/apache/commons/digester/Rule;
.super Ljava/lang/Object;
.source "Rule.java"


# instance fields
.field protected digester:Lorg/apache/commons/digester/Digester;

.field protected namespaceURI:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object v0, p0, Lorg/apache/commons/digester/Rule;->digester:Lorg/apache/commons/digester/Digester;

    .line 91
    iput-object v0, p0, Lorg/apache/commons/digester/Rule;->namespaceURI:Ljava/lang/String;

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    const/4 v0, 0x0

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    iput-object v0, p0, Lorg/apache/commons/digester/Rule;->digester:Lorg/apache/commons/digester/Digester;

    .line 91
    iput-object v0, p0, Lorg/apache/commons/digester/Rule;->namespaceURI:Ljava/lang/String;

    .line 68
    invoke-virtual {p0, p1}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 70
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 4
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 175
    invoke-virtual {p0, p3}, Lorg/apache/commons/digester/Rule;->begin(Lorg/xml/sax/Attributes;)V

    .line 177
    return-void
.end method

.method public begin(Lorg/xml/sax/Attributes;)V
    .registers 2
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 154
    return-void
.end method

.method public body(Ljava/lang/String;)V
    .registers 2
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 194
    return-void
.end method

.method public body(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 217
    invoke-virtual {p0, p3}, Lorg/apache/commons/digester/Rule;->body(Ljava/lang/String;)V

    .line 219
    return-void
.end method

.method public end()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 233
    return-void
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 253
    invoke-virtual {p0}, Lorg/apache/commons/digester/Rule;->end()V

    .line 255
    return-void
.end method

.method public finish()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 266
    return-void
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/commons/digester/Rule;->digester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/commons/digester/Rule;->namespaceURI:Ljava/lang/String;

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/commons/digester/Rule;->digester:Lorg/apache/commons/digester/Digester;

    .line 113
    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 133
    iput-object p1, p0, Lorg/apache/commons/digester/Rule;->namespaceURI:Ljava/lang/String;

    .line 135
    return-void
.end method
