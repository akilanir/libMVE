.class public Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/util/Map",
        "<",
        "Lorg/dmfs/xmlobjects/ElementDescriptor",
        "<*>;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_INITIAL_CAPACITY:I = 0x10

.field public static final INSTANCE:Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;


# instance fields
.field private final mInitialCapacity:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->INSTANCE:Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    const/16 v0, 0x10

    iput v0, p0, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->mInitialCapacity:I

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput p1, p0, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->mInitialCapacity:I

    return-void
.end method


# virtual methods
.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/util/Map;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    if-eqz p2, :cond_6

    invoke-interface {p2}, Ljava/util/Map;->clear()V

    :goto_5
    return-object p2

    :cond_6
    new-instance p2, Ljava/util/HashMap;

    iget v0, p0, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->mInitialCapacity:I

    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(I)V

    goto :goto_5
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Ljava/util/Map;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p3, :cond_5

    invoke-interface {p2, p3, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-object p2
.end method

.method public bridge synthetic writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Ljava/util/Map;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/ElementMapObjectBuilder;->writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    return-void
.end method

.method public writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;>;",
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;",
            "Ljava/lang/Object;",
            ">;",
            "Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;",
            "Lorg/dmfs/xmlobjects/serializer/SerializerContext;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p2, :cond_24

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p3, v1, v0, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_a

    :cond_24
    return-void
.end method
