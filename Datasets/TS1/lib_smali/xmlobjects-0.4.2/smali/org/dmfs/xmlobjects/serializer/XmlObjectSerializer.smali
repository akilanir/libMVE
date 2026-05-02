.class public Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;,
        Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;
    }
.end annotation


# static fields
.field private static final PREFIX_CHARS:[C


# instance fields
.field private final mAttributeWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;

.field private final mChildWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x1a

    new-array v0, v0, [C

    fill-array-data v0, :array_a

    sput-object v0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->PREFIX_CHARS:[C

    return-void

    :array_a
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$1;

    invoke-direct {v0, p0}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$1;-><init>(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mAttributeWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;

    new-instance v0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;

    invoke-direct {v0, p0}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$2;-><init>(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mChildWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;

    return-void
.end method

.method static synthetic access$000(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mAttributeWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;

    return-object v0
.end method

.method static synthetic access$100(Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mChildWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;

    return-object v0
.end method

.method private bindNamespaces(Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->knownNamespaces:Ljava/util/Set;

    if-nez v0, :cond_6

    :cond_5
    return-void

    :cond_6
    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v0, 0x8

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->knownNamespaces:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v1, v2

    :goto_14
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move v3, v1

    :cond_21
    sget-object v6, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->PREFIX_CHARS:[C

    sget-object v7, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->PREFIX_CHARS:[C

    array-length v7, v7

    rem-int v7, v3, v7

    aget-char v6, v6, v7

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    sget-object v6, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->PREFIX_CHARS:[C

    array-length v6, v6

    div-int/2addr v3, v6

    if-gtz v3, :cond_21

    iget-object v3, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6, v0}, Lorg/xmlpull/v1/XmlSerializer;->setPrefix(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_14
.end method


# virtual methods
.method public serialize(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/serializer/SerializerContext;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, v1, v1}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v0, p2, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Lorg/dmfs/xmlobjects/QualifiedName;)V

    invoke-direct {p0, p1}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->bindNamespaces(Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    iget-object v0, p0, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->mChildWriter:Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;

    invoke-interface {v0, p2, p3, p1}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V

    return-void
.end method

.method public setOutput(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Ljava/io/OutputStream;Ljava/lang/String;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    if-nez p3, :cond_6

    const-string p3, "UTF-8"

    :cond_6
    invoke-interface {v0, p2, p3}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_a
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_9} :catch_13

    return-object p0

    :catch_a
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    const-string v2, "can\'t configure serializer"

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_13
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    const-string v2, "can\'t configure serializer"

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public setOutput(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Ljava/io/Writer;)Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v0, p2}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/Writer;)V
    :try_end_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_5} :catch_6
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_5} :catch_f

    return-object p0

    :catch_6
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    const-string v2, "can\'t configure serializer"

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_f
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    const-string v2, "can\'t configure serializer"

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Ljava/lang/String;)V
    .registers 5

    if-eqz p2, :cond_1a

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1a

    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->knownNamespaces:Ljava/util/Set;

    if-nez v0, :cond_15

    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->knownNamespaces:Ljava/util/Set;

    :cond_15
    iget-object v0, p1, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->knownNamespaces:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_1a
    return-void
.end method

.method public useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Lorg/dmfs/xmlobjects/ElementDescriptor;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/serializer/SerializerContext;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;)V"
        }
    .end annotation

    iget-object v0, p2, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    iget-object v0, v0, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Ljava/lang/String;)V

    return-void
.end method

.method public useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Lorg/dmfs/xmlobjects/QualifiedName;)V
    .registers 4

    iget-object v0, p2, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    invoke-virtual {p0, p1, v0}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer;->useNamespace(Lorg/dmfs/xmlobjects/serializer/SerializerContext;Ljava/lang/String;)V

    return-void
.end method
