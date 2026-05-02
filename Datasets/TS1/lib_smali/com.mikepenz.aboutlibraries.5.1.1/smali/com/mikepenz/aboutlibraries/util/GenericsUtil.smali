.class public Lcom/mikepenz/aboutlibraries/util/GenericsUtil;
.super Ljava/lang/Object;
.source "GenericsUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFields(Landroid/content/Context;)[Ljava/lang/String;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/util/GenericsUtil;->resolveRClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 21
    .local v0, "rStringClass":Ljava/lang/Class;
    if-eqz v0, :cond_13

    .line 22
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-static {v1}, Lcom/mikepenz/aboutlibraries/Libs;->toStringArray([Ljava/lang/reflect/Field;)[Ljava/lang/String;

    move-result-object v1

    .line 24
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    goto :goto_12
.end method

.method private static resolveRClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 36
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".R$string"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_16
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_16} :catch_18

    move-result-object v1

    .line 42
    :goto_17
    return-object v1

    .line 37
    :catch_18
    move-exception v0

    .line 38
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    const-string v1, "."

    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_34

    const/4 v1, 0x0

    const/16 v2, 0x2e

    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 40
    :goto_2c
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 42
    const/4 v1, 0x0

    goto :goto_17

    .line 38
    :cond_34
    const-string p0, ""

    goto :goto_2c
.end method
