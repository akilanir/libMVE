.class Lezvcard/io/xml/XCardReader$ContentHandlerImpl;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "XCardReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentHandlerImpl"
.end annotation


# instance fields
.field private final DOC:Lorg/w3c/dom/Document;

.field private final characterBuffer:Ljava/lang/StringBuilder;

.field private group:Ljava/lang/String;

.field private paramName:Ljavax/xml/namespace/QName;

.field private parameters:Lezvcard/parameter/VCardParameters;

.field private parent:Lorg/w3c/dom/Element;

.field private propertyElement:Lorg/w3c/dom/Element;

.field private final structure:Lezvcard/io/xml/XCardReader$XCardStructure;

.field final synthetic this$0:Lezvcard/io/xml/XCardReader;


# direct methods
.method private constructor <init>(Lezvcard/io/xml/XCardReader;)V
    .registers 5

    .prologue
    .line 250
    iput-object p1, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 251
    invoke-static {}, Lezvcard/util/XmlUtils;->createDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iput-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->DOC:Lorg/w3c/dom/Document;

    .line 252
    new-instance v0, Lezvcard/io/xml/XCardReader$XCardStructure;

    iget-object v1, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lezvcard/io/xml/XCardReader$XCardStructure;-><init>(Lezvcard/io/xml/XCardReader;Lezvcard/io/xml/XCardReader$1;)V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    .line 253
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    return-void
.end method

.method synthetic constructor <init>(Lezvcard/io/xml/XCardReader;Lezvcard/io/xml/XCardReader$1;)V
    .registers 3
    .param p1, "x0"    # Lezvcard/io/xml/XCardReader;
    .param p2, "x1"    # Lezvcard/io/xml/XCardReader$1;

    .prologue
    .line 250
    invoke-direct {p0, p1}, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;-><init>(Lezvcard/io/xml/XCardReader;)V

    return-void
.end method

.method private createElement(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lorg/w3c/dom/Element;
    .registers 10
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 450
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->DOC:Lorg/w3c/dom/Document;

    invoke-interface {v5, p1, p2}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 453
    .local v0, "element":Lorg/w3c/dom/Element;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_7
    invoke-interface {p3}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v5

    if-ge v1, v5, :cond_28

    .line 454
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v3

    .line 455
    .local v3, "qname":Ljava/lang/String;
    const-string v5, "xmlns:"

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c

    .line 453
    :goto_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 459
    :cond_1c
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    .line 460
    .local v2, "name":Ljava/lang/String;
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v4

    .line 461
    .local v4, "value":Ljava/lang/String;
    invoke-interface {v0, v2, v4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_19

    .line 464
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "qname":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_28
    return-object v0
.end method


# virtual methods
.method public characters([CII)V
    .registers 5
    .param p1, "buffer"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 262
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    if-nez v0, :cond_5

    .line 267
    :goto_4
    return-void

    .line 266
    :cond_5
    iget-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2, p3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_4
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 22
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 359
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 360
    .local v8, "textContent":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 362
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v12}, Lezvcard/io/xml/XCardReader$XCardStructure;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_1b

    .line 447
    :cond_1a
    :goto_1a
    return-void

    .line 367
    :cond_1b
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v12}, Lezvcard/io/xml/XCardReader$XCardStructure;->pop()Lezvcard/io/xml/XCardReader$ElementType;

    move-result-object v9

    .line 368
    .local v9, "type":Lezvcard/io/xml/XCardReader$ElementType;
    if-nez v9, :cond_35

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    if-eqz v12, :cond_1a

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v12}, Lezvcard/io/xml/XCardReader$XCardStructure;->isUnderParameters()Z

    move-result v12

    if-nez v12, :cond_1a

    .line 373
    :cond_35
    if-eqz v9, :cond_42

    .line 374
    sget-object v12, Lezvcard/io/xml/XCardReader$1;->$SwitchMap$ezvcard$io$xml$XCardReader$ElementType:[I

    invoke-virtual {v9}, Lezvcard/io/xml/XCardReader$ElementType;->ordinal()I

    move-result v13

    aget v12, v12, v13

    packed-switch v12, :pswitch_data_1bc

    .line 441
    :cond_42
    :goto_42
    :pswitch_42
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    if-eqz v12, :cond_1a

    sget-object v12, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v9, v12, :cond_1a

    sget-object v12, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v9, v12, :cond_1a

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v12}, Lezvcard/io/xml/XCardReader$XCardStructure;->isUnderParameters()Z

    move-result v12

    if-nez v12, :cond_1a

    .line 442
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_6f

    .line 443
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->DOC:Lorg/w3c/dom/Document;

    invoke-interface {v13, v8}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 445
    :cond_6f
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    invoke-interface {v12}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v12

    check-cast v12, Lorg/w3c/dom/Element;

    move-object/from16 v0, p0

    iput-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    goto :goto_1a

    .line 376
    :pswitch_7e
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parameters:Lezvcard/parameter/VCardParameters;

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->paramName:Ljavax/xml/namespace/QName;

    invoke-virtual {v13}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v8}, Lezvcard/parameter/VCardParameters;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_42

    .line 388
    :pswitch_8e
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->DOC:Lorg/w3c/dom/Document;

    invoke-interface {v13, v8}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v13

    invoke-interface {v12, v13}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 390
    move-object/from16 v4, p2

    .line 392
    .local v4, "propertyName":Ljava/lang/String;
    new-instance v5, Ljavax/xml/namespace/QName;

    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    invoke-interface {v12}, Lorg/w3c/dom/Element;->getNamespaceURI()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    invoke-interface {v13}, Lorg/w3c/dom/Element;->getLocalName()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v5, v12, v13}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    .local v5, "propertyQName":Ljavax/xml/namespace/QName;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->index:Lezvcard/io/scribe/ScribeIndex;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1300(Lezvcard/io/xml/XCardReader;)Lezvcard/io/scribe/ScribeIndex;

    move-result-object v12

    invoke-virtual {v12, v5}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljavax/xml/namespace/QName;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v7

    .line 395
    .local v7, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :try_start_c0
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v7, v12, v13}, Lezvcard/io/scribe/VCardPropertyScribe;->parseXml(Lorg/w3c/dom/Element;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v6

    .line 396
    .local v6, "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v3

    .line 397
    .local v3, "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->group:Ljava/lang/String;

    invoke-virtual {v3, v12}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1000(Lezvcard/io/xml/XCardReader;)Lezvcard/VCard;

    move-result-object v12

    invoke-virtual {v12, v3}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    .line 399
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getWarnings()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_ea
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_11d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 400
    .local v10, "warning":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1400(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13, v4, v10}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_102
    .catch Lezvcard/io/SkipMeException; {:try_start_c0 .. :try_end_102} :catch_103
    .catch Lezvcard/io/CannotParseException; {:try_start_c0 .. :try_end_102} :catch_124
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_c0 .. :try_end_102} :catch_17b

    goto :goto_ea

    .line 402
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "property":Lezvcard/property/VCardProperty;
    .end local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v10    # "warning":Ljava/lang/String;
    :catch_103
    move-exception v1

    .line 403
    .local v1, "e":Lezvcard/io/SkipMeException;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1500(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v12

    const/4 v13, 0x0

    const/16 v14, 0x16

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v1}, Lezvcard/io/SkipMeException;->getMessage()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-virtual {v12, v13, v4, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 417
    .end local v1    # "e":Lezvcard/io/SkipMeException;
    :cond_11d
    :goto_11d
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    goto/16 :goto_42

    .line 404
    :catch_124
    move-exception v1

    .line 405
    .local v1, "e":Lezvcard/io/CannotParseException;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    invoke-static {v12}, Lezvcard/util/XmlUtils;->toString(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v11

    .line 406
    .local v11, "xml":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1600(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v12

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

    invoke-virtual {v12, v13, v4, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    .line 408
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->index:Lezvcard/io/scribe/ScribeIndex;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1700(Lezvcard/io/xml/XCardReader;)Lezvcard/io/scribe/ScribeIndex;

    move-result-object v12

    const-class v13, Lezvcard/property/Xml;

    invoke-virtual {v12, v13}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Ljava/lang/Class;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v7

    .line 409
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v7, v12, v13}, Lezvcard/io/scribe/VCardPropertyScribe;->parseXml(Lorg/w3c/dom/Element;Lezvcard/parameter/VCardParameters;)Lezvcard/io/scribe/VCardPropertyScribe$Result;

    move-result-object v6

    .line 410
    .restart local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    invoke-virtual {v6}, Lezvcard/io/scribe/VCardPropertyScribe$Result;->getProperty()Lezvcard/property/VCardProperty;

    move-result-object v3

    .line 411
    .restart local v3    # "property":Lezvcard/property/VCardProperty;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->group:Ljava/lang/String;

    invoke-virtual {v3, v12}, Lezvcard/property/VCardProperty;->setGroup(Ljava/lang/String;)V

    .line 412
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1000(Lezvcard/io/xml/XCardReader;)Lezvcard/VCard;

    move-result-object v12

    invoke-virtual {v12, v3}, Lezvcard/VCard;->addProperty(Lezvcard/property/VCardProperty;)V

    goto :goto_11d

    .line 413
    .end local v1    # "e":Lezvcard/io/CannotParseException;
    .end local v3    # "property":Lezvcard/property/VCardProperty;
    .end local v6    # "result":Lezvcard/io/scribe/VCardPropertyScribe$Result;, "Lezvcard/io/scribe/VCardPropertyScribe$Result<+Lezvcard/property/VCardProperty;>;"
    .end local v11    # "xml":Ljava/lang/String;
    :catch_17b
    move-exception v1

    .line 414
    .local v1, "e":Lezvcard/io/EmbeddedVCardException;
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->warnings:Lezvcard/io/ParseWarnings;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1800(Lezvcard/io/xml/XCardReader;)Lezvcard/io/ParseWarnings;

    move-result-object v12

    const/4 v13, 0x0

    const/16 v14, 0x22

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/Object;

    invoke-virtual {v12, v13, v4, v14, v15}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V

    goto :goto_11d

    .line 421
    .end local v1    # "e":Lezvcard/io/EmbeddedVCardException;
    .end local v4    # "propertyName":Ljava/lang/String;
    .end local v5    # "propertyQName":Ljavax/xml/namespace/QName;
    .end local v7    # "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    :pswitch_18e
    const/4 v12, 0x0

    move-object/from16 v0, p0

    iput-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->group:Ljava/lang/String;

    goto/16 :goto_42

    .line 427
    :pswitch_195
    :try_start_195
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readerBlock:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$800(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->lock:Ljava/lang/Object;
    invoke-static {v13}, Lezvcard/io/xml/XCardReader;->access$700(Lezvcard/io/xml/XCardReader;)Ljava/lang/Object;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    .line 428
    move-object/from16 v0, p0

    iget-object v12, v0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->threadBlock:Ljava/util/concurrent/BlockingQueue;
    invoke-static {v12}, Lezvcard/io/xml/XCardReader;->access$1900(Lezvcard/io/xml/XCardReader;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;
    :try_end_1b3
    .catch Ljava/lang/InterruptedException; {:try_start_195 .. :try_end_1b3} :catch_1b5

    goto/16 :goto_42

    .line 429
    :catch_1b5
    move-exception v1

    .line 430
    .local v1, "e":Ljava/lang/InterruptedException;
    new-instance v12, Lorg/xml/sax/SAXException;

    invoke-direct {v12, v1}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    throw v12

    .line 374
    :pswitch_data_1bc
    .packed-switch 0x2
        :pswitch_195
        :pswitch_18e
        :pswitch_8e
        :pswitch_42
        :pswitch_42
        :pswitch_7e
    .end packed-switch
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 12
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 271
    new-instance v2, Ljavax/xml/namespace/QName;

    invoke-direct {v2, p1, p2}, Ljavax/xml/namespace/QName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .local v2, "qname":Ljavax/xml/namespace/QName;
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 273
    .local v3, "textContent":Ljava/lang/String;
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->characterBuffer:Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 275
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v5}, Lezvcard/io/xml/XCardReader$XCardStructure;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_29

    .line 277
    sget-object v5, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-virtual {v5, v2}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_28

    .line 278
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    sget-object v6, Lezvcard/io/xml/XCardReader$ElementType;->vcards:Lezvcard/io/xml/XCardReader$ElementType;

    invoke-virtual {v5, v6}, Lezvcard/io/xml/XCardReader$XCardStructure;->push(Lezvcard/io/xml/XCardReader$ElementType;)V

    .line 355
    :cond_28
    :goto_28
    return-void

    .line 283
    :cond_29
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v5}, Lezvcard/io/xml/XCardReader$XCardStructure;->peek()Lezvcard/io/xml/XCardReader$ElementType;

    move-result-object v1

    .line 284
    .local v1, "parentType":Lezvcard/io/xml/XCardReader$ElementType;
    const/4 v4, 0x0

    .line 286
    .local v4, "typeToPush":Lezvcard/io/xml/XCardReader$ElementType;
    if-eqz v1, :cond_3d

    .line 287
    sget-object v5, Lezvcard/io/xml/XCardReader$1;->$SwitchMap$ezvcard$io$xml$XCardReader$ElementType:[I

    invoke-virtual {v1}, Lezvcard/io/xml/XCardReader$ElementType;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_102

    .line 345
    :cond_3d
    :goto_3d
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    if-eqz v5, :cond_6d

    sget-object v5, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v4, v5, :cond_6d

    sget-object v5, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    if-eq v4, v5, :cond_6d

    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v5}, Lezvcard/io/xml/XCardReader$XCardStructure;->isUnderParameters()Z

    move-result v5

    if-nez v5, :cond_6d

    .line 346
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_62

    .line 347
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    iget-object v6, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->DOC:Lorg/w3c/dom/Document;

    invoke-interface {v6, v3}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 349
    :cond_62
    invoke-direct {p0, p1, p2, p4}, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->createElement(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 350
    .local v0, "element":Lorg/w3c/dom/Element;
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    invoke-interface {v5, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 351
    iput-object v0, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    .line 354
    .end local v0    # "element":Lorg/w3c/dom/Element;
    :cond_6d
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->structure:Lezvcard/io/xml/XCardReader$XCardStructure;

    invoke-virtual {v5, v4}, Lezvcard/io/xml/XCardReader$XCardStructure;->push(Lezvcard/io/xml/XCardReader$ElementType;)V

    goto :goto_28

    .line 290
    :pswitch_73
    sget-object v5, Lezvcard/io/xml/XCardQNames;->VCARD:Ljavax/xml/namespace/QName;

    invoke-virtual {v5, v2}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 291
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    new-instance v6, Lezvcard/VCard;

    invoke-direct {v6}, Lezvcard/VCard;-><init>()V

    # setter for: Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;
    invoke-static {v5, v6}, Lezvcard/io/xml/XCardReader;->access$1002(Lezvcard/io/xml/XCardReader;Lezvcard/VCard;)Lezvcard/VCard;

    .line 292
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->readVCard:Lezvcard/VCard;
    invoke-static {v5}, Lezvcard/io/xml/XCardReader;->access$1000(Lezvcard/io/xml/XCardReader;)Lezvcard/VCard;

    move-result-object v5

    iget-object v6, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->version:Lezvcard/VCardVersion;
    invoke-static {v6}, Lezvcard/io/xml/XCardReader;->access$1100(Lezvcard/io/xml/XCardReader;)Lezvcard/VCardVersion;

    move-result-object v6

    invoke-virtual {v5, v6}, Lezvcard/VCard;->setVersion(Lezvcard/VCardVersion;)V

    .line 293
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->vcard:Lezvcard/io/xml/XCardReader$ElementType;

    goto :goto_3d

    .line 299
    :pswitch_97
    sget-object v5, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-virtual {v5, v2}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_aa

    .line 300
    const-string v5, "name"

    invoke-interface {p4, v5}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->group:Ljava/lang/String;

    .line 301
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->group:Lezvcard/io/xml/XCardReader$ElementType;

    goto :goto_3d

    .line 303
    :cond_aa
    invoke-direct {p0, p1, p2, p4}, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->createElement(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lorg/w3c/dom/Element;

    move-result-object v5

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    .line 304
    new-instance v5, Lezvcard/parameter/VCardParameters;

    invoke-direct {v5}, Lezvcard/parameter/VCardParameters;-><init>()V

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parameters:Lezvcard/parameter/VCardParameters;

    .line 305
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    .line 306
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    .line 308
    goto :goto_3d

    .line 311
    :pswitch_be
    invoke-direct {p0, p1, p2, p4}, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->createElement(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)Lorg/w3c/dom/Element;

    move-result-object v5

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    .line 312
    new-instance v5, Lezvcard/parameter/VCardParameters;

    invoke-direct {v5}, Lezvcard/parameter/VCardParameters;-><init>()V

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parameters:Lezvcard/parameter/VCardParameters;

    .line 313
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->propertyElement:Lorg/w3c/dom/Element;

    iput-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->parent:Lorg/w3c/dom/Element;

    .line 314
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->property:Lezvcard/io/xml/XCardReader$ElementType;

    .line 315
    goto/16 :goto_3d

    .line 319
    :pswitch_d3
    sget-object v5, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-virtual {v5, v2}, Ljavax/xml/namespace/QName;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 320
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->parameters:Lezvcard/io/xml/XCardReader$ElementType;

    goto/16 :goto_3d

    .line 326
    :pswitch_df
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;
    invoke-static {v5}, Lezvcard/io/xml/XCardReader;->access$1200(Lezvcard/io/xml/XCardReader;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 327
    iput-object v2, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->paramName:Ljavax/xml/namespace/QName;

    .line 328
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->parameter:Lezvcard/io/xml/XCardReader$ElementType;

    goto/16 :goto_3d

    .line 333
    :pswitch_f1
    iget-object v5, p0, Lezvcard/io/xml/XCardReader$ContentHandlerImpl;->this$0:Lezvcard/io/xml/XCardReader;

    # getter for: Lezvcard/io/xml/XCardReader;->NS:Ljava/lang/String;
    invoke-static {v5}, Lezvcard/io/xml/XCardReader;->access$1200(Lezvcard/io/xml/XCardReader;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d

    .line 334
    sget-object v4, Lezvcard/io/xml/XCardReader$ElementType;->parameterValue:Lezvcard/io/xml/XCardReader$ElementType;

    goto/16 :goto_3d

    .line 287
    nop

    :pswitch_data_102
    .packed-switch 0x1
        :pswitch_73
        :pswitch_97
        :pswitch_be
        :pswitch_d3
        :pswitch_df
        :pswitch_f1
    .end packed-switch
.end method
