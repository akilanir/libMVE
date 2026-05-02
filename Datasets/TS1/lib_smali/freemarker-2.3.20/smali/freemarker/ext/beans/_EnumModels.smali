.class public Lfreemarker/ext/beans/_EnumModels;
.super Lfreemarker/ext/beans/ClassBasedModelFactory;
.source "_EnumModels.java"


# direct methods
.method public constructor <init>(Lfreemarker/ext/beans/BeansWrapper;)V
    .registers 2
    .param p1, "wrapper"    # Lfreemarker/ext/beans/BeansWrapper;

    .prologue
    .line 69
    invoke-direct {p0, p1}, Lfreemarker/ext/beans/ClassBasedModelFactory;-><init>(Lfreemarker/ext/beans/BeansWrapper;)V

    .line 70
    return-void
.end method


# virtual methods
.method protected createModel(Ljava/lang/Class;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 73
    invoke-virtual {p1}, Ljava/lang/Class;->getEnumConstants()[Ljava/lang/Object;

    move-result-object v2

    .line 74
    .local v2, "obj":[Ljava/lang/Object;
    if-nez v2, :cond_8

    .line 79
    const/4 v4, 0x0

    .line 86
    :goto_7
    return-object v4

    .line 81
    :cond_8
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 82
    .local v1, "map":Ljava/util/Map;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v4, v2

    if-ge v0, v4, :cond_1f

    .line 83
    aget-object v3, v2, v0

    check-cast v3, Ljava/lang/Enum;

    .line 84
    .local v3, "value":Ljava/lang/Enum;
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 86
    .end local v3    # "value":Ljava/lang/Enum;
    :cond_1f
    new-instance v4, Lfreemarker/ext/beans/SimpleMapModel;

    invoke-virtual {p0}, Lfreemarker/ext/beans/_EnumModels;->getWrapper()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v5

    invoke-direct {v4, v1, v5}, Lfreemarker/ext/beans/SimpleMapModel;-><init>(Ljava/util/Map;Lfreemarker/ext/beans/BeansWrapper;)V

    goto :goto_7
.end method

.method public bridge synthetic get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-super {p0, p1}, Lfreemarker/ext/beans/ClassBasedModelFactory;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic isEmpty()Z
    .registers 2

    .prologue
    .line 66
    invoke-super {p0}, Lfreemarker/ext/beans/ClassBasedModelFactory;->isEmpty()Z

    move-result v0

    return v0
.end method
