.class public Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;
.super Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder",
        "<TT;>;"
    }
.end annotation


# instance fields
.field protected final mAttributeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field protected final mElementList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;",
            ">;"
        }
    .end annotation
.end field

.field protected final mElementMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lorg/dmfs/xmlobjects/QualifiedName;",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field

.field private final mGenericClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected final mTextList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    const/16 v1, 0x8

    invoke-direct {p0}, Lorg/dmfs/xmlobjects/builder/AbstractObjectBuilder;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mAttributeMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementMap:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementList:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mTextList:Ljava/util/List;

    iput-object p1, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mGenericClass:Ljava/lang/Class;

    invoke-direct {p0, p1}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->buildFieldMaps(Ljava/lang/Class;)V

    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    :goto_2a
    const-class v1, Ljava/lang/Object;

    if-eq v0, v1, :cond_36

    invoke-direct {p0, v0}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->buildFieldMaps(Ljava/lang/Class;)V

    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_2a

    :cond_36
    return-void
.end method

.method private assignValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    :try_start_4
    const-class v0, Ljava/lang/String;

    if-ne v1, v0, :cond_c

    invoke-virtual {p1, p2, p3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_b
    :goto_b
    return-void

    :cond_c
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_14

    const-class v0, Ljava/lang/Integer;

    if-ne v1, v0, :cond_40

    :cond_14
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_1b
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_1b} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_1b} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_1b} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_4 .. :try_end_1b} :catch_cb

    goto :goto_b

    :catch_1c
    move-exception v0

    new-instance v2, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not assign \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' to a field of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_40
    :try_start_40
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_48

    const-class v0, Ljava/lang/Byte;

    if-ne v1, v0, :cond_74

    :cond_48
    invoke-static {p3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setByte(Ljava/lang/Object;B)V
    :try_end_4f
    .catch Ljava/lang/NumberFormatException; {:try_start_40 .. :try_end_4f} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_40 .. :try_end_4f} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_40 .. :try_end_4f} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_40 .. :try_end_4f} :catch_cb

    goto :goto_b

    :catch_50
    move-exception v0

    new-instance v2, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not assign \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' to a field of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_74
    :try_start_74
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_7c

    const-class v0, Ljava/lang/Character;

    if-ne v1, v0, :cond_ba

    :cond_7c
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_b8

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v0

    :goto_8b
    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setChar(Ljava/lang/Object;C)V
    :try_end_92
    .catch Ljava/lang/NumberFormatException; {:try_start_74 .. :try_end_92} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_74 .. :try_end_92} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_74 .. :try_end_92} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_74 .. :try_end_92} :catch_cb

    goto/16 :goto_b

    :catch_94
    move-exception v0

    new-instance v2, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not assign \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' to a field of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_b8
    const/4 v0, 0x0

    goto :goto_8b

    :cond_ba
    :try_start_ba
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_c2

    const-class v0, Ljava/lang/Short;

    if-ne v1, v0, :cond_eb

    :cond_c2
    invoke-static {p3}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setShort(Ljava/lang/Object;S)V
    :try_end_c9
    .catch Ljava/lang/NumberFormatException; {:try_start_ba .. :try_end_c9} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_ba .. :try_end_c9} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_ba .. :try_end_c9} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_ba .. :try_end_c9} :catch_cb

    goto/16 :goto_b

    :catch_cb
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not parse URI in \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_eb
    :try_start_eb
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_f3

    const-class v0, Ljava/lang/Long;

    if-ne v1, v0, :cond_fc

    :cond_f3
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    goto/16 :goto_b

    :cond_fc
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_104

    const-class v0, Ljava/lang/Float;

    if-ne v1, v0, :cond_10d

    :cond_104
    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    goto/16 :goto_b

    :cond_10d
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_115

    const-class v0, Ljava/lang/Double;

    if-ne v1, v0, :cond_11e

    :cond_115
    invoke-static {p3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    invoke-virtual {p1, p2, v2, v3}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V

    goto/16 :goto_b

    :cond_11e
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v1, v0, :cond_126

    const-class v0, Ljava/lang/Boolean;

    if-ne v1, v0, :cond_12f

    :cond_126
    invoke-static {p3}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    goto/16 :goto_b

    :cond_12f
    const-class v0, Ljava/net/URI;

    if-ne v1, v0, :cond_13d

    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_b

    :cond_13d
    invoke-virtual {p1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v2, Ljava/lang/Class;
    :try_end_143
    .catch Ljava/lang/NumberFormatException; {:try_start_eb .. :try_end_143} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_eb .. :try_end_143} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_eb .. :try_end_143} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_eb .. :try_end_143} :catch_cb

    if-ne v0, v2, :cond_153

    if-eqz p3, :cond_b

    :try_start_147
    invoke-static {p3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_14e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_147 .. :try_end_14e} :catch_150
    .catch Ljava/lang/NumberFormatException; {:try_start_147 .. :try_end_14e} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_147 .. :try_end_14e} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_147 .. :try_end_14e} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_147 .. :try_end_14e} :catch_cb

    goto/16 :goto_b

    :catch_150
    move-exception v0

    goto/16 :goto_b

    :cond_153
    :try_start_153
    const-class v0, Ljava/lang/Enum;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z
    :try_end_158
    .catch Ljava/lang/NumberFormatException; {:try_start_153 .. :try_end_158} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_153 .. :try_end_158} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_153 .. :try_end_158} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_153 .. :try_end_158} :catch_cb

    move-result v0

    if-eqz v0, :cond_b

    :try_start_15b
    const-string v0, "valueOf"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_176
    .catch Ljava/lang/NoSuchMethodException; {:try_start_15b .. :try_end_176} :catch_178
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_15b .. :try_end_176} :catch_17b
    .catch Ljava/lang/NumberFormatException; {:try_start_15b .. :try_end_176} :catch_1c
    .catch Ljava/lang/IllegalArgumentException; {:try_start_15b .. :try_end_176} :catch_50
    .catch Ljava/lang/IllegalAccessException; {:try_start_15b .. :try_end_176} :catch_94
    .catch Ljava/net/URISyntaxException; {:try_start_15b .. :try_end_176} :catch_cb

    goto/16 :goto_b

    :catch_178
    move-exception v0

    goto/16 :goto_b

    :catch_17b
    move-exception v0

    goto/16 :goto_b
.end method

.method private buildFieldMaps(Ljava/lang/Class;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    const/4 v11, 0x1

    iget-object v3, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mAttributeMap:Ljava/util/Map;

    iget-object v4, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementMap:Ljava/util/Map;

    iget-object v5, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementList:Ljava/util/List;

    iget-object v6, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mTextList:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v7

    array-length v8, v7

    const/4 v0, 0x0

    move v2, v0

    :goto_10
    if-ge v2, v8, :cond_8a

    aget-object v9, v7, v2

    const-class v0, Lorg/dmfs/xmlobjects/builder/reflection/Attribute;

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/builder/reflection/Attribute;

    if-eqz v0, :cond_3e

    invoke-virtual {v9, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/builder/reflection/Attribute;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/builder/reflection/Attribute;->namespace()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_8d

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_33
    invoke-static {v10, v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    invoke-interface {v3, v0, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3a
    :goto_3a
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_10

    :cond_3e
    const-class v0, Lorg/dmfs/xmlobjects/builder/reflection/Element;

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/builder/reflection/Element;

    if-eqz v0, :cond_70

    invoke-virtual {v9, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/builder/reflection/Element;->name()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/builder/reflection/Element;->namespace()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_8b

    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    :goto_5d
    invoke-static {v10, v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v1

    invoke-interface {v4, v1, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;

    invoke-static {v10, v0}, Lorg/dmfs/xmlobjects/QualifiedName;->get(Ljava/lang/String;Ljava/lang/String;)Lorg/dmfs/xmlobjects/QualifiedName;

    move-result-object v0

    invoke-direct {v1, v0, v9}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;-><init>(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/reflect/Field;)V

    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_70
    const-class v0, Lorg/dmfs/xmlobjects/builder/reflection/Text;

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/builder/reflection/Text;

    if-eqz v0, :cond_3a

    invoke-virtual {v9, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-interface {v6, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v9}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;-><init>(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/reflect/Field;)V

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_8a
    return-void

    :cond_8b
    move-object v0, v1

    goto :goto_5d

    :cond_8d
    move-object v0, v1

    goto :goto_33
.end method


# virtual methods
.method public get(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    instance-of v0, p2, Lorg/dmfs/xmlobjects/pull/Recyclable;

    if-eqz v0, :cond_b

    move-object v0, p2

    check-cast v0, Lorg/dmfs/xmlobjects/pull/Recyclable;

    invoke-interface {v0}, Lorg/dmfs/xmlobjects/pull/Recyclable;->recycle()V

    :goto_a
    return-object p2

    :cond_b
    :try_start_b
    invoke-virtual {p0, p3}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->getInstance(Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    :try_end_e
    .catch Ljava/lang/InstantiationException; {:try_start_b .. :try_end_e} :catch_10
    .catch Ljava/lang/IllegalAccessException; {:try_start_b .. :try_end_e} :catch_2c

    move-result-object p2

    goto :goto_a

    :catch_10
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not instantiate instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mGenericClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_2c
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "can not instantiate instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mGenericClass:Ljava/lang/Class;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getInstance(Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mGenericClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
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

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mTextList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    invoke-direct {p0, v0, p2, p3}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->assignValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_6

    :cond_16
    return-object p2
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TV;>;TV;",
            "Lorg/dmfs/xmlobjects/pull/ParserContext;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;
        }
    .end annotation

    iget-object v0, p3, Lorg/dmfs/xmlobjects/ElementDescriptor;->qualifiedName:Lorg/dmfs/xmlobjects/QualifiedName;

    iget-object v1, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_3c

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v2

    :try_start_10
    const-class v1, Ljava/util/Collection;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-virtual {v2}, Ljava/lang/Class;->isInterface()Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v2}, Ljava/lang/Class;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v0, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    if-nez v1, :cond_39

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, p2, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_39
    invoke-interface {v1, p4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_3c
    :goto_3c
    return-object p2

    :cond_3d
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_3c

    invoke-virtual {v0, p2, p4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_4a} :catch_4b
    .catch Ljava/lang/IllegalAccessException; {:try_start_10 .. :try_end_4a} :catch_6f
    .catch Ljava/lang/InstantiationException; {:try_start_10 .. :try_end_4a} :catch_93

    goto :goto_3c

    :catch_4b
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not assign \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' to a field of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_6f
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not assign \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' to a field of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :catch_93
    move-exception v0

    new-instance v1, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not insanciate collection for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/dmfs/xmlobjects/pull/XmlObjectPullParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public update(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/pull/ParserContext;)Ljava/lang/Object;
    .registers 7
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

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mAttributeMap:Ljava/util/Map;

    invoke-interface {v0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    if-eqz v0, :cond_d

    invoke-direct {p0, v0, p2, p4}, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->assignValue(Ljava/lang/reflect/Field;Ljava/lang/Object;Ljava/lang/String;)V

    :cond_d
    return-object p2
.end method

.method public writeAttributes(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;",
            "Lorg/dmfs/xmlobjects/serializer/SerializerContext;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mAttributeMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_a
    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    :try_start_16
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    invoke-virtual {v1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_1f} :catch_30
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_1f} :catch_4e

    move-result-object v1

    if-eqz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p3, v0, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlAttributeWriter;->writeAttribute(Lorg/dmfs/xmlobjects/QualifiedName;Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_a

    :catch_30
    move-exception v1

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not read attribute "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_4e
    move-exception v1

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not read attribute "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_6c
    return-void
.end method

.method public writeChildren(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<TT;>;TT;",
            "Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;",
            "Lorg/dmfs/xmlobjects/serializer/SerializerContext;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/dmfs/xmlobjects/serializer/SerializerException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p4}, Lorg/dmfs/xmlobjects/serializer/SerializerContext;->getXmlContext()Lorg/dmfs/xmlobjects/XmlContext;

    move-result-object v2

    iget-object v0, p0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder;->mElementList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_a
    :goto_a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;

    :try_start_16
    iget-object v1, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_16 .. :try_end_1b} :catch_59
    .catch Ljava/lang/IllegalAccessException; {:try_start_16 .. :try_end_1b} :catch_79

    move-result-object v1

    iget-object v4, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->name:Lorg/dmfs/xmlobjects/QualifiedName;

    if-eqz v4, :cond_9e

    iget-object v4, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->name:Lorg/dmfs/xmlobjects/QualifiedName;

    invoke-static {v4, p1, v2}, Lorg/dmfs/xmlobjects/ElementDescriptor;->get(Lorg/dmfs/xmlobjects/QualifiedName;Lorg/dmfs/xmlobjects/ElementDescriptor;Lorg/dmfs/xmlobjects/XmlContext;)Lorg/dmfs/xmlobjects/ElementDescriptor;

    move-result-object v4

    iget-object v0, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    const-class v5, Ljava/util/Collection;

    invoke-virtual {v5, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_99

    invoke-virtual {v0}, Ljava/lang/Class;->isInterface()Z

    move-result v5

    if-nez v5, :cond_99

    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v0

    if-nez v0, :cond_99

    move-object v0, v1

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {p3, v4, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto :goto_4b

    :catch_59
    move-exception v1

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not read field "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_79
    move-exception v1

    new-instance v2, Lorg/dmfs/xmlobjects/serializer/SerializerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can not read field "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v0, v0, Lorg/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0, v1}, Lorg/dmfs/xmlobjects/serializer/SerializerException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_99
    invoke-interface {p3, v4, v1, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeChild(Lorg/dmfs/xmlobjects/ElementDescriptor;Ljava/lang/Object;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto/16 :goto_a

    :cond_9e
    if-eqz v1, :cond_a

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0, p4}, Lorg/dmfs/xmlobjects/serializer/XmlObjectSerializer$IXmlChildWriter;->writeText(Ljava/lang/String;Lorg/dmfs/xmlobjects/serializer/SerializerContext;)V

    goto/16 :goto_a

    :cond_a9
    return-void
.end method
