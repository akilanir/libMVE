.class public Lorg/dmfs/xmlobjects/serializer/SerializerContext;
.super Ljava/lang/Object;


# instance fields
.field knownNamespaces:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field serializer:Lorg/xmlpull/v1/XmlSerializer;

.field xmlContext:Lorg/dmfs/xmlobjects/XmlContext;


# direct methods
.method public constructor <init>(Lorg/dmfs/xmlobjects/XmlContext;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->xmlContext:Lorg/dmfs/xmlobjects/XmlContext;

    :try_start_5
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object v0

    iput-object v0, p0, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->serializer:Lorg/xmlpull/v1/XmlSerializer;
    :try_end_f
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_f} :catch_10

    return-void

    :catch_10
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    const-string v2, "can\'t get serializer"

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public getXmlContext()Lorg/dmfs/xmlobjects/XmlContext;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->xmlContext:Lorg/dmfs/xmlobjects/XmlContext;

    return-object v0
.end method
