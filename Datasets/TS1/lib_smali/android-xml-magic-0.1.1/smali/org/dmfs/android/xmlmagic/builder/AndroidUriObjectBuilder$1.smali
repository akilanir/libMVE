.class final Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
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

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;->get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    move-result-object v0

    return-object v0
.end method

.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;-><init>(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;)V

    return-object v0
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

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

    check-cast v2, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    # setter for: Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->value:Ljava/lang/String;
    invoke-static {p2, p3}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->access$202(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;)Ljava/lang/String;

    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            ">;",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/Model;->ATTR_KEY:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_7

    # setter for: Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->key:Ljava/lang/String;
    invoke-static {p2, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->access$102(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;)Ljava/lang/String;

    :cond_7
    return-object p2
.end method
