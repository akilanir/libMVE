.class final Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;
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
        "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
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

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-eqz p2, :cond_d

    const/16 v0, 0x64

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->max:I

    const/4 v0, 0x0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->progress:I

    const/4 v0, 0x1

    iput-boolean v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->visible:Z

    :goto_c
    return-object p2

    :cond_d
    new-instance p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;-><init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V

    goto :goto_c
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v1, 0x1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_MAX:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$800()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_12

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->max:I

    :cond_11
    :goto_11
    return-object p2

    :cond_12
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_PROGRESS:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$900()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_23

    invoke-virtual {p0, p3, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->progress:I

    goto :goto_11

    :cond_23
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_VISIBLE:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$1000()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_30

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v0

    iput-boolean v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->visible:Z

    goto :goto_11

    :cond_30
    # getter for: Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->ATTR_INDETERMINANTE:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;->access$1100()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_11

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$3;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v0

    iput-boolean v0, p2, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->indeterminante:Z

    goto :goto_11
.end method
