.class final Lcom/google/gson/ObjectNavigator;
.super Ljava/lang/Object;
.source "ObjectNavigator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/ObjectNavigator$Visitor;
    }
.end annotation


# instance fields
.field private final exclusionStrategy:Lcom/google/gson/ExclusionStrategy;

.field private final reflectingFieldNavigator:Lcom/google/gson/ReflectingFieldNavigator;


# direct methods
.method constructor <init>(Lcom/google/gson/ExclusionStrategy;)V
    .registers 4
    .param p1, "strategy"    # Lcom/google/gson/ExclusionStrategy;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    if-nez p1, :cond_a

    new-instance p1, Lcom/google/gson/NullExclusionStrategy;

    .end local p1    # "strategy":Lcom/google/gson/ExclusionStrategy;
    invoke-direct {p1}, Lcom/google/gson/NullExclusionStrategy;-><init>()V

    :cond_a
    iput-object p1, p0, Lcom/google/gson/ObjectNavigator;->exclusionStrategy:Lcom/google/gson/ExclusionStrategy;

    .line 89
    new-instance v0, Lcom/google/gson/ReflectingFieldNavigator;

    iget-object v1, p0, Lcom/google/gson/ObjectNavigator;->exclusionStrategy:Lcom/google/gson/ExclusionStrategy;

    invoke-direct {v0, v1}, Lcom/google/gson/ReflectingFieldNavigator;-><init>(Lcom/google/gson/ExclusionStrategy;)V

    iput-object v0, p0, Lcom/google/gson/ObjectNavigator;->reflectingFieldNavigator:Lcom/google/gson/ReflectingFieldNavigator;

    .line 90
    return-void
.end method

.method private static isPrimitiveOrString(Ljava/lang/Object;)Z
    .registers 3
    .param p0, "objectToVisit"    # Ljava/lang/Object;

    .prologue
    .line 129
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 130
    .local v0, "realClazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v1, Ljava/lang/Object;

    if-eq v0, v1, :cond_16

    const-class v1, Ljava/lang/String;

    if-eq v0, v1, :cond_16

    invoke-static {v0}, Lcom/google/gson/Primitives;->unwrap(Ljava/lang/Class;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-eqz v1, :cond_18

    :cond_16
    const/4 v1, 0x1

    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method


# virtual methods
.method public accept(Lcom/google/gson/ObjectTypePair;Lcom/google/gson/ObjectNavigator$Visitor;)V
    .registers 8
    .param p1, "objTypePair"    # Lcom/google/gson/ObjectTypePair;
    .param p2, "visitor"    # Lcom/google/gson/ObjectNavigator$Visitor;

    .prologue
    .line 98
    iget-object v3, p0, Lcom/google/gson/ObjectNavigator;->exclusionStrategy:Lcom/google/gson/ExclusionStrategy;

    iget-object v4, p1, Lcom/google/gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-static {v4}, Lcom/google/gson/internal/$Gson$Types;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/google/gson/ExclusionStrategy;->shouldSkipClass(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 126
    :cond_e
    :goto_e
    return-void

    .line 101
    :cond_f
    invoke-interface {p2, p1}, Lcom/google/gson/ObjectNavigator$Visitor;->visitUsingCustomHandler(Lcom/google/gson/ObjectTypePair;)Z

    move-result v2

    .line 102
    .local v2, "visitedWithCustomHandler":Z
    if-nez v2, :cond_e

    .line 103
    invoke-virtual {p1}, Lcom/google/gson/ObjectTypePair;->getObject()Ljava/lang/Object;

    move-result-object v0

    .line 104
    .local v0, "obj":Ljava/lang/Object;
    if-nez v0, :cond_38

    invoke-interface {p2}, Lcom/google/gson/ObjectNavigator$Visitor;->getTarget()Ljava/lang/Object;

    move-result-object v1

    .line 105
    .local v1, "objectToVisit":Ljava/lang/Object;
    :goto_1f
    if-eqz v1, :cond_e

    .line 108
    invoke-virtual {p1, v1}, Lcom/google/gson/ObjectTypePair;->setObject(Ljava/lang/Object;)V

    .line 109
    invoke-interface {p2, p1}, Lcom/google/gson/ObjectNavigator$Visitor;->start(Lcom/google/gson/ObjectTypePair;)V

    .line 111
    :try_start_27
    iget-object v3, p1, Lcom/google/gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-static {v3}, Lcom/google/gson/internal/$Gson$Types;->isArray(Ljava/lang/reflect/Type;)Z

    move-result v3

    if-eqz v3, :cond_3a

    .line 112
    iget-object v3, p1, Lcom/google/gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    invoke-interface {p2, v1, v3}, Lcom/google/gson/ObjectNavigator$Visitor;->visitArray(Ljava/lang/Object;Ljava/lang/reflect/Type;)V
    :try_end_34
    .catchall {:try_start_27 .. :try_end_34} :catchall_4d

    .line 123
    :goto_34
    invoke-interface {p2, p1}, Lcom/google/gson/ObjectNavigator$Visitor;->end(Lcom/google/gson/ObjectTypePair;)V

    goto :goto_e

    .end local v1    # "objectToVisit":Ljava/lang/Object;
    :cond_38
    move-object v1, v0

    .line 104
    goto :goto_1f

    .line 113
    .restart local v1    # "objectToVisit":Ljava/lang/Object;
    :cond_3a
    :try_start_3a
    iget-object v3, p1, Lcom/google/gson/ObjectTypePair;->type:Ljava/lang/reflect/Type;

    const-class v4, Ljava/lang/Object;

    if-ne v3, v4, :cond_52

    invoke-static {v1}, Lcom/google/gson/ObjectNavigator;->isPrimitiveOrString(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_52

    .line 116
    invoke-interface {p2, v1}, Lcom/google/gson/ObjectNavigator$Visitor;->visitPrimitive(Ljava/lang/Object;)V

    .line 117
    invoke-interface {p2}, Lcom/google/gson/ObjectNavigator$Visitor;->getTarget()Ljava/lang/Object;
    :try_end_4c
    .catchall {:try_start_3a .. :try_end_4c} :catchall_4d

    goto :goto_34

    .line 123
    :catchall_4d
    move-exception v3

    invoke-interface {p2, p1}, Lcom/google/gson/ObjectNavigator$Visitor;->end(Lcom/google/gson/ObjectTypePair;)V

    throw v3

    .line 119
    :cond_52
    :try_start_52
    invoke-interface {p2, v1}, Lcom/google/gson/ObjectNavigator$Visitor;->startVisitingObject(Ljava/lang/Object;)V

    .line 120
    iget-object v3, p0, Lcom/google/gson/ObjectNavigator;->reflectingFieldNavigator:Lcom/google/gson/ReflectingFieldNavigator;

    invoke-virtual {v3, p1, p2}, Lcom/google/gson/ReflectingFieldNavigator;->visitFieldsReflectively(Lcom/google/gson/ObjectTypePair;Lcom/google/gson/ObjectNavigator$Visitor;)V
    :try_end_5a
    .catchall {:try_start_52 .. :try_end_5a} :catchall_4d

    goto :goto_34
.end method
