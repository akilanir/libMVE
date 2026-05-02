.class public Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final mChildBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    return-void
.end method


# virtual methods
.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-eq p3, v0, :cond_10

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_11

    if-eqz p3, :cond_11

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iget-object v1, p3, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    if-ne v0, v1, :cond_11

    :cond_10
    move-object p2, p4

    :cond_11
    return-object p2
.end method

.method public writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
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

    if-eqz p2, :cond_18

    invoke-virtual {p4}, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->getXmlContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v1

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_19

    instance-of v0, p2, Lorg/dmfs/xmlobjects/QualifiedName;

    if-eqz v0, :cond_19

    move-object v0, p2

    check-cast v0, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-static {v0, p1, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    invoke-interface {p3, v0, p2, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    :cond_18
    :goto_18
    return-void

    :cond_19
    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/TransientObjectBuilder;->mChildDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-interface {p3, v0, p2, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_18
.end method
