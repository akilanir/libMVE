.class abstract Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.super Lorg/mozilla/javascript/xml/XMLObject;
.source "XMLObjectImpl.java"


# static fields
.field private static final Id_addNamespace:I = 0x2

.field private static final Id_appendChild:I = 0x3

.field private static final Id_attribute:I = 0x4

.field private static final Id_attributes:I = 0x5

.field private static final Id_child:I = 0x6

.field private static final Id_childIndex:I = 0x7

.field private static final Id_children:I = 0x8

.field private static final Id_comments:I = 0x9

.field private static final Id_constructor:I = 0x1

.field private static final Id_contains:I = 0xa

.field private static final Id_copy:I = 0xb

.field private static final Id_descendants:I = 0xc

.field private static final Id_elements:I = 0xd

.field private static final Id_hasComplexContent:I = 0x12

.field private static final Id_hasOwnProperty:I = 0x11

.field private static final Id_hasSimpleContent:I = 0x13

.field private static final Id_inScopeNamespaces:I = 0xe

.field private static final Id_insertChildAfter:I = 0xf

.field private static final Id_insertChildBefore:I = 0x10

.field private static final Id_length:I = 0x14

.field private static final Id_localName:I = 0x15

.field private static final Id_name:I = 0x16

.field private static final Id_namespace:I = 0x17

.field private static final Id_namespaceDeclarations:I = 0x18

.field private static final Id_nodeKind:I = 0x19

.field private static final Id_normalize:I = 0x1a

.field private static final Id_parent:I = 0x1b

.field private static final Id_prependChild:I = 0x1c

.field private static final Id_processingInstructions:I = 0x1d

.field private static final Id_propertyIsEnumerable:I = 0x1e

.field private static final Id_removeNamespace:I = 0x1f

.field private static final Id_replace:I = 0x20

.field private static final Id_setChildren:I = 0x21

.field private static final Id_setLocalName:I = 0x22

.field private static final Id_setName:I = 0x23

.field private static final Id_setNamespace:I = 0x24

.field private static final Id_text:I = 0x25

.field private static final Id_toSource:I = 0x27

.field private static final Id_toString:I = 0x26

.field private static final Id_toXMLString:I = 0x28

.field private static final Id_valueOf:I = 0x29

.field private static final MAX_PROTOTYPE_ID:I = 0x29

.field private static final XMLOBJECT_TAG:Ljava/lang/Object;


# instance fields
.field private lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

.field private prototypeFlag:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-string v0, "XMLObject"

    sput-object v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .registers 4
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 25
    invoke-direct {p0}, Lorg/mozilla/javascript/xml/XMLObject;-><init>()V

    .line 26
    invoke-virtual {p0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initialize(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 27
    return-void
.end method

.method private static arg([Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3
    .param p0, "args"    # [Ljava/lang/Object;
    .param p1, "i"    # I

    .prologue
    .line 809
    array-length v0, p0

    if-ge p1, v0, :cond_6

    aget-object v0, p0, p1

    :goto_5
    return-object v0

    :cond_6
    sget-object v0, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_5
.end method

.method private getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 3
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XMLName;

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    .line 150
    .local v0, "rv":Lorg/mozilla/javascript/xmlimpl/XMLList;
    invoke-virtual {p0, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 151
    return-object v0
.end method

.method private toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 5
    .param p1, "typed"    # [Ljava/lang/Object;

    .prologue
    .line 590
    array-length v2, p1

    new-array v1, v2, [Ljava/lang/Object;

    .line 591
    .local v1, "rv":[Ljava/lang/Object;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v2, v1

    if-ge v0, v2, :cond_e

    .line 592
    aget-object v2, p1, v0

    aput-object v2, v1, v0

    .line 591
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 594
    :cond_e
    return-object v1
.end method

.method private xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 598
    invoke-static {p1, p2}, Lorg/mozilla/javascript/ScriptRuntime;->notFunctionError(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method abstract addMatches(Lorg/mozilla/javascript/xmlimpl/XMLList;Lorg/mozilla/javascript/xmlimpl/XMLName;)V
.end method

.method public final addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "thisIsLeft"    # Z
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 366
    instance-of v2, p3, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v2, :cond_16

    .line 368
    if-eqz p2, :cond_11

    .line 369
    move-object v0, p0

    .local v0, "v1":Lorg/mozilla/javascript/xml/XMLObject;
    move-object v1, p3

    .line 370
    check-cast v1, Lorg/mozilla/javascript/xml/XMLObject;

    .line 375
    .local v1, "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_a
    iget-object v2, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v2, p1, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->addXMLObjects(Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/xml/XMLObject;Lorg/mozilla/javascript/xml/XMLObject;)Ljava/lang/Object;

    move-result-object v2

    .line 382
    .end local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    .end local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :goto_10
    return-object v2

    :cond_11
    move-object v0, p3

    .line 372
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .line 373
    .restart local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    move-object v1, p0

    .restart local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    goto :goto_a

    .line 377
    .end local v0    # "v1":Lorg/mozilla/javascript/xml/XMLObject;
    .end local v1    # "v2":Lorg/mozilla/javascript/xml/XMLObject;
    :cond_16
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    if-ne p3, v2, :cond_1f

    .line 379
    invoke-static {p0}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_10

    .line 382
    :cond_1f
    invoke-super {p0, p1, p2, p3}, Lorg/mozilla/javascript/xml/XMLObject;->addValues(Lorg/mozilla/javascript/Context;ZLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_10
.end method

.method abstract child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract children()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract comments()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract contains(Ljava/lang/Object;)Z
.end method

.method abstract copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
.end method

.method final createEmptyXML()Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 2

    .prologue
    .line 832
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v0

    invoke-static {v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->createEmpty(Lorg/mozilla/javascript/xmlimpl/XmlProcessor;)Lorg/mozilla/javascript/xmlimpl/XmlNode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final createNamespace(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 5
    .param p1, "declaration"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    const/4 v2, 0x0

    .line 78
    if-nez p1, :cond_5

    const/4 v0, 0x0

    .line 79
    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    const/4 v1, 0x1

    new-array v1, v1, [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    aget-object v0, v0, v2

    goto :goto_4
.end method

.method final createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;
    .registers 3
    .param p1, "declarations"    # [Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;

    .prologue
    .line 83
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->createNamespaces([Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;)[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v0

    return-object v0
.end method

.method public delete(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 289
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 290
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    .line 291
    return-void
.end method

.method public final delete(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 274
    if-nez p1, :cond_7

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 275
    :cond_7
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 276
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_18

    .line 277
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 279
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->delete(I)V

    .line 283
    .end local v0    # "index":J
    :goto_17
    return v4

    .line 282
    :cond_18
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V

    goto :goto_17
.end method

.method abstract deleteXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)V
.end method

.method final ecmaEscapeAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 827
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->escapeAttributeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 828
    .local v0, "quoted":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method final ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 822
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->ecmaToXml(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method abstract elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method public enterDotQuery(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
    .registers 4
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 358
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    .line 359
    .local v0, "xws":Lorg/mozilla/javascript/xmlimpl/XMLWithScope;
    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;->initAsDotQuery()V

    .line 360
    return-object v0
.end method

.method public enterWith(Lorg/mozilla/javascript/Scriptable;)Lorg/mozilla/javascript/NativeWith;
    .registers 4
    .param p1, "scope"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 353
    new-instance v0, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;

    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-direct {v0, v1, p1, p0}, Lorg/mozilla/javascript/xmlimpl/XMLWithScope;-><init>(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V

    return-object v0
.end method

.method protected final equivalentValues(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 194
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->equivalentXml(Ljava/lang/Object;)Z

    move-result v0

    .line 195
    .local v0, "result":Z
    if-eqz v0, :cond_9

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_8
    return-object v1

    :cond_9
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_8
.end method

.method abstract equivalentXml(Ljava/lang/Object;)Z
.end method

.method public execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 28
    .param p1, "f"    # Lorg/mozilla/javascript/IdFunctionObject;
    .param p2, "cx"    # Lorg/mozilla/javascript/Context;
    .param p3, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p4, "thisObj"    # Lorg/mozilla/javascript/Scriptable;
    .param p5, "args"    # [Ljava/lang/Object;

    .prologue
    .line 605
    sget-object v19, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/IdFunctionObject;->hasTag(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_11

    .line 606
    invoke-super/range {p0 .. p5}, Lorg/mozilla/javascript/xml/XMLObject;->execIdCall(Lorg/mozilla/javascript/IdFunctionObject;Lorg/mozilla/javascript/Context;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    .line 803
    :cond_10
    :goto_10
    return-object v16

    .line 608
    :cond_11
    invoke-virtual/range {p1 .. p1}, Lorg/mozilla/javascript/IdFunctionObject;->methodId()I

    move-result v8

    .line 609
    .local v8, "id":I
    const/16 v19, 0x1

    move/from16 v0, v19

    if-ne v8, v0, :cond_2f

    .line 610
    if-nez p4, :cond_2c

    const/16 v19, 0x1

    :goto_1f
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, v19

    move-object/from16 v3, p5

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    goto :goto_10

    :cond_2c
    const/16 v19, 0x0

    goto :goto_1f

    .line 614
    :cond_2f
    move-object/from16 v0, p4

    instance-of v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move/from16 v19, v0

    if-nez v19, :cond_3c

    .line 615
    invoke-static/range {p1 .. p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->incompatibleCallError(Lorg/mozilla/javascript/IdFunctionObject;)Lorg/mozilla/javascript/EcmaError;

    move-result-object v19

    throw v19

    :cond_3c
    move-object/from16 v15, p4

    .line 616
    check-cast v15, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    .line 618
    .local v15, "realThis":Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXML()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v17

    .line 619
    .local v17, "xml":Lorg/mozilla/javascript/xmlimpl/XML;
    packed-switch v8, :pswitch_data_4ba

    .line 805
    new-instance v19, Ljava/lang/IllegalArgumentException;

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v19

    .line 621
    :pswitch_51
    if-nez v17, :cond_5c

    const-string v19, "appendChild"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 622
    :cond_5c
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->appendChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto :goto_10

    .line 625
    :pswitch_6f
    if-nez v17, :cond_7a

    const-string v19, "addNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 626
    :cond_7a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 627
    .local v12, "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->addNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 630
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_9c
    if-nez v17, :cond_a7

    const-string v19, "childIndex"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 631
    :cond_a7
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->childIndex()I

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v16

    goto/16 :goto_10

    .line 634
    :pswitch_b1
    if-nez v17, :cond_bc

    const-string v19, "inScopeNamespaces"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 635
    :cond_bc
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->inScopeNamespaces()[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v19

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    goto/16 :goto_10

    .line 638
    :pswitch_d4
    if-nez v17, :cond_df

    const-string v19, "insertChildAfter"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 639
    :cond_df
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    .line 640
    .local v5, "arg0":Ljava/lang/Object;
    if-eqz v5, :cond_f1

    instance-of v0, v5, Lorg/mozilla/javascript/xmlimpl/XML;

    move/from16 v19, v0

    if-eqz v19, :cond_107

    .line 641
    :cond_f1
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v5    # "arg0":Ljava/lang/Object;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildAfter(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 643
    .restart local v5    # "arg0":Ljava/lang/Object;
    :cond_107
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 646
    .end local v5    # "arg0":Ljava/lang/Object;
    :pswitch_10b
    if-nez v17, :cond_116

    const-string v19, "insertChildBefore"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 647
    :cond_116
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    .line 648
    .restart local v5    # "arg0":Ljava/lang/Object;
    if-eqz v5, :cond_128

    instance-of v0, v5, Lorg/mozilla/javascript/xmlimpl/XML;

    move/from16 v19, v0

    if-eqz v19, :cond_13e

    .line 649
    :cond_128
    check-cast v5, Lorg/mozilla/javascript/xmlimpl/XML;

    .end local v5    # "arg0":Ljava/lang/Object;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v5, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->insertChildBefore(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 651
    .restart local v5    # "arg0":Ljava/lang/Object;
    :cond_13e
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 654
    .end local v5    # "arg0":Ljava/lang/Object;
    :pswitch_142
    if-nez v17, :cond_14d

    const-string v19, "localName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 655
    :cond_14d
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->localName()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_10

    .line 658
    :pswitch_153
    if-nez v17, :cond_15e

    const-string v19, "name"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 659
    :cond_15e
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->name()Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v16

    goto/16 :goto_10

    .line 662
    :pswitch_164
    if-nez v17, :cond_16f

    const-string v19, "namespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 663
    :cond_16f
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_18a

    const/16 v19, 0x0

    aget-object v19, p5, v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 664
    .local v13, "prefix":Ljava/lang/String;
    :goto_17e
    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lorg/mozilla/javascript/xmlimpl/XML;->namespace(Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v16

    .line 665
    .local v16, "rv":Lorg/mozilla/javascript/xmlimpl/Namespace;
    if-nez v16, :cond_10

    .line 666
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 663
    .end local v13    # "prefix":Ljava/lang/String;
    .end local v16    # "rv":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :cond_18a
    const/4 v13, 0x0

    goto :goto_17e

    .line 672
    :pswitch_18c
    if-nez v17, :cond_197

    const-string v19, "namespaceDeclarations"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 673
    :cond_197
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->namespaceDeclarations()[Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v7

    .line 674
    .local v7, "array":[Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toObjectArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/Context;->newArray(Lorg/mozilla/javascript/Scriptable;[Ljava/lang/Object;)Lorg/mozilla/javascript/Scriptable;

    move-result-object v16

    goto/16 :goto_10

    .line 677
    .end local v7    # "array":[Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_1ad
    if-nez v17, :cond_1b8

    const-string v19, "nodeKind"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 678
    :cond_1b8
    invoke-virtual/range {v17 .. v17}, Lorg/mozilla/javascript/xmlimpl/XML;->nodeKind()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_10

    .line 681
    :pswitch_1be
    if-nez v17, :cond_1c9

    const-string v19, "prependChild"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 682
    :cond_1c9
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->prependChild(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 685
    :pswitch_1dd
    if-nez v17, :cond_1e8

    const-string v19, "removeNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 686
    :cond_1e8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 687
    .restart local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->removeNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 690
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_20a
    if-nez v17, :cond_215

    const-string v19, "replace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 691
    :cond_215
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 692
    .local v18, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    const/16 v19, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v6

    .line 693
    .local v6, "arg1":Ljava/lang/Object;
    if-nez v18, :cond_24a

    .line 695
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v19

    move-wide/from16 v0, v19

    long-to-int v10, v0

    .line 696
    .local v10, "index":I
    move-object/from16 v0, v17

    invoke-virtual {v0, v10, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->replace(ILjava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 698
    .end local v10    # "index":I
    :cond_24a
    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v0, v1, v6}, Lorg/mozilla/javascript/xmlimpl/XML;->replace(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 702
    .end local v6    # "arg1":Ljava/lang/Object;
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_254
    if-nez v17, :cond_25f

    const-string v19, "setChildren"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 703
    :cond_25f
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XML;->setChildren(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v16

    goto/16 :goto_10

    .line 706
    :pswitch_273
    if-nez v17, :cond_27e

    const-string v19, "setLocalName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 708
    :cond_27e
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v4

    .line 709
    .local v4, "arg":Ljava/lang/Object;
    instance-of v0, v4, Lorg/mozilla/javascript/xmlimpl/QName;

    move/from16 v19, v0

    if-eqz v19, :cond_29d

    .line 710
    check-cast v4, Lorg/mozilla/javascript/xmlimpl/QName;

    .end local v4    # "arg":Ljava/lang/Object;
    invoke-virtual {v4}, Lorg/mozilla/javascript/xmlimpl/QName;->localName()Ljava/lang/String;

    move-result-object v11

    .line 714
    .local v11, "localName":Ljava/lang/String;
    :goto_294
    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Lorg/mozilla/javascript/xmlimpl/XML;->setLocalName(Ljava/lang/String;)V

    .line 715
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 712
    .end local v11    # "localName":Ljava/lang/String;
    .restart local v4    # "arg":Ljava/lang/Object;
    :cond_29d
    invoke-static {v4}, Lorg/mozilla/javascript/ScriptRuntime;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .restart local v11    # "localName":Ljava/lang/String;
    goto :goto_294

    .line 718
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v11    # "localName":Ljava/lang/String;
    :pswitch_2a2
    if-nez v17, :cond_2ad

    const-string v19, "setName"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 719
    :cond_2ad
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-eqz v19, :cond_2cf

    const/16 v19, 0x0

    aget-object v4, p5, v19

    .line 720
    .restart local v4    # "arg":Ljava/lang/Object;
    :goto_2b8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    invoke-virtual {v0, v1, v4}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->constructQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v14

    .line 721
    .local v14, "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Lorg/mozilla/javascript/xmlimpl/XML;->setName(Lorg/mozilla/javascript/xmlimpl/QName;)V

    .line 722
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 719
    .end local v4    # "arg":Ljava/lang/Object;
    .end local v14    # "qname":Lorg/mozilla/javascript/xmlimpl/QName;
    :cond_2cf
    sget-object v4, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto :goto_2b8

    .line 725
    :pswitch_2d2
    if-nez v17, :cond_2dd

    const-string v19, "setNamespace"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-direct {v0, v15, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->xmlMethodNotFound(Ljava/lang/Object;Ljava/lang/String;)V

    .line 726
    :cond_2dd
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->castToNamespace(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/Namespace;

    move-result-object v12

    .line 727
    .restart local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lorg/mozilla/javascript/xmlimpl/XML;->setNamespace(Lorg/mozilla/javascript/xmlimpl/Namespace;)V

    .line 728
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 732
    .end local v12    # "ns":Lorg/mozilla/javascript/xmlimpl/Namespace;
    :pswitch_300
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    const/16 v21, 0x1

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v19

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 733
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    move-object/from16 v0, v18

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 736
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_32e
    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v19

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-static/range {v19 .. v21}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 738
    :pswitch_346
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 739
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v18, :cond_36f

    .line 741
    invoke-static/range {p2 .. p2}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v19

    move-wide/from16 v0, v19

    long-to-int v10, v0

    .line 742
    .restart local v10    # "index":I
    invoke-virtual {v15, v10}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->child(I)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 744
    .end local v10    # "index":I
    :cond_36f
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->child(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 748
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_377
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->children()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 750
    :pswitch_37d
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->comments()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 752
    :pswitch_383
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->contains(Ljava/lang/Object;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_10

    .line 755
    :pswitch_399
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->copy()Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;

    move-result-object v16

    goto/16 :goto_10

    .line 757
    :pswitch_39f
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-nez v19, :cond_3c2

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$Namespace;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v14

    .line 758
    .local v14, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    :goto_3ae
    const/16 v19, 0x0

    const/16 v20, 0x1

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-static {v14, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getMatches(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 757
    .end local v14    # "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    :cond_3c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v14

    goto :goto_3ae

    .line 761
    :pswitch_3db
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-nez v19, :cond_3ee

    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 764
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :goto_3e6
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->elements(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 761
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_3ee
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    goto :goto_3e6

    .line 767
    :pswitch_403
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v20

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 768
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_10

    .line 772
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :pswitch_429
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasComplexContent()Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_10

    .line 774
    :pswitch_433
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasSimpleContent()Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_10

    .line 776
    :pswitch_43d
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->length()I

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapInt(I)Ljava/lang/Integer;

    move-result-object v16

    goto/16 :goto_10

    .line 778
    :pswitch_447
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->normalize()V

    .line 779
    sget-object v16, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    goto/16 :goto_10

    .line 781
    :pswitch_44e
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->parent()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_10

    .line 783
    :pswitch_454
    move-object/from16 v0, p5

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_477

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aget-object v20, p5, v20

    move-object/from16 v0, v19

    move-object/from16 v1, p2

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    .line 786
    .restart local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :goto_46f
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 783
    .end local v18    # "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_477
    invoke-static {}, Lorg/mozilla/javascript/xmlimpl/XMLName;->formStar()Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v18

    goto :goto_46f

    .line 789
    :pswitch_47c
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->arg([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->propertyIsEnumerable(Ljava/lang/Object;)Z

    move-result v19

    invoke-static/range {v19 .. v19}, Lorg/mozilla/javascript/ScriptRuntime;->wrapBoolean(Z)Ljava/lang/Boolean;

    move-result-object v16

    goto/16 :goto_10

    .line 793
    :pswitch_492
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->text()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v16

    goto/16 :goto_10

    .line 795
    :pswitch_498
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_10

    .line 797
    :pswitch_49e
    const/16 v19, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v19

    invoke-static {v0, v1}, Lorg/mozilla/javascript/ScriptRuntime;->toInt32([Ljava/lang/Object;I)I

    move-result v9

    .line 798
    .local v9, "indent":I
    invoke-virtual {v15, v9}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toSource(I)Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_10

    .line 800
    .end local v9    # "indent":I
    :pswitch_4ae
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toXMLString()Ljava/lang/String;

    move-result-object v16

    goto/16 :goto_10

    .line 803
    :pswitch_4b4
    invoke-virtual {v15}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->valueOf()Ljava/lang/Object;

    move-result-object v16

    goto/16 :goto_10

    .line 619
    :pswitch_data_4ba
    .packed-switch 0x2
        :pswitch_6f
        :pswitch_51
        :pswitch_300
        :pswitch_32e
        :pswitch_346
        :pswitch_9c
        :pswitch_377
        :pswitch_37d
        :pswitch_383
        :pswitch_399
        :pswitch_39f
        :pswitch_3db
        :pswitch_b1
        :pswitch_d4
        :pswitch_10b
        :pswitch_403
        :pswitch_429
        :pswitch_433
        :pswitch_43d
        :pswitch_142
        :pswitch_153
        :pswitch_164
        :pswitch_18c
        :pswitch_1ad
        :pswitch_447
        :pswitch_44e
        :pswitch_1be
        :pswitch_454
        :pswitch_47c
        :pswitch_1dd
        :pswitch_20a
        :pswitch_254
        :pswitch_273
        :pswitch_2a2
        :pswitch_2d2
        :pswitch_492
        :pswitch_498
        :pswitch_49e
        :pswitch_4ae
        :pswitch_4b4
    .end packed-switch
.end method

.method final exportAsJSClass(Z)V
    .registers 4
    .param p1, "sealed"    # Z

    .prologue
    .line 392
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 393
    const/16 v0, 0x29

    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->exportAsJSClass(ILorg/mozilla/javascript/Scriptable;Z)Lorg/mozilla/javascript/IdFunctionObject;

    .line 394
    return-void
.end method

.method protected findPrototypeId(Ljava/lang/String;)I
    .registers 11
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/16 v8, 0x61

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/16 v5, 0x63

    const/4 v4, 0x0

    .line 447
    const/4 v2, 0x0

    .local v2, "id":I
    const/4 v0, 0x0

    .line 448
    .local v0, "X":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    packed-switch v3, :pswitch_data_18e

    .line 516
    :cond_10
    :goto_10
    :pswitch_10
    if-eqz v0, :cond_1b

    if-eq v0, p1, :cond_1b

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1b

    const/4 v2, 0x0

    .line 520
    :cond_1b
    return v2

    .line 449
    :pswitch_1c
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 450
    .local v1, "c":I
    if-ne v1, v5, :cond_27

    const-string v0, "copy"

    const/16 v2, 0xb

    goto :goto_10

    .line 451
    :cond_27
    const/16 v3, 0x6e

    if-ne v1, v3, :cond_30

    const-string v0, "name"

    const/16 v2, 0x16

    goto :goto_10

    .line 452
    :cond_30
    const/16 v3, 0x74

    if-ne v1, v3, :cond_10

    const-string v0, "text"

    const/16 v2, 0x25

    goto :goto_10

    .line 454
    .end local v1    # "c":I
    :pswitch_39
    const-string v0, "child"

    const/4 v2, 0x6

    goto :goto_10

    .line 455
    :pswitch_3d
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 456
    .restart local v1    # "c":I
    const/16 v3, 0x6c

    if-ne v1, v3, :cond_4a

    const-string v0, "length"

    const/16 v2, 0x14

    goto :goto_10

    .line 457
    :cond_4a
    const/16 v3, 0x70

    if-ne v1, v3, :cond_10

    const-string v0, "parent"

    const/16 v2, 0x1b

    goto :goto_10

    .line 459
    .end local v1    # "c":I
    :pswitch_53
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 460
    .restart local v1    # "c":I
    const/16 v3, 0x72

    if-ne v1, v3, :cond_60

    const-string v0, "replace"

    const/16 v2, 0x20

    goto :goto_10

    .line 461
    :cond_60
    const/16 v3, 0x73

    if-ne v1, v3, :cond_69

    const-string v0, "setName"

    const/16 v2, 0x23

    goto :goto_10

    .line 462
    :cond_69
    const/16 v3, 0x76

    if-ne v1, v3, :cond_10

    const-string v0, "valueOf"

    const/16 v2, 0x29

    goto :goto_10

    .line 464
    .end local v1    # "c":I
    :pswitch_72
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1b8

    goto :goto_10

    .line 465
    :sswitch_7a
    const/4 v3, 0x7

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 466
    .restart local v1    # "c":I
    const/16 v3, 0x65

    if-ne v1, v3, :cond_88

    const-string v0, "toSource"

    const/16 v2, 0x27

    goto :goto_10

    .line 467
    :cond_88
    const/16 v3, 0x67

    if-ne v1, v3, :cond_10

    const-string v0, "toString"

    const/16 v2, 0x26

    goto :goto_10

    .line 469
    .end local v1    # "c":I
    :sswitch_91
    const-string v0, "nodeKind"

    const/16 v2, 0x19

    goto/16 :goto_10

    .line 470
    :sswitch_97
    const-string v0, "elements"

    const/16 v2, 0xd

    goto/16 :goto_10

    .line 471
    :sswitch_9d
    const-string v0, "children"

    const/16 v2, 0x8

    goto/16 :goto_10

    .line 472
    :sswitch_a3
    const-string v0, "comments"

    const/16 v2, 0x9

    goto/16 :goto_10

    .line 473
    :sswitch_a9
    const-string v0, "contains"

    const/16 v2, 0xa

    goto/16 :goto_10

    .line 475
    :pswitch_af
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1d2

    goto/16 :goto_10

    .line 476
    :sswitch_b8
    const-string v0, "localName"

    const/16 v2, 0x15

    goto/16 :goto_10

    .line 477
    :sswitch_be
    const-string v0, "namespace"

    const/16 v2, 0x17

    goto/16 :goto_10

    .line 478
    :sswitch_c4
    const-string v0, "normalize"

    const/16 v2, 0x1a

    goto/16 :goto_10

    .line 479
    :sswitch_ca
    const-string v0, "attribute"

    const/4 v2, 0x4

    goto/16 :goto_10

    .line 481
    :pswitch_cf
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 482
    .restart local v1    # "c":I
    if-ne v1, v8, :cond_da

    const-string v0, "attributes"

    const/4 v2, 0x5

    goto/16 :goto_10

    .line 483
    :cond_da
    if-ne v1, v5, :cond_10

    const-string v0, "childIndex"

    const/4 v2, 0x7

    goto/16 :goto_10

    .line 485
    .end local v1    # "c":I
    :pswitch_e1
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sparse-switch v3, :sswitch_data_1e4

    goto/16 :goto_10

    .line 486
    :sswitch_ea
    const-string v0, "appendChild"

    const/4 v2, 0x3

    goto/16 :goto_10

    .line 487
    :sswitch_ef
    const-string v0, "constructor"

    const/4 v2, 0x1

    goto/16 :goto_10

    .line 488
    :sswitch_f4
    const-string v0, "descendants"

    const/16 v2, 0xc

    goto/16 :goto_10

    .line 489
    :sswitch_fa
    const-string v0, "setChildren"

    const/16 v2, 0x21

    goto/16 :goto_10

    .line 490
    :sswitch_100
    const-string v0, "toXMLString"

    const/16 v2, 0x28

    goto/16 :goto_10

    .line 492
    :pswitch_106
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 493
    .restart local v1    # "c":I
    if-ne v1, v8, :cond_111

    const-string v0, "addNamespace"

    const/4 v2, 0x2

    goto/16 :goto_10

    .line 494
    :cond_111
    const/16 v3, 0x70

    if-ne v1, v3, :cond_11b

    const-string v0, "prependChild"

    const/16 v2, 0x1c

    goto/16 :goto_10

    .line 495
    :cond_11b
    const/16 v3, 0x73

    if-ne v1, v3, :cond_10

    .line 496
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 497
    const/16 v3, 0x4c

    if-ne v1, v3, :cond_12d

    const-string v0, "setLocalName"

    const/16 v2, 0x22

    goto/16 :goto_10

    .line 498
    :cond_12d
    const/16 v3, 0x4e

    if-ne v1, v3, :cond_10

    const-string v0, "setNamespace"

    const/16 v2, 0x24

    goto/16 :goto_10

    .line 501
    .end local v1    # "c":I
    :pswitch_137
    const-string v0, "hasOwnProperty"

    const/16 v2, 0x11

    goto/16 :goto_10

    .line 502
    :pswitch_13d
    const-string v0, "removeNamespace"

    const/16 v2, 0x1f

    goto/16 :goto_10

    .line 503
    :pswitch_143
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 504
    .restart local v1    # "c":I
    const/16 v3, 0x68

    if-ne v1, v3, :cond_151

    const-string v0, "hasSimpleContent"

    const/16 v2, 0x13

    goto/16 :goto_10

    .line 505
    :cond_151
    const/16 v3, 0x69

    if-ne v1, v3, :cond_10

    const-string v0, "insertChildAfter"

    const/16 v2, 0xf

    goto/16 :goto_10

    .line 507
    .end local v1    # "c":I
    :pswitch_15b
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 508
    .restart local v1    # "c":I
    const/16 v3, 0x43

    if-ne v1, v3, :cond_169

    const-string v0, "hasComplexContent"

    const/16 v2, 0x12

    goto/16 :goto_10

    .line 509
    :cond_169
    if-ne v1, v5, :cond_171

    const-string v0, "inScopeNamespaces"

    const/16 v2, 0xe

    goto/16 :goto_10

    .line 510
    :cond_171
    const/16 v3, 0x65

    if-ne v1, v3, :cond_10

    const-string v0, "insertChildBefore"

    const/16 v2, 0x10

    goto/16 :goto_10

    .line 512
    .end local v1    # "c":I
    :pswitch_17b
    const-string v0, "propertyIsEnumerable"

    const/16 v2, 0x1e

    goto/16 :goto_10

    .line 513
    :pswitch_181
    const-string v0, "namespaceDeclarations"

    const/16 v2, 0x18

    goto/16 :goto_10

    .line 514
    :pswitch_187
    const-string v0, "processingInstructions"

    const/16 v2, 0x1d

    goto/16 :goto_10

    .line 448
    nop

    :pswitch_data_18e
    .packed-switch 0x4
        :pswitch_1c
        :pswitch_39
        :pswitch_3d
        :pswitch_53
        :pswitch_72
        :pswitch_af
        :pswitch_cf
        :pswitch_e1
        :pswitch_106
        :pswitch_10
        :pswitch_137
        :pswitch_13d
        :pswitch_143
        :pswitch_15b
        :pswitch_10
        :pswitch_10
        :pswitch_17b
        :pswitch_181
        :pswitch_187
    .end packed-switch

    .line 464
    :sswitch_data_1b8
    .sparse-switch
        0x53 -> :sswitch_7a
        0x64 -> :sswitch_91
        0x65 -> :sswitch_97
        0x69 -> :sswitch_9d
        0x6d -> :sswitch_a3
        0x6e -> :sswitch_a9
    .end sparse-switch

    .line 475
    :sswitch_data_1d2
    .sparse-switch
        0x63 -> :sswitch_b8
        0x6d -> :sswitch_be
        0x72 -> :sswitch_c4
        0x74 -> :sswitch_ca
    .end sparse-switch

    .line 485
    :sswitch_data_1e4
    .sparse-switch
        0x61 -> :sswitch_ea
        0x63 -> :sswitch_ef
        0x64 -> :sswitch_f4
        0x73 -> :sswitch_fa
        0x74 -> :sswitch_100
    .end sparse-switch
.end method

.method public get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 245
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 246
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final get(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 229
    if-nez p1, :cond_6

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 230
    :cond_6
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v4, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v3

    .line 231
    .local v3, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v3, :cond_1e

    .line 232
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 234
    .local v0, "index":J
    long-to-int v4, v0

    invoke-virtual {p0, v4, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v2

    .line 235
    .local v2, "result":Ljava/lang/Object;
    sget-object v4, Lorg/mozilla/javascript/Scriptable;->NOT_FOUND:Ljava/lang/Object;

    if-ne v2, v4, :cond_1d

    .line 236
    sget-object v2, Lorg/mozilla/javascript/Undefined;->instance:Ljava/lang/Object;

    .line 240
    .end local v0    # "index":J
    .end local v2    # "result":Ljava/lang/Object;
    :cond_1d
    :goto_1d
    return-object v2

    :cond_1e
    invoke-virtual {p0, v3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_1d
.end method

.method public final getDefaultValue(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "hint":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFunctionProperty(Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # I

    .prologue
    .line 295
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 296
    invoke-super {p0, p2, p0}, Lorg/mozilla/javascript/xml/XMLObject;->get(ILorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 303
    :goto_a
    return-object v1

    .line 298
    :cond_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 299
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    instance-of v1, v0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_1a

    .line 300
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->getFunctionProperty(Lorg/mozilla/javascript/Context;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_a

    .line 303
    .restart local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_1a
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_a
.end method

.method public getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 308
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->isPrototype()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 309
    invoke-super {p0, p2, p0}, Lorg/mozilla/javascript/xml/XMLObject;->get(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Ljava/lang/Object;

    move-result-object v1

    .line 316
    :goto_a
    return-object v1

    .line 311
    :cond_b
    invoke-virtual {p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    .line 312
    .local v0, "proto":Lorg/mozilla/javascript/Scriptable;
    instance-of v1, v0, Lorg/mozilla/javascript/xml/XMLObject;

    if-eqz v1, :cond_1a

    .line 313
    check-cast v0, Lorg/mozilla/javascript/xml/XMLObject;

    .end local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    invoke-virtual {v0, p1, p2}, Lorg/mozilla/javascript/xml/XMLObject;->getFunctionProperty(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_a

    .line 316
    .restart local v0    # "proto":Lorg/mozilla/javascript/Scriptable;
    :cond_1a
    sget-object v1, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->NOT_FOUND:Ljava/lang/Object;

    goto :goto_a
.end method

.method getLib()Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    return-object v0
.end method

.method public final getParentScope()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 99
    invoke-super {p0}, Lorg/mozilla/javascript/xml/XMLObject;->getParentScope()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method final getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->getProcessor()Lorg/mozilla/javascript/xmlimpl/XmlProcessor;

    move-result-object v0

    return-object v0
.end method

.method public final getPrototype()Lorg/mozilla/javascript/Scriptable;
    .registers 2

    .prologue
    .line 89
    invoke-super {p0}, Lorg/mozilla/javascript/xml/XMLObject;->getPrototype()Lorg/mozilla/javascript/Scriptable;

    move-result-object v0

    return-object v0
.end method

.method abstract getXML()Lorg/mozilla/javascript/xmlimpl/XML;
.end method

.method abstract getXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Ljava/lang/Object;
.end method

.method public has(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;)Z
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 221
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 222
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v1

    return v1
.end method

.method public final has(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Z
    .registers 7
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;

    .prologue
    .line 209
    if-nez p1, :cond_6

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 210
    :cond_6
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 211
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_18

    .line 212
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 214
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3, p0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->has(ILorg/mozilla/javascript/Scriptable;)Z

    move-result v3

    .line 216
    .end local v0    # "index":J
    :goto_17
    return v3

    :cond_18
    invoke-virtual {p0, v2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z

    move-result v3

    goto :goto_17
.end method

.method abstract hasComplexContent()Z
.end method

.method public final hasInstance(Lorg/mozilla/javascript/Scriptable;)Z
    .registers 3
    .param p1, "scriptable"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 114
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->hasInstance(Lorg/mozilla/javascript/Scriptable;)Z

    move-result v0

    return v0
.end method

.method abstract hasOwnProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
.end method

.method abstract hasSimpleContent()Z
.end method

.method abstract hasXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;)Z
.end method

.method protected initPrototypeId(I)V
    .registers 8
    .param p1, "id"    # I

    .prologue
    const/4 v5, 0x1

    .line 528
    packed-switch p1, :pswitch_data_d6

    .line 584
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 531
    :pswitch_e
    instance-of v3, p0, Lorg/mozilla/javascript/xmlimpl/XML;

    if-eqz v3, :cond_20

    .line 532
    new-instance v1, Lorg/mozilla/javascript/xmlimpl/XMLCtor;

    move-object v3, p0

    check-cast v3, Lorg/mozilla/javascript/xmlimpl/XML;

    sget-object v4, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v1, v3, v4, p1, v5}, Lorg/mozilla/javascript/xmlimpl/XMLCtor;-><init>(Lorg/mozilla/javascript/xmlimpl/XML;Ljava/lang/Object;II)V

    .line 536
    .local v1, "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :goto_1c
    invoke-virtual {p0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initPrototypeConstructor(Lorg/mozilla/javascript/IdFunctionObject;)V

    .line 587
    .end local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :goto_1f
    return-void

    .line 534
    :cond_20
    new-instance v1, Lorg/mozilla/javascript/IdFunctionObject;

    sget-object v3, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-direct {v1, p0, v3, p1, v5}, Lorg/mozilla/javascript/IdFunctionObject;-><init>(Lorg/mozilla/javascript/IdFunctionCall;Ljava/lang/Object;II)V

    .restart local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    goto :goto_1c

    .line 540
    .end local v1    # "ctor":Lorg/mozilla/javascript/IdFunctionObject;
    :pswitch_28
    const/4 v0, 0x1

    .local v0, "arity":I
    const-string v2, "addNamespace"

    .line 586
    .local v2, "s":Ljava/lang/String;
    :goto_2b
    sget-object v3, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->XMLOBJECT_TAG:Ljava/lang/Object;

    invoke-virtual {p0, v3, p1, v2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->initPrototypeMethod(Ljava/lang/Object;ILjava/lang/String;I)V

    goto :goto_1f

    .line 541
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_31
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "appendChild"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 542
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_35
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "attribute"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 543
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_39
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "attributes"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 544
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_3d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "child"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 545
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_41
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "childIndex"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 546
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_45
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "children"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 547
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_49
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "comments"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 548
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_4d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "contains"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 549
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_51
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "copy"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 550
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_55
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "descendants"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 551
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_59
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "elements"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 552
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_5d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "hasComplexContent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 553
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_61
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "hasOwnProperty"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 554
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_65
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "hasSimpleContent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 555
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_69
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "inScopeNamespaces"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 556
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_6d
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "insertChildAfter"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 557
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_71
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "insertChildBefore"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 558
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_75
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "length"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 559
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_79
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "localName"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 560
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_7d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "name"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 561
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_81
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "namespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 563
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_85
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "namespaceDeclarations"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 564
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_89
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "nodeKind"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 565
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_8d
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "normalize"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 566
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_91
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "parent"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 567
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_95
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "prependChild"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 569
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_99
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "processingInstructions"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 571
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_9d
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "propertyIsEnumerable"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 572
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a1
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "removeNamespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 573
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a5
    const/4 v0, 0x2

    .restart local v0    # "arity":I
    const-string v2, "replace"

    .restart local v2    # "s":Ljava/lang/String;
    goto :goto_2b

    .line 574
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_a9
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setChildren"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 575
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_ae
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setLocalName"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 576
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_b3
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setName"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 577
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_b8
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "setNamespace"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 578
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_bd
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "text"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 579
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_c2
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "toString"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 580
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_c7
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "toSource"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 581
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_cc
    const/4 v0, 0x1

    .restart local v0    # "arity":I
    const-string v2, "toXMLString"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 582
    .end local v0    # "arity":I
    .end local v2    # "s":Ljava/lang/String;
    :pswitch_d1
    const/4 v0, 0x0

    .restart local v0    # "arity":I
    const-string v2, "valueOf"

    .restart local v2    # "s":Ljava/lang/String;
    goto/16 :goto_2b

    .line 528
    :pswitch_data_d6
    .packed-switch 0x1
        :pswitch_e
        :pswitch_28
        :pswitch_31
        :pswitch_35
        :pswitch_39
        :pswitch_3d
        :pswitch_41
        :pswitch_45
        :pswitch_49
        :pswitch_4d
        :pswitch_51
        :pswitch_55
        :pswitch_59
        :pswitch_69
        :pswitch_6d
        :pswitch_71
        :pswitch_61
        :pswitch_5d
        :pswitch_65
        :pswitch_75
        :pswitch_79
        :pswitch_7d
        :pswitch_81
        :pswitch_85
        :pswitch_89
        :pswitch_8d
        :pswitch_91
        :pswitch_95
        :pswitch_99
        :pswitch_9d
        :pswitch_a1
        :pswitch_a5
        :pswitch_a9
        :pswitch_ae
        :pswitch_b3
        :pswitch_b8
        :pswitch_bd
        :pswitch_c2
        :pswitch_c7
        :pswitch_cc
        :pswitch_d1
    .end packed-switch
.end method

.method final initialize(Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;Lorg/mozilla/javascript/Scriptable;Lorg/mozilla/javascript/xml/XMLObject;)V
    .registers 5
    .param p1, "lib"    # Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;
    .param p2, "scope"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "prototype"    # Lorg/mozilla/javascript/xml/XMLObject;

    .prologue
    .line 32
    invoke-virtual {p0, p2}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 33
    invoke-virtual {p0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 34
    if-nez p3, :cond_e

    const/4 v0, 0x1

    :goto_9
    iput-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    .line 35
    iput-object p1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    .line 36
    return-void

    .line 34
    :cond_e
    const/4 v0, 0x0

    goto :goto_9
.end method

.method final isPrototype()Z
    .registers 2

    .prologue
    .line 39
    iget-boolean v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->prototypeFlag:Z

    return v0
.end method

.method protected abstract jsConstructor(Lorg/mozilla/javascript/Context;Z[Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method abstract length()I
.end method

.method public memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
    .registers 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "elem"    # Ljava/lang/Object;
    .param p3, "memberTypeFlags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v4, 0x0

    .line 322
    and-int/lit8 v5, p3, 0x2

    if-eqz v5, :cond_14

    move v0, v1

    .line 323
    .local v0, "attribute":Z
    :goto_7
    and-int/lit8 v5, p3, 0x4

    if-eqz v5, :cond_16

    .line 324
    .local v1, "descendants":Z
    :goto_b
    if-nez v0, :cond_18

    if-nez v1, :cond_18

    .line 328
    invoke-static {}, Lorg/mozilla/javascript/Kit;->codeBug()Ljava/lang/RuntimeException;

    move-result-object v4

    throw v4

    .end local v0    # "attribute":Z
    .end local v1    # "descendants":Z
    :cond_14
    move v0, v4

    .line 322
    goto :goto_7

    .restart local v0    # "attribute":Z
    :cond_16
    move v1, v4

    .line 323
    goto :goto_b

    .line 330
    .restart local v1    # "descendants":Z
    :cond_18
    iget-object v4, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v4, p1, p2, v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Z)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v2

    .line 331
    .local v2, "qname":Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    invoke-static {v2, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v3

    .line 332
    .local v3, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v3, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V

    .line 333
    return-object v3
.end method

.method public memberRef(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;I)Lorg/mozilla/javascript/Ref;
    .registers 10
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "namespace"    # Ljava/lang/Object;
    .param p3, "elem"    # Ljava/lang/Object;
    .param p4, "memberTypeFlags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v3, 0x0

    .line 343
    and-int/lit8 v4, p4, 0x2

    if-eqz v4, :cond_19

    move v0, v1

    .line 344
    .local v0, "attribute":Z
    :goto_7
    and-int/lit8 v4, p4, 0x4

    if-eqz v4, :cond_1b

    .line 345
    .local v1, "descendants":Z
    :goto_b
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toNodeQName(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    move-result-object v3

    invoke-static {v3, v0, v1}, Lorg/mozilla/javascript/xmlimpl/XMLName;->create(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;ZZ)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 347
    .local v2, "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    invoke-virtual {v2, p0}, Lorg/mozilla/javascript/xmlimpl/XMLName;->initXMLObject(Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;)V

    .line 348
    return-object v2

    .end local v0    # "attribute":Z
    .end local v1    # "descendants":Z
    .end local v2    # "rv":Lorg/mozilla/javascript/xmlimpl/XMLName;
    :cond_19
    move v0, v3

    .line 343
    goto :goto_7

    .restart local v0    # "attribute":Z
    :cond_1b
    move v1, v3

    .line 344
    goto :goto_b
.end method

.method final newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 5
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newQName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;
    .registers 3
    .param p1, "name"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;

    .prologue
    .line 74
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newQName(Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;)Lorg/mozilla/javascript/xmlimpl/QName;

    move-result-object v0

    return-object v0
.end method

.method final newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 5
    .param p1, "reference"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;
    .param p2, "qname"    # Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 813
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1, p2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newTextElementXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;Lorg/mozilla/javascript/xmlimpl/XmlNode$QName;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "inputObject"    # Ljava/lang/Object;

    .prologue
    .line 818
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLFromJs(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method

.method final newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLList()Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method final newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;
    .registers 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 62
    iget-object v0, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->newXMLListFrom(Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLList;

    move-result-object v0

    return-object v0
.end method

.method abstract normalize()V
.end method

.method abstract parent()Ljava/lang/Object;
.end method

.method abstract processingInstructions(Lorg/mozilla/javascript/xmlimpl/XMLName;)Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract propertyIsEnumerable(Ljava/lang/Object;)Z
.end method

.method public put(Ljava/lang/String;Lorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "start"    # Lorg/mozilla/javascript/Scriptable;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 266
    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object v0

    .line 267
    .local v0, "cx":Lorg/mozilla/javascript/Context;
    iget-object v1, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v1, v0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameFromString(Lorg/mozilla/javascript/Context;Ljava/lang/String;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v1

    invoke-virtual {p0, v1, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    .line 268
    return-void
.end method

.method public final put(Lorg/mozilla/javascript/Context;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8
    .param p1, "cx"    # Lorg/mozilla/javascript/Context;
    .param p2, "id"    # Ljava/lang/Object;
    .param p3, "value"    # Ljava/lang/Object;

    .prologue
    .line 253
    if-nez p1, :cond_6

    invoke-static {}, Lorg/mozilla/javascript/Context;->getCurrentContext()Lorg/mozilla/javascript/Context;

    move-result-object p1

    .line 254
    :cond_6
    iget-object v3, p0, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->lib:Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;

    invoke-virtual {v3, p1, p2}, Lorg/mozilla/javascript/xmlimpl/XMLLibImpl;->toXMLNameOrIndex(Lorg/mozilla/javascript/Context;Ljava/lang/Object;)Lorg/mozilla/javascript/xmlimpl/XMLName;

    move-result-object v2

    .line 255
    .local v2, "xmlName":Lorg/mozilla/javascript/xmlimpl/XMLName;
    if-nez v2, :cond_17

    .line 256
    invoke-static {p1}, Lorg/mozilla/javascript/ScriptRuntime;->lastUint32Result(Lorg/mozilla/javascript/Context;)J

    move-result-wide v0

    .line 258
    .local v0, "index":J
    long-to-int v3, v0

    invoke-virtual {p0, v3, p0, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->put(ILorg/mozilla/javascript/Scriptable;Ljava/lang/Object;)V

    .line 262
    .end local v0    # "index":J
    :goto_16
    return-void

    .line 261
    :cond_17
    invoke-virtual {p0, v2, p3}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V

    goto :goto_16
.end method

.method abstract putXMLProperty(Lorg/mozilla/javascript/xmlimpl/XMLName;Ljava/lang/Object;)V
.end method

.method public final setParentScope(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "parent"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 104
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->setParentScope(Lorg/mozilla/javascript/Scriptable;)V

    .line 105
    return-void
.end method

.method public final setPrototype(Lorg/mozilla/javascript/Scriptable;)V
    .registers 2
    .param p1, "prototype"    # Lorg/mozilla/javascript/Scriptable;

    .prologue
    .line 94
    invoke-super {p0, p1}, Lorg/mozilla/javascript/xml/XMLObject;->setPrototype(Lorg/mozilla/javascript/Scriptable;)V

    .line 95
    return-void
.end method

.method abstract text()Lorg/mozilla/javascript/xmlimpl/XMLList;
.end method

.method abstract toSource(I)Ljava/lang/String;
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method abstract toXMLString()Ljava/lang/String;
.end method

.method abstract valueOf()Ljava/lang/Object;
.end method

.method xmlFromNode(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;
    .registers 3
    .param p1, "node"    # Lorg/mozilla/javascript/xmlimpl/XmlNode;

    .prologue
    .line 51
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    if-nez v0, :cond_d

    .line 52
    invoke-virtual {p0, p1}, Lorg/mozilla/javascript/xmlimpl/XMLObjectImpl;->newXML(Lorg/mozilla/javascript/xmlimpl/XmlNode;)Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->setXml(Lorg/mozilla/javascript/xmlimpl/XML;)V

    .line 54
    :cond_d
    invoke-virtual {p1}, Lorg/mozilla/javascript/xmlimpl/XmlNode;->getXml()Lorg/mozilla/javascript/xmlimpl/XML;

    move-result-object v0

    return-object v0
.end method
