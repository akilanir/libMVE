.class Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;
.super Lezvcard/io/StreamReader;
.source "XCardDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "XCardDocumentStreamReader"
.end annotation


# instance fields
.field final synthetic this$0:Lezvcard/io/xml/XCardDocument;

.field private vcard:Lezvcard/VCard;

.field private final vcardElements:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lezvcard/io/xml/XCardDocument;)V
    .registers 5

    .prologue
    .line 376
    iput-object p1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->this$0:Lezvcard/io/xml/XCardDocument;

    invoke-direct {p0}, Lezvcard/io/StreamReader;-><init>()V

    .line 379
    iget-object v1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v1}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v1

    if-nez v1, :cond_18

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 380
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    :goto_11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    iput-object v1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcardElements:Ljava/util/Iterator;

    .line 381
    return-void

    .line 379
    .end local v0    # "list":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    :cond_18
    iget-object v1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v1}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v1

    sget-object v2, Lezvcard/io/xml/XCardQNames;->VCARD:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v1, v2}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->getChildElements(Lorg/w3c/dom/Element;Ljavax/xml/namespace/QName;)Ljava/util/List;

    move-result-object v0

    goto :goto_11
.end method

.method synthetic constructor <init>(Lezvcard/io/xml/XCardDocument;Lezvcard/io/xml/XCardDocument$1;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/io/xml/XCardDocument;
    .param p2, "x1"    # Lezvcard/io/xml/XCardDocument$1;

    .prologue
    .line 376
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;-><init>(Lezvcard/io/xml/XCardDocument;)V

    return-void
.end method

.method private getChildElements(Lorg/w3c/dom/Element;Ljavax/xml/namespace/QName;)Ljava/util/List;
    .registers 8
    .param p1, "parent"    # Lorg/w3c/dom/Element;
    .param p2, "qname"    # Ljavax/xml/namespace/QName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/w3c/dom/Element;",
            "Ljavax/xml/namespace/QName;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/w3c/dom/Element;",
            ">;"
        }
    .end annotation

    .prologue
    .line 506
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 507
    .local v1, "elements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v3

    invoke-static {v3}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 508
    .local v0, "child":Lorg/w3c/dom/Element;
    invoke-virtual {p2}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    invoke-virtual {p2}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 509
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    .line 512
    .end local v0    # "child":Lorg/w3c/dom/Element;
    :cond_3d
    return-object v1
.end method

.method private parseAndAddElement(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .registers 21
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "group"    # Ljava/lang/String;

    .prologue
    .line 440
    invoke-direct/range {p0 .. p1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->parseParameters(Lorg/w3c/dom/Element;)Lezvcard/parameter/VCardParameters;

    move-result-object v4

    .line 443
    .local v4, "parameters":Lezvcard/parameter/VCardParameters;
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v6

    .line 444
    .local v6, "propertyName":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v3

    .line 445
    .local v3, "ns":Ljava/lang/String;
    new-instance v7, Ljavax/xml/namespace/QName;

    invoke-direct {v7, v3, v6}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    .local v7, "qname":Ljavax/xml/namespace/QName;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v12, v7}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljavax/xml/namespace/QName;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v9

    .line 448
    .local v9, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :try_start_19
    move-object/from16 v0, p1

    invoke-virtual {v9, v0, v4}, Lezvcard/io/scribe/VCardPropertyScribe;->parseXml(Lorg/w3c/dom/Element;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v8

    .line 450
    .local v8, "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v8}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v5

    .line 451
    .local v5, "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 453
    invoke-virtual {v8}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_30
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_93

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 454
    .local v10, "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->warnings:Lezvcard/io/ParseWarnings;

    const/4 v13, 0x0

    invoke-virtual {v12, v13, v6, v10}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_44
    .catch Lezvcard/io/SkipMeException; {:try_start_19 .. :try_end_44} :catch_45
    .catch Lezvcard/io/CannotParseException; {:try_start_19 .. :try_end_44} :catch_5c
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_19 .. :try_end_44} :catch_9b

    goto :goto_30

    .line 456
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "property":Lezvcard/property/VCardProperty;
    .end local v8    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v10    # "warning":Ljava/lang/String;
    :catch_45
    move-exception v1

    .line 457
    .local v1, "e":Lezvcard/io/SkipMeException;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->warnings:Lezvcard/io/ParseWarnings;

    const/4 v13, 0x0

    const/16 v14, 0x16

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v1}, Lezvcard/io/SkipMeException;->getMessage()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v6, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 473
    .end local v1    # "e":Lezvcard/io/SkipMeException;
    :goto_5b
    return-void

    .line 459
    :catch_5c
    move-exception v1

    .line 460
    .local v1, "e":Lezvcard/io/CannotParseException;
    invoke-static/range {p1 .. p1}, Lezvcard/util/XmlUtils;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v11

    .line 461
    .local v11, "xml":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->warnings:Lezvcard/io/ParseWarnings;

    const/4 v13, 0x0

    const/16 v14, 0x21

    const/4 v15, 0x2

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v11, v15, v16

    const/16 v16, 0x1

    invoke-virtual {v1}, Lezvcard/io/CannotParseException;->getMessage()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v6, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 463
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->index:Lezvcard/io/scribe/ScribeIndex;

    const-class v13, Lezvcard/property/Xml;

    invoke-virtual {v12, v13}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v9

    .line 464
    move-object/from16 v0, p1

    invoke-virtual {v9, v0, v4}, Lezvcard/io/scribe/VCardPropertyScribe;->parseXml(Lorg/w3c/dom/Element;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v8

    .line 465
    .restart local v8    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v8}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v5

    .line 466
    .restart local v5    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p2

    invoke-virtual {v5, v0}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 472
    .end local v1    # "e":Lezvcard/io/CannotParseException;
    .end local v11    # "xml":Ljava/lang/String;
    :cond_93
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcard:Lezvcard/VCard;

    invoke-virtual {v12, v5}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto :goto_5b

    .line 467
    .end local v5    # "property":Lezvcard/property/VCardProperty;
    .end local v8    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    :catch_9b
    move-exception v1

    .line 468
    .local v1, "e":Lezvcard/io/EmbeddedVCardException;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->warnings:Lezvcard/io/ParseWarnings;

    const/4 v13, 0x0

    const/16 v14, 0x22

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-virtual {v12, v13, v6, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_5b
.end method

.method private parseParameters(Lorg/w3c/dom/Element;)Lezvcard/parameter/VCardParameters;
    .registers 16
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 481
    new-instance v6, Lezvcard/parameter/VCardParameters;

    invoke-direct {v6}, Lezvcard/parameter/VCardParameters;-><init>()V

    .line 483
    .local v6, "parameters":Lezvcard/parameter/VCardParameters;
    sget-object v12, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-virtual {v12}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-virtual {v13}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v13

    invoke-interface {p1, v12, v13}, Lorg/w3c/dom/Element;->getElementsByTagNameNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v12

    invoke-static {v12}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v8

    .line 484
    .local v8, "roots":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_77

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/Element;

    .line 485
    .local v7, "root":Lorg/w3c/dom/Element;
    invoke-interface {v7}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v12

    invoke-static {v12}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v5

    .line 486
    .local v5, "parameterElements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_35
    :goto_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/w3c/dom/Element;

    .line 487
    .local v4, "parameterElement":Lorg/w3c/dom/Element;
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v3

    .line 488
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v12

    invoke-static {v12}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v11

    .line 489
    .local v11, "valueElements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {v11}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_5f

    .line 490
    invoke-interface {v4}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v9

    .line 491
    .local v9, "value":Ljava/lang/String;
    invoke-virtual {v6, v3, v9}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_35

    .line 495
    .end local v9    # "value":Ljava/lang/String;
    :cond_5f
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_63
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_35

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/w3c/dom/Element;

    .line 496
    .local v10, "valueElement":Lorg/w3c/dom/Element;
    invoke-interface {v10}, Lorg/w3c/dom/Element;->getTextContent()Ljava/lang/String;

    move-result-object v9

    .line 497
    .restart local v9    # "value":Ljava/lang/String;
    invoke-virtual {v6, v3, v9}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_63

    .line 502
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "parameterElement":Lorg/w3c/dom/Element;
    .end local v5    # "parameterElements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    .end local v7    # "root":Lorg/w3c/dom/Element;
    .end local v9    # "value":Ljava/lang/String;
    .end local v10    # "valueElement":Lorg/w3c/dom/Element;
    .end local v11    # "valueElements":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    :cond_77
    return-object v6
.end method

.method private parseVCardElement(Lorg/w3c/dom/Element;)V
    .registers 11
    .param p1, "vcardElement"    # Lorg/w3c/dom/Element;

    .prologue
    .line 412
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-static {v7}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v1

    .line 413
    .local v1, "children":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_c
    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_66

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 414
    .local v0, "child":Lorg/w3c/dom/Element;
    sget-object v7, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-virtual {v7}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_61

    sget-object v7, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-virtual {v7}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_61

    .line 415
    const-string v7, "name"

    invoke-interface {v0, v7}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 416
    .local v4, "group":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_45

    .line 417
    const/4 v4, 0x0

    .line 419
    :cond_45
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v7

    invoke-static {v7}, Lezvcard/util/XmlUtils;->toElementList(Lorg/w3c/dom/NodeList;)Ljava/util/List;

    move-result-object v3

    .line 420
    .local v3, "grandChildren":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :goto_51
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/w3c/dom/Element;

    .line 421
    .local v2, "grandChild":Lorg/w3c/dom/Element;
    invoke-direct {p0, v2, v4}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->parseAndAddElement(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    goto :goto_51

    .line 426
    .end local v2    # "grandChild":Lorg/w3c/dom/Element;
    .end local v3    # "grandChildren":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Element;>;"
    .end local v4    # "group":Ljava/lang/String;
    .end local v6    # "i$":Ljava/util/Iterator;
    :cond_61
    const/4 v7, 0x0

    invoke-direct {p0, v0, v7}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->parseAndAddElement(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    goto :goto_c

    .line 428
    .end local v0    # "child":Lorg/w3c/dom/Element;
    :cond_66
    return-void
.end method


# virtual methods
.method protected _readNext()Lezvcard/VCard;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcardElements:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_a

    .line 398
    const/4 v0, 0x0

    .line 404
    :goto_9
    return-object v0

    .line 401
    :cond_a
    new-instance v0, Lezvcard/VCard;

    invoke-direct {v0}, Lezvcard/VCard;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcard:Lezvcard/VCard;

    .line 402
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcard:Lezvcard/VCard;

    iget-object v1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;
    invoke-static {v1}, Lezvcard/io/xml/XCardDocument;->access$200(Lezvcard/io/xml/XCardDocument;)Lezvcard/VCardVersion;

    move-result-object v1

    invoke-virtual {v0, v1}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    .line 403
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcardElements:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->parseVCardElement(Lorg/w3c/dom/Element;)V

    .line 404
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamReader;->vcard:Lezvcard/VCard;

    goto :goto_9
.end method

.method public close()V
    .registers 1

    .prologue
    .line 409
    return-void
.end method

.method public readNext()Lezvcard/VCard;
    .registers 3

    .prologue
    .line 388
    :try_start_0
    invoke-super {p0}, Lezvcard/io/StreamReader;->readNext()Lezvcard/VCard;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 389
    :catch_5
    move-exception v0

    .line 391
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
