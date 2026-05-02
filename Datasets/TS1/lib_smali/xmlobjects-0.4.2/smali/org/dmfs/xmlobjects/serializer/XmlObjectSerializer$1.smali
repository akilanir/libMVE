.class Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$1;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;


# direct methods
.method constructor <init>(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$1;->this$0:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public writeAttribute(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p3, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    iget-object v1, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v2, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v0, v1, v2, p2}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_9} :catch_24

    return-void

    :catch_a
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not serialize attribute "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_24
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not serialize attribute "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
