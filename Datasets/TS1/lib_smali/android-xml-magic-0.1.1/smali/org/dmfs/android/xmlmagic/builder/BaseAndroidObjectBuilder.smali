.class public abstract Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    return-void
.end method


# virtual methods
.method protected final format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;
    .registers 5

    invoke-virtual {p0, p2}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->getTokenResolver(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    move-result-object v0

    if-nez v0, :cond_7

    :goto_6
    return-object p1

    :cond_7
    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lorg/dmfs/android/xmlmagic/StringFormatter;->format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;

    move-result-object p1

    goto :goto_6
.end method

.method protected getBooleanAttr(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/pull/ParserContext;)Z
    .registers 8

    const/4 v0, 0x0

    invoke-virtual {p0, p2}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->getResources(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p2}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getXmlPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    invoke-static {v2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v2

    iget-object v3, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v4, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v2, v3, v4, v0}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v3

    if-nez v3, :cond_39

    iget-object v1, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v3, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v2, v1, v3}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_37

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_38

    :cond_37
    const/4 v0, 0x1

    :cond_38
    :goto_38
    return v0

    :cond_39
    if-eqz v1, :cond_38

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    goto :goto_38
.end method

.method protected getCharSequenceAttr(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;
    .registers 9

    invoke-virtual {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->getResources(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p3}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getXmlPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    iget-object v2, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v3, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_24

    iget-object v0, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v2, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p3}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object p2

    :cond_23
    :goto_23
    return-object p2

    :cond_24
    if-eqz v0, :cond_23

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    goto :goto_23
.end method

.method protected getIntegerAttr(Lorg/dmfs/xmlobjects/QualifiedName;ZLorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Integer;
    .registers 9

    const/4 v4, 0x0

    invoke-virtual {p0, p3}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->getResources(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p3}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getXmlPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    invoke-static {v1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    iget-object v2, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v3, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v1, v2, v3, v4}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v2

    if-nez v2, :cond_36

    :try_start_17
    iget-object v0, p1, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    iget-object v2, p1, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    invoke-interface {v1, v0, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p3}, Lorg/dmfs/android/xmlmagic/builder/BaseAndroidObjectBuilder;->format(Ljava/lang/CharSequence;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_2e
    .catch Ljava/lang/NumberFormatException; {:try_start_17 .. :try_end_2e} :catch_30

    move-result-object v0

    :goto_2f
    return-object v0

    :catch_30
    move-exception v0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_2f

    :cond_36
    if-eqz v0, :cond_44

    if-eqz p2, :cond_44

    :try_start_3a
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_41
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_3a .. :try_end_41} :catch_43

    move-result-object v0

    goto :goto_2f

    :catch_43
    move-exception v0

    :cond_44
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_2f
.end method

.method protected final getResources(Lorg/dmfs/xmlobjects/pull/ParserContext;)Landroid/content/res/Resources;
    .registers 3

    instance-of v0, p1, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-eqz v0, :cond_b

    check-cast p1, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {p1}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected final getTokenResolver(Lorg/dmfs/xmlobjects/pull/ParserContext;)Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;
    .registers 3

    instance-of v0, p1, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-eqz v0, :cond_b

    check-cast p1, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {p1}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getResolver()Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method
