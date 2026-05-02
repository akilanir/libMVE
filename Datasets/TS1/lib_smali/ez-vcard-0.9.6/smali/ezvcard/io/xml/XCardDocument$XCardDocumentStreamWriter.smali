.class public Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;
.super Lezvcard/io/StreamWriter;
.source "XCardDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/io/xml/XCardDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "XCardDocumentStreamWriter"
.end annotation


# instance fields
.field private final parameterDataTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lezvcard/VCardDataType;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lezvcard/io/xml/XCardDocument;


# direct methods
.method public constructor <init>(Lezvcard/io/xml/XCardDocument;)V
    .registers 4

    .prologue
    .line 516
    iput-object p1, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    invoke-direct {p0}, Lezvcard/io/StreamWriter;-><init>()V

    .line 521
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->parameterDataTypes:Ljava/util/Map;

    .line 523
    const-string v0, "ALTID"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 524
    const-string v0, "CALSCALE"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 525
    const-string v0, "GEO"

    sget-object v1, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 526
    const-string v0, "LABEL"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 527
    const-string v0, "LANGUAGE"

    sget-object v1, Lezvcard/VCardDataType;->LANGUAGE_TAG:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 528
    const-string v0, "MEDIATYPE"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 529
    const-string v0, "PID"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 530
    const-string v0, "PREF"

    sget-object v1, Lezvcard/VCardDataType;->INTEGER:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 531
    const-string v0, "SORT-AS"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 532
    const-string v0, "TYPE"

    sget-object v1, Lezvcard/VCardDataType;->TEXT:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 533
    const-string v0, "TZ"

    sget-object v1, Lezvcard/VCardDataType;->URI:Lezvcard/VCardDataType;

    invoke-virtual {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V

    .line 534
    return-void
.end method

.method private createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 667
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;
    invoke-static {v0}, Lezvcard/io/xml/XCardDocument;->access$200(Lezvcard/io/xml/XCardDocument;)Lezvcard/VCardVersion;

    move-result-object v0

    invoke-virtual {v0}, Lezvcard/VCardVersion;->getXmlNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method private createElement(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "ns"    # Ljava/lang/String;

    .prologue
    .line 677
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;
    invoke-static {v0}, Lezvcard/io/xml/XCardDocument;->access$300(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-interface {v0, p2, p1}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method private createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;
    .registers 4
    .param p1, "qname"    # Ljavax/xml/namespace/QName;

    .prologue
    .line 686
    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getLocalPart()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavax/xml/namespace/QName;->getNamespaceURI()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    return-object v0
.end method

.method private marshalParameters(Lezvcard/parameter/VCardParameters;)Lorg/w3c/dom/Element;
    .registers 13
    .param p1, "parameters"    # Lezvcard/parameter/VCardParameters;

    .prologue
    .line 641
    sget-object v10, Lezvcard/io/xml/XCardQNames;->PARAMETERS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v10}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;

    move-result-object v9

    .line 643
    .local v9, "parametersElement":Lorg/w3c/dom/Element;
    invoke-virtual {p1}, Lezvcard/parameter/VCardParameters;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 644
    .local v5, "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v7

    .line 645
    .local v7, "parameterName":Ljava/lang/String;
    invoke-direct {p0, v7}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v6

    .line 647
    .local v6, "parameterElement":Lorg/w3c/dom/Element;
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_2e
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_5a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 648
    .local v8, "parameterValue":Ljava/lang/String;
    iget-object v10, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/VCardDataType;

    .line 649
    .local v0, "dataType":Lezvcard/VCardDataType;
    if-nez v0, :cond_51

    const-string v2, "unknown"

    .line 650
    .local v2, "dataTypeElementName":Ljava/lang/String;
    :goto_46
    invoke-direct {p0, v2}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 651
    .local v1, "dataTypeElement":Lorg/w3c/dom/Element;
    invoke-interface {v1, v8}, Lorg/w3c/dom/Element;->setTextContent(Ljava/lang/String;)V

    .line 652
    invoke-interface {v6, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_2e

    .line 649
    .end local v1    # "dataTypeElement":Lorg/w3c/dom/Element;
    .end local v2    # "dataTypeElementName":Ljava/lang/String;
    :cond_51
    invoke-virtual {v0}, Lezvcard/VCardDataType;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    goto :goto_46

    .line 655
    .end local v0    # "dataType":Lezvcard/VCardDataType;
    .end local v8    # "parameterValue":Ljava/lang/String;
    :cond_5a
    invoke-interface {v9, v6}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_a

    .line 658
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v5    # "parameter":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v6    # "parameterElement":Lorg/w3c/dom/Element;
    .end local v7    # "parameterName":Ljava/lang/String;
    :cond_5e
    return-object v9
.end method

.method private marshalProperty(Lezvcard/property/VCardProperty;Lezvcard/VCard;)Lorg/w3c/dom/Element;
    .registers 9
    .param p1, "type"    # Lezvcard/property/VCardProperty;
    .param p2, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 622
    iget-object v5, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->index:Lezvcard/io/scribe/ScribeIndex;

    invoke-virtual {v5, p1}, Lezvcard/io/scribe/ScribeIndex;->getPropertyScribe(Lezvcard/property/VCardProperty;)Lezvcard/io/scribe/VCardPropertyScribe;

    move-result-object v4

    .line 623
    .local v4, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;
    iget-object v5, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->version4:Lezvcard/VCardVersion;
    invoke-static {v5}, Lezvcard/io/xml/XCardDocument;->access$200(Lezvcard/io/xml/XCardDocument;)Lezvcard/VCardVersion;

    move-result-object v5

    invoke-virtual {v4, p1, v5, p2}, Lezvcard/io/scribe/VCardPropertyScribe;->prepareParameters(Lezvcard/property/VCardProperty;Lezvcard/VCardVersion;Lezvcard/VCard;)Lezvcard/parameter/VCardParameters;

    move-result-object v0

    .line 625
    .local v0, "parameters":Lezvcard/parameter/VCardParameters;
    invoke-virtual {v4}, Lezvcard/io/scribe/VCardPropertyScribe;->getQName()Ljavax/xml/namespace/QName;

    move-result-object v3

    .line 626
    .local v3, "qname":Ljavax/xml/namespace/QName;
    invoke-direct {p0, v3}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 629
    .local v2, "propertyElement":Lorg/w3c/dom/Element;
    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_25

    .line 630
    invoke-direct {p0, v0}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->marshalParameters(Lezvcard/parameter/VCardParameters;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 631
    .local v1, "parametersElement":Lorg/w3c/dom/Element;
    invoke-interface {v2, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 635
    .end local v1    # "parametersElement":Lorg/w3c/dom/Element;
    :cond_25
    invoke-virtual {v4, p1, v2}, Lezvcard/io/scribe/VCardPropertyScribe;->writeXml(Lezvcard/property/VCardProperty;Lorg/w3c/dom/Element;)V

    .line 637
    return-object v2
.end method


# virtual methods
.method protected _write(Lezvcard/VCard;Ljava/util/List;)V
    .registers 16
    .param p1, "vcard"    # Lezvcard/VCard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/VCard;",
            "Ljava/util/List",
            "<",
            "Lezvcard/property/VCardProperty;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 547
    .local p2, "properties":Ljava/util/List;, "Ljava/util/List<Lezvcard/property/VCardProperty;>;"
    new-instance v7, Lezvcard/util/ListMultimap;

    invoke-direct {v7}, Lezvcard/util/ListMultimap;-><init>()V

    .line 548
    .local v7, "propertiesByGroup":Lezvcard/util/ListMultimap;, "Lezvcard/util/ListMultimap<Ljava/lang/String;Lezvcard/property/VCardProperty;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1d

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lezvcard/property/VCardProperty;

    .line 549
    .local v8, "property":Lezvcard/property/VCardProperty;
    invoke-virtual {v8}, Lezvcard/property/VCardProperty;->getGroup()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11, v8}, Lezvcard/util/ListMultimap;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_9

    .line 553
    .end local v8    # "property":Lezvcard/property/VCardProperty;
    :cond_1d
    sget-object v11, Lezvcard/io/xml/XCardQNames;->VCARD:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v11}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;

    move-result-object v10

    .line 554
    .local v10, "vcardElement":Lorg/w3c/dom/Element;
    invoke-virtual {v7}, Lezvcard/util/ListMultimap;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_27
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 555
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lezvcard/property/VCardProperty;>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 557
    .local v3, "groupName":Ljava/lang/String;
    if-eqz v3, :cond_6a

    .line 558
    sget-object v11, Lezvcard/io/xml/XCardQNames;->GROUP:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v11}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;

    move-result-object v2

    .line 559
    .local v2, "groupElement":Lorg/w3c/dom/Element;
    const-string v11, "name"

    invoke-interface {v2, v11, v3}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 560
    invoke-interface {v10, v2}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 561
    move-object v6, v2

    .line 566
    .end local v2    # "groupElement":Lorg/w3c/dom/Element;
    .local v6, "parent":Lorg/w3c/dom/Element;
    :goto_4a
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_54
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_27

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lezvcard/property/VCardProperty;

    .line 568
    .restart local v8    # "property":Lezvcard/property/VCardProperty;
    :try_start_60
    invoke-direct {p0, v8, p1}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->marshalProperty(Lezvcard/property/VCardProperty;Lezvcard/VCard;)Lorg/w3c/dom/Element;

    move-result-object v9

    .line 569
    .local v9, "propertyElement":Lorg/w3c/dom/Element;
    invoke-interface {v6, v9}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;
    :try_end_67
    .catch Lezvcard/io/SkipMeException; {:try_start_60 .. :try_end_67} :catch_68
    .catch Lezvcard/io/EmbeddedVCardException; {:try_start_60 .. :try_end_67} :catch_ae

    goto :goto_54

    .line 570
    .end local v9    # "propertyElement":Lorg/w3c/dom/Element;
    :catch_68
    move-exception v11

    goto :goto_54

    .line 563
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "parent":Lorg/w3c/dom/Element;
    .end local v8    # "property":Lezvcard/property/VCardProperty;
    :cond_6a
    move-object v6, v10

    .restart local v6    # "parent":Lorg/w3c/dom/Element;
    goto :goto_4a

    .line 578
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lezvcard/property/VCardProperty;>;>;"
    .end local v3    # "groupName":Ljava/lang/String;
    .end local v6    # "parent":Lorg/w3c/dom/Element;
    :cond_6c
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v11}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v11

    if-nez v11, :cond_9a

    .line 579
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    sget-object v12, Lezvcard/io/xml/XCardQNames;->VCARDS:Ljavax/xml/namespace/QName;

    invoke-direct {p0, v12}, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->createElement(Ljavax/xml/namespace/QName;)Lorg/w3c/dom/Element;

    move-result-object v12

    # setter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v11, v12}, Lezvcard/io/xml/XCardDocument;->access$102(Lezvcard/io/xml/XCardDocument;Lorg/w3c/dom/Element;)Lorg/w3c/dom/Element;

    .line 580
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;
    invoke-static {v11}, Lezvcard/io/xml/XCardDocument;->access$300(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Document;

    move-result-object v11

    invoke-static {v11}, Lezvcard/util/XmlUtils;->getRootElement(Lorg/w3c/dom/Document;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 581
    .local v0, "documentRoot":Lorg/w3c/dom/Element;
    if-nez v0, :cond_a4

    .line 582
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->document:Lorg/w3c/dom/Document;
    invoke-static {v11}, Lezvcard/io/xml/XCardDocument;->access$300(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Document;

    move-result-object v11

    iget-object v12, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v12}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v12

    invoke-interface {v11, v12}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 587
    .end local v0    # "documentRoot":Lorg/w3c/dom/Element;
    :cond_9a
    :goto_9a
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v11}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v11

    invoke-interface {v11, v10}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 588
    return-void

    .line 584
    .restart local v0    # "documentRoot":Lorg/w3c/dom/Element;
    :cond_a4
    iget-object v11, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->this$0:Lezvcard/io/xml/XCardDocument;

    # getter for: Lezvcard/io/xml/XCardDocument;->root:Lorg/w3c/dom/Element;
    invoke-static {v11}, Lezvcard/io/xml/XCardDocument;->access$100(Lezvcard/io/xml/XCardDocument;)Lorg/w3c/dom/Element;

    move-result-object v11

    invoke-interface {v0, v11}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    goto :goto_9a

    .line 572
    .end local v0    # "documentRoot":Lorg/w3c/dom/Element;
    .restart local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Lezvcard/property/VCardProperty;>;>;"
    .restart local v3    # "groupName":Ljava/lang/String;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "parent":Lorg/w3c/dom/Element;
    .restart local v8    # "property":Lezvcard/property/VCardProperty;
    :catch_ae
    move-exception v11

    goto :goto_54
.end method

.method public close()V
    .registers 1

    .prologue
    .line 612
    return-void
.end method

.method protected getTargetVersion()Lezvcard/VCardVersion;
    .registers 2

    .prologue
    .line 592
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    return-object v0
.end method

.method public registerParameterDataType(Ljava/lang/String;Lezvcard/VCardDataType;)V
    .registers 4
    .param p1, "parameterName"    # Ljava/lang/String;
    .param p2, "dataType"    # Lezvcard/VCardDataType;

    .prologue
    .line 602
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 603
    if-nez p2, :cond_c

    .line 604
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 608
    :goto_b
    return-void

    .line 606
    :cond_c
    iget-object v0, p0, Lezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter;->parameterDataTypes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method

.method public write(Lezvcard/VCard;)V
    .registers 3
    .param p1, "vcard"    # Lezvcard/VCard;

    .prologue
    .line 539
    :try_start_0
    invoke-super {p0, p1}, Lezvcard/io/StreamWriter;->write(Lezvcard/VCard;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 543
    :goto_3
    return-void

    .line 540
    :catch_4
    move-exception v0

    goto :goto_3
.end method
