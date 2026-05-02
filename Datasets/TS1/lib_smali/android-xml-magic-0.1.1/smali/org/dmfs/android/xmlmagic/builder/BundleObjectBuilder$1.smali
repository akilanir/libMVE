.class final Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
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
.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-result-object v0

    return-object v0
.end method

.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {p2}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'bundle-value\' must have a key"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    return-object p2
.end method

.method public bridge synthetic get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_a

    # setter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$002(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/String;)Ljava/lang/String;

    # setter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$102(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_9
    return-object p2

    :cond_a
    new-instance p2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    invoke-direct {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;-><init>(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;)V

    goto :goto_9
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-result-object v0

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

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

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

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {p2}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'bundle-value\' can not have more than one child element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    invoke-virtual {p0, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    # setter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {p2, v0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$102(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # getter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {p2}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "\'bundle-value\' can not have more than one child element"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    # setter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;
    invoke-static {p2, p4}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$102(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/Model;->ATTR_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_7

    # setter for: Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;
    invoke-static {p2, p4}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->access$002(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    return-object p2
.end method
