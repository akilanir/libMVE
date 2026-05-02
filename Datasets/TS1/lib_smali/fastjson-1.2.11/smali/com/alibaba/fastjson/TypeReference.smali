.class public Lcom/alibaba/fastjson/TypeReference;
.super Ljava/lang/Object;
.source "TypeReference.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final type:Ljava/lang/reflect/Type;


# direct methods
.method protected constructor <init>()V
    .registers 4

    .prologue
    .line 13
    .local p0, "this":Lcom/alibaba/fastjson/TypeReference;, "Lcom/alibaba/fastjson/TypeReference<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 16
    .local v0, "superClass":Ljava/lang/reflect/Type;
    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .end local v0    # "superClass":Ljava/lang/reflect/Type;
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    iput-object v1, p0, Lcom/alibaba/fastjson/TypeReference;->type:Ljava/lang/reflect/Type;

    .line 17
    return-void
.end method

.method protected varargs constructor <init>([Ljava/lang/reflect/Type;)V
    .registers 11
    .param p1, "actualTypeArguments"    # [Ljava/lang/reflect/Type;

    .prologue
    .line 23
    .local p0, "this":Lcom/alibaba/fastjson/TypeReference;, "Lcom/alibaba/fastjson/TypeReference<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v6

    .line 26
    .local v6, "superClass":Ljava/lang/reflect/Type;
    check-cast v6, Ljava/lang/reflect/ParameterizedType;

    .end local v6    # "superClass":Ljava/lang/reflect/Type;
    invoke-interface {v6}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v2, v7, v8

    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    .line 27
    .local v2, "argType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 28
    .local v5, "rawType":Ljava/lang/reflect/Type;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 30
    .local v3, "argTypes":[Ljava/lang/reflect/Type;
    const/4 v0, 0x0

    .line 31
    .local v0, "actualIndex":I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_20
    array-length v7, v3

    if-ge v4, v7, :cond_33

    .line 32
    aget-object v7, v3, v4

    instance-of v7, v7, Ljava/lang/reflect/TypeVariable;

    if-eqz v7, :cond_40

    .line 33
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "actualIndex":I
    .local v1, "actualIndex":I
    aget-object v7, p1, v0

    aput-object v7, v3, v4

    .line 34
    array-length v7, p1

    if-lt v1, v7, :cond_3f

    move v0, v1

    .line 39
    .end local v1    # "actualIndex":I
    .restart local v0    # "actualIndex":I
    :cond_33
    new-instance v7, Lcom/alibaba/fastjson/util/ParameterizedTypeImpl;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-direct {v7, v3, v8, v5}, Lcom/alibaba/fastjson/util/ParameterizedTypeImpl;-><init>([Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)V

    iput-object v7, p0, Lcom/alibaba/fastjson/TypeReference;->type:Ljava/lang/reflect/Type;

    .line 40
    return-void

    .end local v0    # "actualIndex":I
    .restart local v1    # "actualIndex":I
    :cond_3f
    move v0, v1

    .line 31
    .end local v1    # "actualIndex":I
    .restart local v0    # "actualIndex":I
    :cond_40
    add-int/lit8 v4, v4, 0x1

    goto :goto_20
.end method


# virtual methods
.method public getType()Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    .line 43
    .local p0, "this":Lcom/alibaba/fastjson/TypeReference;, "Lcom/alibaba/fastjson/TypeReference<TT;>;"
    iget-object v0, p0, Lcom/alibaba/fastjson/TypeReference;->type:Ljava/lang/reflect/Type;

    return-object v0
.end method
