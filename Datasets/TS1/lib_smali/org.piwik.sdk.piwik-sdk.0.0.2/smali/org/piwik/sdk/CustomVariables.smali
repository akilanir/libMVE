.class public Lorg/piwik/sdk/CustomVariables;
.super Ljava/util/HashMap;
.source "CustomVariables.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap",
        "<",
        "Ljava/lang/String;",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# static fields
.field private static final LOGGER_TAG:Ljava/lang/String; = "PIWIK:CustomVariables"

.field protected static final MAX_LENGTH:I = 0xc8

.field private static final MAX_VARIABLES:I = 0x5


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 40
    return-void
.end method


# virtual methods
.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 20
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/json/JSONArray;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/CustomVariables;->put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 10
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0xc8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 55
    if-lez p1, :cond_61

    const/4 v0, 0x5

    if-gt p1, v0, :cond_61

    if-eqz p2, :cond_5d

    move v3, v1

    :goto_c
    if-eqz p3, :cond_5f

    move v0, v1

    :goto_f
    and-int/2addr v0, v3

    if-eqz v0, :cond_61

    .line 57
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_2b

    .line 58
    const-string v0, "PIWIK:CustomVariables"

    const-string v3, "Name is too long %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p2, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-virtual {p2, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 62
    :cond_2b
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_44

    .line 63
    const-string v0, "PIWIK:CustomVariables"

    const-string v3, "Value is too long %s"

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p3, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    invoke-virtual {p3, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    .line 67
    :cond_44
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lorg/json/JSONArray;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    aput-object p2, v4, v2

    aput-object p3, v4, v1

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v3, v1}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0, v3}, Lorg/piwik/sdk/CustomVariables;->put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v0

    .line 70
    :goto_5c
    return-object v0

    :cond_5d
    move v3, v2

    .line 55
    goto :goto_c

    :cond_5f
    move v0, v2

    goto :goto_f

    .line 69
    :cond_61
    const-string v0, "PIWIK:CustomVariables"

    const-string v1, "Index is out of range or name/value is null"

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    const/4 v0, 0x0

    goto :goto_5c
.end method

.method public put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 5
    .param p1, "index"    # Ljava/lang/String;
    .param p2, "values"    # Lorg/json/JSONArray;

    .prologue
    .line 80
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_10

    if-eqz p1, :cond_10

    .line 81
    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    .line 84
    :goto_f
    return-object v0

    .line 83
    :cond_10
    const-string v0, "PIWIK:CustomVariables"

    const-string v1, "value length should be equal 2"

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/piwik/sdk/CustomVariables;->size()I

    move-result v0

    if-nez v0, :cond_8

    .line 90
    const/4 v0, 0x0

    .line 92
    :goto_7
    return-object v0

    :cond_8
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_7
.end method
