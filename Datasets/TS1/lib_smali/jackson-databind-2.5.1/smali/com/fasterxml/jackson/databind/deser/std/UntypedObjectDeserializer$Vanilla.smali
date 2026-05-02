.class public Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;
.super Lcom/fasterxml/jackson/databind/deser/std/StdDeserializer;
.source "UntypedObjectDeserializer.java"


# annotations
.annotation runtime Lcom/fasterxml/jackson/databind/annotation/JacksonStdImpl;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Vanilla"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/fasterxml/jackson/databind/deser/std/StdDeserializer",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L

.field public static final std:Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 424
    new-instance v0, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;

    invoke-direct {v0}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;-><init>()V

    sput-object v0, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->std:Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 426
    const-class v0, Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/fasterxml/jackson/databind/deser/std/StdDeserializer;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 6
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x2

    .line 431
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentTokenId()I

    move-result v1

    packed-switch v1, :pswitch_data_88

    .line 483
    :pswitch_8
    const-class v1, Ljava/lang/Object;

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v1

    throw v1

    .line 434
    :pswitch_f
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 435
    .local v0, "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_1d

    .line 436
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1, v2}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 478
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :goto_1c
    return-object v1

    .line 440
    :cond_1d
    :pswitch_1d
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->mapObject(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1c

    .line 443
    :pswitch_22
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 444
    .restart local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_3b

    .line 445
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_JAVA_ARRAY_FOR_JSON_ARRAY:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 446
    sget-object v1, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer;->NO_OBJECTS:[Ljava/lang/Object;

    goto :goto_1c

    .line 448
    :cond_35
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    goto :goto_1c

    .line 451
    :cond_3b
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_JAVA_ARRAY_FOR_JSON_ARRAY:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 452
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->mapArrayToArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)[Ljava/lang/Object;

    move-result-object v1

    goto :goto_1c

    .line 454
    :cond_48
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->mapArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_1c

    .line 456
    .end local v0    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :pswitch_4d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getEmbeddedObject()Ljava/lang/Object;

    move-result-object v1

    goto :goto_1c

    .line 458
    :pswitch_52
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1c

    .line 461
    :pswitch_57
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_BIG_INTEGER_FOR_INTS:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_64

    .line 462
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getBigIntegerValue()Ljava/math/BigInteger;

    move-result-object v1

    goto :goto_1c

    .line 464
    :cond_64
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getNumberValue()Ljava/lang/Number;

    move-result-object v1

    goto :goto_1c

    .line 467
    :pswitch_69
    sget-object v1, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_BIG_DECIMAL_FOR_FLOATS:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v1

    if-eqz v1, :cond_76

    .line 468
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getDecimalValue()Ljava/math/BigDecimal;

    move-result-object v1

    goto :goto_1c

    .line 470
    :cond_76
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getDoubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    goto :goto_1c

    .line 473
    :pswitch_7f
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_1c

    .line 475
    :pswitch_82
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_1c

    .line 478
    :pswitch_85
    const/4 v1, 0x0

    goto :goto_1c

    .line 431
    nop

    :pswitch_data_88
    .packed-switch 0x1
        :pswitch_f
        :pswitch_8
        :pswitch_22
        :pswitch_8
        :pswitch_1d
        :pswitch_52
        :pswitch_57
        :pswitch_69
        :pswitch_7f
        :pswitch_82
        :pswitch_85
        :pswitch_4d
    .end packed-switch
.end method

.method public deserializeWithType(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;)Ljava/lang/Object;
    .registers 6
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p3, "typeDeserializer"    # Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 490
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentTokenId()I

    move-result v0

    packed-switch v0, :pswitch_data_4e

    .line 521
    :pswitch_7
    const-class v0, Ljava/lang/Object;

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->mappingException(Ljava/lang/Class;)Lcom/fasterxml/jackson/databind/JsonMappingException;

    move-result-object v0

    throw v0

    .line 494
    :pswitch_e
    invoke-virtual {p3, p1, p2}, Lcom/fasterxml/jackson/databind/jsontype/TypeDeserializer;->deserializeTypedFromAny(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 519
    :goto_12
    return-object v0

    .line 497
    :pswitch_13
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_12

    .line 500
    :pswitch_18
    sget-object v0, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_BIG_INTEGER_FOR_INTS:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 501
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getBigIntegerValue()Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_12

    .line 503
    :cond_25
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getNumberValue()Ljava/lang/Number;

    move-result-object v0

    goto :goto_12

    .line 506
    :pswitch_2a
    sget-object v0, Lcom/fasterxml/jackson/databind/DeserializationFeature;->USE_BIG_DECIMAL_FOR_FLOATS:Lcom/fasterxml/jackson/databind/DeserializationFeature;

    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/databind/DeserializationContext;->isEnabled(Lcom/fasterxml/jackson/databind/DeserializationFeature;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 507
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getDecimalValue()Ljava/math/BigDecimal;

    move-result-object v0

    goto :goto_12

    .line 509
    :cond_37
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getDoubleValue()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_12

    .line 512
    :pswitch_40
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_12

    .line 514
    :pswitch_43
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_12

    .line 516
    :pswitch_46
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getEmbeddedObject()Ljava/lang/Object;

    move-result-object v0

    goto :goto_12

    .line 519
    :pswitch_4b
    const/4 v0, 0x0

    goto :goto_12

    .line 490
    nop

    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_e
        :pswitch_7
        :pswitch_e
        :pswitch_7
        :pswitch_e
        :pswitch_13
        :pswitch_18
        :pswitch_2a
        :pswitch_40
        :pswitch_43
        :pswitch_4b
        :pswitch_46
    .end packed-switch
.end method

.method protected mapArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 15
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x2

    .line 527
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v6

    .line 528
    .local v6, "value":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v9, v10, :cond_16

    .line 529
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 530
    .local v1, "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 558
    .end local v1    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :goto_15
    return-object v1

    .line 533
    :cond_16
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v7

    .line 534
    .local v7, "value2":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v9, v10, :cond_2e

    .line 535
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 536
    .restart local v1    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 537
    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    .line 540
    .end local v1    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_2e
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->leaseObjectBuffer()Lcom/fasterxml/jackson/databind/util/ObjectBuffer;

    move-result-object v0

    .line 541
    .local v0, "buffer":Lcom/fasterxml/jackson/databind/util/ObjectBuffer;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->resetAndStart()[Ljava/lang/Object;

    move-result-object v8

    .line 542
    .local v8, "values":[Ljava/lang/Object;
    const/4 v2, 0x0

    .line 543
    .local v2, "ptr":I
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .local v3, "ptr":I
    aput-object v6, v8, v2

    .line 544
    add-int/lit8 v2, v3, 0x1

    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    aput-object v7, v8, v3

    .line 545
    move v5, v2

    .line 547
    .local v5, "totalSize":I
    :goto_40
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v6

    .line 548
    add-int/lit8 v5, v5, 0x1

    .line 549
    array-length v9, v8

    if-lt v2, v9, :cond_4e

    .line 550
    invoke-virtual {v0, v8}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->appendCompletedChunk([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    .line 551
    const/4 v2, 0x0

    .line 553
    :cond_4e
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "ptr":I
    .restart local v3    # "ptr":I
    aput-object v6, v8, v2

    .line 554
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    sget-object v10, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v9, v10, :cond_64

    .line 556
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 557
    .local v4, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    invoke-virtual {v0, v8, v3, v4}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->completeAndClearBuffer([Ljava/lang/Object;ILjava/util/List;)V

    move-object v1, v4

    .line 558
    goto :goto_15

    .end local v4    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    :cond_64
    move v2, v3

    .end local v3    # "ptr":I
    .restart local v2    # "ptr":I
    goto :goto_40
.end method

.method protected mapArrayToArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)[Ljava/lang/Object;
    .registers 10
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 600
    invoke-virtual {p2}, Lcom/fasterxml/jackson/databind/DeserializationContext;->leaseObjectBuffer()Lcom/fasterxml/jackson/databind/util/ObjectBuffer;

    move-result-object v0

    .line 601
    .local v0, "buffer":Lcom/fasterxml/jackson/databind/util/ObjectBuffer;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->resetAndStart()[Ljava/lang/Object;

    move-result-object v4

    .line 602
    .local v4, "values":[Ljava/lang/Object;
    const/4 v1, 0x0

    .line 604
    .local v1, "ptr":I
    :goto_9
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v3

    .line 605
    .local v3, "value":Ljava/lang/Object;
    array-length v5, v4

    if-lt v1, v5, :cond_15

    .line 606
    invoke-virtual {v0, v4}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->appendCompletedChunk([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .line 607
    const/4 v1, 0x0

    .line 609
    :cond_15
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "ptr":I
    .local v2, "ptr":I
    aput-object v3, v4, v1

    .line 610
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v5, v6, :cond_26

    .line 611
    invoke-virtual {v0, v4, v2}, Lcom/fasterxml/jackson/databind/util/ObjectBuffer;->completeAndClearBuffer([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    return-object v5

    :cond_26
    move v1, v2

    .end local v2    # "ptr":I
    .restart local v1    # "ptr":I
    goto :goto_9
.end method

.method protected mapObject(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;
    .registers 11
    .param p1, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p2, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 567
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 568
    .local v0, "field1":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 569
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v4

    .line 570
    .local v4, "value1":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v6, v7, :cond_1d

    .line 571
    new-instance v3, Ljava/util/LinkedHashMap;

    const/4 v6, 0x2

    invoke-direct {v3, v6}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 572
    .local v3, "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3, v0, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 593
    :goto_1c
    return-object v3

    .line 575
    .end local v3    # "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1d
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 576
    .local v1, "field2":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 577
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v5

    .line 578
    .local v5, "value2":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v6, v7, :cond_3d

    .line 579
    new-instance v3, Ljava/util/LinkedHashMap;

    const/4 v6, 0x4

    invoke-direct {v3, v6}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 580
    .restart local v3    # "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3, v0, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    invoke-virtual {v3, v1, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c

    .line 585
    .end local v3    # "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3d
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    .line 586
    .restart local v3    # "result":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v3, v0, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    invoke-virtual {v3, v1, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 589
    :cond_48
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    .line 590
    .local v2, "fieldName":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 591
    invoke-virtual {p0, p1, p2}, Lcom/fasterxml/jackson/databind/deser/std/UntypedObjectDeserializer$Vanilla;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v2, v6}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 592
    invoke-virtual {p1}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v6, v7, :cond_48

    goto :goto_1c
.end method
