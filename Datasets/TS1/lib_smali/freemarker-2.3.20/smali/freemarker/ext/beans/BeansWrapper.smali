.class public Lfreemarker/ext/beans/BeansWrapper;
.super Ljava/lang/Object;
.source "BeansWrapper.java"

# interfaces
.implements Lfreemarker/template/ObjectWrapper;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;,
        Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    }
.end annotation


# static fields
.field private static final ARGTYPES:Ljava/lang/Object;

.field private static final BIGINTEGER_CLASS:Ljava/lang/Class;

.field private static final BOOLEAN_CLASS:Ljava/lang/Class;

.field static final CAN_NOT_UNWRAP:Ljava/lang/Object;

.field private static final CHARACTER_CLASS:Ljava/lang/Class;

.field private static final COLLECTION_CLASS:Ljava/lang/Class;

.field private static final CONSTRUCTORS:Ljava/lang/Object;

.field private static final DATE_CLASS:Ljava/lang/Class;

.field private static final DEVELOPMENT:Z

.field private static final ENUMERATION_FACTORY:Lfreemarker/ext/util/ModelFactory;

.field private static final ENUMS_MODEL_CTOR:Ljava/lang/reflect/Constructor;

.field public static final EXPOSE_ALL:I = 0x0

.field public static final EXPOSE_NOTHING:I = 0x3

.field public static final EXPOSE_PROPERTIES_ONLY:I = 0x2

.field public static final EXPOSE_SAFE:I = 0x1

.field static final GENERIC_GET_KEY:Ljava/lang/Object;

.field private static final HASHADAPTER_CLASS:Ljava/lang/Class;

.field private static final INSTANCE:Lfreemarker/ext/beans/BeansWrapper;

.field private static final ITERABLE_CLASS:Ljava/lang/Class;

.field private static final ITERATOR_FACTORY:Lfreemarker/ext/util/ModelFactory;

.field private static final LIST_CLASS:Ljava/lang/Class;

.field private static final MAP_CLASS:Ljava/lang/Class;

.field private static final NUMBER_CLASS:Ljava/lang/Class;

.field private static final OBJECT_CLASS:Ljava/lang/Class;

.field private static final SEQUENCEADAPTER_CLASS:Ljava/lang/Class;

.field private static final SETADAPTER_CLASS:Ljava/lang/Class;

.field private static final SET_CLASS:Ljava/lang/Class;

.field private static final STRING_CLASS:Ljava/lang/Class;

.field private static final UNSAFE_METHODS:Ljava/util/Set;

.field static class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

.field static class$freemarker$ext$beans$HashAdapter:Ljava/lang/Class;

.field static class$freemarker$ext$beans$SequenceAdapter:Ljava/lang/Class;

.field static class$freemarker$ext$beans$SetAdapter:Ljava/lang/Class;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$java$lang$Byte:Ljava/lang/Class;

.field static class$java$lang$Character:Ljava/lang/Class;

.field static class$java$lang$Double:Ljava/lang/Class;

.field static class$java$lang$Float:Ljava/lang/Class;

.field static class$java$lang$Integer:Ljava/lang/Class;

.field static class$java$lang$Long:Ljava/lang/Class;

.field static class$java$lang$Number:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;

.field static class$java$lang$Short:Ljava/lang/Class;

.field static class$java$lang$String:Ljava/lang/Class;

.field static class$java$math$BigDecimal:Ljava/lang/Class;

.field static class$java$math$BigInteger:Ljava/lang/Class;

.field static class$java$util$Collection:Ljava/lang/Class;

.field static class$java$util$Date:Ljava/lang/Class;

.field static class$java$util$Enumeration:Ljava/lang/Class;

.field static class$java$util$Iterator:Ljava/lang/Class;

.field static class$java$util$List:Ljava/lang/Class;

.field static class$java$util$Map:Ljava/lang/Class;

.field static class$java$util$ResourceBundle:Ljava/lang/Class;

.field static class$java$util$Set:Ljava/lang/Class;

.field private static final javaRebelAvailable:Z

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final BOOLEAN_FACTORY:Lfreemarker/ext/util/ModelFactory;

.field private final FALSE:Lfreemarker/ext/beans/BooleanModel;

.field private final TRUE:Lfreemarker/ext/beans/BooleanModel;

.field private defaultDateType:I

.field private final enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

.field private exposeFields:Z

.field private exposureLevel:I

.field private final genericClassIntrospectionCache:Ljava/util/Map;

.field private final genericClassIntrospectionCacheClassNames:Ljava/util/Set;

.field private final genericClassIntrospectionsInProgress:Ljava/util/Set;

.field private final isGenericClassIntrospectionCacheConcurrentMap:Z

.field private methodsShadowItems:Z

.field private final modelCache:Lfreemarker/ext/util/ModelCache;

.field private nullModel:Lfreemarker/template/TemplateModel;

.field private outerIdentity:Lfreemarker/template/ObjectWrapper;

.field private final sharedClassIntrospectionCacheLock:Ljava/lang/Object;

.field private simpleMapWrapper:Z

.field private final staticModels:Lfreemarker/ext/beans/StaticModels;

.field private strict:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 116
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    .line 117
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v2, :cond_126

    const-string v2, "java.math.BigInteger"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_13
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->BIGINTEGER_CLASS:Ljava/lang/Class;

    .line 118
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v2, :cond_12a

    const-string v2, "java.lang.Boolean"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_21
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->BOOLEAN_CLASS:Ljava/lang/Class;

    .line 119
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Character:Ljava/lang/Class;

    if-nez v2, :cond_12e

    const-string v2, "java.lang.Character"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Character:Ljava/lang/Class;

    :goto_2f
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->CHARACTER_CLASS:Ljava/lang/Class;

    .line 120
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    if-nez v2, :cond_132

    const-string v2, "java.util.Collection"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    :goto_3d
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->COLLECTION_CLASS:Ljava/lang/Class;

    .line 121
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    if-nez v2, :cond_136

    const-string v2, "java.util.Date"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    :goto_4b
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->DATE_CLASS:Ljava/lang/Class;

    .line 122
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$HashAdapter:Ljava/lang/Class;

    if-nez v2, :cond_13a

    const-string v2, "freemarker.ext.beans.HashAdapter"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$HashAdapter:Ljava/lang/Class;

    :goto_59
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->HASHADAPTER_CLASS:Ljava/lang/Class;

    .line 124
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$List:Ljava/lang/Class;

    if-nez v2, :cond_13e

    const-string v2, "java.util.List"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$List:Ljava/lang/Class;

    :goto_67
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->LIST_CLASS:Ljava/lang/Class;

    .line 125
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    if-nez v2, :cond_142

    const-string v2, "java.util.Map"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    :goto_75
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->MAP_CLASS:Ljava/lang/Class;

    .line 126
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v2, :cond_146

    const-string v2, "java.lang.Number"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    :goto_83
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->NUMBER_CLASS:Ljava/lang/Class;

    .line 127
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v2, :cond_14a

    const-string v2, "java.lang.Object"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Object:Ljava/lang/Class;

    :goto_91
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->OBJECT_CLASS:Ljava/lang/Class;

    .line 128
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SequenceAdapter:Ljava/lang/Class;

    if-nez v2, :cond_14e

    const-string v2, "freemarker.ext.beans.SequenceAdapter"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SequenceAdapter:Ljava/lang/Class;

    :goto_9f
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->SEQUENCEADAPTER_CLASS:Ljava/lang/Class;

    .line 129
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Set:Ljava/lang/Class;

    if-nez v2, :cond_152

    const-string v2, "java.util.Set"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Set:Ljava/lang/Class;

    :goto_ad
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->SET_CLASS:Ljava/lang/Class;

    .line 130
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SetAdapter:Ljava/lang/Class;

    if-nez v2, :cond_156

    const-string v2, "freemarker.ext.beans.SetAdapter"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SetAdapter:Ljava/lang/Class;

    :goto_bb
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->SETADAPTER_CLASS:Ljava/lang/Class;

    .line 131
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$String:Ljava/lang/Class;

    if-nez v2, :cond_15a

    const-string v2, "java.lang.String"

    invoke-static {v2}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$String:Ljava/lang/Class;

    :goto_c9
    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->STRING_CLASS:Ljava/lang/Class;

    .line 135
    :try_start_cb
    const-string v2, "java.lang.Iterable"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_d0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_cb .. :try_end_d0} :catch_15e

    move-result-object v1

    .line 141
    .local v1, "iterable":Ljava/lang/Class;
    :goto_d1
    sput-object v1, Lfreemarker/ext/beans/BeansWrapper;->ITERABLE_CLASS:Ljava/lang/Class;

    .line 147
    const-string v2, "true"

    const-string v3, "freemarker.development"

    invoke-static {v3}, Lfreemarker/template/utility/SecurityUtilities;->getSystemProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    sput-boolean v2, Lfreemarker/ext/beans/BeansWrapper;->DEVELOPMENT:Z

    .line 149
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->enumsModelCtor()Ljava/lang/reflect/Constructor;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->ENUMS_MODEL_CTOR:Ljava/lang/reflect/Constructor;

    .line 151
    const-string v2, "freemarker.beans"

    invoke-static {v2}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    .line 153
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->createUnsafeMethodsSet()Ljava/util/Set;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->UNSAFE_METHODS:Ljava/util/Set;

    .line 155
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    .line 156
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    .line 157
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    .line 159
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->isJavaRebelAvailable()Z

    move-result v2

    sput-boolean v2, Lfreemarker/ext/beans/BeansWrapper;->javaRebelAvailable:Z

    .line 164
    new-instance v2, Lfreemarker/ext/beans/BeansWrapper;

    invoke-direct {v2}, Lfreemarker/ext/beans/BeansWrapper;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->INSTANCE:Lfreemarker/ext/beans/BeansWrapper;

    .line 533
    new-instance v2, Lfreemarker/ext/beans/BeansWrapper$2;

    invoke-direct {v2}, Lfreemarker/ext/beans/BeansWrapper$2;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->ITERATOR_FACTORY:Lfreemarker/ext/util/ModelFactory;

    .line 539
    new-instance v2, Lfreemarker/ext/beans/BeansWrapper$3;

    invoke-direct {v2}, Lfreemarker/ext/beans/BeansWrapper$3;-><init>()V

    sput-object v2, Lfreemarker/ext/beans/BeansWrapper;->ENUMERATION_FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void

    .line 117
    .end local v1    # "iterable":Ljava/lang/Class;
    :cond_126
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    goto/16 :goto_13

    .line 118
    :cond_12a
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    goto/16 :goto_21

    .line 119
    :cond_12e
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Character:Ljava/lang/Class;

    goto/16 :goto_2f

    .line 120
    :cond_132
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    goto/16 :goto_3d

    .line 121
    :cond_136
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    goto/16 :goto_4b

    .line 122
    :cond_13a
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$HashAdapter:Ljava/lang/Class;

    goto/16 :goto_59

    .line 124
    :cond_13e
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$List:Ljava/lang/Class;

    goto/16 :goto_67

    .line 125
    :cond_142
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    goto/16 :goto_75

    .line 126
    :cond_146
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    goto/16 :goto_83

    .line 127
    :cond_14a
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Object:Ljava/lang/Class;

    goto/16 :goto_91

    .line 128
    :cond_14e
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SequenceAdapter:Ljava/lang/Class;

    goto/16 :goto_9f

    .line 129
    :cond_152
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Set:Ljava/lang/Class;

    goto/16 :goto_ad

    .line 130
    :cond_156
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$SetAdapter:Ljava/lang/Class;

    goto/16 :goto_bb

    .line 131
    :cond_15a
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$String:Ljava/lang/Class;

    goto/16 :goto_c9

    .line 137
    :catch_15e
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const/4 v1, 0x0

    .restart local v1    # "iterable":Ljava/lang/Class;
    goto/16 :goto_d1
.end method

.method public constructor <init>()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    .line 180
    invoke-static {}, Lfreemarker/core/_ConcurrentMapFactory;->newMaybeConcurrentHashMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    .line 182
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-static {v0}, Lfreemarker/core/_ConcurrentMapFactory;->isConcurrent(Ljava/util/Map;)Z

    move-result v0

    iput-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->isGenericClassIntrospectionCacheConcurrentMap:Z

    .line 184
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCacheClassNames:Ljava/util/Set;

    .line 186
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionsInProgress:Ljava/util/Set;

    .line 189
    new-instance v0, Lfreemarker/ext/beans/StaticModels;

    invoke-direct {v0, p0}, Lfreemarker/ext/beans/StaticModels;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->staticModels:Lfreemarker/ext/beans/StaticModels;

    .line 190
    invoke-static {p0}, Lfreemarker/ext/beans/BeansWrapper;->createEnumModels(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/ClassBasedModelFactory;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    .line 192
    new-instance v0, Lfreemarker/ext/beans/BeansModelCache;

    invoke-direct {v0, p0}, Lfreemarker/ext/beans/BeansModelCache;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    .line 194
    new-instance v0, Lfreemarker/ext/beans/BooleanModel;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, p0}, Lfreemarker/ext/beans/BooleanModel;-><init>(Ljava/lang/Boolean;Lfreemarker/ext/beans/BeansWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->FALSE:Lfreemarker/ext/beans/BooleanModel;

    .line 195
    new-instance v0, Lfreemarker/ext/beans/BooleanModel;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-direct {v0, v1, p0}, Lfreemarker/ext/beans/BooleanModel;-><init>(Ljava/lang/Boolean;Lfreemarker/ext/beans/BeansWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->TRUE:Lfreemarker/ext/beans/BooleanModel;

    .line 233
    iput v3, p0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    .line 234
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->nullModel:Lfreemarker/template/TemplateModel;

    .line 235
    iput-boolean v3, p0, Lfreemarker/ext/beans/BeansWrapper;->methodsShadowItems:Z

    .line 236
    iput-boolean v2, p0, Lfreemarker/ext/beans/BeansWrapper;->exposeFields:Z

    .line 237
    iput v2, p0, Lfreemarker/ext/beans/BeansWrapper;->defaultDateType:I

    .line 239
    iput-object p0, p0, Lfreemarker/ext/beans/BeansWrapper;->outerIdentity:Lfreemarker/template/ObjectWrapper;

    .line 241
    iput-boolean v2, p0, Lfreemarker/ext/beans/BeansWrapper;->strict:Z

    .line 527
    new-instance v0, Lfreemarker/ext/beans/BeansWrapper$1;

    invoke-direct {v0, p0}, Lfreemarker/ext/beans/BeansWrapper$1;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    iput-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->BOOLEAN_FACTORY:Lfreemarker/ext/util/ModelFactory;

    .line 253
    sget-boolean v0, Lfreemarker/ext/beans/BeansWrapper;->javaRebelAvailable:Z

    if-eqz v0, :cond_6b

    .line 254
    invoke-static {p0}, Lfreemarker/ext/beans/JavaRebelIntegration;->registerWrapper(Lfreemarker/ext/beans/BeansWrapper;)V

    .line 256
    :cond_6b
    return-void
.end method

.method static access$000(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/BooleanModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 114
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->TRUE:Lfreemarker/ext/beans/BooleanModel;

    return-object v0
.end method

.method static access$100(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/BooleanModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 114
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->FALSE:Lfreemarker/ext/beans/BooleanModel;

    return-object v0
.end method

.method static access$400()Ljava/lang/Class;
    .registers 1

    .prologue
    .line 114
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->STRING_CLASS:Ljava/lang/Class;

    return-object v0
.end method

.method static access$500()Ljava/lang/Class;
    .registers 1

    .prologue
    .line 114
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->OBJECT_CLASS:Ljava/lang/Class;

    return-object v0
.end method

.method private addBeanInfoToClassInrospectionData(Ljava/util/Map;Ljava/lang/Class;Ljava/util/Map;)V
    .registers 24
    .param p1, "introspData"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "accessibleMethods"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/beans/IntrospectionException;
        }
    .end annotation

    .prologue
    .line 1217
    invoke-static/range {p2 .. p2}, Ljava/beans/Introspector;->getBeanInfo(Ljava/lang/Class;)Ljava/beans/BeanInfo;

    move-result-object v5

    .line 1219
    .local v5, "beanInfo":Ljava/beans/BeanInfo;
    invoke-interface {v5}, Ljava/beans/BeanInfo;->getPropertyDescriptors()[Ljava/beans/PropertyDescriptor;

    move-result-object v13

    .line 1220
    .local v13, "pda":[Ljava/beans/PropertyDescriptor;
    if-eqz v13, :cond_21

    array-length v14, v13

    .line 1221
    .local v14, "pdaLength":I
    :goto_b
    add-int/lit8 v7, v14, -0x1

    .local v7, "i":I
    :goto_d
    if-ltz v7, :cond_23

    .line 1222
    aget-object v18, v13, v7

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p1

    invoke-direct {v0, v1, v2, v3, v4}, Lfreemarker/ext/beans/BeansWrapper;->addPropertyDescriptorToClassIntrospectionData(Ljava/beans/PropertyDescriptor;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)V

    .line 1221
    add-int/lit8 v7, v7, -0x1

    goto :goto_d

    .line 1220
    .end local v7    # "i":I
    .end local v14    # "pdaLength":I
    :cond_21
    const/4 v14, 0x0

    goto :goto_b

    .line 1227
    .restart local v7    # "i":I
    .restart local v14    # "pdaLength":I
    :cond_23
    move-object/from16 v0, p0

    iget v0, v0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    move/from16 v18, v0

    const/16 v19, 0x2

    move/from16 v0, v18

    move/from16 v1, v19

    if-ge v0, v1, :cond_ff

    .line 1229
    new-instance v6, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;

    invoke-direct {v6}, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;-><init>()V

    .line 1230
    .local v6, "decision":Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;
    invoke-interface {v5}, Ljava/beans/BeanInfo;->getMethodDescriptors()[Ljava/beans/MethodDescriptor;

    move-result-object v9

    .line 1231
    .local v9, "mda":[Ljava/beans/MethodDescriptor;
    if-eqz v9, :cond_c9

    array-length v10, v9

    .line 1232
    .local v10, "mdaLength":I
    :goto_3d
    add-int/lit8 v7, v10, -0x1

    :goto_3f
    if-ltz v7, :cond_ff

    .line 1234
    aget-object v8, v9, v7

    .line 1235
    .local v8, "md":Ljava/beans/MethodDescriptor;
    invoke-virtual {v8}, Ljava/beans/MethodDescriptor;->getMethod()Ljava/lang/reflect/Method;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->getAccessibleMethod(Ljava/lang/reflect/Method;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v17

    .line 1237
    .local v17, "publicMethod":Ljava/lang/reflect/Method;
    if-eqz v17, :cond_c5

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->isSafeMethod(Ljava/lang/reflect/Method;)Z

    move-result v18

    if-eqz v18, :cond_c5

    .line 1239
    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->setDefaults(Ljava/lang/reflect/Method;)V

    .line 1240
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2, v6}, Lfreemarker/ext/beans/BeansWrapper;->finetuneMethodAppearance(Ljava/lang/Class;Ljava/lang/reflect/Method;Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;)V

    .line 1242
    invoke-virtual {v6}, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->getExposeAsProperty()Ljava/beans/PropertyDescriptor;

    move-result-object v16

    .line 1243
    .local v16, "propDesc":Ljava/beans/PropertyDescriptor;
    if-eqz v16, :cond_90

    invoke-virtual/range {v16 .. v16}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    instance-of v0, v0, Ljava/beans/PropertyDescriptor;

    move/from16 v18, v0

    if-nez v18, :cond_90

    .line 1247
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p1

    invoke-direct {v0, v1, v2, v3, v4}, Lfreemarker/ext/beans/BeansWrapper;->addPropertyDescriptorToClassIntrospectionData(Ljava/beans/PropertyDescriptor;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)V

    .line 1252
    :cond_90
    invoke-virtual {v6}, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->getExposeMethodAs()Ljava/lang/String;

    move-result-object v11

    .line 1253
    .local v11, "methodKey":Ljava/lang/String;
    if-eqz v11, :cond_c5

    .line 1255
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    .line 1256
    .local v15, "previous":Ljava/lang/Object;
    instance-of v0, v15, Ljava/lang/reflect/Method;

    move/from16 v18, v0

    if-eqz v18, :cond_cc

    .line 1259
    new-instance v12, Lfreemarker/ext/beans/OverloadedMethods;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lfreemarker/ext/beans/OverloadedMethods;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    .local v12, "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    move-object/from16 v18, v15

    .line 1260
    check-cast v18, Ljava/lang/reflect/Method;

    move-object/from16 v0, v18

    invoke-virtual {v12, v0}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    .line 1261
    move-object/from16 v0, v17

    invoke-virtual {v12, v0}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    .line 1262
    move-object/from16 v0, p1

    invoke-interface {v0, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1264
    invoke-static/range {p1 .. p1}, Lfreemarker/ext/beans/BeansWrapper;->getArgTypes(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v15}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1232
    .end local v11    # "methodKey":Ljava/lang/String;
    .end local v12    # "overloadedMethods":Lfreemarker/ext/beans/OverloadedMethods;
    .end local v15    # "previous":Ljava/lang/Object;
    .end local v16    # "propDesc":Ljava/beans/PropertyDescriptor;
    :cond_c5
    :goto_c5
    add-int/lit8 v7, v7, -0x1

    goto/16 :goto_3f

    .line 1231
    .end local v8    # "md":Ljava/beans/MethodDescriptor;
    .end local v10    # "mdaLength":I
    .end local v17    # "publicMethod":Ljava/lang/reflect/Method;
    :cond_c9
    const/4 v10, 0x0

    goto/16 :goto_3d

    .line 1266
    .restart local v8    # "md":Ljava/beans/MethodDescriptor;
    .restart local v10    # "mdaLength":I
    .restart local v11    # "methodKey":Ljava/lang/String;
    .restart local v15    # "previous":Ljava/lang/Object;
    .restart local v16    # "propDesc":Ljava/beans/PropertyDescriptor;
    .restart local v17    # "publicMethod":Ljava/lang/reflect/Method;
    :cond_cc
    instance-of v0, v15, Lfreemarker/ext/beans/OverloadedMethods;

    move/from16 v18, v0

    if-eqz v18, :cond_da

    .line 1269
    check-cast v15, Lfreemarker/ext/beans/OverloadedMethods;

    .end local v15    # "previous":Ljava/lang/Object;
    move-object/from16 v0, v17

    invoke-virtual {v15, v0}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    goto :goto_c5

    .line 1271
    .restart local v15    # "previous":Ljava/lang/Object;
    :cond_da
    invoke-virtual {v6}, Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;->getMethodShadowsProperty()Z

    move-result v18

    if-nez v18, :cond_e6

    instance-of v0, v15, Ljava/beans/PropertyDescriptor;

    move/from16 v18, v0

    if-nez v18, :cond_c5

    .line 1275
    :cond_e6
    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1276
    invoke-static/range {p1 .. p1}, Lfreemarker/ext/beans/BeansWrapper;->getArgTypes(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v18

    invoke-virtual/range {v17 .. v17}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v19

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c5

    .line 1283
    .end local v6    # "decision":Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;
    .end local v8    # "md":Ljava/beans/MethodDescriptor;
    .end local v9    # "mda":[Ljava/beans/MethodDescriptor;
    .end local v10    # "mdaLength":I
    .end local v11    # "methodKey":Ljava/lang/String;
    .end local v15    # "previous":Ljava/lang/Object;
    .end local v16    # "propDesc":Ljava/beans/PropertyDescriptor;
    .end local v17    # "publicMethod":Ljava/lang/reflect/Method;
    :cond_ff
    return-void
.end method

.method private addConstructorsToClassIntrospectionData(Ljava/util/Map;Ljava/lang/Class;)V
    .registers 11
    .param p1, "introspData"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;

    .prologue
    const/4 v6, 0x1

    .line 1355
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v2

    .line 1356
    .local v2, "ctors":[Ljava/lang/reflect/Constructor;
    array-length v5, v2

    if-ne v5, v6, :cond_1a

    .line 1358
    const/4 v5, 0x0

    aget-object v0, v2, v5

    .line 1359
    .local v0, "ctor":Ljava/lang/reflect/Constructor;
    sget-object v5, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    new-instance v6, Lfreemarker/ext/beans/SimpleMemberModel;

    invoke-virtual {v0}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v7

    invoke-direct {v6, v0, v7}, Lfreemarker/ext/beans/SimpleMemberModel;-><init>(Ljava/lang/reflect/Member;[Ljava/lang/Class;)V

    invoke-interface {p1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1376
    .end local v0    # "ctor":Ljava/lang/reflect/Constructor;
    .end local v2    # "ctors":[Ljava/lang/reflect/Constructor;
    :cond_19
    :goto_19
    return-void

    .line 1361
    .restart local v2    # "ctors":[Ljava/lang/reflect/Constructor;
    :cond_1a
    array-length v5, v2

    if-le v5, v6, :cond_19

    .line 1363
    new-instance v1, Lfreemarker/ext/beans/OverloadedMethods;

    invoke-direct {v1, p0}, Lfreemarker/ext/beans/OverloadedMethods;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    .line 1364
    .local v1, "ctorMap":Lfreemarker/ext/beans/OverloadedMethods;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_23
    array-length v5, v2

    if-ge v4, v5, :cond_2e

    .line 1366
    aget-object v5, v2, v4

    invoke-virtual {v1, v5}, Lfreemarker/ext/beans/OverloadedMethods;->addMember(Ljava/lang/reflect/Member;)V

    .line 1364
    add-int/lit8 v4, v4, 0x1

    goto :goto_23

    .line 1368
    :cond_2e
    sget-object v5, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    invoke-interface {p1, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_33} :catch_34

    goto :goto_19

    .line 1371
    .end local v1    # "ctorMap":Lfreemarker/ext/beans/OverloadedMethods;
    .end local v2    # "ctors":[Ljava/lang/reflect/Constructor;
    .end local v4    # "i":I
    :catch_34
    move-exception v3

    .line 1373
    .local v3, "e":Ljava/lang/SecurityException;
    sget-object v5, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Canont discover constructors for class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v3}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_19
.end method

.method private addFieldsToClassIntrospectionData(Ljava/util/Map;Ljava/lang/Class;)V
    .registers 7
    .param p1, "introspData"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 1204
    invoke-virtual {p2}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    .line 1205
    .local v1, "fields":[Ljava/lang/reflect/Field;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_5
    array-length v3, v1

    if-ge v2, v3, :cond_1c

    .line 1207
    aget-object v0, v1, v2

    .line 1208
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v3

    and-int/lit8 v3, v3, 0x8

    if-nez v3, :cond_19

    .line 1210
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1205
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 1213
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_1c
    return-void
.end method

.method private addGenericGetToClassIntrospectionData(Ljava/util/Map;Ljava/util/Map;)V
    .registers 5
    .param p1, "introspData"    # Ljava/util/Map;
    .param p2, "accessibleMethods"    # Ljava/util/Map;

    .prologue
    .line 1338
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->access$200()Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    move-result-object v1

    invoke-static {v1, p2}, Lfreemarker/ext/beans/BeansWrapper;->getFirstAccessibleMethod(Lfreemarker/ext/beans/BeansWrapper$MethodSignature;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1340
    .local v0, "genericGet":Ljava/lang/reflect/Method;
    if-nez v0, :cond_12

    .line 1342
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;->access$300()Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    move-result-object v1

    invoke-static {v1, p2}, Lfreemarker/ext/beans/BeansWrapper;->getFirstAccessibleMethod(Lfreemarker/ext/beans/BeansWrapper$MethodSignature;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 1345
    :cond_12
    if-eqz v0, :cond_19

    .line 1347
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1349
    :cond_19
    return-void
.end method

.method private addPropertyDescriptorToClassIntrospectionData(Ljava/beans/PropertyDescriptor;Ljava/lang/Class;Ljava/util/Map;Ljava/util/Map;)V
    .registers 15
    .param p1, "pd"    # Ljava/beans/PropertyDescriptor;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "accessibleMethods"    # Ljava/util/Map;
    .param p4, "classMap"    # Ljava/util/Map;

    .prologue
    .line 1287
    instance-of v1, p1, Ljava/beans/IndexedPropertyDescriptor;

    if-eqz v1, :cond_72

    move-object v7, p1

    .line 1288
    check-cast v7, Ljava/beans/IndexedPropertyDescriptor;

    .line 1290
    .local v7, "ipd":Ljava/beans/IndexedPropertyDescriptor;
    invoke-virtual {v7}, Ljava/beans/IndexedPropertyDescriptor;->getIndexedReadMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    .line 1291
    .local v9, "readMethod":Ljava/lang/reflect/Method;
    invoke-static {v9, p3}, Lfreemarker/ext/beans/BeansWrapper;->getAccessibleMethod(Ljava/lang/reflect/Method;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1293
    .local v4, "publicReadMethod":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_da

    invoke-virtual {p0, v4}, Lfreemarker/ext/beans/BeansWrapper;->isSafeMethod(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-eqz v1, :cond_da

    .line 1295
    if-eq v9, v4, :cond_d7

    .line 1296
    :try_start_19
    new-instance v0, Ljava/beans/IndexedPropertyDescriptor;

    invoke-virtual {v7}, Ljava/beans/IndexedPropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7}, Ljava/beans/IndexedPropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Ljava/beans/IndexedPropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    :try_end_28
    .catch Ljava/beans/IntrospectionException; {:try_start_19 .. :try_end_28} :catch_3b

    .line 1301
    .end local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .local v0, "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :goto_28
    :try_start_28
    invoke-virtual {v0}, Ljava/beans/IndexedPropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p4, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    invoke-static {p4}, Lfreemarker/ext/beans/BeansWrapper;->getArgTypes(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/beans/IntrospectionException; {:try_start_28 .. :try_end_3a} :catch_d4

    .line 1334
    .end local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :cond_3a
    :goto_3a
    return-void

    .line 1305
    .restart local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :catch_3b
    move-exception v6

    move-object v0, v7

    .line 1306
    .end local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .local v6, "e":Ljava/beans/IntrospectionException;
    :goto_3d
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Failed creating a publicly-accessible property descriptor for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " indexed property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", read method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3a

    .line 1315
    .end local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .end local v4    # "publicReadMethod":Ljava/lang/reflect/Method;
    .end local v6    # "e":Ljava/beans/IntrospectionException;
    .end local v9    # "readMethod":Ljava/lang/reflect/Method;
    :cond_72
    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getReadMethod()Ljava/lang/reflect/Method;

    move-result-object v9

    .line 1316
    .restart local v9    # "readMethod":Ljava/lang/reflect/Method;
    invoke-static {v9, p3}, Lfreemarker/ext/beans/BeansWrapper;->getAccessibleMethod(Ljava/lang/reflect/Method;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 1317
    .restart local v4    # "publicReadMethod":Ljava/lang/reflect/Method;
    if-eqz v4, :cond_3a

    invoke-virtual {p0, v4}, Lfreemarker/ext/beans/BeansWrapper;->isSafeMethod(Ljava/lang/reflect/Method;)Z

    move-result v1

    if-eqz v1, :cond_3a

    .line 1319
    if-eq v9, v4, :cond_92

    .line 1320
    :try_start_84
    new-instance v8, Ljava/beans/PropertyDescriptor;

    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v8, v1, v4, v2}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/reflect/Method;Ljava/lang/reflect/Method;)V
    :try_end_8e
    .catch Ljava/beans/IntrospectionException; {:try_start_84 .. :try_end_8e} :catch_9a

    .line 1322
    .end local p1    # "pd":Ljava/beans/PropertyDescriptor;
    .local v8, "pd":Ljava/beans/PropertyDescriptor;
    :try_start_8e
    invoke-virtual {v8, v4}, Ljava/beans/PropertyDescriptor;->setReadMethod(Ljava/lang/reflect/Method;)V
    :try_end_91
    .catch Ljava/beans/IntrospectionException; {:try_start_8e .. :try_end_91} :catch_d1

    move-object p1, v8

    .line 1324
    .end local v8    # "pd":Ljava/beans/PropertyDescriptor;
    .restart local p1    # "pd":Ljava/beans/PropertyDescriptor;
    :cond_92
    :try_start_92
    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p4, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_99
    .catch Ljava/beans/IntrospectionException; {:try_start_92 .. :try_end_99} :catch_9a

    goto :goto_3a

    .line 1326
    :catch_9a
    move-exception v6

    .line 1327
    .restart local v6    # "e":Ljava/beans/IntrospectionException;
    :goto_9b
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Failed creating a publicly-accessible property descriptor for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " property "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/beans/PropertyDescriptor;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ", read method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a

    .line 1326
    .end local v6    # "e":Ljava/beans/IntrospectionException;
    .end local p1    # "pd":Ljava/beans/PropertyDescriptor;
    .restart local v8    # "pd":Ljava/beans/PropertyDescriptor;
    :catch_d1
    move-exception v6

    move-object p1, v8

    .end local v8    # "pd":Ljava/beans/PropertyDescriptor;
    .restart local p1    # "pd":Ljava/beans/PropertyDescriptor;
    goto :goto_9b

    .line 1305
    .restart local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :catch_d4
    move-exception v6

    goto/16 :goto_3d

    .end local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :cond_d7
    move-object v0, v7

    .end local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    goto/16 :goto_28

    .end local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    :cond_da
    move-object v0, v7

    .end local v7    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    .restart local v0    # "ipd":Ljava/beans/IndexedPropertyDescriptor;
    goto/16 :goto_3a
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 117
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private clearGenericClassIntrospectionCache()V
    .registers 3

    .prologue
    .line 1121
    iget-object v1, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1122
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 1123
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCacheClassNames:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 1124
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0}, Lfreemarker/ext/util/ModelCache;->clearCache()V

    .line 1125
    monitor-exit v1

    .line 1126
    return-void

    .line 1125
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw v0
.end method

.method public static coerceBigDecimal(Ljava/math/BigDecimal;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 5
    .param p0, "bd"    # Ljava/math/BigDecimal;
    .param p1, "formalType"    # Ljava/lang/Class;

    .prologue
    .line 1729
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_12

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_1d

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_10
    if-ne p1, v0, :cond_20

    .line 1730
    :cond_12
    new-instance v0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->intValue()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object p0, v0

    .line 1750
    .end local p0    # "bd":Ljava/math/BigDecimal;
    :cond_1c
    :goto_1c
    return-object p0

    .line 1729
    .restart local p0    # "bd":Ljava/math/BigDecimal;
    :cond_1d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_10

    .line 1732
    :cond_20
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_32

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_3d

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    :goto_30
    if-ne p1, v0, :cond_40

    .line 1733
    :cond_32
    new-instance v0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    move-object p0, v0

    goto :goto_1c

    .line 1732
    :cond_3d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_30

    .line 1735
    :cond_40
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_52

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_5d

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    :goto_50
    if-ne p1, v0, :cond_60

    .line 1736
    :cond_52
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    move-object p0, v0

    goto :goto_1c

    .line 1735
    :cond_5d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_50

    .line 1738
    :cond_60
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_72

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_7d

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    :goto_70
    if-ne p1, v0, :cond_80

    .line 1739
    :cond_72
    new-instance v0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->floatValue()F

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    move-object p0, v0

    goto :goto_1c

    .line 1738
    :cond_7d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_70

    .line 1741
    :cond_80
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_92

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_9d

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    :goto_90
    if-ne p1, v0, :cond_a0

    .line 1742
    :cond_92
    new-instance v0, Ljava/lang/Short;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->shortValue()S

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    move-object p0, v0

    goto :goto_1c

    .line 1741
    :cond_9d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_90

    .line 1744
    :cond_a0
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_b2

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_be

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_b0
    if-ne p1, v0, :cond_c1

    .line 1745
    :cond_b2
    new-instance v0, Ljava/lang/Byte;

    invoke-virtual {p0}, Ljava/math/BigDecimal;->byteValue()B

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Byte;-><init>(B)V

    move-object p0, v0

    goto/16 :goto_1c

    .line 1744
    :cond_be
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_b0

    .line 1747
    :cond_c1
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->BIGINTEGER_CLASS:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 1748
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toBigInteger()Ljava/math/BigInteger;

    move-result-object p0

    goto/16 :goto_1c
.end method

.method public static coerceBigDecimals(Ljava/lang/reflect/AccessibleObject;[Ljava/lang/Object;)V
    .registers 8
    .param p0, "callable"    # Ljava/lang/reflect/AccessibleObject;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1679
    const/4 v1, 0x0

    .line 1680
    .local v1, "formalTypes":[Ljava/lang/Class;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v3, p1

    if-ge v2, v3, :cond_52

    .line 1681
    aget-object v0, p1, v2

    .line 1682
    .local v0, "arg":Ljava/lang/Object;
    instance-of v3, v0, Ljava/math/BigDecimal;

    if-eqz v3, :cond_22

    .line 1683
    if-nez v1, :cond_18

    .line 1684
    instance-of v3, p0, Ljava/lang/reflect/Method;

    if-eqz v3, :cond_25

    move-object v3, p0

    .line 1685
    check-cast v3, Ljava/lang/reflect/Method;

    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    .line 1696
    :cond_18
    :goto_18
    check-cast v0, Ljava/math/BigDecimal;

    .end local v0    # "arg":Ljava/lang/Object;
    aget-object v3, v1, v2

    invoke-static {v0, v3}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimal(Ljava/math/BigDecimal;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    aput-object v3, p1, v2

    .line 1680
    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1687
    .restart local v0    # "arg":Ljava/lang/Object;
    :cond_25
    instance-of v3, p0, Ljava/lang/reflect/Constructor;

    if-eqz v3, :cond_31

    move-object v3, p0

    .line 1688
    check-cast v3, Ljava/lang/reflect/Constructor;

    invoke-virtual {v3}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v1

    goto :goto_18

    .line 1691
    :cond_31
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Expected method or  constructor; callable is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1699
    .end local v0    # "arg":Ljava/lang/Object;
    :cond_52
    return-void
.end method

.method public static coerceBigDecimals([Ljava/lang/Class;[Ljava/lang/Object;)V
    .registers 9
    .param p0, "formalTypes"    # [Ljava/lang/Class;
    .param p1, "args"    # [Ljava/lang/Object;

    .prologue
    .line 1707
    array-length v4, p0

    .line 1708
    .local v4, "typeLen":I
    array-length v1, p1

    .line 1709
    .local v1, "argsLen":I
    invoke-static {v4, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1710
    .local v3, "min":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    if-ge v2, v3, :cond_1c

    .line 1711
    aget-object v0, p1, v2

    .line 1712
    .local v0, "arg":Ljava/lang/Object;
    instance-of v6, v0, Ljava/math/BigDecimal;

    if-eqz v6, :cond_19

    .line 1713
    check-cast v0, Ljava/math/BigDecimal;

    .end local v0    # "arg":Ljava/lang/Object;
    aget-object v6, p0, v2

    invoke-static {v0, v6}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimal(Ljava/math/BigDecimal;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, p1, v2

    .line 1710
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 1716
    :cond_1c
    if-le v1, v4, :cond_36

    .line 1717
    add-int/lit8 v6, v4, -0x1

    aget-object v5, p0, v6

    .line 1718
    .local v5, "varArgType":Ljava/lang/Class;
    move v2, v4

    :goto_23
    if-ge v2, v1, :cond_36

    .line 1719
    aget-object v0, p1, v2

    .line 1720
    .restart local v0    # "arg":Ljava/lang/Object;
    instance-of v6, v0, Ljava/math/BigDecimal;

    if-eqz v6, :cond_33

    .line 1721
    check-cast v0, Ljava/math/BigDecimal;

    .end local v0    # "arg":Ljava/lang/Object;
    invoke-static {v0, v5}, Lfreemarker/ext/beans/BeansWrapper;->coerceBigDecimal(Ljava/math/BigDecimal;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    aput-object v6, p1, v2

    .line 1718
    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_23

    .line 1725
    .end local v5    # "varArgType":Ljava/lang/Class;
    :cond_36
    return-void
.end method

.method private static convertUnwrappedNumber(Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;
    .registers 5
    .param p0, "hint"    # Ljava/lang/Class;
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    .line 837
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_12

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "java.lang.Integer"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    :goto_10
    if-ne p0, v0, :cond_27

    .line 838
    :cond_12
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_1c

    check-cast p1, Ljava/lang/Integer;

    .line 885
    .end local p1    # "number":Ljava/lang/Number;
    :cond_18
    :goto_18
    return-object p1

    .line 837
    .restart local p1    # "number":Ljava/lang/Number;
    :cond_19
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Integer:Ljava/lang/Class;

    goto :goto_10

    .line 838
    :cond_1c
    new-instance v0, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    move-object p1, v0

    goto :goto_18

    .line 841
    :cond_27
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_39

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    if-nez v0, :cond_40

    const-string v0, "java.lang.Long"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    :goto_37
    if-ne p0, v0, :cond_4e

    .line 842
    :cond_39
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_43

    check-cast p1, Ljava/lang/Long;

    goto :goto_18

    .line 841
    :cond_40
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Long:Ljava/lang/Class;

    goto :goto_37

    .line 842
    :cond_43
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    move-object p1, v0

    goto :goto_18

    .line 845
    :cond_4e
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_60

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    if-nez v0, :cond_67

    const-string v0, "java.lang.Float"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    :goto_5e
    if-ne p0, v0, :cond_75

    .line 846
    :cond_60
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_6a

    check-cast p1, Ljava/lang/Float;

    goto :goto_18

    .line 845
    :cond_67
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Float:Ljava/lang/Class;

    goto :goto_5e

    .line 846
    :cond_6a
    new-instance v0, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Float;-><init>(F)V

    move-object p1, v0

    goto :goto_18

    .line 849
    :cond_75
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_87

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    if-nez v0, :cond_8e

    const-string v0, "java.lang.Double"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    :goto_85
    if-ne p0, v0, :cond_9d

    .line 851
    :cond_87
    instance-of v0, p1, Ljava/lang/Double;

    if-eqz v0, :cond_91

    check-cast p1, Ljava/lang/Double;

    goto :goto_18

    .line 849
    :cond_8e
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Double:Ljava/lang/Class;

    goto :goto_85

    .line 851
    :cond_91
    new-instance v0, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/lang/Double;-><init>(D)V

    move-object p1, v0

    goto/16 :goto_18

    .line 854
    :cond_9d
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_af

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    if-nez v0, :cond_b7

    const-string v0, "java.lang.Byte"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    :goto_ad
    if-ne p0, v0, :cond_c6

    .line 855
    :cond_af
    instance-of v0, p1, Ljava/lang/Byte;

    if-eqz v0, :cond_ba

    check-cast p1, Ljava/lang/Byte;

    goto/16 :goto_18

    .line 854
    :cond_b7
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Byte:Ljava/lang/Class;

    goto :goto_ad

    .line 855
    :cond_ba
    new-instance v0, Ljava/lang/Byte;

    invoke-virtual {p1}, Ljava/lang/Number;->byteValue()B

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Byte;-><init>(B)V

    move-object p1, v0

    goto/16 :goto_18

    .line 858
    :cond_c6
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_d8

    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    if-nez v0, :cond_e0

    const-string v0, "java.lang.Short"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    :goto_d6
    if-ne p0, v0, :cond_ef

    .line 859
    :cond_d8
    instance-of v0, p1, Ljava/lang/Short;

    if-eqz v0, :cond_e3

    check-cast p1, Ljava/lang/Short;

    goto/16 :goto_18

    .line 858
    :cond_e0
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Short:Ljava/lang/Class;

    goto :goto_d6

    .line 859
    :cond_e3
    new-instance v0, Ljava/lang/Short;

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    move-object p1, v0

    goto/16 :goto_18

    .line 862
    :cond_ef
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    if-nez v0, :cond_10d

    const-string v0, "java.math.BigInteger"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    :goto_fb
    if-ne p0, v0, :cond_110

    .line 863
    instance-of v0, p1, Ljava/math/BigInteger;

    if-nez v0, :cond_18

    new-instance v0, Ljava/math/BigInteger;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    goto/16 :goto_18

    .line 862
    :cond_10d
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigInteger:Ljava/lang/Class;

    goto :goto_fb

    .line 866
    :cond_110
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigDecimal:Ljava/lang/Class;

    if-nez v0, :cond_130

    const-string v0, "java.math.BigDecimal"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigDecimal:Ljava/lang/Class;

    :goto_11c
    if-ne p0, v0, :cond_14f

    .line 867
    instance-of v0, p1, Ljava/math/BigDecimal;

    if-nez v0, :cond_18

    .line 870
    instance-of v0, p1, Ljava/math/BigInteger;

    if-eqz v0, :cond_133

    .line 871
    new-instance v0, Ljava/math/BigDecimal;

    check-cast p1, Ljava/math/BigInteger;

    .end local p1    # "number":Ljava/lang/Number;
    invoke-direct {v0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/math/BigInteger;)V

    move-object p1, v0

    goto/16 :goto_18

    .line 866
    .restart local p1    # "number":Ljava/lang/Number;
    :cond_130
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$math$BigDecimal:Ljava/lang/Class;

    goto :goto_11c

    .line 873
    :cond_133
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_143

    .line 876
    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    goto/16 :goto_18

    .line 878
    :cond_143
    new-instance v0, Ljava/math/BigDecimal;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    move-object p1, v0

    goto/16 :goto_18

    .line 882
    :cond_14f
    invoke-virtual {p0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    .line 885
    const/4 p1, 0x0

    goto/16 :goto_18
.end method

.method private createClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;
    .registers 8
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1170
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 1172
    .local v2, "introspData":Ljava/util/Map;
    iget-boolean v3, p0, Lfreemarker/ext/beans/BeansWrapper;->exposeFields:Z

    if-eqz v3, :cond_c

    .line 1173
    invoke-direct {p0, v2, p1}, Lfreemarker/ext/beans/BeansWrapper;->addFieldsToClassIntrospectionData(Ljava/util/Map;Ljava/lang/Class;)V

    .line 1176
    :cond_c
    invoke-static {p1}, Lfreemarker/ext/beans/BeansWrapper;->discoverAccessibleMethods(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v0

    .line 1178
    .local v0, "accessibleMethods":Ljava/util/Map;
    invoke-direct {p0, v2, v0}, Lfreemarker/ext/beans/BeansWrapper;->addGenericGetToClassIntrospectionData(Ljava/util/Map;Ljava/util/Map;)V

    .line 1180
    iget v3, p0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    const/4 v4, 0x3

    if-eq v3, v4, :cond_1b

    .line 1182
    :try_start_18
    invoke-direct {p0, v2, p1, v0}, Lfreemarker/ext/beans/BeansWrapper;->addBeanInfoToClassInrospectionData(Ljava/util/Map;Ljava/lang/Class;Ljava/util/Map;)V
    :try_end_1b
    .catch Ljava/beans/IntrospectionException; {:try_start_18 .. :try_end_1b} :catch_26

    .line 1190
    :cond_1b
    :goto_1b
    invoke-direct {p0, v2, p1}, Lfreemarker/ext/beans/BeansWrapper;->addConstructorsToClassIntrospectionData(Ljava/util/Map;Ljava/lang/Class;)V

    .line 1192
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_43

    .line 1198
    .end local v2    # "introspData":Ljava/util/Map;
    :goto_25
    return-object v2

    .line 1183
    .restart local v2    # "introspData":Ljava/util/Map;
    :catch_26
    move-exception v1

    .line 1184
    .local v1, "e":Ljava/beans/IntrospectionException;
    sget-object v3, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Couldn\'t properly perform introspection for class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1186
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    goto :goto_1b

    .line 1194
    .end local v1    # "e":Ljava/beans/IntrospectionException;
    :cond_43
    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    if-nez v3, :cond_4c

    .line 1195
    sget-object v2, Lfreemarker/template/utility/Collections12;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_25

    .line 1197
    :cond_4c
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 1198
    .local v1, "e":Ljava/util/Map$Entry;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Lfreemarker/template/utility/Collections12;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    goto :goto_25
.end method

.method private static createEnumModels(Lfreemarker/ext/beans/BeansWrapper;)Lfreemarker/ext/beans/ClassBasedModelFactory;
    .registers 5
    .param p0, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 1754
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->ENUMS_MODEL_CTOR:Ljava/lang/reflect/Constructor;

    if-eqz v1, :cond_1a

    .line 1756
    :try_start_4
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->ENUMS_MODEL_CTOR:Ljava/lang/reflect/Constructor;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/ext/beans/ClassBasedModelFactory;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_12} :catch_13

    .line 1762
    :goto_12
    return-object v1

    .line 1758
    :catch_13
    move-exception v0

    .line 1759
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1762
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1a
    const/4 v1, 0x0

    goto :goto_12
.end method

.method private static createPrimitiveClassesMap()Ljava/util/Map;
    .registers 3

    .prologue
    .line 1660
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1661
    .local v0, "map":Ljava/util/Map;
    const-string v1, "boolean"

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1662
    const-string v1, "byte"

    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1663
    const-string v1, "char"

    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1664
    const-string v1, "short"

    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1665
    const-string v1, "int"

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1666
    const-string v1, "long"

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1667
    const-string v1, "float"

    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1668
    const-string v1, "double"

    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1669
    return-object v0
.end method

.method private static final createUnsafeMethodsSet()Ljava/util/Set;
    .registers 11

    .prologue
    .line 1589
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    .line 1590
    .local v6, "props":Ljava/util/Properties;
    sget-object v8, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    if-nez v8, :cond_91

    const-string v8, "freemarker.ext.beans.BeansWrapper"

    invoke-static {v8}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    sput-object v8, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    :goto_11
    const-string v9, "unsafeMethods.txt"

    invoke-virtual {v8, v9}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2

    .line 1591
    .local v2, "in":Ljava/io/InputStream;
    if-eqz v2, :cond_a0

    .line 1593
    const/4 v4, 0x0

    .line 1598
    .local v4, "methodSpec":Ljava/lang/String;
    :try_start_1a
    invoke-virtual {v6, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_95

    .line 1602
    :try_start_1d
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 1604
    new-instance v7, Ljava/util/HashSet;

    invoke-virtual {v6}, Ljava/util/Properties;->size()I

    move-result v8

    mul-int/lit8 v8, v8, 0x4

    div-int/lit8 v8, v8, 0x3

    const/high16 v9, 0x3f400000    # 0.75f

    invoke-direct {v7, v8, v9}, Ljava/util/HashSet;-><init>(IF)V

    .line 1605
    .local v7, "set":Ljava/util/Set;
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->createPrimitiveClassesMap()Ljava/util/Map;

    move-result-object v5

    .line 1606
    .local v5, "primClasses":Ljava/util/Map;
    invoke-virtual {v6}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "iterator":Ljava/util/Iterator;
    :cond_3b
    :goto_3b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_a2

    .line 1608
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v4, v0
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_49} :catch_57

    .line 1610
    :try_start_49
    invoke-static {v4, v5}, Lfreemarker/ext/beans/BeansWrapper;->parseMethodSpec(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_50
    .catch Ljava/lang/ClassNotFoundException; {:try_start_49 .. :try_end_50} :catch_51
    .catch Ljava/lang/NoSuchMethodException; {:try_start_49 .. :try_end_50} :catch_9a
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_50} :catch_57

    goto :goto_3b

    .line 1612
    :catch_51
    move-exception v1

    .line 1613
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    :try_start_52
    sget-boolean v8, Lfreemarker/ext/beans/BeansWrapper;->DEVELOPMENT:Z

    if-eqz v8, :cond_3b

    .line 1614
    throw v1
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_57} :catch_57

    .line 1625
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    .end local v3    # "iterator":Ljava/util/Iterator;
    .end local v5    # "primClasses":Ljava/util/Map;
    .end local v7    # "set":Ljava/util/Set;
    :catch_57
    move-exception v1

    .line 1627
    .local v1, "e":Ljava/lang/Exception;
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Could not load unsafe method "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 1590
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "in":Ljava/io/InputStream;
    .end local v4    # "methodSpec":Ljava/lang/String;
    :cond_91
    sget-object v8, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    goto/16 :goto_11

    .line 1602
    .restart local v2    # "in":Ljava/io/InputStream;
    .restart local v4    # "methodSpec":Ljava/lang/String;
    :catchall_95
    move-exception v8

    :try_start_96
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    throw v8

    .line 1617
    .restart local v3    # "iterator":Ljava/util/Iterator;
    .restart local v5    # "primClasses":Ljava/util/Map;
    .restart local v7    # "set":Ljava/util/Set;
    :catch_9a
    move-exception v1

    .line 1618
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    sget-boolean v8, Lfreemarker/ext/beans/BeansWrapper;->DEVELOPMENT:Z

    if-eqz v8, :cond_3b

    .line 1619
    throw v1
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_96 .. :try_end_a0} :catch_57

    .line 1630
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    .end local v3    # "iterator":Ljava/util/Iterator;
    .end local v4    # "methodSpec":Ljava/lang/String;
    .end local v5    # "primClasses":Ljava/util/Map;
    .end local v7    # "set":Ljava/util/Set;
    :cond_a0
    sget-object v7, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    :cond_a2
    return-object v7
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;)Ljava/util/Map;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1492
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1493
    .local v0, "map":Ljava/util/Map;
    invoke-static {p0, v0}, Lfreemarker/ext/beans/BeansWrapper;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;)V

    .line 1494
    return-object v0
.end method

.method private static discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;)V
    .registers 13
    .param p0, "clazz"    # Ljava/lang/Class;
    .param p1, "map"    # Ljava/util/Map;

    .prologue
    .line 1499
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v8

    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v8

    if-eqz v8, :cond_52

    .line 1503
    :try_start_a
    invoke-virtual {p0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    .line 1504
    .local v5, "methods":[Ljava/lang/reflect/Method;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_f
    array-length v8, v5

    if-ge v1, v8, :cond_6b

    .line 1506
    aget-object v3, v5, v1

    .line 1507
    .local v3, "method":Ljava/lang/reflect/Method;
    new-instance v6, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    invoke-direct {v6, v3}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 1519
    .local v6, "sig":Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 1520
    .local v4, "methodList":Ljava/util/List;
    if-nez v4, :cond_29

    .line 1521
    new-instance v4, Ljava/util/LinkedList;

    .end local v4    # "methodList":Ljava/util/List;
    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 1522
    .restart local v4    # "methodList":Ljava/util/List;
    invoke-interface {p1, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1524
    :cond_29
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2c
    .catch Ljava/lang/SecurityException; {:try_start_a .. :try_end_2c} :catch_2f

    .line 1504
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    .line 1528
    .end local v1    # "i":I
    .end local v3    # "method":Ljava/lang/reflect/Method;
    .end local v4    # "methodList":Ljava/util/List;
    .end local v5    # "methods":[Ljava/lang/reflect/Method;
    .end local v6    # "sig":Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    :catch_2f
    move-exception v0

    .line 1530
    .local v0, "e":Ljava/lang/SecurityException;
    sget-object v8, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Could not discover accessible methods of class "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ", attemping superclasses/interfaces."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9, v0}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1538
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_52
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v2

    .line 1539
    .local v2, "interfaces":[Ljava/lang/Class;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_57
    array-length v8, v2

    if-ge v1, v8, :cond_62

    .line 1541
    aget-object v8, v2, v1

    invoke-static {v8, p1}, Lfreemarker/ext/beans/BeansWrapper;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;)V

    .line 1539
    add-int/lit8 v1, v1, 0x1

    goto :goto_57

    .line 1543
    :cond_62
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v7

    .line 1544
    .local v7, "superclass":Ljava/lang/Class;
    if-eqz v7, :cond_6b

    .line 1546
    invoke-static {v7, p1}, Lfreemarker/ext/beans/BeansWrapper;->discoverAccessibleMethods(Ljava/lang/Class;Ljava/util/Map;)V

    .line 1548
    .end local v2    # "interfaces":[Ljava/lang/Class;
    .end local v7    # "superclass":Ljava/lang/Class;
    :cond_6b
    return-void
.end method

.method private static enumsModelCtor()Ljava/lang/reflect/Constructor;
    .registers 5

    .prologue
    .line 1769
    :try_start_0
    const-string v1, "java.lang.Enum"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 1771
    const-string v1, "freemarker.ext.beans._EnumModels"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Class;

    const/4 v4, 0x0

    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    if-nez v1, :cond_22

    const-string v1, "freemarker.ext.beans.BeansWrapper"

    invoke-static {v1}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    :goto_1b
    aput-object v1, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    .line 1777
    .local v0, "e":Ljava/lang/Exception;
    :goto_21
    return-object v1

    .line 1771
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_22
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;
    :try_end_24
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_24} :catch_25

    goto :goto_1b

    .line 1775
    :catch_25
    move-exception v0

    .line 1777
    .restart local v0    # "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_21
.end method

.method private static getAccessibleMethod(Ljava/lang/reflect/Method;Ljava/util/Map;)Ljava/lang/reflect/Method;
    .registers 9
    .param p0, "m"    # Ljava/lang/reflect/Method;
    .param p1, "accessibles"    # Ljava/util/Map;

    .prologue
    const/4 v4, 0x0

    .line 1460
    if-nez p0, :cond_5

    move-object v0, v4

    .line 1475
    :goto_4
    return-object v0

    .line 1463
    :cond_5
    new-instance v3, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;

    invoke-direct {v3, p0}, Lfreemarker/ext/beans/BeansWrapper$MethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 1464
    .local v3, "sig":Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 1465
    .local v2, "l":Ljava/util/List;
    if-nez v2, :cond_14

    move-object v0, v4

    .line 1466
    goto :goto_4

    .line 1468
    :cond_14
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;
    :cond_18
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 1470
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Method;

    .line 1471
    .local v0, "am":Ljava/lang/reflect/Method;
    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_18

    goto :goto_4

    .end local v0    # "am":Ljava/lang/reflect/Method;
    :cond_2f
    move-object v0, v4

    .line 1475
    goto :goto_4
.end method

.method private static getArgTypes(Ljava/util/Map;)Ljava/util/Map;
    .registers 3
    .param p0, "classMap"    # Ljava/util/Map;

    .prologue
    .line 1437
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    .line 1438
    .local v0, "argTypes":Ljava/util/Map;
    if-nez v0, :cond_14

    .line 1439
    new-instance v0, Ljava/util/HashMap;

    .end local v0    # "argTypes":Ljava/util/Map;
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1440
    .restart local v0    # "argTypes":Ljava/util/Map;
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1442
    :cond_14
    return-object v0
.end method

.method static getArgTypes(Ljava/util/Map;Ljava/lang/reflect/AccessibleObject;)[Ljava/lang/Class;
    .registers 3
    .param p0, "classMap"    # Ljava/util/Map;
    .param p1, "methodOrCtor"    # Ljava/lang/reflect/AccessibleObject;

    .prologue
    .line 1446
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Class;

    check-cast v0, [Ljava/lang/Class;

    return-object v0
.end method

.method public static final getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;
    .registers 1

    .prologue
    .line 485
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->INSTANCE:Lfreemarker/ext/beans/BeansWrapper;

    return-object v0
.end method

.method private static getFirstAccessibleMethod(Lfreemarker/ext/beans/BeansWrapper$MethodSignature;Ljava/util/Map;)Ljava/lang/reflect/Method;
    .registers 4
    .param p0, "sig"    # Lfreemarker/ext/beans/BeansWrapper$MethodSignature;
    .param p1, "accessibles"    # Ljava/util/Map;

    .prologue
    .line 1451
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1452
    .local v0, "l":Ljava/util/List;
    if-eqz v0, :cond_e

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_10

    .line 1453
    :cond_e
    const/4 v1, 0x0

    .line 1455
    :goto_f
    return-object v1

    :cond_10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Method;

    goto :goto_f
.end method

.method private static isJavaRebelAvailable()Z
    .registers 2

    .prologue
    .line 1784
    :try_start_0
    invoke-static {}, Lfreemarker/ext/beans/JavaRebelIntegration;->testAvailability()V
    :try_end_3
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_3} :catch_5

    .line 1785
    const/4 v1, 0x1

    .line 1788
    .local v0, "e":Ljava/lang/NoClassDefFoundError;
    :goto_4
    return v1

    .line 1787
    .end local v0    # "e":Ljava/lang/NoClassDefFoundError;
    :catch_5
    move-exception v0

    .line 1788
    .restart local v0    # "e":Ljava/lang/NoClassDefFoundError;
    const/4 v1, 0x0

    goto :goto_4
.end method

.method private static parseMethodSpec(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/reflect/Method;
    .registers 14
    .param p0, "methodSpec"    # Ljava/lang/String;
    .param p1, "primClasses"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1638
    const/16 v10, 0x28

    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 1639
    .local v4, "brace":I
    const/16 v10, 0x2e

    invoke-virtual {p0, v10, v4}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v6

    .line 1640
    .local v6, "dot":I
    const/4 v10, 0x0

    invoke-virtual {p0, v10, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 1641
    .local v5, "clazz":Ljava/lang/Class;
    add-int/lit8 v10, v6, 0x1

    invoke-virtual {p0, v10, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    .line 1642
    .local v8, "methodName":Ljava/lang/String;
    add-int/lit8 v10, v4, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-virtual {p0, v10, v11}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1643
    .local v1, "argSpec":Ljava/lang/String;
    new-instance v9, Ljava/util/StringTokenizer;

    const-string v10, ","

    invoke-direct {v9, v1, v10}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1644
    .local v9, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v3

    .line 1645
    .local v3, "argcount":I
    new-array v2, v3, [Ljava/lang/Class;

    .line 1646
    .local v2, "argTypes":[Ljava/lang/Class;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_35
    if-ge v7, v3, :cond_50

    .line 1648
    invoke-virtual {v9}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v0

    .line 1649
    .local v0, "argClassName":Ljava/lang/String;
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Class;

    aput-object v10, v2, v7

    .line 1650
    aget-object v10, v2, v7

    if-nez v10, :cond_4d

    .line 1652
    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    aput-object v10, v2, v7

    .line 1646
    :cond_4d
    add-int/lit8 v7, v7, 0x1

    goto :goto_35

    .line 1655
    .end local v0    # "argClassName":Ljava/lang/String;
    :cond_50
    invoke-virtual {v5, v8, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    return-object v10
.end method

.method private removeFromGenericClassIntrospectionCache(Ljava/lang/Class;)V
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1113
    iget-object v1, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1114
    :try_start_3
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1115
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCacheClassNames:Ljava/util/Set;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1116
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0}, Lfreemarker/ext/util/ModelCache;->clearCache()V

    .line 1117
    monitor-exit v1

    .line 1118
    return-void

    .line 1117
    :catchall_18
    move-exception v0

    monitor-exit v1
    :try_end_1a
    .catchall {:try_start_3 .. :try_end_1a} :catchall_18

    throw v0
.end method

.method private unwrap(Lfreemarker/template/TemplateModel;Ljava/lang/Class;Ljava/util/Map;)Ljava/lang/Object;
    .registers 23
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "hint"    # Ljava/lang/Class;
    .param p3, "recursionStops"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 625
    if-eqz p1, :cond_e

    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/ext/beans/BeansWrapper;->nullModel:Lfreemarker/template/TemplateModel;

    move-object/from16 v17, v0

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_10

    .line 626
    :cond_e
    const/4 v10, 0x0

    .line 832
    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_f
    :goto_f
    return-object v10

    .line 629
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_10
    sget-object v17, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_40

    const/4 v8, 0x1

    .line 630
    .local v8, "isBoolean":Z
    :goto_19
    sget-object v17, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_42

    const/4 v9, 0x1

    .line 636
    .local v9, "isChar":Z
    :goto_22
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/AdapterTemplateModel;

    move/from16 v17, v0

    if-eqz v17, :cond_6a

    move-object/from16 v17, p1

    .line 637
    check-cast v17, Lfreemarker/template/AdapterTemplateModel;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 639
    .local v3, "adapted":Ljava/lang/Object;
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_44

    move-object v10, v3

    .line 640
    goto :goto_f

    .line 629
    .end local v3    # "adapted":Ljava/lang/Object;
    .end local v8    # "isBoolean":Z
    .end local v9    # "isChar":Z
    :cond_40
    const/4 v8, 0x0

    goto :goto_19

    .line 630
    .restart local v8    # "isBoolean":Z
    :cond_42
    const/4 v9, 0x0

    goto :goto_22

    .line 643
    .restart local v3    # "adapted":Ljava/lang/Object;
    .restart local v9    # "isChar":Z
    :cond_44
    instance-of v0, v3, Ljava/lang/Number;

    move/from16 v17, v0

    if-eqz v17, :cond_6a

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v17

    if-eqz v17, :cond_54

    if-nez v9, :cond_54

    if-eqz v8, :cond_60

    :cond_54
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->NUMBER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_6a

    .line 645
    :cond_60
    check-cast v3, Ljava/lang/Number;

    .end local v3    # "adapted":Ljava/lang/Object;
    move-object/from16 v0, p2

    invoke-static {v0, v3}, Lfreemarker/ext/beans/BeansWrapper;->convertUnwrappedNumber(Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v10

    .line 647
    .local v10, "number":Ljava/lang/Number;
    if-nez v10, :cond_f

    .line 653
    .end local v10    # "number":Ljava/lang/Number;
    :cond_6a
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/ext/util/WrapperTemplateModel;

    move/from16 v17, v0

    if-eqz v17, :cond_b1

    move-object/from16 v17, p1

    .line 654
    check-cast v17, Lfreemarker/ext/util/WrapperTemplateModel;

    invoke-interface/range {v17 .. v17}, Lfreemarker/ext/util/WrapperTemplateModel;->getWrappedObject()Ljava/lang/Object;

    move-result-object v16

    .line 655
    .local v16, "wrapped":Ljava/lang/Object;
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_87

    move-object/from16 v10, v16

    .line 656
    goto :goto_f

    .line 659
    :cond_87
    move-object/from16 v0, v16

    instance-of v0, v0, Ljava/lang/Number;

    move/from16 v17, v0

    if-eqz v17, :cond_b1

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v17

    if-eqz v17, :cond_99

    if-nez v9, :cond_99

    if-eqz v8, :cond_a5

    :cond_99
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->NUMBER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_b1

    .line 661
    :cond_a5
    check-cast v16, Ljava/lang/Number;

    .end local v16    # "wrapped":Ljava/lang/Object;
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->convertUnwrappedNumber(Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v10

    .line 663
    .restart local v10    # "number":Ljava/lang/Number;
    if-nez v10, :cond_f

    .line 674
    .end local v10    # "number":Ljava/lang/Number;
    :cond_b1
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->STRING_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_cd

    .line 675
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v17, v0

    if-eqz v17, :cond_c9

    .line 676
    check-cast p1, Lfreemarker/template/TemplateScalarModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_f

    .line 679
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_c9
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    goto/16 :goto_f

    .line 683
    :cond_cd
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->isPrimitive()Z

    move-result v17

    if-eqz v17, :cond_d7

    if-nez v9, :cond_d7

    if-eqz v8, :cond_e3

    :cond_d7
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->NUMBER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_fd

    .line 685
    :cond_e3
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateNumberModel;

    move/from16 v17, v0

    if-eqz v17, :cond_fd

    move-object/from16 v17, p1

    .line 686
    check-cast v17, Lfreemarker/template/TemplateNumberModel;

    invoke-interface/range {v17 .. v17}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v17

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->convertUnwrappedNumber(Ljava/lang/Class;Ljava/lang/Number;)Ljava/lang/Number;

    move-result-object v10

    .line 688
    .restart local v10    # "number":Ljava/lang/Number;
    if-nez v10, :cond_f

    .line 694
    .end local v10    # "number":Ljava/lang/Number;
    :cond_fd
    if-nez v8, :cond_107

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->BOOLEAN_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_124

    .line 695
    :cond_107
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateBooleanModel;

    move/from16 v17, v0

    if-eqz v17, :cond_120

    .line 696
    check-cast p1, Lfreemarker/template/TemplateBooleanModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v17

    if-eqz v17, :cond_11d

    sget-object v17, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_119
    move-object/from16 v10, v17

    goto/16 :goto_f

    :cond_11d
    sget-object v17, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_119

    .line 700
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_120
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    goto/16 :goto_f

    .line 703
    :cond_124
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->MAP_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_141

    .line 704
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateHashModel;

    move/from16 v17, v0

    if-eqz v17, :cond_141

    .line 705
    new-instance v10, Lfreemarker/ext/beans/HashAdapter;

    check-cast p1, Lfreemarker/template/TemplateHashModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/HashAdapter;-><init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 709
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_141
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->LIST_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_15e

    .line 710
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateSequenceModel;

    move/from16 v17, v0

    if-eqz v17, :cond_15e

    .line 711
    new-instance v10, Lfreemarker/ext/beans/SequenceAdapter;

    check-cast p1, Lfreemarker/template/TemplateSequenceModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/SequenceAdapter;-><init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 715
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_15e
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->SET_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_17b

    .line 716
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateCollectionModel;

    move/from16 v17, v0

    if-eqz v17, :cond_17b

    .line 717
    new-instance v10, Lfreemarker/ext/beans/SetAdapter;

    check-cast p1, Lfreemarker/template/TemplateCollectionModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/SetAdapter;-><init>(Lfreemarker/template/TemplateCollectionModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 721
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_17b
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->COLLECTION_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-eq v0, v1, :cond_18b

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->ITERABLE_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    if-ne v0, v1, :cond_1b5

    .line 723
    :cond_18b
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateCollectionModel;

    move/from16 v17, v0

    if-eqz v17, :cond_1a0

    .line 724
    new-instance v10, Lfreemarker/ext/beans/CollectionAdapter;

    check-cast p1, Lfreemarker/template/TemplateCollectionModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/CollectionAdapter;-><init>(Lfreemarker/template/TemplateCollectionModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 727
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_1a0
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateSequenceModel;

    move/from16 v17, v0

    if-eqz v17, :cond_1b5

    .line 728
    new-instance v10, Lfreemarker/ext/beans/SequenceAdapter;

    check-cast p1, Lfreemarker/template/TemplateSequenceModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/SequenceAdapter;-><init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 733
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_1b5
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->isArray()Z

    move-result v17

    if-eqz v17, :cond_233

    .line 734
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateSequenceModel;

    move/from16 v17, v0

    if-eqz v17, :cond_22f

    .line 735
    if-eqz p3, :cond_1d2

    .line 736
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    .line 737
    .local v11, "retval":Ljava/lang/Object;
    if-eqz v11, :cond_1d7

    move-object v10, v11

    .line 738
    goto/16 :goto_f

    .line 741
    .end local v11    # "retval":Ljava/lang/Object;
    :cond_1d2
    new-instance p3, Lfreemarker/ext/util/IdentityHashMap;

    .end local p3    # "recursionStops":Ljava/util/Map;
    invoke-direct/range {p3 .. p3}, Lfreemarker/ext/util/IdentityHashMap;-><init>()V

    .restart local p3    # "recursionStops":Ljava/util/Map;
    :cond_1d7
    move-object/from16 v13, p1

    .line 744
    check-cast v13, Lfreemarker/template/TemplateSequenceModel;

    .line 745
    .local v13, "seq":Lfreemarker/template/TemplateSequenceModel;
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v5

    .line 746
    .local v5, "componentType":Ljava/lang/Class;
    invoke-interface {v13}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-static {v5, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    .line 747
    .local v4, "array":Ljava/lang/Object;
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 749
    :try_start_1f0
    invoke-interface {v13}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v14

    .line 750
    .local v14, "size":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1f5
    if-ge v7, v14, :cond_21c

    .line 751
    invoke-interface {v13, v7}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v17

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v5, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;Ljava/lang/Class;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v15

    .line 753
    .local v15, "val":Ljava/lang/Object;
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    move-object/from16 v0, v17

    if-ne v15, v0, :cond_216

    .line 754
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;
    :try_end_20d
    .catchall {:try_start_1f0 .. :try_end_20d} :catchall_226

    .line 759
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_f

    .line 756
    :cond_216
    :try_start_216
    invoke-static {v4, v7, v15}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_219
    .catchall {:try_start_216 .. :try_end_219} :catchall_226

    .line 750
    add-int/lit8 v7, v7, 0x1

    goto :goto_1f5

    .line 759
    .end local v15    # "val":Ljava/lang/Object;
    :cond_21c
    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v10, v4

    .line 761
    goto/16 :goto_f

    .line 759
    .end local v7    # "i":I
    .end local v14    # "size":I
    :catchall_226
    move-exception v17

    move-object/from16 v0, p3

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    throw v17

    .line 764
    .end local v4    # "array":Ljava/lang/Object;
    .end local v5    # "componentType":Ljava/lang/Class;
    .end local v13    # "seq":Lfreemarker/template/TemplateSequenceModel;
    :cond_22f
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    goto/16 :goto_f

    .line 768
    :cond_233
    if-nez v9, :cond_23d

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->CHARACTER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_26c

    .line 769
    :cond_23d
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v17, v0

    if-eqz v17, :cond_268

    .line 770
    check-cast p1, Lfreemarker/template/TemplateScalarModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v12

    .line 771
    .local v12, "s":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v18, 0x1

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_268

    .line 772
    new-instance v10, Ljava/lang/Character;

    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    move/from16 v0, v17

    invoke-direct {v10, v0}, Ljava/lang/Character;-><init>(C)V

    goto/16 :goto_f

    .line 776
    .end local v12    # "s":Ljava/lang/String;
    :cond_268
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    goto/16 :goto_f

    .line 779
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_26c
    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->DATE_CLASS:Ljava/lang/Class;

    move-object/from16 v0, v17

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_293

    .line 780
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateDateModel;

    move/from16 v17, v0

    if-eqz v17, :cond_293

    move-object/from16 v17, p1

    .line 781
    check-cast v17, Lfreemarker/template/TemplateDateModel;

    invoke-interface/range {v17 .. v17}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v6

    .line 782
    .local v6, "date":Ljava/util/Date;
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_293

    move-object v10, v6

    .line 783
    goto/16 :goto_f

    .line 792
    .end local v6    # "date":Ljava/util/Date;
    :cond_293
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateNumberModel;

    move/from16 v17, v0

    if-eqz v17, :cond_2ab

    move-object/from16 v17, p1

    .line 793
    check-cast v17, Lfreemarker/template/TemplateNumberModel;

    invoke-interface/range {v17 .. v17}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v10

    .line 794
    .restart local v10    # "number":Ljava/lang/Number;
    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_f

    .line 798
    .end local v10    # "number":Ljava/lang/Number;
    :cond_2ab
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateDateModel;

    move/from16 v17, v0

    if-eqz v17, :cond_2c6

    move-object/from16 v17, p1

    .line 799
    check-cast v17, Lfreemarker/template/TemplateDateModel;

    invoke-interface/range {v17 .. v17}, Lfreemarker/template/TemplateDateModel;->getAsDate()Ljava/util/Date;

    move-result-object v6

    .line 800
    .restart local v6    # "date":Ljava/util/Date;
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_2c6

    move-object v10, v6

    .line 801
    goto/16 :goto_f

    .line 804
    .end local v6    # "date":Ljava/util/Date;
    :cond_2c6
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateScalarModel;

    move/from16 v17, v0

    if-eqz v17, :cond_2e2

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->STRING_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_2e2

    .line 806
    check-cast p1, Lfreemarker/template/TemplateScalarModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_f

    .line 808
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_2e2
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateBooleanModel;

    move/from16 v17, v0

    if-eqz v17, :cond_307

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->BOOLEAN_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_307

    .line 810
    check-cast p1, Lfreemarker/template/TemplateBooleanModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v17

    if-eqz v17, :cond_304

    sget-object v17, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_300
    move-object/from16 v10, v17

    goto/16 :goto_f

    :cond_304
    sget-object v17, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_300

    .line 813
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_307
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateHashModel;

    move/from16 v17, v0

    if-eqz v17, :cond_328

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->HASHADAPTER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_328

    .line 815
    new-instance v10, Lfreemarker/ext/beans/HashAdapter;

    check-cast p1, Lfreemarker/template/TemplateHashModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/HashAdapter;-><init>(Lfreemarker/template/TemplateHashModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 817
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_328
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateSequenceModel;

    move/from16 v17, v0

    if-eqz v17, :cond_349

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->SEQUENCEADAPTER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_349

    .line 819
    new-instance v10, Lfreemarker/ext/beans/SequenceAdapter;

    check-cast p1, Lfreemarker/template/TemplateSequenceModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/SequenceAdapter;-><init>(Lfreemarker/template/TemplateSequenceModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 821
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_349
    move-object/from16 v0, p1

    instance-of v0, v0, Lfreemarker/template/TemplateCollectionModel;

    move/from16 v17, v0

    if-eqz v17, :cond_36a

    sget-object v17, Lfreemarker/ext/beans/BeansWrapper;->SETADAPTER_CLASS:Ljava/lang/Class;

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v17

    if-eqz v17, :cond_36a

    .line 823
    new-instance v10, Lfreemarker/ext/beans/SetAdapter;

    check-cast p1, Lfreemarker/template/TemplateCollectionModel;

    .end local p1    # "model":Lfreemarker/template/TemplateModel;
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    invoke-direct {v10, v0, v1}, Lfreemarker/ext/beans/SetAdapter;-><init>(Lfreemarker/template/TemplateCollectionModel;Lfreemarker/ext/beans/BeansWrapper;)V

    goto/16 :goto_f

    .line 828
    .restart local p1    # "model":Lfreemarker/template/TemplateModel;
    :cond_36a
    move-object/from16 v0, p2

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_378

    move-object/from16 v10, p1

    .line 829
    goto/16 :goto_f

    .line 832
    :cond_378
    sget-object v10, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    goto/16 :goto_f
.end method


# virtual methods
.method public clearClassIntrospecitonCache()V
    .registers 3

    .prologue
    .line 1087
    iget-object v1, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1088
    :try_start_3
    invoke-direct {p0}, Lfreemarker/ext/beans/BeansWrapper;->clearGenericClassIntrospectionCache()V

    .line 1089
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->staticModels:Lfreemarker/ext/beans/StaticModels;

    invoke-virtual {v0}, Lfreemarker/ext/beans/StaticModels;->clearCache()V

    .line 1090
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    invoke-virtual {v0}, Lfreemarker/ext/beans/ClassBasedModelFactory;->clearCache()V

    .line 1091
    :cond_14
    monitor-exit v1

    .line 1092
    return-void

    .line 1091
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw v0
.end method

.method protected finetuneMethodAppearance(Ljava/lang/Class;Ljava/lang/reflect/Method;Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "m"    # Ljava/lang/reflect/Method;
    .param p3, "decision"    # Lfreemarker/ext/beans/BeansWrapper$MethodAppearanceDecision;

    .prologue
    .line 1434
    return-void
.end method

.method getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;
    .registers 9
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1016
    iget-boolean v3, p0, Lfreemarker/ext/beans/BeansWrapper;->isGenericClassIntrospectionCacheConcurrentMap:Z

    if-eqz v3, :cond_f

    .line 1017
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 1018
    .local v2, "introspData":Ljava/util/Map;
    if-eqz v2, :cond_f

    .line 1059
    :goto_e
    return-object v2

    .line 1022
    .end local v2    # "introspData":Ljava/util/Map;
    :cond_f
    iget-object v4, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1023
    :try_start_12
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    .line 1024
    .restart local v2    # "introspData":Ljava/util/Map;
    if-eqz v2, :cond_21

    monitor-exit v4

    goto :goto_e

    .line 1047
    .end local v2    # "introspData":Ljava/util/Map;
    :catchall_1e
    move-exception v3

    monitor-exit v4
    :try_end_20
    .catchall {:try_start_12 .. :try_end_20} :catchall_1e

    throw v3

    .line 1026
    .restart local v2    # "introspData":Ljava/util/Map;
    :cond_21
    :try_start_21
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1027
    .local v0, "className":Ljava/lang/String;
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCacheClassNames:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_30

    .line 1028
    invoke-virtual {p0, v0}, Lfreemarker/ext/beans/BeansWrapper;->onSameNameClassesDetected(Ljava/lang/String;)V

    .line 1032
    :cond_30
    :goto_30
    if-nez v2, :cond_62

    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z
    :try_end_37
    .catchall {:try_start_21 .. :try_end_37} :catchall_1e

    move-result v3

    if-eqz v3, :cond_62

    .line 1036
    :try_start_3a
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V

    .line 1037
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "introspData":Ljava/util/Map;
    check-cast v2, Ljava/util/Map;
    :try_end_47
    .catch Ljava/lang/InterruptedException; {:try_start_3a .. :try_end_47} :catch_48
    .catchall {:try_start_3a .. :try_end_47} :catchall_1e

    .restart local v2    # "introspData":Ljava/util/Map;
    goto :goto_30

    .line 1038
    .end local v2    # "introspData":Ljava/util/Map;
    :catch_48
    move-exception v1

    .line 1039
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_49
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Class inrospection data lookup aborded: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1043
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .restart local v2    # "introspData":Ljava/util/Map;
    :cond_62
    if-eqz v2, :cond_66

    monitor-exit v4

    goto :goto_e

    .line 1046
    :cond_66
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1047
    monitor-exit v4
    :try_end_6c
    .catchall {:try_start_49 .. :try_end_6c} :catchall_1e

    .line 1049
    :try_start_6c
    invoke-direct {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->createClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v2

    .line 1050
    iget-object v4, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v4
    :try_end_73
    .catchall {:try_start_6c .. :try_end_73} :catchall_93

    .line 1051
    :try_start_73
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCache:Ljava/util/Map;

    invoke-interface {v3, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1052
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionCacheClassNames:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1053
    monitor-exit v4
    :try_end_7e
    .catchall {:try_start_73 .. :try_end_7e} :catchall_90

    .line 1056
    iget-object v4, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1057
    :try_start_81
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v3, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1058
    iget-object v3, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 1059
    monitor-exit v4

    goto :goto_e

    :catchall_8d
    move-exception v3

    monitor-exit v4
    :try_end_8f
    .catchall {:try_start_81 .. :try_end_8f} :catchall_8d

    throw v3

    .line 1053
    :catchall_90
    move-exception v3

    :try_start_91
    monitor-exit v4
    :try_end_92
    .catchall {:try_start_91 .. :try_end_92} :catchall_90

    :try_start_92
    throw v3
    :try_end_93
    .catchall {:try_start_92 .. :try_end_93} :catchall_93

    .line 1056
    :catchall_93
    move-exception v3

    iget-object v4, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v4

    .line 1057
    :try_start_97
    iget-object v5, p0, Lfreemarker/ext/beans/BeansWrapper;->genericClassIntrospectionsInProgress:Ljava/util/Set;

    invoke-interface {v5, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1058
    iget-object v5, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->notifyAll()V

    .line 1059
    monitor-exit v4
    :try_end_a2
    .catchall {:try_start_97 .. :try_end_a2} :catchall_a3

    throw v3

    :catchall_a3
    move-exception v3

    :try_start_a4
    monitor-exit v4
    :try_end_a5
    .catchall {:try_start_a4 .. :try_end_a5} :catchall_a3

    throw v3
.end method

.method protected getDefaultDateType()I
    .registers 2

    .prologue
    .line 445
    iget v0, p0, Lfreemarker/ext/beans/BeansWrapper;->defaultDateType:I

    return v0
.end method

.method public getEnumModels()Lfreemarker/template/TemplateHashModel;
    .registers 3

    .prologue
    .line 954
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    if-nez v0, :cond_c

    .line 955
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Enums not supported before J2SE 5."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 958
    :cond_c
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    return-object v0
.end method

.method getExposureLevel()I
    .registers 2

    .prologue
    .line 380
    iget v0, p0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    return v0
.end method

.method protected getInstance(Ljava/lang/Object;Lfreemarker/ext/util/ModelFactory;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "factory"    # Lfreemarker/ext/util/ModelFactory;

    .prologue
    .line 524
    invoke-interface {p2, p1, p0}, Lfreemarker/ext/util/ModelFactory;->create(Ljava/lang/Object;Lfreemarker/template/ObjectWrapper;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method protected getModelFactory(Ljava/lang/Class;)Lfreemarker/ext/util/ModelFactory;
    .registers 3
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 546
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    if-nez v0, :cond_19

    const-string v0, "java.util.Map"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 547
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->simpleMapWrapper:Z

    if-eqz v0, :cond_1c

    sget-object v0, Lfreemarker/ext/beans/SimpleMapModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    .line 573
    :goto_18
    return-object v0

    .line 546
    :cond_19
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Map:Ljava/lang/Class;

    goto :goto_c

    .line 547
    :cond_1c
    sget-object v0, Lfreemarker/ext/beans/MapModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 549
    :cond_1f
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    if-nez v0, :cond_34

    const-string v0, "java.util.Collection"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    :goto_2b
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_37

    .line 550
    sget-object v0, Lfreemarker/ext/beans/CollectionModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 549
    :cond_34
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Collection:Ljava/lang/Class;

    goto :goto_2b

    .line 552
    :cond_37
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    if-nez v0, :cond_4c

    const-string v0, "java.lang.Number"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    :goto_43
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 553
    sget-object v0, Lfreemarker/ext/beans/NumberModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 552
    :cond_4c
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Number:Ljava/lang/Class;

    goto :goto_43

    .line 555
    :cond_4f
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    if-nez v0, :cond_64

    const-string v0, "java.util.Date"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    :goto_5b
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_67

    .line 556
    sget-object v0, Lfreemarker/ext/beans/DateModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 555
    :cond_64
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Date:Ljava/lang/Class;

    goto :goto_5b

    .line 558
    :cond_67
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    if-nez v0, :cond_78

    const-string v0, "java.lang.Boolean"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    :goto_73
    if-ne v0, p1, :cond_7b

    .line 559
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->BOOLEAN_FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 558
    :cond_78
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$lang$Boolean:Ljava/lang/Class;

    goto :goto_73

    .line 561
    :cond_7b
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$ResourceBundle:Ljava/lang/Class;

    if-nez v0, :cond_90

    const-string v0, "java.util.ResourceBundle"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$ResourceBundle:Ljava/lang/Class;

    :goto_87
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_93

    .line 562
    sget-object v0, Lfreemarker/ext/beans/ResourceBundleModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto :goto_18

    .line 561
    :cond_90
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$ResourceBundle:Ljava/lang/Class;

    goto :goto_87

    .line 564
    :cond_93
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Iterator:Ljava/lang/Class;

    if-nez v0, :cond_a9

    const-string v0, "java.util.Iterator"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Iterator:Ljava/lang/Class;

    :goto_9f
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_ac

    .line 565
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->ITERATOR_FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto/16 :goto_18

    .line 564
    :cond_a9
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Iterator:Ljava/lang/Class;

    goto :goto_9f

    .line 567
    :cond_ac
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Enumeration:Ljava/lang/Class;

    if-nez v0, :cond_c2

    const-string v0, "java.util.Enumeration"

    invoke-static {v0}, Lfreemarker/ext/beans/BeansWrapper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Enumeration:Ljava/lang/Class;

    :goto_b8
    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_c5

    .line 568
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->ENUMERATION_FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto/16 :goto_18

    .line 567
    :cond_c2
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->class$java$util$Enumeration:Ljava/lang/Class;

    goto :goto_b8

    .line 570
    :cond_c5
    invoke-virtual {p1}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_cf

    .line 571
    sget-object v0, Lfreemarker/ext/beans/ArrayModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto/16 :goto_18

    .line 573
    :cond_cf
    sget-object v0, Lfreemarker/ext/beans/StringModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    goto/16 :goto_18
.end method

.method public getOuterIdentity()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->outerIdentity:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method getSharedClassIntrospectionCacheLock()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 1109
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    return-object v0
.end method

.method public getStaticModels()Lfreemarker/template/TemplateHashModel;
    .registers 2

    .prologue
    .line 934
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->staticModels:Lfreemarker/ext/beans/StaticModels;

    return-object v0
.end method

.method invokeMethod(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "method"    # Ljava/lang/reflect/Method;
    .param p3, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 912
    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 913
    .local v0, "retval":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_f

    sget-object v1, Lfreemarker/template/TemplateModel;->NOTHING:Lfreemarker/template/TemplateModel;

    :goto_e
    return-object v1

    :cond_f
    invoke-virtual {p0}, Lfreemarker/ext/beans/BeansWrapper;->getOuterIdentity()Lfreemarker/template/ObjectWrapper;

    move-result-object v1

    invoke-interface {v1, v0}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    goto :goto_e
.end method

.method public isExposeFields()Z
    .registers 2

    .prologue
    .line 405
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->exposeFields:Z

    return v0
.end method

.method isMethodsShadowItems()Z
    .registers 2

    .prologue
    .line 425
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->methodsShadowItems:Z

    return v0
.end method

.method isSafeMethod(Ljava/lang/reflect/Method;)Z
    .registers 4
    .param p1, "method"    # Ljava/lang/reflect/Method;

    .prologue
    const/4 v0, 0x1

    .line 1480
    iget v1, p0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    if-lt v1, v0, :cond_d

    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->UNSAFE_METHODS:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    :cond_d
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public isSimpleMapWrapper()Z
    .registers 2

    .prologue
    .line 336
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->simpleMapWrapper:Z

    return v0
.end method

.method public isStrict()Z
    .registers 2

    .prologue
    .line 262
    iget-boolean v0, p0, Lfreemarker/ext/beans/BeansWrapper;->strict:Z

    return v0
.end method

.method keyCount(Ljava/lang/Class;)I
    .registers 5
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1136
    invoke-virtual {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v1

    .line 1137
    .local v1, "map":Ljava/util/Map;
    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v0

    .line 1138
    .local v0, "count":I
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 1139
    add-int/lit8 v0, v0, -0x1

    .line 1140
    :cond_12
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 1141
    add-int/lit8 v0, v0, -0x1

    .line 1142
    :cond_1c
    sget-object v2, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 1143
    add-int/lit8 v0, v0, -0x1

    .line 1144
    :cond_26
    return v0
.end method

.method keySet(Ljava/lang/Class;)Ljava/util/Set;
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1155
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1156
    .local v0, "set":Ljava/util/Set;
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1157
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->GENERIC_GET_KEY:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1158
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->ARGTYPES:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1159
    return-object v0
.end method

.method public newInstance(Ljava/lang/Class;Ljava/util/List;)Ljava/lang/Object;
    .registers 14
    .param p1, "clazz"    # Ljava/lang/Class;
    .param p2, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 967
    :try_start_0
    invoke-virtual {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->getClassIntrospectionData(Ljava/lang/Class;)Ljava/util/Map;

    move-result-object v8

    sget-object v9, Lfreemarker/ext/beans/BeansWrapper;->CONSTRUCTORS:Ljava/lang/Object;

    invoke-interface {v8, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 968
    .local v2, "ctors":Ljava/lang/Object;
    if-nez v2, :cond_31

    .line 970
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Class "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " has no public constructors."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_2f
    .catch Lfreemarker/template/TemplateModelException; {:try_start_0 .. :try_end_2f} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2f} :catch_66

    .line 996
    .end local v2    # "ctors":Ljava/lang/Object;
    :catch_2f
    move-exception v3

    .line 998
    .local v3, "e":Lfreemarker/template/TemplateModelException;
    throw v3

    .line 973
    .end local v3    # "e":Lfreemarker/template/TemplateModelException;
    .restart local v2    # "ctors":Ljava/lang/Object;
    :cond_31
    const/4 v1, 0x0

    .line 975
    .local v1, "ctor":Ljava/lang/reflect/Constructor;
    :try_start_32
    instance-of v8, v2, Lfreemarker/ext/beans/SimpleMemberModel;

    if-eqz v8, :cond_49

    .line 977
    move-object v0, v2

    check-cast v0, Lfreemarker/ext/beans/SimpleMemberModel;

    move-object v7, v0

    .line 978
    .local v7, "smm":Lfreemarker/ext/beans/SimpleMemberModel;
    invoke-virtual {v7}, Lfreemarker/ext/beans/SimpleMemberModel;->getMember()Ljava/lang/reflect/Member;

    move-result-object v1

    .end local v1    # "ctor":Ljava/lang/reflect/Constructor;
    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 979
    .restart local v1    # "ctor":Ljava/lang/reflect/Constructor;
    invoke-virtual {v7, p2, p0}, Lfreemarker/ext/beans/SimpleMemberModel;->unwrapArguments(Ljava/util/List;Lfreemarker/ext/beans/BeansWrapper;)[Ljava/lang/Object;

    move-result-object v5

    .line 994
    .end local v7    # "smm":Lfreemarker/ext/beans/SimpleMemberModel;
    .local v5, "objargs":[Ljava/lang/Object;
    :goto_44
    invoke-virtual {v1, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 981
    .end local v5    # "objargs":[Ljava/lang/Object;
    :cond_49
    instance-of v8, v2, Lfreemarker/ext/beans/OverloadedMethods;

    if-eqz v8, :cond_60

    .line 983
    move-object v0, v2

    check-cast v0, Lfreemarker/ext/beans/OverloadedMethods;

    move-object v6, v0

    .line 984
    .local v6, "overloadedConstructors":Lfreemarker/ext/beans/OverloadedMethods;
    invoke-virtual {v6, p2}, Lfreemarker/ext/beans/OverloadedMethods;->getMemberAndArguments(Ljava/util/List;)Lfreemarker/ext/beans/MemberAndArguments;

    move-result-object v4

    .line 986
    .local v4, "maa":Lfreemarker/ext/beans/MemberAndArguments;
    invoke-virtual {v4}, Lfreemarker/ext/beans/MemberAndArguments;->getArgs()[Ljava/lang/Object;

    move-result-object v5

    .line 987
    .restart local v5    # "objargs":[Ljava/lang/Object;
    invoke-virtual {v4}, Lfreemarker/ext/beans/MemberAndArguments;->getMember()Ljava/lang/reflect/Member;

    move-result-object v1

    .end local v1    # "ctor":Ljava/lang/reflect/Constructor;
    check-cast v1, Ljava/lang/reflect/Constructor;

    .line 988
    .restart local v1    # "ctor":Ljava/lang/reflect/Constructor;
    goto :goto_44

    .line 992
    .end local v4    # "maa":Lfreemarker/ext/beans/MemberAndArguments;
    .end local v5    # "objargs":[Ljava/lang/Object;
    .end local v6    # "overloadedConstructors":Lfreemarker/ext/beans/OverloadedMethods;
    :cond_60
    new-instance v8, Ljava/lang/Error;

    invoke-direct {v8}, Ljava/lang/Error;-><init>()V

    throw v8
    :try_end_66
    .catch Lfreemarker/template/TemplateModelException; {:try_start_32 .. :try_end_66} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_66} :catch_66

    .line 1000
    .end local v1    # "ctor":Ljava/lang/reflect/Constructor;
    .end local v2    # "ctors":Ljava/lang/Object;
    :catch_66
    move-exception v3

    .line 1002
    .local v3, "e":Ljava/lang/Exception;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "Could not create instance of class "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v8
.end method

.method onSameNameClassesDetected(Ljava/lang/String;)V
    .registers 5
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 1099
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v0}, Lfreemarker/log/Logger;->isInfoEnabled()Z

    move-result v0

    if-eqz v0, :cond_2c

    .line 1100
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->logger:Lfreemarker/log/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Detected multiple classes with the same name, \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\". Assuming it was a class-reloading. Clearing BeansWrapper "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "caches to release old data."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/log/Logger;->info(Ljava/lang/String;)V

    .line 1105
    :cond_2c
    invoke-virtual {p0}, Lfreemarker/ext/beans/BeansWrapper;->clearClassIntrospecitonCache()V

    .line 1106
    return-void
.end method

.method public removeFromClassIntrospectionCache(Ljava/lang/Class;)V
    .registers 4
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1072
    iget-object v1, p0, Lfreemarker/ext/beans/BeansWrapper;->sharedClassIntrospectionCacheLock:Ljava/lang/Object;

    monitor-enter v1

    .line 1073
    :try_start_3
    invoke-direct {p0, p1}, Lfreemarker/ext/beans/BeansWrapper;->removeFromGenericClassIntrospectionCache(Ljava/lang/Class;)V

    .line 1074
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->staticModels:Lfreemarker/ext/beans/StaticModels;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/StaticModels;->removeFromCache(Ljava/lang/Class;)V

    .line 1075
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->enumModels:Lfreemarker/ext/beans/ClassBasedModelFactory;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/ClassBasedModelFactory;->removeFromCache(Ljava/lang/Class;)V

    .line 1076
    :cond_14
    monitor-exit v1

    .line 1077
    return-void

    .line 1076
    :catchall_16
    move-exception v0

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw v0
.end method

.method public declared-synchronized setDefaultDateType(I)V
    .registers 3
    .param p1, "defaultDateType"    # I

    .prologue
    .line 436
    monitor-enter p0

    :try_start_1
    iput p1, p0, Lfreemarker/ext/beans/BeansWrapper;->defaultDateType:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 437
    monitor-exit p0

    return-void

    .line 436
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setExposeFields(Z)V
    .registers 2
    .param p1, "exposeFields"    # Z

    .prologue
    .line 395
    iput-boolean p1, p0, Lfreemarker/ext/beans/BeansWrapper;->exposeFields:Z

    .line 396
    return-void
.end method

.method public setExposureLevel(I)V
    .registers 5
    .param p1, "exposureLevel"    # I

    .prologue
    .line 371
    if-ltz p1, :cond_5

    const/4 v0, 0x3

    if-le p1, v0, :cond_1e

    .line 373
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Illegal exposure level "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 375
    :cond_1e
    iput p1, p0, Lfreemarker/ext/beans/BeansWrapper;->exposureLevel:I

    .line 376
    return-void
.end method

.method public declared-synchronized setMethodsShadowItems(Z)V
    .registers 3
    .param p1, "methodsShadowItems"    # Z

    .prologue
    .line 420
    monitor-enter p0

    :try_start_1
    iput-boolean p1, p0, Lfreemarker/ext/beans/BeansWrapper;->methodsShadowItems:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 421
    monitor-exit p0

    return-void

    .line 420
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setNullModel(Lfreemarker/template/TemplateModel;)V
    .registers 2
    .param p1, "nullModel"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 469
    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper;->nullModel:Lfreemarker/template/TemplateModel;

    .line 470
    return-void
.end method

.method public setOuterIdentity(Lfreemarker/template/ObjectWrapper;)V
    .registers 2
    .param p1, "outerIdentity"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 301
    iput-object p1, p0, Lfreemarker/ext/beans/BeansWrapper;->outerIdentity:Lfreemarker/template/ObjectWrapper;

    .line 302
    return-void
.end method

.method public setSimpleMapWrapper(Z)V
    .registers 2
    .param p1, "simpleMapWrapper"    # Z

    .prologue
    .line 325
    iput-boolean p1, p0, Lfreemarker/ext/beans/BeansWrapper;->simpleMapWrapper:Z

    .line 326
    return-void
.end method

.method public setStrict(Z)V
    .registers 2
    .param p1, "strict"    # Z

    .prologue
    .line 287
    iput-boolean p1, p0, Lfreemarker/ext/beans/BeansWrapper;->strict:Z

    .line 288
    return-void
.end method

.method public setUseCache(Z)V
    .registers 3
    .param p1, "useCache"    # Z

    .prologue
    .line 456
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/ModelCache;->setUseCache(Z)V

    .line 457
    return-void
.end method

.method public unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;
    .registers 3
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 591
    sget-object v0, Lfreemarker/ext/beans/BeansWrapper;->OBJECT_CLASS:Ljava/lang/Class;

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public unwrap(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "hint"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 608
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/beans/BeansWrapper;->unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    .line 609
    .local v0, "obj":Ljava/lang/Object;
    sget-object v1, Lfreemarker/ext/beans/BeansWrapper;->CAN_NOT_UNWRAP:Ljava/lang/Object;

    if-ne v0, v1, :cond_37

    .line 610
    new-instance v1, Lfreemarker/template/TemplateModelException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Can not unwrap model of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " to type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 613
    :cond_37
    return-object v0
.end method

.method unwrapInternal(Lfreemarker/template/TemplateModel;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 4
    .param p1, "model"    # Lfreemarker/template/TemplateModel;
    .param p2, "hint"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 619
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;Ljava/lang/Class;Ljava/util/Map;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 510
    if-nez p1, :cond_5

    .line 511
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->nullModel:Lfreemarker/template/TemplateModel;

    .line 512
    :goto_4
    return-object v0

    :cond_5
    iget-object v0, p0, Lfreemarker/ext/beans/BeansWrapper;->modelCache:Lfreemarker/ext/util/ModelCache;

    invoke-virtual {v0, p1}, Lfreemarker/ext/util/ModelCache;->getInstance(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_4
.end method
