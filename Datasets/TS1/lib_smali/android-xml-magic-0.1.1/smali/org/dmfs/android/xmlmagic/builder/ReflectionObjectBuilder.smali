.class public Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/String;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    const/4 v1, 0x0

    const/4 v0, 0x0

    instance-of v2, p5, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    if-eqz v2, :cond_189

    move-object v0, p5

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    move-object v0, p5

    check-cast v0, Lorg/dmfs/android/xmlmagic/AndroidParserContext;

    invoke-virtual {v0}, Lorg/dmfs/android/xmlmagic/AndroidParserContext;->getResolver()Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;

    move-result-object v0

    move-object v3, v0

    move-object v4, v1

    :goto_16
    invoke-virtual {p5}, Lorg/dmfs/xmlobjects/pull/ParserContext;->getXmlPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    invoke-static {v0}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/ReflectionObjectBuilder;->mAttributeMap:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_8b

    iget-object v6, p3, Lorg/dmfs/xmlobjects/QualifiedName;->name:Ljava/lang/String;

    iget-object v7, p3, Lorg/dmfs/xmlobjects/QualifiedName;->namespace:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-interface {v5, v7, v6, v1}, Landroid/util/AttributeSet;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v8

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v9, Ljava/lang/String;

    if-ne v1, v9, :cond_5a

    if-nez v8, :cond_8c

    invoke-interface {v5, v7, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_40
    :goto_40
    if-eqz v3, :cond_5a

    const-class v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;

    if-eqz v1, :cond_5a

    invoke-interface {v1}, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;->value()Z

    move-result v1

    if-eqz v1, :cond_5a

    move-object v1, v2

    check-cast v1, Ljava/lang/String;

    const/4 v2, 0x5

    invoke-static {v1, v3, v2}, Lorg/dmfs/android/xmlmagic/StringFormatter;->format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;

    move-result-object v2

    :cond_5a
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v9, Ljava/lang/CharSequence;

    if-ne v1, v9, :cond_9a

    if-nez v8, :cond_93

    invoke-interface {v5, v7, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_68
    :goto_68
    if-eqz v3, :cond_82

    const-class v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;

    if-eqz v1, :cond_82

    invoke-interface {v1}, Lorg/dmfs/android/xmlmagic/annotations/ResolveTokens;->value()Z

    move-result v1

    if-eqz v1, :cond_82

    move-object v1, v2

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x5

    invoke-static {v1, v3, v2}, Lorg/dmfs/android/xmlmagic/StringFormatter;->format(Ljava/lang/CharSequence;Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;I)Ljava/lang/CharSequence;

    move-result-object v2

    :cond_82
    :goto_82
    if-eqz v2, :cond_17d

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :try_start_88
    invoke-virtual {v0, p2, v2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_88 .. :try_end_8b} :catch_183
    .catch Ljava/lang/IllegalAccessException; {:try_start_88 .. :try_end_8b} :catch_186

    :cond_8b
    :goto_8b
    return-object p2

    :cond_8c
    if-eqz v4, :cond_40

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_40

    :cond_93
    if-eqz v4, :cond_68

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_68

    :cond_9a
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v1, v3, :cond_aa

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/lang/Integer;

    if-ne v1, v3, :cond_dc

    :cond_aa
    if-nez v8, :cond_b6

    const/4 v1, 0x0

    invoke-interface {v5, v7, v6, v1}, Landroid/util/AttributeSet;->getAttributeIntValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_82

    :cond_b6
    if-eqz v4, :cond_d7

    const-class v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveInt;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lorg/dmfs/android/xmlmagic/annotations/ResolveInt;

    if-eqz v1, :cond_d7

    invoke-interface {v1}, Lorg/dmfs/android/xmlmagic/annotations/ResolveInt;->value()Z

    move-result v1

    if-eqz v1, :cond_d7

    :try_start_c8
    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_cf
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_c8 .. :try_end_cf} :catch_d1

    move-result-object v2

    goto :goto_82

    :catch_d1
    move-exception v1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_82

    :cond_d7
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_82

    :cond_dc
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq v1, v3, :cond_ec

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/lang/Float;

    if-ne v1, v3, :cond_f6

    :cond_ec
    const/4 v1, 0x0

    invoke-interface {v5, v7, v6, v1}, Landroid/util/AttributeSet;->getAttributeFloatValue(Ljava/lang/String;Ljava/lang/String;F)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    goto :goto_82

    :cond_f6
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v1, v3, :cond_106

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/lang/Boolean;

    if-ne v1, v3, :cond_11f

    :cond_106
    if-nez v8, :cond_113

    const/4 v1, 0x0

    invoke-interface {v5, v7, v6, v1}, Landroid/util/AttributeSet;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto/16 :goto_82

    :cond_113
    if-eqz v4, :cond_82

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto/16 :goto_82

    :cond_11f
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/net/URI;

    if-ne v1, v3, :cond_13d

    const/4 v1, 0x0

    if-nez v8, :cond_136

    invoke-interface {v5, v7, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_12e
    :goto_12e
    if-eqz v1, :cond_82

    invoke-static {v1}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v2

    goto/16 :goto_82

    :cond_136
    if-eqz v4, :cond_12e

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_12e

    :cond_13d
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Landroid/net/Uri;

    if-ne v1, v3, :cond_15b

    const/4 v1, 0x0

    if-nez v8, :cond_154

    invoke-interface {v5, v7, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_14c
    :goto_14c
    if-eqz v1, :cond_82

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    goto/16 :goto_82

    :cond_154
    if-eqz v4, :cond_14c

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_14c

    :cond_15b
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    const-class v3, Ljava/lang/Class;

    if-ne v1, v3, :cond_82

    const/4 v1, 0x0

    if-nez v8, :cond_172

    invoke-interface {v5, v7, v6}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_16a
    :goto_16a
    if-eqz v1, :cond_82

    :try_start_16c
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_16f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_16c .. :try_end_16f} :catch_179

    move-result-object v2

    goto/16 :goto_82

    :cond_172
    if-eqz v4, :cond_16a

    invoke-virtual {v4, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_16a

    :catch_179
    move-exception v1

    const/4 v2, 0x0

    goto/16 :goto_82

    :cond_17d
    invoke-super/range {p0 .. p5}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;

    move-result-object p2

    goto/16 :goto_8b

    :catch_183
    move-exception v0

    goto/16 :goto_8b

    :catch_186
    move-exception v0

    goto/16 :goto_8b

    :cond_189
    move-object v3, v0

    move-object v4, v1

    goto/16 :goto_16
.end method
