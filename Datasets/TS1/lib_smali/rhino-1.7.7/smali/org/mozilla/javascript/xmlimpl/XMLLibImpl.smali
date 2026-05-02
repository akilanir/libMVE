.class public final Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
.super Lorg/mozilla/javascript/xml/XMLLib;
.source "XMLLibImpl.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private globalScope:Lorg/mozilla/javascript/Scriptable;

.field private namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

.field private options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

.field private qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

.field private xmlListPrototype:Lorg/mozilla/javascript/xmlimpl/XMLList;

.field private xmlPrototype:Lorg/mozilla/javascript/xmlimpl/XML;


# direct methods
.method private constructor <init>(Lorg/mozilla/javascript/Scriptable;)V
    .registers 3
    .param p1, "globalScope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 104
    invoke-direct {p0}, Lorg/mozilla/javascript/xml/XMLLib;-><init>()V

    .line 102
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-direct {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;-><init>()V

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    .line 105
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    .line 106
    return-void
.end method

.method private static badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 168
    instance-of v1, p0, Ljava/lang/Number;

    if-eqz v1, :cond_20

    .line 169
    const-string v0, "Can not construct XML name from number: "

    .line 177
    .local v0, "msg":Ljava/lang/String;
    :goto_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    return-object v1

    .line 170
    .end local v0    # "msg":Ljava/lang/String;
    :cond_20
    instance-of v1, p0, Ljava/lang/Boolean;

    if-eqz v1, :cond_27

    .line 171
    const-string v0, "Can not construct XML name from boolean: "

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_6

    .line 172
    .end local v0    # "msg":Ljava/lang/String;
    :cond_27
    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p0, v1, :cond_2d

    if-nez p0, :cond_30

    .line 173
    :cond_2d
    const-string v0, "Can not construct XML name from "

    .restart local v0    # "msg":Ljava/lang/String;
    goto :goto_6

    .line 175
    .end local v0    # "msg":Ljava/lang/String;
    :cond_30
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private exportToScope(Z)V
    .registers 6
    .param p1, "sealed"    # Z

    .prologue
    const/4 v3, 0x0

    .line 125
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    const-string v1, ""

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlPrototype:Lorg/mozilla/javascript/xmlimpl/XML;

    .line 126
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlListPrototype:Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 127
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->GLOBAL:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-static {v0, v3, v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->create(Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/Namespace;Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 129
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    const-string v1, ""

    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    const-string v2, ""

    invoke-static {v1, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {p0, v0, v3, v1}, Lorg/mozilla/javascript/xmlimpl/QName;->create(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/QName;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    iput-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    .line 132
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlPrototype:Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XML;->exportAsJSClass(Z)V

    .line 133
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlListPrototype:Lorg/mozilla/javascript/xmlimpl/XMLList;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->exportAsJSClass(Z)V

    .line 134
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->exportAsJSClass(Z)V

    .line 135
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/QName;->exportAsJSClass(Z)V

    .line 136
    return-void
.end method

.method private getDefaultNamespaceURI(Lorg/mozilla/javascript/Context;)Ljava/lang/String;
    .registers 3
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 337
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/Namespace;->uri()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static init(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Z)V
    .registers 5
    .param p0, "cx"    # Lorg/mozilla/javascript/Context;
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p2, "sealed"    # Z

    .prologue
    .line 37
    new-instance v1, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-direct {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;-><init>(Lorg/mozilla/javascript/Scriptable;)V

    .line 38
    .local v1, "lib":Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->bindToScope(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/xml/XMLLib;

    move-result-object v0

    .line 39
    .local v0, "bound":Lorg/mozilla/javascript/xml/XMLLib;
    if-ne v0, v1, :cond_e

    .line 40
    invoke-direct {v1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->exportToScope(Z)V

    .line 42
    :cond_e
    return-void
.end method

.method private parse(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 5
    .param p1, "frag"    # Ljava/lang/String;

    .prologue
    .line 429
    :try_start_0
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getDefaultNamespaceURI(Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createElement(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    :try_end_11
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_11} :catch_13

    move-result-object v1

    return-object v1

    .line 431
    :catch_13
    move-exception v0

    .line 432
    .local v0, "e":Lorg/xml/sax/SAXException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot parse XML: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1
.end method

.method public static toDomNode(Ljava/lang/Object;)Lorg/w3c/dom/Node;
    .registers 3
    .param p0, "xmlObject"    # Ljava/lang/Object;

    .prologue
    .line 28
    instance-of v0, p0, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v0, :cond_b

    .line 29
    check-cast p0, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local p0    # "xmlObject":Ljava/lang/Object;
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XML;->toDomNode()Lorg/w3c/dom/Node;

    move-result-object v0

    return-object v0

    .line 31
    .restart local p0    # "xmlObject":Ljava/lang/Object;
    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "xmlObject is not an XML object in JavaScript."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private xmlPrimaryReference(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xmlimpl/XMLName;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "xmlName"    # Lorg/mozilla/javascript/xmlimpl/XMLName;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 304
    const/4 v0, 0x0

    .line 308
    .local v0, "firstXml":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    :cond_1
    instance-of v2, p3, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;

    if-eqz v2, :cond_1a

    .line 309
    invoke-interface {p3}, Lorg/mozilla/javascript/Scriptable;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 310
    .local v1, "xmlObj":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    invoke-virtual {v1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 326
    :goto_11
    if-eqz v1, :cond_16

    .line 327
    invoke-virtual {p2, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V

    .line 329
    :cond_16
    return-object p2

    .line 313
    :cond_17
    if-nez v0, :cond_1a

    .line 314
    move-object v0, v1

    .line 317
    .end local v1    # "xmlObj":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    :cond_1a
    invoke-interface {p3}, Lorg/mozilla/javascript/Scriptable;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object p3

    .line 318
    if-nez p3, :cond_1

    .line 319
    move-object v1, v0

    .line 320
    .restart local v1    # "xmlObj":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    goto :goto_11
.end method


# virtual methods
.method addXMLObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xml/XMLObject;)Ljava/lang/Object;
    .registers 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "obj1"    # Lorg/mozilla/javascript/xml/XMLObject;
    .param p3, "obj2"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 274
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    .line 276
    .local v3, "listToAdd":Lorg/mozilla/javascript/xmlimpl/XMLList;
    instance-of v4, p2, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v4, :cond_37

    move-object v1, p2

    .line 277
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 278
    .local v1, "list1":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_32

    .line 279
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 290
    .end local v1    # "list1":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :goto_1a
    instance-of v4, p3, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v4, :cond_3b

    move-object v2, p3

    .line 291
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 292
    .local v2, "list2":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_22
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->length()I

    move-result v4

    if-ge v0, v4, :cond_42

    .line 293
    invoke-virtual {v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 292
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    .line 284
    .end local v0    # "i":I
    .end local v2    # "list2":Lorg/mozilla/javascript/xmlimpl/XMLList;
    .restart local v1    # "list1":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_32
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v3

    goto :goto_1a

    .line 287
    .end local v1    # "list1":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_37
    invoke-virtual {v3, p2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    goto :goto_1a

    .line 295
    :cond_3b
    instance-of v4, p3, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v4, :cond_42

    .line 296
    invoke-virtual {v3, p3}, Lorg/mozilla/javascript/xmlimpl/XMLList;->addToList(Ljava/lang/Object;)V

    .line 299
    :cond_42
    return-object v3
.end method

.method castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespaceObj"    # Ljava/lang/Object;

    .prologue
    .line 333
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->castToNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method castToQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "qnameValue"    # Ljava/lang/Object;

    .prologue
    .line 391
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/QName;->castToQName(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;

    .prologue
    .line 387
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/QName;->constructQName(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method constructQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/Object;

    .prologue
    .line 378
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/QName;->constructQName(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 7
    .param p1, "declarations"    # [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 368
    array-length v2, p1

    new-array v1, v2, [Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 369
    .local v1, "rv":[Lorg/mozilla/javascript/xmlimpl/Namespace;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, p1

    if-ge v0, v2, :cond_1e

    .line 370
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    aget-object v3, p1, v0

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getPrefix()Ljava/lang/String;

    move-result-object v3

    aget-object v4, p1, v0

    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->getUri()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v2

    aput-object v2, v1, v0

    .line 369
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 373
    :cond_1e
    return-object v1
.end method

.method final ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 438
    if-eqz p1, :cond_6

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v3, :cond_24

    .line 439
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cannot convert "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to XML"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 441
    :cond_24
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v3, :cond_2c

    move-object v3, p1

    check-cast v3, Lorg/mozilla/javascript/xmlimpl/XML;

    .line 467
    :goto_2b
    return-object v3

    .line 442
    :cond_2c
    instance-of v3, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v3, :cond_45

    move-object v0, p1

    .line 443
    check-cast v0, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 444
    .local v0, "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    if-eqz v3, :cond_3e

    .line 445
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    goto :goto_2b

    .line 447
    :cond_3e
    const-string v3, "Cannot convert list of >1 element to XML"

    invoke-static {v3}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v3

    throw v3

    .line 454
    .end local v0    # "list":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_45
    instance-of v3, p1, Lorg/mozilla/javascript/Wrapper;

    if-eqz v3, :cond_4f

    .line 455
    check-cast p1, Lorg/mozilla/javascript/Wrapper;

    .end local p1    # "object":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/mozilla/javascript/Wrapper;->unwrap()Ljava/lang/Object;

    move-result-object p1

    .line 457
    .restart local p1    # "object":Ljava/lang/Object;
    :cond_4f
    instance-of v3, p1, Lorg/w3c/dom/Node;

    if-eqz v3, :cond_5f

    move-object v1, p1

    .line 458
    check-cast v1, Lorg/w3c/dom/Node;

    .line 459
    .local v1, "node":Lorg/w3c/dom/Node;
    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createElementFromNode(Lorg/w3c/dom/Node;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    goto :goto_2b

    .line 462
    .end local v1    # "node":Lorg/w3c/dom/Node;
    :cond_5f
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 464
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_77

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x3c

    if-ne v3, v4, :cond_77

    .line 465
    invoke-direct {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->parse(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    goto :goto_2b

    .line 467
    :cond_77
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {v3, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    goto :goto_2b
.end method

.method public escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 613
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 608
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->escapeTextValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getDefaultNamespace(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;

    .prologue
    .line 345
    if-nez p1, :cond_b

    .line 346
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 347
    if-nez p1, :cond_b

    .line 348
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    .line 362
    :goto_a
    return-object v0

    .line 352
    :cond_b
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->searchDefaultNamespace(Lorg/mozilla/javascript/Context;)Ljava/lang/Object;

    move-result-object v0

    .line 353
    .local v0, "ns":Ljava/lang/Object;
    if-nez v0, :cond_14

    .line 354
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    goto :goto_a

    .line 356
    :cond_14
    instance-of v1, v0, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-eqz v1, :cond_1b

    .line 357
    check-cast v0, Lorg/mozilla/javascript/xmlimpl/Namespace;

    goto :goto_a

    .line 362
    :cond_1b
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    goto :goto_a
.end method

.method public getPrettyIndent()I
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->getPrettyIndent()I

    move-result v0

    return v0
.end method

.method getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    return-object v0
.end method

.method globalScope()Lorg/mozilla/javascript/Scriptable;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    return-object v0
.end method

.method public isIgnoreComments()Z
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreComments()Z

    move-result v0

    return v0
.end method

.method public isIgnoreProcessingInstructions()Z
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreProcessingInstructions()Z

    move-result v0

    return v0
.end method

.method public isIgnoreWhitespace()Z
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isIgnoreWhitespace()Z

    move-result v0

    return v0
.end method

.method public isPrettyPrinting()Z
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->isPrettyPrinting()Z

    move-result v0

    return v0
.end method

.method public isXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .registers 4
    .param p1, "_cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "nameObj"    # Ljava/lang/Object;

    .prologue
    .line 598
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->accept(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
    .registers 9
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "name"    # Ljava/lang/Object;
    .param p4, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "memberTypeFlags"    # I

    .prologue
    const/4 v2, 0x0

    .line 628
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {v1, v2, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    .line 631
    .local v0, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_16

    .line 632
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->isAttributeName()Z

    move-result v1

    if-nez v1, :cond_16

    .line 633
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->setAttributeName()V

    .line 637
    :cond_16
    invoke-direct {p0, p1, v0, p4}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlPrimaryReference(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xmlimpl/XMLName;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method public nameRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Lorg/mozilla/javascript/Scriptable;I)Lorg/mozilla/javascript/Ref;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "name"    # Ljava/lang/Object;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "memberTypeFlags"    # I

    .prologue
    .line 618
    and-int/lit8 v1, p4, 0x2

    if-nez v1, :cond_9

    .line 620
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 622
    :cond_9
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toAttributeName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    .line 623
    .local v0, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-direct {p0, p1, v0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlPrimaryReference(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xmlimpl/XMLName;Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/Ref;

    move-result-object v1

    return-object v1
.end method

.method newNamespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 3
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 341
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->newNamespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    .line 382
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-virtual {v0, p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/QName;->newQName(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 4
    .param p1, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 395
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    invoke-static {p0, v0, v1, p1}, Lorg/mozilla/javascript/xmlimpl/QName;->create(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xmlimpl/QName;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 5
    .param p1, "reference"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .param p2, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 472
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {v0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->newElementWithText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 5
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 399
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XML;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlPrototype:Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-direct {v0, p0, v1, v2, p1}, Lorg/mozilla/javascript/xmlimpl/XML;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xmlimpl/XmlNode;)V

    return-object v0
.end method

.method final newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 5
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    .line 407
    if-eqz p1, :cond_6

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p1, v1, :cond_1b

    .line 408
    :cond_6
    const-string v0, ""

    .line 416
    .end local p1    # "inputObject":Ljava/lang/Object;
    .local v0, "frag":Ljava/lang/String;
    :goto_8
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string v2, "<>"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 417
    const-string v1, "Invalid use of XML object anonymous tags <></>."

    invoke-static {v1}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v1

    throw v1

    .line 409
    .end local v0    # "frag":Ljava/lang/String;
    .restart local p1    # "inputObject":Ljava/lang/Object;
    :cond_1b
    instance-of v1, p1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    if-eqz v1, :cond_26

    .line 411
    check-cast p1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .end local p1    # "inputObject":Ljava/lang/Object;
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "frag":Ljava/lang/String;
    goto :goto_8

    .line 413
    .end local v0    # "frag":Ljava/lang/String;
    .restart local p1    # "inputObject":Ljava/lang/Object;
    :cond_26
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "frag":Ljava/lang/String;
    goto :goto_8

    .line 420
    .end local p1    # "inputObject":Ljava/lang/Object;
    :cond_2b
    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_3f

    .line 422
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-static {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createText(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    .line 424
    :goto_3e
    return-object v1

    :cond_3f
    invoke-direct {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->parse(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v1

    goto :goto_3e
.end method

.method newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 4

    .prologue
    .line 476
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLList;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->globalScope:Lorg/mozilla/javascript/Scriptable;

    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->xmlListPrototype:Lorg/mozilla/javascript/xmlimpl/XMLList;

    invoke-direct {v0, p0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    return-object v0
.end method

.method final newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 12
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    .line 480
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v4

    .line 482
    .local v4, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    if-eqz p1, :cond_a

    instance-of v7, p1, Lorg/mozilla/javascript/Undefined;

    if-eqz v7, :cond_b

    .line 515
    :cond_a
    :goto_a
    return-object v4

    .line 484
    :cond_b
    instance-of v7, p1, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v7, :cond_1a

    move-object v5, p1

    .line 485
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XML;

    .line 486
    .local v5, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    move-result-object v7

    invoke-virtual {v7, v5}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XML;)V

    goto :goto_a

    .line 488
    .end local v5    # "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    :cond_1a
    instance-of v7, p1, Lorg/mozilla/javascript/xmlimpl/XMLList;

    if-eqz v7, :cond_2d

    move-object v6, p1

    .line 489
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XMLList;

    .line 490
    .local v6, "xmll":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    move-result-object v7

    invoke-virtual {v6}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;)V

    goto :goto_a

    .line 493
    .end local v6    # "xmll":Lorg/mozilla/javascript/xmlimpl/XMLList;
    :cond_2d
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 495
    .local v1, "frag":Ljava/lang/String;
    const-string v7, "<>"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_56

    .line 496
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 499
    :cond_56
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "<fragment>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x2

    invoke-virtual {v1, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 500
    const-string v7, "</>"

    invoke-virtual {v1, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_7d

    .line 501
    const-string v7, "XML with anonymous tag missing end anonymous tag"

    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->typeError(Ljava/lang/String;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v7

    throw v7

    .line 504
    :cond_7d
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v8, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v9

    add-int/lit8 v9, v9, -0x3

    invoke-virtual {v1, v8, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</fragment>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 506
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v3

    .line 509
    .local v3, "orgXML":Lorg/mozilla/javascript/xmlimpl/XML;
    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/XML;->children()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 511
    .local v0, "children":Lorg/mozilla/javascript/xmlimpl/XMLList;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_a4
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    move-result-object v7

    invoke-virtual {v7}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->length()I

    move-result v7

    if-ge v2, v7, :cond_a

    .line 513
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/XMLList;->getNodeList()Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;

    move-result-object v8

    invoke-virtual {v0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLList;->item(I)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v7

    invoke-virtual {v7}, Lorg/mozilla/javascript/xmlimpl/XML;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v7

    check-cast v7, Lorg/mozilla/javascript/xmlimpl/XML;

    invoke-virtual {v8, v7}, Lorg/mozilla/javascript/xmlimpl/XmlNode$InternalList;->add(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 511
    add-int/lit8 v2, v2, 0x1

    goto :goto_a4
.end method

.method qnamePrototype()Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->qnamePrototype:Lorg/mozilla/javascript/xmlimpl/QName;

    return-object v0
.end method

.method public setIgnoreComments(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 46
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreComments(Z)V

    .line 47
    return-void
.end method

.method public setIgnoreProcessingInstructions(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 56
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreProcessingInstructions(Z)V

    .line 57
    return-void
.end method

.method public setIgnoreWhitespace(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 51
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setIgnoreWhitespace(Z)V

    .line 52
    return-void
.end method

.method public setPrettyIndent(I)V
    .registers 3
    .param p1, "i"    # I

    .prologue
    .line 66
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setPrettyIndent(I)V

    .line 67
    return-void
.end method

.method public setPrettyPrinting(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 61
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->options:Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XmlProcessor;->setPrettyPrinting(Z)V

    .line 62
    return-void
.end method

.method toAttributeName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 141
    instance-of v1, p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    if-eqz v1, :cond_9

    .line 143
    check-cast p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    .line 160
    .end local p2    # "nameValue":Ljava/lang/Object;
    :goto_8
    return-object p2

    .line 144
    .restart local p2    # "nameValue":Ljava/lang/Object;
    :cond_9
    instance-of v1, p2, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v1, :cond_18

    .line 145
    check-cast p2, Lorg/mozilla/javascript/xmlimpl/QName;

    .end local p2    # "nameValue":Ljava/lang/Object;
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/QName;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {v1, v3, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object p2

    goto :goto_8

    .line 146
    .restart local p2    # "nameValue":Ljava/lang/Object;
    :cond_18
    instance-of v1, p2, Ljava/lang/Boolean;

    if-nez v1, :cond_26

    instance-of v1, p2, Ljava/lang/Number;

    if-nez v1, :cond_26

    sget-object v1, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v1, :cond_26

    if-nez p2, :cond_2b

    .line 150
    :cond_26
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 153
    :cond_2b
    const/4 v0, 0x0

    .line 154
    .local v0, "localName":Ljava/lang/String;
    instance-of v1, p2, Ljava/lang/String;

    if-eqz v1, :cond_4d

    move-object v0, p2

    .line 155
    check-cast v0, Ljava/lang/String;

    .line 159
    :goto_33
    if-eqz v0, :cond_3e

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    const/4 v0, 0x0

    .line 160
    :cond_3e
    const-string v1, ""

    invoke-static {v1}, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->create(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    invoke-static {v1, v3, v2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object p2

    goto :goto_8

    .line 157
    :cond_4d
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_33
.end method

.method public toDefaultXmlNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "uriValue"    # Ljava/lang/Object;

    .prologue
    .line 603
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-virtual {v0, p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespaceValue"    # Ljava/lang/Object;
    .param p3, "nameValue"    # Ljava/lang/Object;

    .prologue
    .line 525
    instance-of v3, p3, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v3, :cond_28

    move-object v2, p3

    .line 526
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 527
    .local v2, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v2}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v0

    .line 533
    .end local v2    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    .local v0, "localName":Ljava/lang/String;
    :goto_b
    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p2, v3, :cond_36

    .line 534
    const-string v3, "*"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2d

    .line 535
    const/4 v1, 0x0

    .line 547
    .end local p2    # "namespaceValue":Ljava/lang/Object;
    .local v1, "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    :goto_18
    if-eqz v0, :cond_23

    const-string v3, "*"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    const/4 v0, 0x0

    .line 548
    :cond_23
    invoke-static {v1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    return-object v3

    .line 529
    .end local v0    # "localName":Ljava/lang/String;
    .end local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .restart local p2    # "namespaceValue":Ljava/lang/Object;
    :cond_28
    invoke-static {p3}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "localName":Ljava/lang/String;
    goto :goto_b

    .line 537
    :cond_2d
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .restart local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    goto :goto_18

    .line 539
    .end local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    :cond_36
    if-nez p2, :cond_3a

    .line 540
    const/4 v1, 0x0

    .restart local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    goto :goto_18

    .line 541
    .end local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    :cond_3a
    instance-of v3, p2, Lorg/mozilla/javascript/xmlimpl/Namespace;

    if-eqz v3, :cond_45

    .line 542
    check-cast p2, Lorg/mozilla/javascript/xmlimpl/Namespace;

    .end local p2    # "namespaceValue":Ljava/lang/Object;
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .restart local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    goto :goto_18

    .line 544
    .end local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    .restart local p2    # "namespaceValue":Ljava/lang/Object;
    :cond_45
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->namespacePrototype:Lorg/mozilla/javascript/xmlimpl/Namespace;

    invoke-virtual {v3, p2}, Lorg/mozilla/javascript/xmlimpl/Namespace;->constructNamespace(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v3

    invoke-virtual {v3}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v1

    .restart local v1    # "ns":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    goto :goto_18
.end method

.method toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;
    .param p3, "attribute"    # Z

    .prologue
    .line 569
    instance-of v2, p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    if-eqz v2, :cond_b

    .line 570
    check-cast p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    .end local p2    # "nameValue":Ljava/lang/Object;
    invoke-virtual {p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->toQname()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    .line 588
    :goto_a
    return-object v2

    .line 571
    .restart local p2    # "nameValue":Ljava/lang/Object;
    :cond_b
    instance-of v2, p2, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v2, :cond_17

    move-object v1, p2

    .line 572
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 573
    .local v1, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/QName;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    goto :goto_a

    .line 574
    .end local v1    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    :cond_17
    instance-of v2, p2, Ljava/lang/Boolean;

    if-nez v2, :cond_25

    instance-of v2, p2, Ljava/lang/Number;

    if-nez v2, :cond_25

    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v2, :cond_25

    if-nez p2, :cond_2a

    .line 580
    :cond_25
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v2

    throw v2

    .line 582
    :cond_2a
    const/4 v0, 0x0

    .line 583
    .local v0, "local":Ljava/lang/String;
    instance-of v2, p2, Ljava/lang/String;

    if-eqz v2, :cond_37

    move-object v0, p2

    .line 584
    check-cast v0, Ljava/lang/String;

    .line 588
    :goto_32
    invoke-virtual {p0, p1, v0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/String;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    goto :goto_a

    .line 586
    :cond_37
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_32
.end method

.method toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/String;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attribute"    # Z

    .prologue
    const/4 v2, 0x0

    .line 552
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getDefaultNamespace(Lorg/mozilla/javascript/Context;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v1

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/Namespace;->getDelegate()Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    move-result-object v0

    .line 553
    .local v0, "defaultNamespace":Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;
    if-eqz p2, :cond_18

    const-string v1, "*"

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 554
    invoke-static {v2, v2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    .line 559
    :goto_17
    return-object v1

    .line 556
    :cond_18
    if-eqz p3, :cond_21

    .line 557
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;->GLOBAL:Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    invoke-static {v1, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    goto :goto_17

    .line 559
    :cond_21
    invoke-static {v0, p2}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v1

    goto :goto_17
.end method

.method toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "nameValue"    # Ljava/lang/Object;

    .prologue
    .line 188
    instance-of v3, p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    if-eqz v3, :cond_8

    move-object v2, p2

    .line 189
    check-cast v2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    .line 205
    .end local p2    # "nameValue":Ljava/lang/Object;
    .local v2, "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :goto_7
    return-object v2

    .line 190
    .end local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .restart local p2    # "nameValue":Ljava/lang/Object;
    :cond_8
    instance-of v3, p2, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v3, :cond_1c

    move-object v1, p2

    .line 191
    check-cast v1, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 192
    .local v1, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 193
    .restart local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7

    .end local v1    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    .end local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_1c
    instance-of v3, p2, Ljava/lang/String;

    if-eqz v3, :cond_27

    .line 194
    check-cast p2, Ljava/lang/String;

    .end local p2    # "nameValue":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .restart local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7

    .line 195
    .end local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .restart local p2    # "nameValue":Ljava/lang/Object;
    :cond_27
    instance-of v3, p2, Ljava/lang/Boolean;

    if-nez v3, :cond_35

    instance-of v3, p2, Ljava/lang/Number;

    if-nez v3, :cond_35

    sget-object v3, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v3, :cond_35

    if-nez p2, :cond_3a

    .line 199
    :cond_35
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 201
    :cond_3a
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, "name":Ljava/lang/String;
    invoke-virtual {p0, p1, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .restart local v2    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7
.end method

.method toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 4
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getDefaultNamespaceURI(Lorg/mozilla/javascript/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v0

    return-object v0
.end method

.method toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;
    .registers 16
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 217
    instance-of v11, p2, Lorg/mozilla/javascript/xmlimpl/XMLName;

    if-eqz v11, :cond_8

    move-object v6, p2

    .line 218
    check-cast v6, Lorg/mozilla/javascript/xmlimpl/XMLName;

    .line 269
    .local v6, "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_7
    :goto_7
    return-object v6

    .line 219
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_8
    instance-of v11, p2, Ljava/lang/String;

    if-eqz v11, :cond_23

    move-object v7, p2

    .line 220
    check-cast v7, Ljava/lang/String;

    .line 221
    .local v7, "str":Ljava/lang/String;
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v8

    .line 222
    .local v8, "test":J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-ltz v11, :cond_1e

    .line 223
    invoke-static {p1, v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->storeUint32Result(Lorg/mozilla/javascript/Context;J)V

    .line 224
    const/4 v6, 0x0

    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7

    .line 226
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_1e
    invoke-virtual {p0, p1, v7}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v6

    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7

    .line 228
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .end local v7    # "str":Ljava/lang/String;
    .end local v8    # "test":J
    :cond_23
    instance-of v11, p2, Ljava/lang/Number;

    if-eqz v11, :cond_4d

    move-object v11, p2

    .line 229
    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    .line 230
    .local v0, "d":D
    double-to-long v2, v0

    .line 231
    .local v2, "l":J
    long-to-double v11, v2

    cmpl-double v11, v11, v0

    if-nez v11, :cond_48

    const-wide/16 v11, 0x0

    cmp-long v11, v11, v2

    if-gtz v11, :cond_48

    const-wide v11, 0xffffffffL

    cmp-long v11, v2, v11

    if-gtz v11, :cond_48

    .line 232
    invoke-static {p1, v2, v3}, Lorg/mozilla/javascript/ScriptRuntime;->storeUint32Result(Lorg/mozilla/javascript/Context;J)V

    .line 233
    const/4 v6, 0x0

    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto :goto_7

    .line 235
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_48
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v11

    throw v11

    .line 237
    .end local v0    # "d":D
    .end local v2    # "l":J
    :cond_4d
    instance-of v11, p2, Lorg/mozilla/javascript/xmlimpl/QName;

    if-eqz v11, :cond_7b

    move-object v5, p2

    .line 238
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/QName;

    .line 239
    .local v5, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/QName;->uri()Ljava/lang/String;

    move-result-object v10

    .line 240
    .local v10, "uri":Ljava/lang/String;
    const/4 v4, 0x0

    .line 241
    .local v4, "number":Z
    const/4 v6, 0x0

    .line 242
    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-eqz v10, :cond_70

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-nez v11, :cond_70

    .line 244
    invoke-static {v10}, Lorg/mozilla/javascript/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v8

    .line 245
    .restart local v8    # "test":J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-ltz v11, :cond_70

    .line 246
    invoke-static {p1, v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->storeUint32Result(Lorg/mozilla/javascript/Context;J)V

    .line 247
    const/4 v4, 0x1

    .line 250
    .end local v8    # "test":J
    :cond_70
    if-nez v4, :cond_7

    .line 251
    invoke-virtual {v5}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formProperty(Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v6

    goto :goto_7

    .line 253
    .end local v4    # "number":Z
    .end local v5    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    .end local v10    # "uri":Ljava/lang/String;
    :cond_7b
    instance-of v11, p2, Ljava/lang/Boolean;

    if-nez v11, :cond_85

    sget-object v11, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-eq p2, v11, :cond_85

    if-nez p2, :cond_8a

    .line 257
    :cond_85
    invoke-static {p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->badXMLName(Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v11

    throw v11

    .line 259
    :cond_8a
    invoke-static {p2}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 260
    .restart local v7    # "str":Ljava/lang/String;
    invoke-static {v7}, Lorg/mozilla/javascript/ScriptRuntime;->testUint32String(Ljava/lang/String;)J

    move-result-wide v8

    .line 261
    .restart local v8    # "test":J
    const-wide/16 v11, 0x0

    cmp-long v11, v8, v11

    if-ltz v11, :cond_9e

    .line 262
    invoke-static {p1, v8, v9}, Lorg/mozilla/javascript/ScriptRuntime;->storeUint32Result(Lorg/mozilla/javascript/Context;J)V

    .line 263
    const/4 v6, 0x0

    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto/16 :goto_7

    .line 265
    .end local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_9e
    invoke-virtual {p0, p1, v7}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v6

    .restart local v6    # "result":Lorg/mozilla/javascript/xmlimpl/XMLName;
    goto/16 :goto_7
.end method
