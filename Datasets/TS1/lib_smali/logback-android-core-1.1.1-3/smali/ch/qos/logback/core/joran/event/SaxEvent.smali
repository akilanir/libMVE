.class public Lch/qos/logback/core/joran/event/SaxEvent;
.super Ljava/lang/Object;


# instance fields
.field public final localName:Ljava/lang/String;

.field public final locator:Lorg/xml/sax/Locator;

.field public final namespaceURI:Ljava/lang/String;

.field public final qName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Locator;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/joran/event/SaxEvent;->namespaceURI:Ljava/lang/String;

    iput-object p2, p0, Lch/qos/logback/core/joran/event/SaxEvent;->localName:Ljava/lang/String;

    iput-object p3, p0, Lch/qos/logback/core/joran/event/SaxEvent;->qName:Ljava/lang/String;

    new-instance v0, Lorg/xml/sax/helpers/LocatorImpl;

    invoke-direct {v0, p4}, Lorg/xml/sax/helpers/LocatorImpl;-><init>(Lorg/xml/sax/Locator;)V

    iput-object v0, p0, Lch/qos/logback/core/joran/event/SaxEvent;->locator:Lorg/xml/sax/Locator;

    return-void
.end method


# virtual methods
.method public getLocalName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEvent;->localName:Ljava/lang/String;

    return-object v0
.end method

.method public getLocator()Lorg/xml/sax/Locator;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEvent;->locator:Lorg/xml/sax/Locator;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEvent;->namespaceURI:Ljava/lang/String;

    return-object v0
.end method

.method public getQName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/event/SaxEvent;->qName:Ljava/lang/String;

    return-object v0
.end method
