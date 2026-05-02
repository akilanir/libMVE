.class public Lcom/mikepenz/iconics/utils/GenericsUtil;
.super Ljava/lang/Object;
.source "GenericsUtil.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getDefinedFonts(Landroid/content/Context;[Ljava/lang/reflect/Field;)[Ljava/lang/String;
    .registers 8
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "fields"    # [Ljava/lang/reflect/Field;

    .prologue
    .line 53
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .local v1, "fieldArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    array-length v3, p1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v3, :cond_25

    aget-object v0, p1, v2

    .line 55
    .local v0, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "define_font_"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_22

    .line 56
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-static {p0, v4}, Lcom/mikepenz/iconics/utils/GenericsUtil;->getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :cond_22
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 59
    .end local v0    # "field":Ljava/lang/reflect/Field;
    :cond_25
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method public static getFields(Landroid/content/Context;)[Ljava/lang/String;
    .registers 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mikepenz/iconics/utils/GenericsUtil;->resolveRClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 22
    .local v0, "rStringClass":Ljava/lang/Class;
    if-eqz v0, :cond_13

    .line 23
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/mikepenz/iconics/utils/GenericsUtil;->getDefinedFonts(Landroid/content/Context;[Ljava/lang/reflect/Field;)[Ljava/lang/String;

    move-result-object v1

    .line 25
    :goto_12
    return-object v1

    :cond_13
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    goto :goto_12
.end method

.method private static getStringResourceByName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "resourceName"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, "packageName":Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "string"

    invoke-virtual {v2, p1, v3, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 72
    .local v1, "resId":I
    if-nez v1, :cond_13

    .line 73
    const-string v2, ""

    .line 75
    :goto_12
    return-object v2

    :cond_13
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_12
.end method

.method private static resolveRClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "packageName"    # Ljava/lang/String;

    .prologue
    .line 37
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

    .line 43
    :goto_17
    return-object v1

    .line 38
    :catch_18
    move-exception v0

    .line 39
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

    .line 41
    :goto_2c
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 43
    const/4 v1, 0x0

    goto :goto_17

    .line 39
    :cond_34
    const-string p0, ""

    goto :goto_2c
.end method
