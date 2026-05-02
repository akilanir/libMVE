.class public Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final attribute:Lorg/dmfs/xmlobjects/QualifiedName;


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/QualifiedName;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;->attribute:Lorg/dmfs/xmlobjects/QualifiedName;

    return-void
.end method


# virtual methods
.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;->attribute:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne v0, p3, :cond_5

    :goto_4
    return-object p4

    :cond_5
    move-object p4, p2

    goto :goto_4
.end method

.method public bridge synthetic writeAttributes(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;->writeAttributes(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    return-void
.end method

.method public writeAttributes(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;",
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

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/StringAttributeObjectBuilder;->attribute:Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-interface {p3, v0, p2, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;->writeAttribute(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    return-void
.end method
