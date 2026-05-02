.class public Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/util/List",
        "<TT;>;>;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INITIAL_CAPACITY:I = 0x10


# instance fields
.field private final mInitialCapacity:I

.field private final mListElementBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final mStoreNull:Z


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;)V"
        }
    .end annotation

    const/16 v0, 0x10

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/ElementDescriptor;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/ElementDescriptor;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;I)V"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/ElementDescriptor;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/ElementDescriptor;IZ)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;IZ)V"
        }
    .end annotation

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iput p2, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mInitialCapacity:I

    iput-boolean p3, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mStoreNull:Z

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/ElementDescriptor;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;Z)V"
        }
    .end annotation

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0, p2}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/ElementDescriptor;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;)V"
        }
    .end annotation

    const/16 v0, 0x10

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;I)V"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;IZ)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;IZ)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;IZ)V"
        }
    .end annotation

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iput p2, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mInitialCapacity:I

    iput-boolean p3, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mStoreNull:Z

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/builder/IObjectBuilder",
            "<TT;>;Z)V"
        }
    .end annotation

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0, p2}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;-><init>(Lorg/dmfs/xmlobjects/builder/IObjectBuilder;IZ)V

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

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/List",
            "<TT;>;>;",
            "Ljava/util/List",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    if-eqz p2, :cond_6

    invoke-interface {p2}, Ljava/util/List;->clear()V

    :goto_5
    return-object p2

    :cond_6
    new-instance p2, Ljava/util/ArrayList;

    iget v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mInitialCapacity:I

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

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

    check-cast v2, Ljava/util/List;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/List",
            "<TT;>;>;",
            "Ljava/util/List",
            "<TT;>;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-eq p3, v0, :cond_10

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_19

    if-eqz p3, :cond_19

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementBuilder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iget-object v1, p3, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    if-ne v0, v1, :cond_19

    :cond_10
    if-nez p4, :cond_16

    iget-boolean v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mStoreNull:Z

    if-eqz v0, :cond_19

    :cond_16
    invoke-interface {p2, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_19
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

    check-cast p2, Ljava/util/List;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    return-void
.end method

.method public writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/util/List;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/util/List",
            "<TT;>;>;",
            "Ljava/util/List",
            "<TT;>;",
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

    if-eqz p2, :cond_2d

    invoke-virtual {p4}, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->getXmlContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-nez v0, :cond_27

    instance-of v0, v1, Lorg/dmfs/xmlobjects/QualifiedName;

    if-eqz v0, :cond_27

    move-object v0, v1

    check-cast v0, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-static {v0, p1, v2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    invoke-interface {p3, v0, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_a

    :cond_27
    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/ListObjectBuilder;->mListElementDescriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    invoke-interface {p3, v0, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_a

    :cond_2d
    return-void
.end method
