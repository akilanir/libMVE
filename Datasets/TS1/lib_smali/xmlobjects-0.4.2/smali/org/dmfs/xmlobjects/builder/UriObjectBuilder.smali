.class public Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/net/URI;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;

.field public static final INSTANCE_STRICT:Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;


# instance fields
.field private final mStrict:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;-><init>(Z)V

    sput-object v0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->INSTANCE_STRICT:Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;

    new-instance v0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;-><init>(Z)V

    sput-object v0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->INSTANCE:Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;

    return-void
.end method

.method private constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    iput-boolean p1, p0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->mStrict:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/net/URI;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/net/URI;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/net/URI;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/net/URI;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/net/URI;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/net/URI;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/net/URI;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p3, :cond_8

    iget-boolean v1, p0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->mStrict:Z

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return-object v0

    :cond_8
    :try_start_8
    new-instance v1, Ljava/net/URI;

    iget-boolean v2, p0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->mStrict:Z

    if-eqz v2, :cond_14

    move-object v2, p3

    :goto_f
    invoke-direct {v1, v2}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    move-object v0, v1

    goto :goto_7

    :cond_14
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_17
    .catch Ljava/net/URISyntaxException; {:try_start_8 .. :try_end_17} :catch_19

    move-result-object v2

    goto :goto_f

    :catch_19
    move-exception v1

    iget-boolean v2, p0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->mStrict:Z

    if-eqz v2, :cond_7

    new-instance v0, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "could not parse URI in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v1}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public bridge synthetic writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    check-cast p2, Ljava/net/URI;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/net/URI;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    return-void
.end method

.method public writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/net/URI;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/net/URI;",
            ">;",
            "Ljava/net/URI;",
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

    if-eqz p2, :cond_a

    invoke-virtual {p2}, Ljava/net/URI;->toASCIIString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeText(Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    :cond_9
    return-void

    :cond_a
    iget-boolean v0, p0, Lorg/dmfs/xmlobjects/builder/UriObjectBuilder;->mStrict:Z

    if-eqz v0, :cond_9

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "URI value is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
