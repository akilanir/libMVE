.class public Lorg/dmfs/android/xmlmagic/builder/EqualsObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/EqualsObjectBuilder;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/Boolean;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-object p2

    :cond_7
    invoke-virtual {p5}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_11

    invoke-virtual {p5, p4}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    goto :goto_6

    :cond_11
    invoke-virtual {v0, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p5, p4}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    goto :goto_6
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Ljava/lang/Boolean;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/EqualsObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
