.class public final Lcom/google/gson/FieldAttributes;
.super Ljava/lang/Object;
.source "FieldAttributes.java"


# static fields
.field private static final ANNOTATION_CACHE:Lcom/google/gson/Cache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/gson/Cache",
            "<",
            "Lcom/google/gson/Pair",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final MAX_CACHE_PROPERTY_NAME:Ljava/lang/String; = "com.google.gson.annotation_cache_size_hint"


# instance fields
.field private annotations:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation
.end field

.field private final declaredType:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final declaringClazz:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private final field:Ljava/lang/reflect/Field;

.field private genericType:Ljava/lang/reflect/Type;

.field private final isSynthetic:Z

.field private final modifiers:I

.field private final name:Ljava/lang/String;

.field private final resolvedType:Ljava/lang/reflect/Type;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 43
    new-instance v0, Lcom/google/gson/LruCache;

    invoke-static {}, Lcom/google/gson/FieldAttributes;->getMaxCacheSize()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/gson/LruCache;-><init>(I)V

    sput-object v0, Lcom/google/gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/gson/Cache;

    return-void
.end method

.method constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;)V
    .registers 5
    .param p2, "f"    # Ljava/lang/reflect/Field;
    .param p3, "declaringType"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Field;",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .prologue
    .line 64
    .local p1, "declaringClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-static {p1}, Lcom/google/gson/internal/$Gson$Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    .line 66
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->name:Ljava/lang/String;

    .line 67
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->declaredType:Ljava/lang/Class;

    .line 68
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->isSynthetic()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/gson/FieldAttributes;->isSynthetic:Z

    .line 69
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    iput v0, p0, Lcom/google/gson/FieldAttributes;->modifiers:I

    .line 70
    iput-object p2, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    .line 71
    invoke-static {p2, p3}, Lcom/google/gson/FieldAttributes;->getTypeInfoForField(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->resolvedType:Ljava/lang/reflect/Type;

    .line 72
    return-void
.end method

.method private static getAnnotationFromArray(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 232
    .local p0, "annotations":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/annotation/Annotation;

    .line 233
    .local v0, "a":Ljava/lang/annotation/Annotation;
    invoke-interface {v0}, Ljava/lang/annotation/Annotation;->annotationType()Ljava/lang/Class;

    move-result-object v2

    if-ne v2, p1, :cond_4

    .line 237
    .end local v0    # "a":Ljava/lang/annotation/Annotation;
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    goto :goto_16
.end method

.method private static getMaxCacheSize()I
    .registers 6

    .prologue
    const/16 v3, 0x7d0

    .line 75
    const/16 v0, 0x7d0

    .line 77
    .local v0, "defaultMaxCacheSize":I
    :try_start_4
    const-string v4, "com.google.gson.annotation_cache_size_hint"

    const/16 v5, 0x7d0

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "propertyValue":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_13
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_13} :catch_15

    move-result v3

    .line 81
    .end local v2    # "propertyValue":Ljava/lang/String;
    :goto_14
    return v3

    .line 80
    :catch_15
    move-exception v1

    .line 81
    .local v1, "e":Ljava/lang/NumberFormatException;
    goto :goto_14
.end method

.method static getTypeInfoForField(Ljava/lang/reflect/Field;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 4
    .param p0, "f"    # Ljava/lang/reflect/Field;
    .param p1, "typeDefiningF"    # Ljava/lang/reflect/Type;

    .prologue
    .line 249
    invoke-static {p1}, Lcom/google/gson/internal/$Gson$Types;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v0

    .line 250
    .local v0, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 252
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 254
    :goto_12
    return-object v1

    :cond_13
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/google/gson/internal/$Gson$Types;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v1

    goto :goto_12
.end method


# virtual methods
.method get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "instance"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 205
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/lang/annotation/Annotation;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "annotation":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Lcom/google/gson/FieldAttributes;->getAnnotations()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/gson/FieldAttributes;->getAnnotationFromArray(Ljava/util/Collection;Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    return-object v0
.end method

.method public getAnnotations()Ljava/util/Collection;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/annotation/Annotation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 160
    iget-object v2, p0, Lcom/google/gson/FieldAttributes;->annotations:Ljava/util/Collection;

    if-nez v2, :cond_2c

    .line 161
    new-instance v1, Lcom/google/gson/Pair;

    iget-object v2, p0, Lcom/google/gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    iget-object v3, p0, Lcom/google/gson/FieldAttributes;->name:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Lcom/google/gson/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 162
    .local v1, "key":Lcom/google/gson/Pair;, "Lcom/google/gson/Pair<Ljava/lang/Class<*>;Ljava/lang/String;>;"
    sget-object v2, Lcom/google/gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/gson/Cache;

    invoke-interface {v2, v1}, Lcom/google/gson/Cache;->getElement(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    .line 163
    .local v0, "cachedValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    if-nez v0, :cond_2a

    .line 164
    iget-object v2, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    .line 166
    sget-object v2, Lcom/google/gson/FieldAttributes;->ANNOTATION_CACHE:Lcom/google/gson/Cache;

    invoke-interface {v2, v1, v0}, Lcom/google/gson/Cache;->addElement(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 168
    :cond_2a
    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->annotations:Ljava/util/Collection;

    .line 170
    .end local v0    # "cachedValue":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/annotation/Annotation;>;"
    .end local v1    # "key":Lcom/google/gson/Pair;, "Lcom/google/gson/Pair<Ljava/lang/Class<*>;Ljava/lang/String;>;"
    :cond_2c
    iget-object v2, p0, Lcom/google/gson/FieldAttributes;->annotations:Ljava/util/Collection;

    return-object v2
.end method

.method public getDeclaredClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 139
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->declaredType:Ljava/lang/Class;

    return-object v0
.end method

.method public getDeclaredType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    if-nez v0, :cond_c

    .line 117
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    .line 119
    :cond_c
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->genericType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getDeclaringClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->declaringClazz:Ljava/lang/Class;

    return-object v0
.end method

.method getFieldObject()Ljava/lang/reflect/Field;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 222
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->name:Ljava/lang/String;

    return-object v0
.end method

.method getResolvedType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 226
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->resolvedType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public hasModifier(I)Z
    .registers 3
    .param p1, "modifier"    # I

    .prologue
    .line 184
    iget v0, p0, Lcom/google/gson/FieldAttributes;->modifiers:I

    and-int/2addr v0, p1

    if-eqz v0, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method isSynthetic()Z
    .registers 2

    .prologue
    .line 214
    iget-boolean v0, p0, Lcom/google/gson/FieldAttributes;->isSynthetic:Z

    return v0
.end method

.method set(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4
    .param p1, "instance"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 194
    iget-object v0, p0, Lcom/google/gson/FieldAttributes;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 195
    return-void
.end method
