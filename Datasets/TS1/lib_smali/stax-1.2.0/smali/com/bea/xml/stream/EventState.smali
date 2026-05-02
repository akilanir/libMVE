.class public Lcom/bea/xml/stream/EventState;
.super Ljava/lang/Object;
.source "EventState.java"


# instance fields
.field private attributes:Ljava/util/List;

.field private data:Ljava/lang/String;

.field private extraData:Ljava/lang/String;

.field private namespaces:Ljava/util/List;

.field private qname:Ljavax/xml/namespace/QName;

.field private type:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "type"    # I

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lcom/bea/xml/stream/EventState;->type:I

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    .line 23
    return-void
.end method


# virtual methods
.method public addAttribute(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    return-void
.end method

.method public addNamespace(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    return-void
.end method

.method public clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 26
    iput-object v1, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    .line 29
    iput-object v1, p0, Lcom/bea/xml/stream/EventState;->data:Ljava/lang/String;

    .line 30
    iput-object v1, p0, Lcom/bea/xml/stream/EventState;->extraData:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public getAttributes()Ljava/util/List;
    .registers 2

    .prologue
    .line 48
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->data:Ljava/lang/String;

    return-object v0
.end method

.method public getExtraData()Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->extraData:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljavax/xml/namespace/QName;
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNamespaces()Ljava/util/List;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    return-object v0
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    invoke-virtual {v0}, Ljavax/xml/namespace/QName;->getPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()I
    .registers 2

    .prologue
    .line 33
    iget v0, p0, Lcom/bea/xml/stream/EventState;->type:I

    return v0
.end method

.method public setAttributes(Ljava/util/List;)V
    .registers 2
    .param p1, "atts"    # Ljava/util/List;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/bea/xml/stream/EventState;->data:Ljava/lang/String;

    return-void
.end method

.method public setExtraData(Ljava/lang/String;)V
    .registers 2
    .param p1, "d"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/bea/xml/stream/EventState;->extraData:Ljava/lang/String;

    return-void
.end method

.method public setName(Ljavax/xml/namespace/QName;)V
    .registers 2
    .param p1, "n"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    return-void
.end method

.method public setNamespaces(Ljava/util/List;)V
    .registers 2
    .param p1, "ns"    # Ljava/util/List;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    return-void
.end method

.method public setType(I)V
    .registers 2
    .param p1, "type"    # I

    .prologue
    .line 32
    iput p1, p0, Lcom/bea/xml/stream/EventState;->type:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 56
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 57
    .local v0, "b":Ljava/lang/StringBuffer;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget v3, p0, Lcom/bea/xml/stream/EventState;->type:I

    invoke-static {v3}, Lcom/bea/xml/stream/util/ElementTypeNames;->getEventTypeString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    iget-object v2, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    if-eqz v2, :cond_49

    .line 60
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "[name=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/bea/xml/stream/EventState;->qname:Ljavax/xml/namespace/QName;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\']"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    :cond_49
    iget-object v2, p0, Lcom/bea/xml/stream/EventState;->namespaces:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 62
    .local v1, "i":Ljava/util/Iterator;
    :goto_4f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_70

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_4f

    .line 63
    :cond_70
    iget-object v2, p0, Lcom/bea/xml/stream/EventState;->attributes:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 64
    :goto_76
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_97

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_76

    .line 65
    :cond_97
    iget-object v2, p0, Lcom/bea/xml/stream/EventState;->data:Ljava/lang/String;

    if-eqz v2, :cond_b9

    .line 66
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, ",data=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/bea/xml/stream/EventState;->data:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    :cond_b9
    iget-object v2, p0, Lcom/bea/xml/stream/EventState;->extraData:Ljava/lang/String;

    if-eqz v2, :cond_db

    .line 68
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, ",extradata=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/bea/xml/stream/EventState;->extraData:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 69
    :cond_db
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
