.class public final Lorg/acra/collector/Compatibility;
.super Ljava/lang/Object;
.source "Compatibility.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAPILevel()I
    .registers 5

    .prologue
    .line 40
    :try_start_0
    const-class v3, Landroid/os/Build$VERSION;

    const-string v4, "SDK_INT"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 41
    .local v0, "SDK_INT":Ljava/lang/reflect/Field;
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I
    :try_end_c
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_c} :catch_e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_c} :catch_16
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_c} :catch_1e
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_c} :catch_26

    move-result v1

    .line 52
    .local v1, "apiLevel":I
    :goto_d
    return v1

    .line 42
    .end local v1    # "apiLevel":I
    :catch_e
    move-exception v2

    .line 43
    .local v2, "e":Ljava/lang/SecurityException;
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 50
    .restart local v1    # "apiLevel":I
    goto :goto_d

    .line 44
    .end local v1    # "apiLevel":I
    .end local v2    # "e":Ljava/lang/SecurityException;
    :catch_16
    move-exception v2

    .line 45
    .local v2, "e":Ljava/lang/NoSuchFieldException;
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 50
    .restart local v1    # "apiLevel":I
    goto :goto_d

    .line 46
    .end local v1    # "apiLevel":I
    .end local v2    # "e":Ljava/lang/NoSuchFieldException;
    :catch_1e
    move-exception v2

    .line 47
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 50
    .restart local v1    # "apiLevel":I
    goto :goto_d

    .line 48
    .end local v1    # "apiLevel":I
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_26
    move-exception v2

    .line 49
    .local v2, "e":Ljava/lang/IllegalAccessException;
    sget-object v3, Landroid/os/Build$VERSION;->SDK:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .restart local v1    # "apiLevel":I
    goto :goto_d
.end method

.method public static getDropBoxServiceName()Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchFieldException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 63
    const-class v2, Landroid/content/Context;

    const-string v3, "DROPBOX_SERVICE"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 64
    .local v0, "serviceName":Ljava/lang/reflect/Field;
    if-eqz v0, :cond_11

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 67
    :cond_11
    return-object v1
.end method
