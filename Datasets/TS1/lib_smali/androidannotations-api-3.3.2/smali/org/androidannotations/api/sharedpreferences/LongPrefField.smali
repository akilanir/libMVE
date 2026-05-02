.class public final Lorg/androidannotations/api/sharedpreferences/LongPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "LongPrefField.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/androidannotations/api/sharedpreferences/AbstractPrefField",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Long;)V
    .registers 4
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Long;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    return-void
.end method


# virtual methods
.method public getOr(Ljava/lang/Long;)Ljava/lang/Long;
    .registers 9
    .param p1, "defaultValue"    # Ljava/lang/Long;

    .prologue
    .line 29
    :try_start_0
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_f
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_f} :catch_11

    move-result-object v3

    .line 35
    :goto_10
    return-object v3

    .line 30
    :catch_11
    move-exception v0

    .line 34
    .local v0, "e":Ljava/lang/ClassCastException;
    :try_start_12
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 35
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_34} :catch_36

    move-result-object v3

    goto :goto_10

    .line 36
    .end local v2    # "value":Ljava/lang/String;
    :catch_36
    move-exception v1

    .line 39
    .local v1, "e2":Ljava/lang/Exception;
    throw v0
.end method

.method public bridge synthetic getOr(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->getOr(Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method protected putInternal(Ljava/lang/Long;)V
    .registers 6
    .param p1, "value"    # Ljava/lang/Long;

    .prologue
    .line 46
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 47
    return-void
.end method

.method protected bridge synthetic putInternal(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 20
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->putInternal(Ljava/lang/Long;)V

    return-void
.end method
