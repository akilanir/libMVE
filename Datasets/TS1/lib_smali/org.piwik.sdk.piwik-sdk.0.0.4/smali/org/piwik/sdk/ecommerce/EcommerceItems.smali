.class public Lorg/piwik/sdk/ecommerce/EcommerceItems;
.super Ljava/lang/Object;
.source "EcommerceItems.java"


# instance fields
.field public items:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/json/JSONArray;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/piwik/sdk/ecommerce/EcommerceItems;->items:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addItem(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 8
    .param p1, "sku"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "category"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "price"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "quantity"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    if-nez p2, :cond_4

    .line 34
    const-string p2, ""

    .line 36
    :cond_4
    if-nez p3, :cond_8

    .line 37
    const-string p3, ""

    .line 39
    :cond_8
    if-nez p4, :cond_f

    .line 40
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    .line 42
    :cond_f
    if-nez p5, :cond_16

    .line 43
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p5

    .line 46
    :cond_16
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 47
    .local v0, "item":Lorg/json/JSONArray;
    invoke-virtual {v0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 48
    invoke-virtual {v0, p2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 49
    invoke-virtual {v0, p3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 50
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Lorg/piwik/sdk/tools/CurrencyFormatter;->priceString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 51
    invoke-virtual {p5}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 52
    iget-object v1, p0, Lorg/piwik/sdk/ecommerce/EcommerceItems;->items:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    return-void
.end method

.method public removeAll()V
    .registers 2

    .line 68
    iget-object v0, p0, Lorg/piwik/sdk/ecommerce/EcommerceItems;->items:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 69
    return-void
.end method

.method public removeItem(Ljava/lang/String;)V
    .registers 3
    .param p1, "sku"    # Ljava/lang/String;

    .line 61
    iget-object v0, p0, Lorg/piwik/sdk/ecommerce/EcommerceItems;->items:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .registers 4

    .line 72
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 74
    .local v0, "jsonItems":Lorg/json/JSONArray;
    iget-object v1, p0, Lorg/piwik/sdk/ecommerce/EcommerceItems;->items:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONArray;

    .line 75
    .local v2, "item":Lorg/json/JSONArray;
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 76
    .end local v2    # "item":Lorg/json/JSONArray;
    goto :goto_f

    .line 77
    :cond_1f
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
