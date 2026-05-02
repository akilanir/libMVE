.class public Lfreemarker/ext/beans/MapModel;
.super Lfreemarker/ext/beans/StringModel;
.source "MapModel.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# static fields
.field static final FACTORY:Lfreemarker/ext/util/ModelFactory;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 85
    new-instance v0, Lfreemarker/ext/beans/MapModel$1;

    invoke-direct {v0}, Lfreemarker/ext/beans/MapModel$1;-><init>()V

    sput-object v0, Lfreemarker/ext/beans/MapModel;->FACTORY:Lfreemarker/ext/util/ModelFactory;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 3
    .param p1, "map"    # Ljava/util/Map;
    .param p2, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 104
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/beans/StringModel;-><init>(Ljava/lang/Object;Lfreemarker/ext/beans/BeansWrapper;)V

    .line 105
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 4
    .param p1, "arguments"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 114
    const/4 v1, 0x0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/template/TemplateModel;

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/MapModel;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v0

    .line 115
    .local v0, "key":Ljava/lang/Object;
    iget-object v1, p0, Lfreemarker/ext/beans/MapModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/ext/beans/MapModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    return-object v1
.end method

.method protected invokeGenericGet(Ljava/util/Map;Ljava/lang/Class;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "keyMap"    # Ljava/util/Map;
    .param p2, "clazz"    # Ljava/lang/Class;
    .param p3, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v1, p0, Lfreemarker/ext/beans/MapModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    .line 126
    .local v1, "map":Ljava/util/Map;
    invoke-interface {v1, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 127
    .local v2, "val":Ljava/lang/Object;
    if-nez v2, :cond_39

    .line 128
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_30

    .line 130
    new-instance v0, Ljava/lang/Character;

    const/4 v3, 0x0

    invoke-virtual {p3, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-direct {v0, v3}, Ljava/lang/Character;-><init>(C)V

    .line 131
    .local v0, "charKey":Ljava/lang/Character;
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 132
    if-nez v2, :cond_39

    invoke-interface {v1, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_39

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 133
    sget-object v3, Lfreemarker/ext/beans/MapModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    .line 140
    .end local v0    # "charKey":Ljava/lang/Character;
    :goto_2f
    return-object v3

    .line 136
    :cond_30
    invoke-interface {v1, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_39

    .line 137
    sget-object v3, Lfreemarker/ext/beans/MapModel;->UNKNOWN:Lfreemarker/template/TemplateModel;

    goto :goto_2f

    .line 140
    :cond_39
    invoke-virtual {p0, v2}, Lfreemarker/ext/beans/MapModel;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_2f
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 145
    iget-object v0, p0, Lfreemarker/ext/beans/MapModel;->object:Ljava/lang/Object;

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-super {p0}, Lfreemarker/ext/beans/StringModel;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method protected keySet()Ljava/util/Set;
    .registers 3

    .prologue
    .line 155
    invoke-super {p0}, Lfreemarker/ext/beans/StringModel;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 156
    .local v0, "set":Ljava/util/Set;
    iget-object v1, p0, Lfreemarker/ext/beans/MapModel;->object:Ljava/lang/Object;

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 157
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 150
    invoke-virtual {p0}, Lfreemarker/ext/beans/MapModel;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method
