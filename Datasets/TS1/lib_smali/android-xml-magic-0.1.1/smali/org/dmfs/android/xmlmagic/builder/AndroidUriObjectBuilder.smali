.class public Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;
.super Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder",
        "<",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# static fields
.field private static final APPEND_PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final ATTR_AUTHORITY:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_FRAGMENT:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_PATH:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final ATTR_SCHEME:Lorg/dmfs/xmlobjects/QualifiedName;

.field private static final AUTHORITY:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRAGMENT:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;

.field private static final PARAMETER:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;",
            ">;"
        }
    .end annotation
.end field

.field private static final PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final SCHEME:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;

    invoke-direct {v0}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;-><init>()V

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;

    const-string v0, "scheme"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_SCHEME:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "authority"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_AUTHORITY:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "path"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_PATH:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "fragment"

    invoke-static {v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_FRAGMENT:Lorg/dmfs/xmlobjects/QualifiedName;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "scheme"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->SCHEME:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "authority"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->AUTHORITY:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "path"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "append-path"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->APPEND_PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "fragment"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;->INSTANCE:Lorg/dmfs/android/xmlmagic/builder/AndroidStringObjectBuilder;

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->FRAGMENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    const-string v0, "http://dmfs.org/ns/android-xml-magic"

    const-string v1, "query-parameter"

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    new-instance v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;

    invoke-direct {v1}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;-><init>()V

    invoke-static {v0, v1}, Lorg/dmfs/xmlobjects/ElementDescriptor;->register(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/builder/IObjectBuilder;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v0

    sput-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->PARAMETER:Lorg/dmfs/xmlobjects/ElementDescriptor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;-><init>()V

    return-void
.end method

.method private getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;
    .registers 3

    invoke-virtual {p1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getState()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri$Builder;

    if-nez v0, :cond_10

    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {p1, v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    :cond_10
    return-object v0
.end method


# virtual methods
.method public finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/net/Uri;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    if-nez p2, :cond_a

    invoke-direct {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    :cond_a
    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    return-object p2
.end method

.method public bridge synthetic finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->finish(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/net/Uri;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v0

    :goto_10
    return-object v0

    :catch_11
    move-exception v0

    const/4 v0, 0x0

    goto :goto_10
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/net/Uri;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p2, :cond_b

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {p5, v1}, Lorg/dmfs/xmlobjects/pull/ParserContext;->setState(Ljava/lang/Object;)V

    move-object p2, v0

    :cond_b
    instance-of v1, p4, Ljava/lang/String;

    if-nez v1, :cond_11

    if-nez p4, :cond_79

    :cond_11
    if-nez p4, :cond_21

    :goto_13
    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->SCHEME:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v1, :cond_2d

    if-eqz p4, :cond_20

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_20
    :goto_20
    return-object p2

    :cond_21
    move-object v0, p4

    check-cast v0, Ljava/lang/CharSequence;

    invoke-virtual {p0, v0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_13

    :cond_2d
    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->AUTHORITY:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v1, :cond_3b

    if-eqz p4, :cond_20

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_3b
    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v1, :cond_53

    if-nez p4, :cond_4b

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_4b
    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_53
    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->FRAGMENT:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v1, :cond_61

    if-eqz p4, :cond_20

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_61
    sget-object v1, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->APPEND_PATH:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v1, :cond_20

    if-nez p4, :cond_71

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_71
    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20

    :cond_79
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->PARAMETER:Lorg/dmfs/xmlobjects/ElementDescriptor;

    if-ne p3, v0, :cond_20

    check-cast p4, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    # getter for: Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->key:Ljava/lang/String;
    invoke-static {p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->access$100(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    # getter for: Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->value:Ljava/lang/String;
    invoke-static {p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->access$200(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_20
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<",
            "Landroid/net/Uri;",
            ">;",
            "Landroid/net/Uri;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")",
            "Landroid/net/Uri;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_SCHEME:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_13

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_13
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_AUTHORITY:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_26

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_26
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_PATH:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_39

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_39
    sget-object v0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->ATTR_FRAGMENT:Lorg/dmfs/xmlobjects/QualifiedName;

    if-ne p3, v0, :cond_4c

    invoke-direct {p0, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getBuilder(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {p0, p3, p4, p5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_4c
    return-object p2
.end method

.method public bridge synthetic update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    check-cast p2, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;

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

    check-cast v2, Landroid/net/Uri;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;

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

    check-cast v2, Landroid/net/Uri;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Landroid/net/Uri;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
