.class Lorg/mozilla/javascript/xmlimpl/XMLList;
.super Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.source "XMLList.java"

# interfaces
.implements Lorg/mozilla/javascript/Function;


# static fields
.field static final serialVersionUID:J = -0x3f0e2d2e782404cfL


# instance fields
.field private _annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

.field private targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

.field private targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .registers 5
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 17
    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 18
    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .line 22
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    .line 23
    return-void
.end method

.method private applyOrCall(ZLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "isApply"    # Z
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 713
    if-eqz p1, :cond_16

    const-string v0, "apply"

    .line 714
    .local v0, "methodName":Ljava/lang/String;
    :goto_4
    instance-of v1, p4, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v1, :cond_f

    move-object v1, p4

    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    iget-object v1, v1, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    if-nez v1, :cond_19

    .line 716
    :cond_f
    const-string v1, "msg.isnt.function"

    invoke-static {v1, v0}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1

    .line 713
    .end local v0    # "methodName":Ljava/lang/String;
    :cond_16
    const-string v0, "call"

    goto :goto_4

    .line 719
    .restart local v0    # "methodName":Ljava/lang/String;
    :cond_19
    invoke-static {p1, p2, p3, p4, p5}, Lorg/mozilla/javascript/ScriptRuntime;->applyOrCall(ZLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 6
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 691
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 692
    .local v1, "propertyList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v2, 0x0

    .line 694
    .local v2, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isDescendants()Z

    move-result v3

    if-nez v3, :cond_15

    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v3

    if-nez v3, :cond_15

    .line 697
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    .line 700
    :cond_15
    invoke-virtual {v1, p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V

    .line 702
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_2d

    .line 703
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 702
    add-int/lit8 v0, v0, 0x1

    goto :goto_19

    .line 707
    :cond_2d
    return-object v1
.end method

.method private getXML(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;I)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 4
    .param p1, "_annos"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    .param p2, "index"    # I

    .prologue
    .line 280
    if-ltz p2, :cond_11

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p2, v0, :cond_11

    .line 281
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->item(I)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->xmlFromNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 283
    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 38
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-direct {p0, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXML(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method private insert(ILorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "xml"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 62
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge p1, v1, :cond_1f

    .line 63
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;-><init>()V

    .line 64
    .local v0, "newAnnoList":Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;II)V

    .line 65
    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 66
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    invoke-virtual {v0, v1, p1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;II)V

    .line 67
    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    .line 69
    .end local v0    # "newAnnoList":Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    :cond_1f
    return-void
.end method

.method private internalRemoveFromList(I)V
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->remove(I)V

    .line 49
    return-void
.end method

.method private replaceNode(Lorg/mozilla/javascript/xmlimpl/XML;Lorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 3
    .param p1, "xml"    # Lorg/mozilla/javascript/xmlimpl/XML;
    .param p2, "with"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 173
    invoke-virtual {p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->replaceWith(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 174
    return-void
.end method

.method private setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
    .registers 6
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 349
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_11

    .line 350
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 351
    .local v1, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 349
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 353
    .end local v1    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_11
    return-void
.end method


# virtual methods
.method addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V
    .registers 5
    .param p1, "rv"    # Lorg/mozilla/javascript/xmlimpl/XMLList;
    .param p2, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 389
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 390
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 389
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 392
    :cond_11
    return-void
.end method

.method addToList(Ljava/lang/Object;)V
    .registers 3
    .param p1, "toAdd"    # Ljava/lang/Object;

    .prologue
    .line 356
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->addToList(Ljava/lang/Object;)V

    .line 357
    return-void
.end method

.method public call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 753
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    if-nez v0, :cond_9

    .line 754
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 756
    :cond_9
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v7

    .line 758
    .local v7, "methodName":Ljava/lang/String;
    const-string v0, "apply"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 759
    .local v1, "isApply":Z
    if-nez v1, :cond_1f

    const-string v0, "call"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_29

    :cond_1f
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    .line 760
    invoke-direct/range {v0 .. v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->applyOrCall(ZLorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 786
    :goto_28
    return-object v0

    .line 762
    :cond_29
    instance-of v0, p3, Lorg/mozilla/javascript/xml/XMLObject;

    if-nez v0, :cond_34

    .line 763
    const-string v0, "msg.incompat.call"

    invoke-static {v0, v7}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0

    .line 765
    :cond_34
    const/4 v6, 0x0

    .line 766
    .local v6, "func":Ljava/lang/Object;
    move-object v8, p3

    .line 768
    .end local v6    # "func":Ljava/lang/Object;
    .local v8, "sobj":Lorg/mozilla/javascript/Scriptable;
    :cond_36
    :goto_36
    instance-of v0, v8, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v0, :cond_66

    move-object v9, v8

    .line 769
    check-cast v9, Lorg/mozilla/javascript/xml/XMLObject;

    .line 770
    .local v9, "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-virtual {v9, p1, v7}, Lorg/mozilla/javascript/xml/XMLObject;->getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 771
    .restart local v6    # "func":Ljava/lang/Object;
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-eq v6, v0, :cond_4f

    move-object v0, v6

    .line 783
    .end local v6    # "func":Ljava/lang/Object;
    .end local v9    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_46
    instance-of v2, v0, Lorg/mozilla/javascript/Callable;

    if-nez v2, :cond_5f

    .line 784
    invoke-static {p3, v0, v7}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0

    .line 774
    .restart local v6    # "func":Ljava/lang/Object;
    .restart local v9    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_4f
    invoke-virtual {v9, p1}, Lorg/mozilla/javascript/xml/XMLObject;->getExtraMethodSource(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v8

    .line 775
    if-eqz v8, :cond_36

    .line 776
    move-object p3, v8

    .line 777
    instance-of v0, v8, Lorg/mozilla/javascript/xml/XMLObject;

    if-nez v0, :cond_36

    .line 778
    invoke-static {v8, v7}, Lorg/mozilla/javascript/ScriptableObject;->getProperty(Lorg/mozilla/javascript/Scriptable;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    goto :goto_36

    .line 786
    .end local v6    # "func":Ljava/lang/Object;
    .end local v9    # "xmlObject":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_5f
    check-cast v0, Lorg/mozilla/javascript/Callable;

    invoke-interface {v0, p1, p2, p3, p4}, Lorg/mozilla/javascript/Callable;->call(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_28

    :cond_66
    move-object v0, v6

    goto :goto_46
.end method

.method child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 367
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 369
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_19

    .line 370
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 369
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 373
    :cond_19
    return-object v1
.end method

.method child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 5
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 378
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 380
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_19

    .line 381
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 380
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 384
    :cond_19
    return-object v1
.end method

.method children()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 10

    .prologue
    .line 396
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 398
    .local v5, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/mozilla/javascript/xmlimpl/XML;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_6
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge v3, v8, :cond_2a

    .line 399
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    .line 401
    .local v7, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    if-eqz v7, :cond_27

    .line 402
    invoke-virtual {v7}, Lorg/mozilla/javascript/xmlimpl/XML;->children()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    .line 404
    .local v2, "childList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    .line 405
    .local v1, "cChildren":I
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1b
    if-ge v4, v1, :cond_27

    .line 406
    invoke-virtual {v2, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    add-int/lit8 v4, v4, 0x1

    goto :goto_1b

    .line 398
    .end local v1    # "cChildren":I
    .end local v2    # "childList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .end local v4    # "j":I
    :cond_27
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    .line 411
    .end local v7    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_2a
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 412
    .local v0, "allChildren":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 414
    .local v6, "sz":I
    const/4 v3, 0x0

    :goto_33
    if-ge v3, v6, :cond_3f

    .line 415
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 414
    add-int/lit8 v3, v3, 0x1

    goto :goto_33

    .line 418
    :cond_3f
    return-object v0
.end method

.method comments()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 5

    .prologue
    .line 423
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 425
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 426
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 427
    .local v2, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->comments()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 425
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 430
    .end local v2    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_19
    return-object v1
.end method

.method public construct(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 790
    const-string v0, "msg.not.ctor"

    const-string v1, "XMLList"

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError1(Ljava/lang/String;Ljava/lang/Object;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v0

    throw v0
.end method

.method contains(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "xml"    # Ljava/lang/Object;

    .prologue
    .line 445
    const/4 v2, 0x0

    .line 447
    .local v2, "result":Z
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_2
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_13

    .line 448
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 450
    .local v1, "member":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 451
    const/4 v2, 0x1

    .line 456
    .end local v1    # "member":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_13
    return v2

    .line 447
    .restart local v1    # "member":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    .registers 5

    .prologue
    .line 461
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 463
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 464
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 465
    .local v2, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 463
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 468
    .end local v2    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_19
    return-object v1
.end method

.method public delete(I)V
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 300
    if-ltz p1, :cond_12

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge p1, v1, :cond_12

    .line 301
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 303
    .local v0, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XML;->remove()V

    .line 305
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->internalRemoveFromList(I)V

    .line 307
    .end local v0    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_12
    return-void
.end method

.method deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V
    .registers 5
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 289
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_17

    .line 290
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 292
    .local v1, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 293
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 289
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 296
    .end local v1    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_17
    return-void
.end method

.method elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 6
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 435
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 436
    .local v1, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 437
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 438
    .local v2, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 436
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 440
    .end local v2    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_19
    return-object v1
.end method

.method equivalentXml(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "target"    # Ljava/lang/Object;

    .prologue
    .line 665
    const/4 v2, 0x0

    .line 668
    .local v2, "result":Z
    instance-of v3, p1, Lorg/mozilla/javascript/Undefined;

    if-eqz v3, :cond_d

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-nez v3, :cond_d

    .line 669
    const/4 v2, 0x1

    .line 687
    :cond_c
    :goto_c
    return v2

    .line 670
    :cond_d
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1e

    .line 671
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_c

    .line 672
    :cond_1e
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v3, :cond_c

    move-object v1, p1

    .line 673
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 675
    .local v1, "otherList":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ne v3, v4, :cond_c

    .line 676
    const/4 v2, 0x1

    .line 678
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_31
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_c

    .line 679
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-direct {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XML;->equivalentXml(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_47

    .line 680
    const/4 v2, 0x0

    .line 681
    goto :goto_c

    .line 678
    :cond_47
    add-int/lit8 v0, v0, 0x1

    goto :goto_31
.end method

.method public get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 92
    if-ltz p1, :cond_d

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_d

    .line 93
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 95
    :goto_c
    return-object v0

    :cond_d
    sget-object v0, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_c
.end method

.method public getClassName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    const-string v0, "XMLList"

    return-object v0
.end method

.method public getExtraMethodSource(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/Scriptable;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 743
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_d

    .line 744
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 746
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getIds()[Ljava/lang/Object;
    .registers 4

    .prologue
    .line 313
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->isPrototype()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 314
    const/4 v2, 0x0

    new-array v0, v2, [Ljava/lang/Object;

    .line 323
    .local v0, "enumObjs":[Ljava/lang/Object;
    :cond_9
    return-object v0

    .line 316
    .end local v0    # "enumObjs":[Ljava/lang/Object;
    :cond_a
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    new-array v0, v2, [Ljava/lang/Object;

    .line 318
    .restart local v0    # "enumObjs":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    array-length v2, v0

    if-ge v1, v2, :cond_9

    .line 319
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 318
    add-int/lit8 v1, v1, 0x1

    goto :goto_11
.end method

.method public getIdsForDebug()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 327
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getIds()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    .registers 2

    .prologue
    .line 27
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    return-object v0
.end method

.method getXML()Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3

    .prologue
    .line 43
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_d

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    .line 44
    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 169
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method public has(ILorg/mozilla/javascript/Scriptable;)Z
    .registers 4
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 107
    if-ltz p1, :cond_a

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    if-ge p1, v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method hasComplexContent()Z
    .registers 6

    .prologue
    .line 484
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    .line 486
    .local v2, "length":I
    if-nez v2, :cond_8

    .line 487
    const/4 v0, 0x0

    .line 502
    .local v0, "complexContent":Z
    :cond_7
    :goto_7
    return v0

    .line 488
    .end local v0    # "complexContent":Z
    :cond_8
    const/4 v4, 0x1

    if-ne v2, v4, :cond_15

    .line 489
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XML;->hasComplexContent()Z

    move-result v0

    .restart local v0    # "complexContent":Z
    goto :goto_7

    .line 491
    .end local v0    # "complexContent":Z
    :cond_15
    const/4 v0, 0x0

    .line 493
    .restart local v0    # "complexContent":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_17
    if-ge v1, v2, :cond_7

    .line 494
    invoke-direct {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    .line 495
    .local v3, "nextElement":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_25

    .line 496
    const/4 v0, 0x1

    .line 497
    goto :goto_7

    .line 493
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_17
.end method

.method hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
    .registers 6
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 473
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->isPrototype()Z

    move-result v3

    if-eqz v3, :cond_15

    .line 474
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->localName()Ljava/lang/String;

    move-result-object v0

    .line 475
    .local v0, "property":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->findPrototypeId(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_13

    .line 477
    .end local v0    # "property":Ljava/lang/String;
    :cond_12
    :goto_12
    return v1

    .restart local v0    # "property":Ljava/lang/String;
    :cond_13
    move v1, v2

    .line 475
    goto :goto_12

    .line 477
    .end local v0    # "property":Ljava/lang/String;
    :cond_15
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-gtz v3, :cond_12

    move v1, v2

    goto :goto_12
.end method

.method hasSimpleContent()Z
    .registers 6

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 507
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-nez v4, :cond_9

    .line 518
    :cond_8
    :goto_8
    return v2

    .line 509
    :cond_9
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ne v4, v2, :cond_18

    .line 510
    invoke-direct {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->hasSimpleContent()Z

    move-result v2

    goto :goto_8

    .line 512
    :cond_18
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_19
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge v0, v4, :cond_8

    .line 513
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 514
    .local v1, "nextElement":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->isElement()Z

    move-result v4

    if-eqz v4, :cond_2b

    move v2, v3

    .line 515
    goto :goto_8

    .line 512
    :cond_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_19
.end method

.method hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
    .registers 3
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 102
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getPropertyList(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method item(I)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 344
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    if-eqz v0, :cond_9

    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    :goto_8
    return-object v0

    :cond_9
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->createEmptyXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    goto :goto_8
.end method

.method protected jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "inNewExpr"    # Z
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 726
    array-length v1, p3

    if-nez v1, :cond_8

    .line 727
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 734
    :cond_7
    :goto_7
    return-object v0

    .line 729
    :cond_8
    const/4 v1, 0x0

    aget-object v0, p3, v1

    .line 730
    .local v0, "arg0":Ljava/lang/Object;
    if-nez p2, :cond_11

    instance-of v1, v0, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-nez v1, :cond_7

    .line 734
    :cond_11
    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    goto :goto_7
.end method

.method length()I
    .registers 3

    .prologue
    .line 524
    const/4 v0, 0x0

    .line 526
    .local v0, "result":I
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    if-eqz v1, :cond_b

    .line 527
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->length()I

    move-result v0

    .line 530
    :cond_b
    return v0
.end method

.method normalize()V
    .registers 3

    .prologue
    .line 535
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 536
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->normalize()V

    .line 535
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 538
    :cond_11
    return-void
.end method

.method parent()Ljava/lang/Object;
    .registers 6

    .prologue
    .line 546
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-nez v4, :cond_9

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 565
    :cond_8
    :goto_8
    return-object v0

    .line 548
    :cond_9
    const/4 v0, 0x0

    .line 550
    .local v0, "candidateParent":Lorg/mozilla/javascript/xmlimpl/XML;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge v2, v4, :cond_8

    .line 551
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XML;->parent()Ljava/lang/Object;

    move-result-object v1

    .line 552
    .local v1, "currParent":Ljava/lang/Object;
    instance-of v4, v1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-nez v4, :cond_20

    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_8

    :cond_20
    move-object v3, v1

    .line 553
    check-cast v3, Lorg/mozilla/javascript/xmlimpl/XML;

    .line 554
    .local v3, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    if-nez v2, :cond_29

    .line 556
    move-object v0, v3

    .line 550
    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    .line 558
    :cond_29
    invoke-virtual {v0, v3}, Lorg/mozilla/javascript/xmlimpl/XML;->is(Lorg/mozilla/javascript/xmlimpl/XML;)Z

    move-result v4

    if-nez v4, :cond_26

    .line 561
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_8
.end method

.method processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 6
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 570
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 572
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_19

    .line 573
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 575
    .local v2, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v2, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 572
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 578
    .end local v2    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_19
    return-object v1
.end method

.method propertyIsEnumerable(Ljava/lang/Object;)Z
    .registers 14
    .param p1, "name"    # Ljava/lang/Object;

    .prologue
    const-wide/16 v10, 0x0

    const/4 v5, 0x0

    .line 584
    instance-of v6, p1, Ljava/lang/Integer;

    if-eqz v6, :cond_1d

    .line 585
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "name":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-long v0, v6

    .line 600
    .local v0, "index":J
    :cond_e
    :goto_e
    cmp-long v6, v10, v0

    if-gtz v6, :cond_1c

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v6

    int-to-long v6, v6

    cmp-long v6, v0, v6

    if-gez v6, :cond_1c

    const/4 v5, 0x1

    :cond_1c
    :goto_1c
    return v5

    .line 586
    .end local v0    # "index":J
    .restart local p1    # "name":Ljava/lang/Object;
    :cond_1d
    instance-of v6, p1, Ljava/lang/Number;

    if-eqz v6, :cond_3b

    .line 587
    check-cast p1, Ljava/lang/Number;

    .end local p1    # "name":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    .line 588
    .local v3, "x":D
    double-to-long v0, v3

    .line 589
    .restart local v0    # "index":J
    long-to-double v6, v0

    cmpl-double v6, v6, v3

    if-nez v6, :cond_1c

    .line 592
    cmp-long v6, v0, v10

    if-nez v6, :cond_e

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    div-double/2addr v6, v3

    const-wide/16 v8, 0x0

    cmpg-double v6, v6, v8

    if-gez v6, :cond_e

    goto :goto_1c

    .line 597
    .end local v0    # "index":J
    .end local v3    # "x":D
    .restart local p1    # "name":Ljava/lang/Object;
    :cond_3b
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 598
    .local v2, "s":Ljava/lang/String;
    invoke-static {v2}, Lorg/mozilla/javascript/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v0

    .restart local v0    # "index":J
    goto :goto_e
.end method

.method public put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 15
    .param p1, "index"    # I
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x0

    .line 178
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 183
    .local v3, "parent":Ljava/lang/Object;
    if-nez p3, :cond_3b

    .line 184
    const-string p3, "null"

    .line 189
    .end local p3    # "value":Ljava/lang/Object;
    :cond_8
    :goto_8
    instance-of v8, p3, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v8, :cond_42

    move-object v7, p3

    .line 190
    check-cast v7, Lorg/mozilla/javascript/xml/XMLObject;

    .line 211
    .local v7, "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_f
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge p1, v8, :cond_6d

    .line 212
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {v8}, Lorg/mozilla/javascript/xmlimpl/XML;->parent()Ljava/lang/Object;

    move-result-object v3

    .line 220
    :goto_1d
    instance-of v8, v3, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v8, :cond_d3

    move-object v6, v3

    .line 222
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XML;

    .line 224
    .local v6, "xmlParent":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge p1, v8, :cond_c7

    .line 226
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v5

    .line 228
    .local v5, "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    instance-of v8, v7, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v8, :cond_88

    .line 229
    check-cast v7, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-direct {p0, v5, v7}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replaceNode(Lorg/mozilla/javascript/xmlimpl/XML;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 230
    invoke-virtual {p0, p1, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 277
    .end local v5    # "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    .end local v6    # "xmlParent":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_3a
    :goto_3a
    return-void

    .line 185
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_3b
    instance-of v8, p3, Lorg/mozilla/javascript/Undefined;

    if-eqz v8, :cond_8

    .line 186
    const-string p3, "undefined"

    .local p3, "value":Ljava/lang/String;
    goto :goto_8

    .line 192
    .end local p3    # "value":Ljava/lang/String;
    :cond_42
    iget-object v8, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    if-nez v8, :cond_4f

    .line 193
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    .restart local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    goto :goto_f

    .line 199
    .end local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_4f
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    .line 200
    .restart local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    if-nez v7, :cond_61

    .line 201
    invoke-virtual {p0, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    .line 202
    .local v4, "x":Lorg/mozilla/javascript/xmlimpl/XML;
    if-nez v4, :cond_68

    iget-object v8, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {p0, v10, v8, v10}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    .end local v4    # "x":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_61
    :goto_61
    move-object v8, v7

    .line 206
    check-cast v8, Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-virtual {v8, p3}, Lorg/mozilla/javascript/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    goto :goto_f

    .line 202
    .restart local v4    # "x":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_68
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XML;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v7

    goto :goto_61

    .line 213
    .end local v4    # "x":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_6d
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-nez v8, :cond_83

    .line 214
    iget-object v8, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-eqz v8, :cond_7e

    iget-object v8, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v8}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    :goto_7d
    goto :goto_1d

    :cond_7e
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->parent()Ljava/lang/Object;

    move-result-object v3

    goto :goto_7d

    .line 217
    :cond_83
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->parent()Ljava/lang/Object;

    move-result-object v3

    goto :goto_1d

    .line 231
    .restart local v5    # "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    .restart local v6    # "xmlParent":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_88
    instance-of v8, v7, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v8, :cond_3a

    move-object v2, v7

    .line 233
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 235
    .local v2, "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-lez v8, :cond_3a

    .line 236
    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/XML;->childIndex()I

    move-result v1

    .line 237
    .local v1, "lastIndexAdded":I
    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-direct {p0, v5, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replaceNode(Lorg/mozilla/javascript/xmlimpl/XML;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 238
    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {p0, p1, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 240
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_a8
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge v0, v8, :cond_3a

    .line 241
    invoke-virtual {v6, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->getXmlChild(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildAfter(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    .line 242
    add-int/lit8 v1, v1, 0x1

    .line 243
    add-int v8, p1, v0

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->insert(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 240
    add-int/lit8 v0, v0, 0x1

    goto :goto_a8

    .line 249
    .end local v0    # "i":I
    .end local v1    # "lastIndexAdded":I
    .end local v2    # "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .end local v5    # "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_c7
    invoke-virtual {v6, v7}, Lorg/mozilla/javascript/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    .line 250
    invoke-virtual {v6}, Lorg/mozilla/javascript/xmlimpl/XML;->getLastXmlChild()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {p0, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto/16 :goto_3a

    .line 254
    .end local v6    # "xmlParent":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_d3
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge p1, v8, :cond_11b

    .line 255
    iget-object v8, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-direct {p0, v8, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXML(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v5

    .line 257
    .restart local v5    # "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    instance-of v8, v7, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v8, :cond_ed

    .line 258
    check-cast v7, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    invoke-direct {p0, v5, v7}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replaceNode(Lorg/mozilla/javascript/xmlimpl/XML;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 259
    invoke-virtual {p0, p1, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    goto/16 :goto_3a

    .line 260
    .restart local v7    # "xmlValue":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_ed
    instance-of v8, v7, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v8, :cond_3a

    move-object v2, v7

    .line 262
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 264
    .restart local v2    # "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-lez v8, :cond_3a

    .line 265
    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-direct {p0, v5, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replaceNode(Lorg/mozilla/javascript/xmlimpl/XML;Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 266
    invoke-virtual {v2, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v8

    invoke-virtual {p0, p1, v8}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 268
    const/4 v0, 0x1

    .restart local v0    # "i":I
    :goto_109
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v8

    if-ge v0, v8, :cond_3a

    .line 269
    add-int v8, p1, v0

    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v9

    invoke-direct {p0, v8, v9}, Lorg/mozilla/javascript/xmlimpl/XMLList;->insert(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 268
    add-int/lit8 v0, v0, 0x1

    goto :goto_109

    .line 274
    .end local v0    # "i":I
    .end local v2    # "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .end local v5    # "xmlNode":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_11b
    invoke-virtual {p0, v7}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto/16 :goto_3a
.end method

.method putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
    .registers 10
    .param p1, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 115
    if-nez p2, :cond_14

    .line 116
    const-string p2, "null"

    .line 121
    .end local p2    # "value":Ljava/lang/Object;
    :cond_6
    :goto_6
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_1b

    .line 122
    const-string v3, "Assignment to lists with more than one item is not supported"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 117
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_14
    instance-of v3, p2, Lorg/mozilla/javascript/Undefined;

    if-eqz v3, :cond_6

    .line 118
    const-string p2, "undefined"

    .local p2, "value":Ljava/lang/String;
    goto :goto_6

    .line 124
    .end local p2    # "value":Ljava/lang/String;
    :cond_1b
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-nez v3, :cond_8c

    .line 127
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-eqz v3, :cond_85

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    if-eqz v3, :cond_85

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_85

    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_85

    .line 133
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {p0, v6, v3, v6}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 134
    .local v2, "xmlValue":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 136
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v3

    if-eqz v3, :cond_76

    .line 137
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 147
    :goto_4f
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getNamespace()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    .line 150
    .local v0, "name2":Lorg/mozilla/javascript/xmlimpl/XMLName;
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v3, v0, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 151
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->getLastXmlChild()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v5, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    .line 165
    .end local v0    # "name2":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .end local v2    # "xmlValue":Lorg/mozilla/javascript/xmlimpl/XML;
    :goto_75
    return-void

    .line 139
    .restart local v2    # "xmlValue":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_76
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 140
    .local v1, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 143
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v5, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    goto :goto_4f

    .line 153
    .end local v1    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    .end local v2    # "xmlValue":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_85
    const-string v3, "Assignment to empty XMLList without targets not supported"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 156
    :cond_8c
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v3

    if-eqz v3, :cond_96

    .line 157
    invoke-direct {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->setAttribute(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto :goto_75

    .line 159
    :cond_96
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 160
    .restart local v1    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XML;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 163
    invoke-virtual {p0, v5}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    invoke-virtual {p0, v5, v3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->replace(ILorg/mozilla/javascript/xmlimpl/XML;)V

    goto :goto_75
.end method

.method remove()V
    .registers 4

    .prologue
    .line 333
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    .line 334
    .local v1, "nLen":I
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_17

    .line 335
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    .line 336
    .local v2, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    if-eqz v2, :cond_14

    .line 337
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->remove()V

    .line 338
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->internalRemoveFromList(I)V

    .line 334
    :cond_14
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 341
    .end local v2    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_17
    return-void
.end method

.method replace(ILorg/mozilla/javascript/xmlimpl/XML;)V
    .registers 7
    .param p1, "index"    # I
    .param p2, "xml"    # Lorg/mozilla/javascript/xmlimpl/XML;

    .prologue
    .line 52
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v1

    if-ge p1, v1, :cond_21

    .line 53
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;-><init>()V

    .line 54
    .local v0, "newAnnoList":Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;II)V

    .line 55
    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 56
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    add-int/lit8 v2, p1, 0x1

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;II)V

    .line 57
    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->_annos:Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    .line 59
    .end local v0    # "newAnnoList":Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;
    :cond_21
    return-void
.end method

.method setTargets(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)V
    .registers 3
    .param p1, "object"    # Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    .param p2, "property"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 32
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetObject:Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 33
    iput-object p2, p0, Lorg/mozilla/javascript/xmlimpl/XMLList;->targetProperty:Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .line 34
    return-void
.end method

.method text()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 4

    .prologue
    .line 605
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v1

    .line 607
    .local v1, "result":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_19

    .line 608
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->text()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 607
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 611
    :cond_19
    return-object v1
.end method

.method toSource(I)Ljava/lang/String;
    .registers 3
    .param p1, "indent"    # I

    .prologue
    .line 637
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->toXMLString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 617
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->hasSimpleContent()Z

    move-result v3

    if-eqz v3, :cond_32

    .line 618
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 620
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_c
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v3

    if-ge v0, v3, :cond_2d

    .line 621
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 622
    .local v1, "next":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->isComment()Z

    move-result v3

    if-nez v3, :cond_22

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->isProcessingInstruction()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 620
    :cond_22
    :goto_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 625
    :cond_25
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XML;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 629
    .end local v1    # "next":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_2d
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 631
    .end local v0    # "i":I
    .end local v2    # "sb":Ljava/lang/StringBuilder;
    :goto_31
    return-object v3

    :cond_32
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->toXMLString()Ljava/lang/String;

    move-result-object v3

    goto :goto_31
.end method

.method toXMLString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 645
    .local v1, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v2

    if-ge v0, v2, :cond_2b

    .line 646
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v2

    if-eqz v2, :cond_1d

    if-eqz v0, :cond_1d

    .line 647
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 649
    :cond_1d
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXmlFromAnnotation(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v2

    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XML;->toXMLString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 645
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 651
    :cond_2b
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method valueOf()Ljava/lang/Object;
    .registers 1

    .prologue
    .line 656
    return-object p0
.end method
