.class public Lezvcard/property/Xml;
.super Lezvcard/property/SimpleProperty;
.source "Xml.java"

# interfaces
.implements Lezvcard/property/HasAltId;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/property/SimpleProperty",
        "<",
        "Lorg/w3c/dom/Document;",
        ">;",
        "Lezvcard/property/HasAltId;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "xml"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 75
    invoke-static {p1}, Lezvcard/util/XmlUtils;->toDocument(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/property/Xml;-><init>(Lorg/w3c/dom/Document;)V

    .line 76
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Document;)V
    .registers 2
    .param p1, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lezvcard/property/SimpleProperty;-><init>(Ljava/lang/Object;)V

    .line 93
    return-void
.end method

.method public constructor <init>(Lorg/w3c/dom/Element;)V
    .registers 3
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 84
    invoke-static {p1}, Lezvcard/property/Xml;->detachElement(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Document;

    move-result-object v0

    invoke-direct {p0, v0}, Lezvcard/property/Xml;-><init>(Lorg/w3c/dom/Document;)V

    .line 85
    return-void
.end method

.method private static detachElement(Lorg/w3c/dom/Element;)Lorg/w3c/dom/Document;
    .registers 4
    .param p0, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 111
    invoke-static {}, Lezvcard/util/XmlUtils;->createDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 112
    .local v0, "document":Lorg/w3c/dom/Document;
    const/4 v2, 0x1

    invoke-interface {v0, p0, v2}, Lorg/w3c/dom/Document;->importNode(Lorg/w3c/dom/Node;Z)Lorg/w3c/dom/Node;

    move-result-object v1

    .line 113
    .local v1, "imported":Lorg/w3c/dom/Node;
    invoke-interface {v0, v1}, Lorg/w3c/dom/Document;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 114
    return-object v0
.end method


# virtual methods
.method public _supportedVersions()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lezvcard/VCardVersion;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    sget-object v0, Lezvcard/VCardVersion;->V4_0:Lezvcard/VCardVersion;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public getAltId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lezvcard/property/Xml;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0}, Lezvcard/parameter/VCardParameters;->getAltId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAltId(Ljava/lang/String;)V
    .registers 3
    .param p1, "altId"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lezvcard/property/Xml;->parameters:Lezvcard/parameter/VCardParameters;

    invoke-virtual {v0, p1}, Lezvcard/parameter/VCardParameters;->setAltId(Ljava/lang/String;)V

    .line 108
    return-void
.end method
