.class public final Lorg/androidannotations/api/sharedpreferences/LongPrefField;
.super Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;
.source "LongPrefField.java"


# instance fields
.field private final defaultValue:J


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;J)V
    .registers 5
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # J

    .prologue
    .line 25
    invoke-direct {p0, p1, p2}, Lorg/androidannotations/api/sharedpreferences/AbstractPrefField;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    .line 26
    iput-wide p3, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->defaultValue:J

    .line 27
    return-void
.end method


# virtual methods
.method public get()J
    .registers 3

    .prologue
    .line 30
    iget-wide v0, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->defaultValue:J

    invoke-virtual {p0, v0, v1}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->getOr(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOr(J)J
    .registers 10
    .param p1, "defaultValue"    # J

    .prologue
    .line 35
    :try_start_0
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-interface {v3, v4, p1, p2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J
    :try_end_7
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-wide v3

    .line 41
    :goto_8
    return-wide v3

    .line 36
    :catch_9
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/ClassCastException;
    :try_start_a
    iget-object v3, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->sharedPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 41
    .local v2, "value":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_28} :catch_2a

    move-result-wide v3

    goto :goto_8

    .line 42
    .end local v2    # "value":Ljava/lang/String;
    :catch_2a
    move-exception v1

    .line 44
    .local v1, "e2":Ljava/lang/Exception;
    throw v0
.end method

.method public put(J)V
    .registers 5
    .param p1, "value"    # J

    .prologue
    .line 50
    invoke-virtual {p0}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->key:Ljava/lang/String;

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/androidannotations/api/sharedpreferences/LongPrefField;->apply(Landroid/content/SharedPreferences$Editor;)V

    .line 51
    return-void
.end method
