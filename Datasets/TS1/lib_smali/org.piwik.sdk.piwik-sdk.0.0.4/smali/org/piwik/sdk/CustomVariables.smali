.class public Lorg/piwik/sdk/CustomVariables;
.super Ljava/util/HashMap;
.source "CustomVariables.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
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

    .line 37
    const/4 v0, 0x5

    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 38
    return-void
.end method


# virtual methods
.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 18
    check-cast p1, Ljava/lang/String;

    check-cast p2, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2}, Lorg/piwik/sdk/CustomVariables;->put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object p1

    return-object p1
.end method

.method public put(ILjava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;
    .registers 10
    .param p1, "index"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 53
    if-lez p1, :cond_61

    const/4 v0, 0x5

    if-gt p1, v0, :cond_61

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_b

    const/4 v2, 0x1

    goto :goto_c

    :cond_b
    const/4 v2, 0x0

    :goto_c
    if-eqz p3, :cond_10

    const/4 v3, 0x1

    goto :goto_11

    :cond_10
    const/4 v3, 0x0

    :goto_11
    and-int/2addr v2, v3

    if-eqz v2, :cond_61

    .line 55
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0xc8

    if-le v2, v3, :cond_2f

    .line 56
    const-string v2, "PIWIK:CustomVariables"

    const-string v4, "Name is too long %s"

    new-array v5, v0, [Ljava/lang/Object;

    aput-object p2, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    invoke-virtual {p2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    .line 60
    :cond_2f
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v3, :cond_48

    .line 61
    const-string v2, "PIWIK:CustomVariables"

    const-string v4, "Value is too long %s"

    new-array v5, v0, [Ljava/lang/Object;

    aput-object p3, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lorg/piwik/sdk/tools/Logy;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    invoke-virtual {p3, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p3

    .line 65
    :cond_48
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lorg/json/JSONArray;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    aput-object p2, v4, v1

    aput-object p3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v3, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v2, v3}, Lorg/piwik/sdk/CustomVariables;->put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0

    .line 67
    :cond_61
    const-string v0, "PIWIK:CustomVariables"

    const-string v1, "Index is out of range or name/value is null"

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public put(Ljava/lang/String;Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .registers 5
    .param p1, "index"    # Ljava/lang/String;
    .param p2, "values"    # Lorg/json/JSONArray;

    .line 78
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_10

    if-eqz p1, :cond_10

    .line 79
    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONArray;

    return-object v0

    .line 81
    :cond_10
    const-string v0, "PIWIK:CustomVariables"

    const-string v1, "value length should be equal 2"

    invoke-static {v0, v1}, Lorg/piwik/sdk/tools/Logy;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    const/4 v0, 0x0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 87
    invoke-virtual {p0}, Lorg/piwik/sdk/CustomVariables;->size()I

    move-result v0

    if-nez v0, :cond_8

    .line 88
    const/4 v0, 0x0

    return-object v0

    .line 90
    :cond_8
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
