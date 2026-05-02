.class public Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/util/Map",
        "<TT;TV;>;>;"
    }
.end annotation


# static fields
.field public static final DEFAULT_INITIAL_MAP_SIZE:I = 0x10


# instance fields
.field private final mChildElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;"
        }
    .end annotation
.end field

.field private final mInitialMapSize:I

.field private final mMapper:Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper",
            "<TT;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper",
            "<TT;TV;>;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;)V"
        }
    .end annotation

    const/16 v0, 0x10

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;Lorg/dmfs/xmlobjects/ElementDescriptor;I)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;Lorg/dmfs/xmlobjects/ElementDescriptor;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper",
            "<TT;TV;>;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mMapper:Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;

    iput-object p2, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mChildElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    iput p3, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mInitialMapSize:I

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

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;

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
            "<TT;TV;>;>;",
            "Ljava/util/Map",
            "<TT;TV;>;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/Map",
            "<TT;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p2, :cond_6

    invoke-interface {p2}, Ljava/util/Map;->clear()V

    :goto_5
    return-object p2

    :cond_6
    new-instance p2, Ljava/util/HashMap;

    iget v0, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mInitialMapSize:I

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

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/Map;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<W:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/Map",
            "<TT;TV;>;>;",
            "Ljava/util/Map",
            "<TT;TV;>;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TW;>;TW;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/Map",
            "<TT;TV;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mChildElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_11

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mMapper:Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;

    iget-object v1, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mChildElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-interface {v0, v1, p4}, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder$Mapper;->getIndex(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-interface {p2, v0, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_11
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

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/Map;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

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
            "<TT;TV;>;>;",
            "Ljava/util/Map",
            "<TT;TV;>;",
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

    if-eqz p2, :cond_1a

    invoke-interface {p2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/xmlobjects/builder/MapObjectBuilder;->mChildElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-interface {p3, v2, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_a

    :cond_1a
    return-void
.end method
