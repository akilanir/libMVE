.class public Lcom/adobe/xmp/impl/XMPNormalizer;
.super Ljava/lang/Object;
.source "XMPNormalizer.java"


# static fields
.field private static dcArrayForms:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 0

    .prologue
    .line 40
    invoke-static {}, Lcom/adobe/xmp/impl/XMPNormalizer;->initDCArrays()V

    .line 41
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    return-void
.end method

.method private static compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V
    .registers 13
    .param p0, "aliasNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p1, "baseNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "outerCall"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xcb

    const/4 v8, 0x0

    .line 524
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1b

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v7

    if-eq v6, v7, :cond_23

    .line 527
    :cond_1b
    new-instance v6, Lcom/adobe/xmp/XMPException;

    const-string v7, "Mismatch between alias and base nodes"

    invoke-direct {v6, v7, v9}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 530
    :cond_23
    if-nez p2, :cond_53

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/adobe/xmp/options/PropertyOptions;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4b

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v6

    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getQualifierLength()I

    move-result v7

    if-eq v6, v7, :cond_53

    .line 537
    :cond_4b
    new-instance v6, Lcom/adobe/xmp/XMPException;

    const-string v7, "Mismatch between alias and base nodes"

    invoke-direct {v6, v7, v9}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v6

    .line 541
    :cond_53
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .line 542
    .local v2, "an":Ljava/util/Iterator;
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v5

    .line 543
    .local v5, "bn":Ljava/util/Iterator;
    :goto_5b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_77

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_77

    .line 545
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/impl/XMPNode;

    .line 546
    .local v0, "aliasChild":Lcom/adobe/xmp/impl/XMPNode;
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/xmp/impl/XMPNode;

    .line 547
    .local v3, "baseChild":Lcom/adobe/xmp/impl/XMPNode;
    invoke-static {v0, v3, v8}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    goto :goto_5b

    .line 551
    .end local v0    # "aliasChild":Lcom/adobe/xmp/impl/XMPNode;
    .end local v3    # "baseChild":Lcom/adobe/xmp/impl/XMPNode;
    :cond_77
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v2

    .line 552
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->iterateQualifier()Ljava/util/Iterator;

    move-result-object v5

    .line 553
    :goto_7f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9b

    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9b

    .line 555
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 556
    .local v1, "aliasQual":Lcom/adobe/xmp/impl/XMPNode;
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/xmp/impl/XMPNode;

    .line 557
    .local v4, "baseQual":Lcom/adobe/xmp/impl/XMPNode;
    invoke-static {v1, v4, v8}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    goto :goto_7f

    .line 559
    .end local v1    # "aliasQual":Lcom/adobe/xmp/impl/XMPNode;
    .end local v4    # "baseQual":Lcom/adobe/xmp/impl/XMPNode;
    :cond_9b
    return-void
.end method

.method private static deleteEmptySchemas(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 4
    .param p0, "tree"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 500
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 502
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 503
    .local v1, "schema":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v2

    if-nez v2, :cond_4

    .line 505
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_4

    .line 508
    .end local v1    # "schema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_1a
    return-void
.end method

.method private static fixGPSTimeStamp(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 9
    .param p0, "exifSchema"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 448
    const-string v6, "exif:GPSTimeStamp"

    invoke-static {p0, v6, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    .line 449
    .local v4, "gpsDateTime":Lcom/adobe/xmp/impl/XMPNode;
    if-nez v4, :cond_a

    .line 487
    :cond_9
    :goto_9
    return-void

    .line 459
    :cond_a
    :try_start_a
    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object v0

    .line 460
    .local v0, "binGPSStamp":Lcom/adobe/xmp/XMPDateTime;
    invoke-interface {v0}, Lcom/adobe/xmp/XMPDateTime;->getYear()I

    move-result v6

    if-nez v6, :cond_9

    invoke-interface {v0}, Lcom/adobe/xmp/XMPDateTime;->getMonth()I

    move-result v6

    if-nez v6, :cond_9

    invoke-interface {v0}, Lcom/adobe/xmp/XMPDateTime;->getDay()I

    move-result v6

    if-nez v6, :cond_9

    .line 467
    const-string v6, "exif:DateTimeOriginal"

    const/4 v7, 0x0

    invoke-static {p0, v6, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 469
    .local v5, "otherDate":Lcom/adobe/xmp/impl/XMPNode;
    if-nez v5, :cond_34

    .line 471
    const-string v6, "exif:DateTimeDigitized"

    const/4 v7, 0x0

    invoke-static {p0, v6, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 474
    :cond_34
    invoke-virtual {v5}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/adobe/xmp/XMPUtils;->convertToDate(Ljava/lang/String;)Lcom/adobe/xmp/XMPDateTime;

    move-result-object v1

    .line 475
    .local v1, "binOtherDate":Lcom/adobe/xmp/XMPDateTime;
    invoke-interface {v0}, Lcom/adobe/xmp/XMPDateTime;->getCalendar()Ljava/util/Calendar;

    move-result-object v2

    .line 476
    .local v2, "cal":Ljava/util/Calendar;
    const/4 v6, 0x1

    invoke-interface {v1}, Lcom/adobe/xmp/XMPDateTime;->getYear()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->set(II)V

    .line 477
    const/4 v6, 0x2

    invoke-interface {v1}, Lcom/adobe/xmp/XMPDateTime;->getMonth()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->set(II)V

    .line 478
    const/4 v6, 0x5

    invoke-interface {v1}, Lcom/adobe/xmp/XMPDateTime;->getDay()I

    move-result v7

    invoke-virtual {v2, v6, v7}, Ljava/util/Calendar;->set(II)V

    .line 479
    new-instance v0, Lcom/adobe/xmp/impl/XMPDateTimeImpl;

    .end local v0    # "binGPSStamp":Lcom/adobe/xmp/XMPDateTime;
    invoke-direct {v0, v2}, Lcom/adobe/xmp/impl/XMPDateTimeImpl;-><init>(Ljava/util/Calendar;)V

    .line 480
    .restart local v0    # "binGPSStamp":Lcom/adobe/xmp/XMPDateTime;
    invoke-static {v0}, Lcom/adobe/xmp/XMPUtils;->convertFromDate(Lcom/adobe/xmp/XMPDateTime;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V
    :try_end_64
    .catch Lcom/adobe/xmp/XMPException; {:try_start_a .. :try_end_64} :catch_65

    goto :goto_9

    .line 482
    .end local v0    # "binGPSStamp":Lcom/adobe/xmp/XMPDateTime;
    .end local v1    # "binOtherDate":Lcom/adobe/xmp/XMPDateTime;
    .end local v2    # "cal":Ljava/util/Calendar;
    .end local v5    # "otherDate":Lcom/adobe/xmp/impl/XMPNode;
    :catch_65
    move-exception v3

    .line 485
    .local v3, "e":Lcom/adobe/xmp/XMPException;
    goto :goto_9
.end method

.method private static initDCArrays()V
    .registers 6

    .prologue
    const/4 v5, 0x1

    .line 666
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    sput-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    .line 669
    new-instance v1, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v1}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .line 670
    .local v1, "bagForm":Lcom/adobe/xmp/options/PropertyOptions;
    invoke-virtual {v1, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 671
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:contributor"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:language"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 673
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:publisher"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 674
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:relation"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 675
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:subject"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 676
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:type"

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    new-instance v2, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v2}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .line 680
    .local v2, "seqForm":Lcom/adobe/xmp/options/PropertyOptions;
    invoke-virtual {v2, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 681
    invoke-virtual {v2, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 682
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:creator"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 683
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:date"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 686
    new-instance v0, Lcom/adobe/xmp/options/PropertyOptions;

    invoke-direct {v0}, Lcom/adobe/xmp/options/PropertyOptions;-><init>()V

    .line 687
    .local v0, "altTextForm":Lcom/adobe/xmp/options/PropertyOptions;
    invoke-virtual {v0, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArray(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 688
    invoke-virtual {v0, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 689
    invoke-virtual {v0, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 690
    invoke-virtual {v0, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 691
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:description"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 692
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:rights"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    sget-object v3, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    const-string v4, "dc:title"

    invoke-interface {v3, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 694
    return-void
.end method

.method private static migrateAudioCopyright(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 23
    .param p0, "xmp"    # Lcom/adobe/xmp/XMPMeta;
    .param p1, "dmCopyright"    # Lcom/adobe/xmp/impl/XMPNode;

    .prologue
    .line 594
    :try_start_0
    move-object/from16 v0, p0

    check-cast v0, Lcom/adobe/xmp/impl/XMPMetaImpl;

    move-object v1, v0

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    const-string v2, "http://purl.org/dc/elements/1.1/"

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v15

    .line 597
    .local v15, "dcSchema":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v6

    .line 598
    .local v6, "dmValue":Ljava/lang/String;
    const-string v18, "\n\n"

    .line 600
    .local v18, "doubleLF":Ljava/lang/String;
    const-string v1, "dc:rights"

    const/4 v2, 0x0

    invoke-static {v15, v1, v2}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v14

    .line 602
    .local v14, "dcRightsArray":Lcom/adobe/xmp/impl/XMPNode;
    if-eqz v14, :cond_25

    invoke-virtual {v14}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v1

    if-nez v1, :cond_50

    .line 605
    :cond_25
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 606
    const-string v2, "http://purl.org/dc/elements/1.1/"

    const-string v3, "rights"

    const-string v4, ""

    const-string v5, "x-default"

    const/4 v7, 0x0

    move-object/from16 v1, p0

    invoke-interface/range {v1 .. v7}, Lcom/adobe/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 650
    :cond_46
    :goto_46
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/xmp/impl/XMPNode;->getParent()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->removeChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 657
    .end local v6    # "dmValue":Ljava/lang/String;
    .end local v14    # "dcRightsArray":Lcom/adobe/xmp/impl/XMPNode;
    .end local v15    # "dcSchema":Lcom/adobe/xmp/impl/XMPNode;
    .end local v18    # "doubleLF":Ljava/lang/String;
    :goto_4f
    return-void

    .line 611
    .restart local v6    # "dmValue":Ljava/lang/String;
    .restart local v14    # "dcRightsArray":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v15    # "dcSchema":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v18    # "doubleLF":Ljava/lang/String;
    :cond_50
    const-string v1, "x-default"

    invoke-static {v14, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v20

    .line 613
    .local v20, "xdIndex":I
    if-gez v20, :cond_75

    .line 616
    const/4 v1, 0x1

    invoke-virtual {v14, v1}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v12

    .line 617
    .local v12, "firstValue":Ljava/lang/String;
    const-string v8, "http://purl.org/dc/elements/1.1/"

    const-string v9, "rights"

    const-string v10, ""

    const-string v11, "x-default"

    const/4 v13, 0x0

    move-object/from16 v7, p0

    invoke-interface/range {v7 .. v13}, Lcom/adobe/xmp/XMPMeta;->setLocalizedText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 619
    const-string v1, "x-default"

    invoke-static {v14, v1}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v20

    .line 623
    .end local v12    # "firstValue":Ljava/lang/String;
    :cond_75
    move/from16 v0, v20

    invoke-virtual {v14, v0}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v16

    .line 624
    .local v16, "defaultNode":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v17

    .line 625
    .local v17, "defaultValue":Ljava/lang/String;
    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v19

    .line 627
    .local v19, "lfPos":I
    if-gez v19, :cond_ae

    .line 630
    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_46

    .line 634
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, v18

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    goto :goto_46

    .line 652
    .end local v6    # "dmValue":Ljava/lang/String;
    .end local v14    # "dcRightsArray":Lcom/adobe/xmp/impl/XMPNode;
    .end local v15    # "dcSchema":Lcom/adobe/xmp/impl/XMPNode;
    .end local v16    # "defaultNode":Lcom/adobe/xmp/impl/XMPNode;
    .end local v17    # "defaultValue":Ljava/lang/String;
    .end local v18    # "doubleLF":Ljava/lang/String;
    .end local v19    # "lfPos":I
    .end local v20    # "xdIndex":I
    :catch_ac
    move-exception v1

    goto :goto_4f

    .line 640
    .restart local v6    # "dmValue":Ljava/lang/String;
    .restart local v14    # "dcRightsArray":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v15    # "dcSchema":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v16    # "defaultNode":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v17    # "defaultValue":Ljava/lang/String;
    .restart local v18    # "doubleLF":Ljava/lang/String;
    .restart local v19    # "lfPos":I
    .restart local v20    # "xdIndex":I
    :cond_ae
    add-int/lit8 v1, v19, 0x2

    move-object/from16 v0, v17

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_46

    .line 643
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    add-int/lit8 v3, v19, 0x2

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V
    :try_end_db
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_db} :catch_ac

    goto/16 :goto_46
.end method

.method private static moveExplicitAliases(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/options/ParseOptions;)V
    .registers 16
    .param p0, "tree"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p1, "options"    # Lcom/adobe/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 293
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getHasAliases()Z

    move-result v11

    if-nez v11, :cond_7

    .line 407
    :cond_6
    return-void

    .line 297
    :cond_7
    const/4 v11, 0x0

    invoke-virtual {p0, v11}, Lcom/adobe/xmp/impl/XMPNode;->setHasAliases(Z)V

    .line 299
    invoke-virtual {p1}, Lcom/adobe/xmp/options/ParseOptions;->getStrictAliasing()Z

    move-result v9

    .line 301
    .local v9, "strictAliasing":Z
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getUnmodifiableChildren()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "schemaIt":Ljava/util/Iterator;
    :cond_17
    :goto_17
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_6

    .line 303
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/xmp/impl/XMPNode;

    .line 304
    .local v3, "currSchema":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->getHasAliases()Z

    move-result v11

    if-eqz v11, :cond_17

    .line 309
    invoke-virtual {v3}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "propertyIt":Ljava/util/Iterator;
    :cond_2d
    :goto_2d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_125

    .line 311
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/adobe/xmp/impl/XMPNode;

    .line 313
    .local v2, "currProp":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->isAlias()Z

    move-result v11

    if-eqz v11, :cond_2d

    .line 318
    const/4 v11, 0x0

    invoke-virtual {v2, v11}, Lcom/adobe/xmp/impl/XMPNode;->setAlias(Z)V

    .line 321
    invoke-static {}, Lcom/adobe/xmp/XMPMetaFactory;->getSchemaRegistry()Lcom/adobe/xmp/XMPSchemaRegistry;

    move-result-object v11

    invoke-virtual {v2}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Lcom/adobe/xmp/XMPSchemaRegistry;->findAlias(Ljava/lang/String;)Lcom/adobe/xmp/properties/XMPAliasInfo;

    move-result-object v4

    .line 323
    .local v4, "info":Lcom/adobe/xmp/properties/XMPAliasInfo;
    if-eqz v4, :cond_2d

    .line 326
    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getNamespace()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x1

    invoke-static {p0, v11, v12, v13}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    .line 328
    .local v1, "baseSchema":Lcom/adobe/xmp/impl/XMPNode;
    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Lcom/adobe/xmp/impl/XMPNode;->setImplicit(Z)V

    .line 330
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-static {v1, v11, v12}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    .line 333
    .local v0, "baseNode":Lcom/adobe/xmp/impl/XMPNode;
    if-nez v0, :cond_da

    .line 335
    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/xmp/options/AliasOptions;->isSimple()Z

    move-result v11

    if-eqz v11, :cond_ac

    .line 339
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 340
    .local v7, "qname":Ljava/lang/String;
    invoke-virtual {v2, v7}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 341
    invoke-virtual {v1, v2}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 343
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_2d

    .line 349
    .end local v7    # "qname":Ljava/lang/String;
    :cond_ac
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    .end local v0    # "baseNode":Lcom/adobe/xmp/impl/XMPNode;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPrefix()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getPropName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v12

    invoke-virtual {v12}, Lcom/adobe/xmp/options/AliasOptions;->toPropertyOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v12

    invoke-direct {v0, v11, v12}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 351
    .restart local v0    # "baseNode":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1, v0}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 352
    invoke-static {v6, v2, v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_2d

    .line 356
    :cond_da
    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/xmp/options/AliasOptions;->isSimple()Z

    move-result v11

    if-eqz v11, :cond_ef

    .line 361
    if-eqz v9, :cond_ea

    .line 363
    const/4 v11, 0x1

    invoke-static {v2, v0, v11}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    .line 366
    :cond_ea
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_2d

    .line 374
    :cond_ef
    const/4 v5, 0x0

    .line 375
    .local v5, "itemNode":Lcom/adobe/xmp/impl/XMPNode;
    invoke-interface {v4}, Lcom/adobe/xmp/properties/XMPAliasInfo;->getAliasForm()Lcom/adobe/xmp/options/AliasOptions;

    move-result-object v11

    invoke-virtual {v11}, Lcom/adobe/xmp/options/AliasOptions;->isArrayAltText()Z

    move-result v11

    if-eqz v11, :cond_10e

    .line 377
    const-string v11, "x-default"

    invoke-static {v0, v11}, Lcom/adobe/xmp/impl/XMPNodeUtils;->lookupLanguageItem(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;)I

    move-result v10

    .line 379
    .local v10, "xdIndex":I
    const/4 v11, -0x1

    if-eq v10, v11, :cond_107

    .line 381
    invoke-virtual {v0, v10}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    .line 389
    .end local v10    # "xdIndex":I
    :cond_107
    :goto_107
    if-nez v5, :cond_11a

    .line 391
    invoke-static {v6, v2, v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->transplantArrayItemAlias(Ljava/util/Iterator;Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;)V

    goto/16 :goto_2d

    .line 384
    :cond_10e
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->hasChildren()Z

    move-result v11

    if-eqz v11, :cond_107

    .line 386
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v5

    goto :goto_107

    .line 395
    :cond_11a
    if-eqz v9, :cond_120

    .line 397
    const/4 v11, 0x1

    invoke-static {v2, v5, v11}, Lcom/adobe/xmp/impl/XMPNormalizer;->compareAliasedSubtrees(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;Z)V

    .line 400
    :cond_120
    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_2d

    .line 405
    .end local v0    # "baseNode":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "baseSchema":Lcom/adobe/xmp/impl/XMPNode;
    .end local v2    # "currProp":Lcom/adobe/xmp/impl/XMPNode;
    .end local v4    # "info":Lcom/adobe/xmp/properties/XMPAliasInfo;
    .end local v5    # "itemNode":Lcom/adobe/xmp/impl/XMPNode;
    :cond_125
    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Lcom/adobe/xmp/impl/XMPNode;->setHasAliases(Z)V

    goto/16 :goto_17
.end method

.method private static normalizeDCArrays(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 9
    .param p0, "dcSchema"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 188
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_1
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getChildrenLength()I

    move-result v5

    if-gt v2, v5, :cond_73

    .line 190
    invoke-virtual {p0, v2}, Lcom/adobe/xmp/impl/XMPNode;->getChild(I)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v1

    .line 192
    .local v1, "currProp":Lcom/adobe/xmp/impl/XMPNode;
    sget-object v5, Lcom/adobe/xmp/impl/XMPNormalizer;->dcArrayForms:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/xmp/options/PropertyOptions;

    .line 193
    .local v0, "arrayForm":Lcom/adobe/xmp/options/PropertyOptions;
    if-nez v0, :cond_1c

    .line 188
    :cond_19
    :goto_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 197
    :cond_1c
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->isSimple()Z

    move-result v5

    if-eqz v5, :cond_58

    .line 201
    new-instance v3, Lcom/adobe/xmp/impl/XMPNode;

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5, v0}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 202
    .local v3, "newArray":Lcom/adobe/xmp/impl/XMPNode;
    const-string v5, "[]"

    invoke-virtual {v1, v5}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 203
    invoke-virtual {v3, v1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 204
    invoke-virtual {p0, v2, v3}, Lcom/adobe/xmp/impl/XMPNode;->replaceChild(ILcom/adobe/xmp/impl/XMPNode;)V

    .line 207
    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v5

    if-eqz v5, :cond_19

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v5

    if-nez v5, :cond_19

    .line 209
    new-instance v4, Lcom/adobe/xmp/impl/XMPNode;

    const-string v5, "xml:lang"

    const-string v6, "x-default"

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 210
    .local v4, "newLang":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1, v4}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_19

    .line 216
    .end local v3    # "newArray":Lcom/adobe/xmp/impl/XMPNode;
    .end local v4    # "newLang":Lcom/adobe/xmp/impl/XMPNode;
    :cond_58
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    const/16 v6, 0x1e00

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Lcom/adobe/xmp/options/PropertyOptions;->setOption(IZ)V

    .line 222
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/adobe/xmp/options/PropertyOptions;->mergeWith(Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 224
    invoke-virtual {v0}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v5

    if-eqz v5, :cond_19

    .line 227
    invoke-static {v1}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_19

    .line 232
    .end local v0    # "arrayForm":Lcom/adobe/xmp/options/PropertyOptions;
    .end local v1    # "currProp":Lcom/adobe/xmp/impl/XMPNode;
    :cond_73
    return-void
.end method

.method static process(Lcom/adobe/xmp/impl/XMPMetaImpl;Lcom/adobe/xmp/options/ParseOptions;)Lcom/adobe/xmp/XMPMeta;
    .registers 3
    .param p0, "xmp"    # Lcom/adobe/xmp/impl/XMPMetaImpl;
    .param p1, "options"    # Lcom/adobe/xmp/options/ParseOptions;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    .line 64
    .local v0, "tree":Lcom/adobe/xmp/impl/XMPNode;
    invoke-static {p0}, Lcom/adobe/xmp/impl/XMPNormalizer;->touchUpDataModel(Lcom/adobe/xmp/impl/XMPMetaImpl;)V

    .line 65
    invoke-static {v0, p1}, Lcom/adobe/xmp/impl/XMPNormalizer;->moveExplicitAliases(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/options/ParseOptions;)V

    .line 67
    invoke-static {v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->tweakOldXMP(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 69
    invoke-static {v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->deleteEmptySchemas(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 71
    return-object p0
.end method

.method private static repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 8
    .param p0, "arrayNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 244
    if-eqz p0, :cond_d

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/options/PropertyOptions;->isArray()Z

    move-result v4

    if-nez v4, :cond_e

    .line 278
    :cond_d
    return-void

    .line 252
    :cond_e
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayOrdered(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAlternate(Z)Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/adobe/xmp/options/PropertyOptions;->setArrayAltText(Z)Lcom/adobe/xmp/options/PropertyOptions;

    .line 254
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;
    :cond_21
    :goto_21
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 256
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 257
    .local v1, "currChild":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/options/PropertyOptions;->isCompositeProperty()Z

    move-result v4

    if-eqz v4, :cond_3b

    .line 260
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_21

    .line 262
    :cond_3b
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v4

    if-nez v4, :cond_21

    .line 264
    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 265
    .local v0, "childValue":Ljava/lang/String;
    if-eqz v0, :cond_51

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_55

    .line 268
    :cond_51
    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_21

    .line 273
    :cond_55
    new-instance v3, Lcom/adobe/xmp/impl/XMPNode;

    const-string v4, "xml:lang"

    const-string v5, "x-repair"

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 274
    .local v3, "repairLang":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {v1, v3}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_21
.end method

.method private static touchUpDataModel(Lcom/adobe/xmp/impl/XMPMetaImpl;)V
    .registers 9
    .param p0, "xmp"    # Lcom/adobe/xmp/impl/XMPMetaImpl;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 131
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    const-string v5, "http://purl.org/dc/elements/1.1/"

    const/4 v6, 0x1

    invoke-static {v4, v5, v6}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findSchemaNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    .line 134
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPMetaImpl;->getRoot()Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v4

    invoke-virtual {v4}, Lcom/adobe/xmp/impl/XMPNode;->iterateChildren()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;
    :cond_13
    :goto_13
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7a

    .line 136
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/xmp/impl/XMPNode;

    .line 137
    .local v1, "currSchema":Lcom/adobe/xmp/impl/XMPNode;
    const-string v4, "http://purl.org/dc/elements/1.1/"

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2f

    .line 139
    invoke-static {v1}, Lcom/adobe/xmp/impl/XMPNormalizer;->normalizeDCArrays(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_13

    .line 141
    :cond_2f
    const-string v4, "http://ns.adobe.com/exif/1.0/"

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4a

    .line 144
    invoke-static {v1}, Lcom/adobe/xmp/impl/XMPNormalizer;->fixGPSTimeStamp(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 145
    const-string v4, "exif:UserComment"

    invoke-static {v1, v4, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    .line 147
    .local v0, "arrayNode":Lcom/adobe/xmp/impl/XMPNode;
    if-eqz v0, :cond_13

    .line 149
    invoke-static {v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_13

    .line 152
    .end local v0    # "arrayNode":Lcom/adobe/xmp/impl/XMPNode;
    :cond_4a
    const-string v4, "http://ns.adobe.com/xmp/1.0/DynamicMedia/"

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_62

    .line 156
    const-string v4, "xmpDM:copyright"

    invoke-static {v1, v4, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v2

    .line 158
    .local v2, "dmCopyright":Lcom/adobe/xmp/impl/XMPNode;
    if-eqz v2, :cond_13

    .line 160
    invoke-static {p0, v2}, Lcom/adobe/xmp/impl/XMPNormalizer;->migrateAudioCopyright(Lcom/adobe/xmp/XMPMeta;Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_13

    .line 163
    .end local v2    # "dmCopyright":Lcom/adobe/xmp/impl/XMPNode;
    :cond_62
    const-string v4, "http://ns.adobe.com/xap/1.0/rights/"

    invoke-virtual {v1}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 165
    const-string v4, "xmpRights:UsageTerms"

    invoke-static {v1, v4, v7}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findChildNode(Lcom/adobe/xmp/impl/XMPNode;Ljava/lang/String;Z)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    .line 167
    .restart local v0    # "arrayNode":Lcom/adobe/xmp/impl/XMPNode;
    if-eqz v0, :cond_13

    .line 169
    invoke-static {v0}, Lcom/adobe/xmp/impl/XMPNormalizer;->repairAltText(Lcom/adobe/xmp/impl/XMPNode;)V

    goto :goto_13

    .line 173
    .end local v0    # "arrayNode":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "currSchema":Lcom/adobe/xmp/impl/XMPNode;
    :cond_7a
    return-void
.end method

.method private static transplantArrayItemAlias(Ljava/util/Iterator;Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 7
    .param p0, "propertyIt"    # Ljava/util/Iterator;
    .param p1, "childNode"    # Lcom/adobe/xmp/impl/XMPNode;
    .param p2, "baseArray"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    .line 420
    invoke-virtual {p2}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/xmp/options/PropertyOptions;->isArrayAltText()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 422
    invoke-virtual {p1}, Lcom/adobe/xmp/impl/XMPNode;->getOptions()Lcom/adobe/xmp/options/PropertyOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/xmp/options/PropertyOptions;->getHasLanguage()Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 424
    new-instance v1, Lcom/adobe/xmp/XMPException;

    const-string v2, "Alias to x-default already has a language qualifier"

    const/16 v3, 0xcb

    invoke-direct {v1, v2, v3}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v1

    .line 428
    :cond_1e
    new-instance v0, Lcom/adobe/xmp/impl/XMPNode;

    const-string v1, "xml:lang"

    const-string v2, "x-default"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/adobe/xmp/impl/XMPNode;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 429
    .local v0, "langQual":Lcom/adobe/xmp/impl/XMPNode;
    invoke-virtual {p1, v0}, Lcom/adobe/xmp/impl/XMPNode;->addQualifier(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 432
    .end local v0    # "langQual":Lcom/adobe/xmp/impl/XMPNode;
    :cond_2b
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 433
    const-string v1, "[]"

    invoke-virtual {p1, v1}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 434
    invoke-virtual {p2, p1}, Lcom/adobe/xmp/impl/XMPNode;->addChild(Lcom/adobe/xmp/impl/XMPNode;)V

    .line 435
    return-void
.end method

.method private static tweakOldXMP(Lcom/adobe/xmp/impl/XMPNode;)V
    .registers 7
    .param p0, "tree"    # Lcom/adobe/xmp/impl/XMPNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/xmp/XMPException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 90
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_5f

    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x24

    if-lt v3, v4, :cond_5f

    .line 92
    invoke-virtual {p0}, Lcom/adobe/xmp/impl/XMPNode;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "nameStr":Ljava/lang/String;
    const-string v3, "uuid:"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 95
    const/4 v3, 0x5

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 98
    :cond_28
    invoke-static {v1}, Lcom/adobe/xmp/impl/Utils;->checkUUIDFormat(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 101
    const-string v3, "http://ns.adobe.com/xap/1.0/mm/"

    const-string v4, "InstanceID"

    invoke-static {v3, v4}, Lcom/adobe/xmp/impl/xpath/XMPPathParser;->expandXPath(Ljava/lang/String;Ljava/lang/String;)Lcom/adobe/xmp/impl/xpath/XMPPath;

    move-result-object v2

    .line 102
    .local v2, "path":Lcom/adobe/xmp/impl/xpath/XMPPath;
    const/4 v3, 0x1

    invoke-static {p0, v2, v3, v5}, Lcom/adobe/xmp/impl/XMPNodeUtils;->findNode(Lcom/adobe/xmp/impl/XMPNode;Lcom/adobe/xmp/impl/xpath/XMPPath;ZLcom/adobe/xmp/options/PropertyOptions;)Lcom/adobe/xmp/impl/XMPNode;

    move-result-object v0

    .line 103
    .local v0, "idNode":Lcom/adobe/xmp/impl/XMPNode;
    if-eqz v0, :cond_60

    .line 105
    invoke-virtual {v0, v5}, Lcom/adobe/xmp/impl/XMPNode;->setOptions(Lcom/adobe/xmp/options/PropertyOptions;)V

    .line 106
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uuid:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/adobe/xmp/impl/XMPNode;->setValue(Ljava/lang/String;)V

    .line 107
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->removeChildren()V

    .line 108
    invoke-virtual {v0}, Lcom/adobe/xmp/impl/XMPNode;->removeQualifiers()V

    .line 109
    invoke-virtual {p0, v5}, Lcom/adobe/xmp/impl/XMPNode;->setName(Ljava/lang/String;)V

    .line 118
    .end local v0    # "idNode":Lcom/adobe/xmp/impl/XMPNode;
    .end local v1    # "nameStr":Ljava/lang/String;
    .end local v2    # "path":Lcom/adobe/xmp/impl/xpath/XMPPath;
    :cond_5f
    return-void

    .line 113
    .restart local v0    # "idNode":Lcom/adobe/xmp/impl/XMPNode;
    .restart local v1    # "nameStr":Ljava/lang/String;
    .restart local v2    # "path":Lcom/adobe/xmp/impl/xpath/XMPPath;
    :cond_60
    new-instance v3, Lcom/adobe/xmp/XMPException;

    const-string v4, "Failure creating xmpMM:InstanceID"

    const/16 v5, 0x9

    invoke-direct {v3, v4, v5}, Lcom/adobe/xmp/XMPException;-><init>(Ljava/lang/String;I)V

    throw v3
.end method
