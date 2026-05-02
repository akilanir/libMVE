.class public Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/android/xmlmagic/tokenresolvers/ITokenResolver;


# instance fields
.field private final mJsonObject:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->mJsonObject:Lorg/json/JSONObject;

    return-void
.end method

.method private getAsString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    :try_start_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    :goto_4
    return-object v0

    :catch_5
    move-exception v0

    const-string v0, ""

    goto :goto_4
.end method


# virtual methods
.method public resolveToken(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 7

    const/4 v1, 0x0

    if-nez p1, :cond_5

    move-object v0, v1

    :goto_4
    return-object v0

    :cond_5
    const-string v0, "@json:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4b

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->mJsonObject:Lorg/json/JSONObject;

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21

    iget-object v1, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->mJsonObject:Lorg/json/JSONObject;

    invoke-direct {p0, v1, v0}, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->getAsString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_21
    iget-object v2, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->mJsonObject:Lorg/json/JSONObject;

    :cond_23
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-lez v2, :cond_4b

    iget-object v3, p0, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->mJsonObject:Lorg/json/JSONObject;

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    if-nez v3, :cond_3a

    move-object v0, v1

    goto :goto_4

    :cond_3a
    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-direct {p0, v3, v0}, Lorg/dmfs/android/xmlmagic/tokenresolvers/JsonTokenResolver;->getAsString(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    :cond_4b
    move-object v0, v1

    goto :goto_4
.end method
