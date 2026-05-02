.class public interface abstract Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IXmlAttributeWriter"
.end annotation


# virtual methods
.method public abstract writeAttribute(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
