.class public Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
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

    if-nez p2, :cond_7

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    :cond_7
    return-object p2
.end method

.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
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

    const/4 v0, 0x0

    if-eqz p2, :cond_4

    :goto_3
    return-object p2

    :cond_4
    if-eqz p3, :cond_c

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_11

    :cond_c
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    goto :goto_3

    :cond_11
    instance-of v1, p4, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-eqz v1, :cond_26

    check-cast p4, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {p4}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getResolver()Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    move-result-object v1

    if-eqz v1, :cond_26

    const/4 v2, 0x5

    invoke-static {p3, v1, v2}, Lorg/dmfs/android/xmlmagic/StringFormatter;->format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    :cond_26
    const-string v1, "true"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_36

    const-string v1, "1"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_37

    :cond_36
    const/4 v0, 0x1

    :cond_37
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    goto :goto_3
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/Boolean;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
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

    invoke-virtual {p0, p3, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

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

    check-cast v2, Ljava/lang/Boolean;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/AndroidBooleanObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Boolean;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
