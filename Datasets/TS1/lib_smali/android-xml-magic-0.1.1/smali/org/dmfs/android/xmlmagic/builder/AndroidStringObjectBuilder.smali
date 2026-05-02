.class public Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# static fields
.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;

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

    check-cast v2, Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-nez p2, :cond_a

    invoke-virtual {p0, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    :cond_a
    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/String;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
