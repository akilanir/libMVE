.class Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;


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

    iput-object p1, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;->this$0:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 9
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

    iget-object v1, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    if-nez v0, :cond_1f

    new-instance v0, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not serializable"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1f
    :try_start_1f
    iget-object v0, p3, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    iget-object v2, v1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v3, v1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iget-object v2, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;->this$0:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;

    # getter for: Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mAttributeWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;
    invoke-static {v2}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->access$000(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;

    move-result-object v2

    invoke-interface {v0, p1, p2, v2, p3}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->writeAttributes(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    iget-object v0, p1, Lorg/dmfs/xmlobjects/ElementDescriptor;->builder:Lorg/dmfs/xmlobjects/builder/IObjectBuilder;

    iget-object v2, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;->this$0:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;

    # getter for: Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mChildWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;
    invoke-static {v2}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->access$100(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;

    move-result-object v2

    invoke-interface {v0, p1, p2, v2, p3}, Lorg/dmfs/xmlobjects/builder/IObjectBuilder;->writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    iget-object v0, p3, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    iget-object v2, v1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v3, v1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_47
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1f .. :try_end_47} :catch_48
    .catch Ljava/lang/IllegalStateException; {:try_start_1f .. :try_end_47} :catch_62

    return-void

    :catch_48
    move-exception v0

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not serialize element "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_62
    move-exception v0

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not serialize element "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public writeText(Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_7

    :try_start_2
    iget-object v0, p2, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, p1}, Lorg/xmlpull/v1/XmlSerializer;->text(Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_7} :catch_8
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_7} :catch_28

    :cond_7
    return-void

    :catch_8
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not serialize text \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_28
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not serialize text \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
