.class final Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p2, :cond_e

    const v0, -0xff0100

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->color:I

    const/16 v0, 0x1f4

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->off:I

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->on:I

    :goto_d
    return-object p2

    :cond_e
    new-instance p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;-><init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V

    goto :goto_d
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v1, 0x1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_COLOR:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$400()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_16

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->color:I

    :cond_15
    :goto_15
    return-object p2

    :cond_16
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_ON_MS:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$500()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_27

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->on:I

    goto :goto_15

    :cond_27
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_OFF_MS:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$600()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_15

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$2;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->off:I

    goto :goto_15
.end method
