.class public interface abstract Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "IXmlChildWriter"
.end annotation


# virtual methods
.method public abstract writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
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
.end method

.method public abstract writeText(Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method
