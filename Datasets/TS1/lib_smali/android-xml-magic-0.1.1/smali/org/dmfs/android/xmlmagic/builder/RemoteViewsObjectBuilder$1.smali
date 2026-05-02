.class final Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
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

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;-><init>(Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;)V

    return-object v0
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    move-object v2, p2

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iput-object p3, p2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->descriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;

    iput-object p4, p2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->value:Ljava/lang/Object;

    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # getter for: Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_ID:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->access$100()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_12

    const/4 v0, 0x0

    invoke-virtual {p0, p3, v0, p5}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;->getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->viewId:I

    :cond_11
    :goto_11
    return-object p2

    :cond_12
    # getter for: Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->ATTR_METHOD:Lorg/dmfs/xmlobjects/QualifiedName;
    invoke-static {}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;->access$200()Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    if-ne p3, v0, :cond_11

    iput-object p4, p2, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;->methodName:Ljava/lang/String;

    goto :goto_11
.end method
