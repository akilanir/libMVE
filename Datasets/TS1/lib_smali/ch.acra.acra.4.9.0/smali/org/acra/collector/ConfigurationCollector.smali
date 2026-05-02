.class public final Lorg/acra/collector/ConfigurationCollector;
.super Ljava/lang/Object;
.source "ConfigurationCollector.java"


# static fields
.field private static final FIELD_MCC:Ljava/lang/String; = "mcc"

.field private static final FIELD_MNC:Ljava/lang/String; = "mnc"

.field private static final FIELD_SCREENLAYOUT:Ljava/lang/String; = "screenLayout"

.field private static final FIELD_UIMODE:Ljava/lang/String; = "uiMode"

.field private static final PREFIX_HARDKEYBOARDHIDDEN:Ljava/lang/String; = "HARDKEYBOARDHIDDEN_"

.field private static final PREFIX_KEYBOARD:Ljava/lang/String; = "KEYBOARD_"

.field private static final PREFIX_KEYBOARDHIDDEN:Ljava/lang/String; = "KEYBOARDHIDDEN_"

.field private static final PREFIX_NAVIGATION:Ljava/lang/String; = "NAVIGATION_"

.field private static final PREFIX_NAVIGATIONHIDDEN:Ljava/lang/String; = "NAVIGATIONHIDDEN_"

.field private static final PREFIX_ORIENTATION:Ljava/lang/String; = "ORIENTATION_"

.field private static final PREFIX_SCREENLAYOUT:Ljava/lang/String; = "SCREENLAYOUT_"

.field private static final PREFIX_TOUCHSCREEN:Ljava/lang/String; = "TOUCHSCREEN_"

.field private static final PREFIX_UI_MODE:Ljava/lang/String; = "UI_MODE_"

.field private static final SUFFIX_MASK:Ljava/lang/String; = "_MASK"


# instance fields
.field private final mValueArrays:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 22

    .prologue
    .line 62
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v15, Ljava/util/HashMap;

    invoke-direct {v15}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, p0

    iput-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    .line 64
    new-instance v6, Landroid/util/SparseArray;

    invoke-direct {v6}, Landroid/util/SparseArray;-><init>()V

    .line 65
    .local v6, "hardKeyboardHiddenValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v8, Landroid/util/SparseArray;

    invoke-direct {v8}, Landroid/util/SparseArray;-><init>()V

    .line 66
    .local v8, "keyboardValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v7, Landroid/util/SparseArray;

    invoke-direct {v7}, Landroid/util/SparseArray;-><init>()V

    .line 67
    .local v7, "keyboardHiddenValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v10, Landroid/util/SparseArray;

    invoke-direct {v10}, Landroid/util/SparseArray;-><init>()V

    .line 68
    .local v10, "navigationValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v9, Landroid/util/SparseArray;

    invoke-direct {v9}, Landroid/util/SparseArray;-><init>()V

    .line 69
    .local v9, "navigationHiddenValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v11, Landroid/util/SparseArray;

    invoke-direct {v11}, Landroid/util/SparseArray;-><init>()V

    .line 70
    .local v11, "orientationValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v12, Landroid/util/SparseArray;

    invoke-direct {v12}, Landroid/util/SparseArray;-><init>()V

    .line 71
    .local v12, "screenLayoutValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v13, Landroid/util/SparseArray;

    invoke-direct {v13}, Landroid/util/SparseArray;-><init>()V

    .line 72
    .local v13, "touchScreenValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v14, Landroid/util/SparseArray;

    invoke-direct {v14}, Landroid/util/SparseArray;-><init>()V

    .line 74
    .local v14, "uiModeValues":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    const-class v15, Landroid/content/res/Configuration;

    invoke-virtual {v15}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v16

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v17, v0

    const/4 v15, 0x0

    :goto_45
    move/from16 v0, v17

    if-ge v15, v0, :cond_164

    aget-object v4, v16, v15

    .line 75
    .local v4, "f":Ljava/lang/reflect/Field;
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v18

    if-eqz v18, :cond_7a

    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result v18

    if-eqz v18, :cond_7a

    .line 76
    invoke-virtual {v4}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    .line 78
    .local v5, "fieldName":Ljava/lang/String;
    :try_start_63
    const-string v18, "HARDKEYBOARDHIDDEN_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_7d

    .line 79
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v6, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 74
    .end local v5    # "fieldName":Ljava/lang/String;
    :cond_7a
    :goto_7a
    add-int/lit8 v15, v15, 0x1

    goto :goto_45

    .line 80
    .restart local v5    # "fieldName":Ljava/lang/String;
    :cond_7d
    const-string v18, "KEYBOARD_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_a6

    .line 81
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v8, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_94
    .catch Ljava/lang/IllegalArgumentException; {:try_start_63 .. :try_end_94} :catch_95
    .catch Ljava/lang/IllegalAccessException; {:try_start_63 .. :try_end_94} :catch_be

    goto :goto_7a

    .line 97
    :catch_95
    move-exception v3

    .line 98
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    sget-object v18, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v19, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v20, "Error while inspecting device configuration: "

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7a

    .line 82
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :cond_a6
    :try_start_a6
    const-string v18, "KEYBOARDHIDDEN_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_cf

    .line 83
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v7, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_bd
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a6 .. :try_end_bd} :catch_95
    .catch Ljava/lang/IllegalAccessException; {:try_start_a6 .. :try_end_bd} :catch_be

    goto :goto_7a

    .line 99
    :catch_be
    move-exception v3

    .line 100
    .local v3, "e":Ljava/lang/IllegalAccessException;
    sget-object v18, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v19, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v20, "Error while inspecting device configuration: "

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2, v3}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_7a

    .line 84
    .end local v3    # "e":Ljava/lang/IllegalAccessException;
    :cond_cf
    :try_start_cf
    const-string v18, "NAVIGATION_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_e7

    .line 85
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v10, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_7a

    .line 86
    :cond_e7
    const-string v18, "NAVIGATIONHIDDEN_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_100

    .line 87
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v9, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_7a

    .line 88
    :cond_100
    const-string v18, "ORIENTATION_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_119

    .line 89
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v11, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_7a

    .line 90
    :cond_119
    const-string v18, "SCREENLAYOUT_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_132

    .line 91
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v12, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_7a

    .line 92
    :cond_132
    const-string v18, "TOUCHSCREEN_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_14b

    .line 93
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v13, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto/16 :goto_7a

    .line 94
    :cond_14b
    const-string v18, "UI_MODE_"

    move-object/from16 v0, v18

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_7a

    .line 95
    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v14, v0, v5}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V
    :try_end_162
    .catch Ljava/lang/IllegalArgumentException; {:try_start_cf .. :try_end_162} :catch_95
    .catch Ljava/lang/IllegalAccessException; {:try_start_cf .. :try_end_162} :catch_be

    goto/16 :goto_7a

    .line 105
    .end local v4    # "f":Ljava/lang/reflect/Field;
    .end local v5    # "fieldName":Ljava/lang/String;
    :cond_164
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "HARDKEYBOARDHIDDEN_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "KEYBOARD_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "KEYBOARDHIDDEN_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "NAVIGATION_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "NAVIGATIONHIDDEN_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "ORIENTATION_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "SCREENLAYOUT_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "TOUCHSCREEN_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v16, "UI_MODE_"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    return-void
.end method

.method private static activeFlags(Landroid/util/SparseArray;I)Ljava/lang/String;
    .registers 8
    .param p0    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "bitfield"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;I)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 203
    .local p0, "valueNames":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .local v2, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p0}, Landroid/util/SparseArray;->size()I

    move-result v4

    if-ge v0, v4, :cond_39

    .line 207
    invoke-virtual {p0, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v1

    .line 208
    .local v1, "maskValue":I
    invoke-virtual {p0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "_MASK"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_36

    .line 209
    and-int v3, p1, v1

    .line 210
    .local v3, "value":I
    if-lez v3, :cond_36

    .line 211
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2d

    .line 212
    const/16 v4, 0x2b

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 214
    :cond_2d
    invoke-virtual {p0, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .end local v3    # "value":I
    :cond_36
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 218
    .end local v1    # "maskValue":I
    :cond_39
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public static collectConfiguration(Landroid/content/Context;)Ljava/lang/String;
    .registers 8
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 230
    :try_start_0
    new-instance v0, Lorg/acra/collector/ConfigurationCollector;

    invoke-direct {v0}, Lorg/acra/collector/ConfigurationCollector;-><init>()V

    .line 231
    .local v0, "collector":Lorg/acra/collector/ConfigurationCollector;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    .line 232
    .local v1, "crashConf":Landroid/content/res/Configuration;
    invoke-direct {v0, v1}, Lorg/acra/collector/ConfigurationCollector;->toString(Landroid/content/res/Configuration;)Ljava/lang/String;
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_10} :catch_12

    move-result-object v3

    .line 235
    .end local v0    # "collector":Lorg/acra/collector/ConfigurationCollector;
    .end local v1    # "crashConf":Landroid/content/res/Configuration;
    :goto_11
    return-object v3

    .line 233
    :catch_12
    move-exception v2

    .line 234
    .local v2, "e":Ljava/lang/RuntimeException;
    sget-object v3, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v4, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t retrieve CrashConfiguration for : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5, v2}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 235
    const-string v3, "Couldn\'t retrieve crash config"

    goto :goto_11
.end method

.method private getFieldValueName(Landroid/content/res/Configuration;Ljava/lang/reflect/Field;)Ljava/lang/String;
    .registers 9
    .param p1, "conf"    # Landroid/content/res/Configuration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "f"    # Ljava/lang/reflect/Field;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-virtual {p2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, "fieldName":Ljava/lang/String;
    const-string v3, "mcc"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_14

    const-string v3, "mnc"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 167
    :cond_14
    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 184
    :cond_1c
    :goto_1c
    return-object v1

    .line 168
    :cond_1d
    const-string v3, "uiMode"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_38

    .line 169
    iget-object v3, p0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v4, "UI_MODE_"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v3, v4}, Lorg/acra/collector/ConfigurationCollector;->activeFlags(Landroid/util/SparseArray;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1c

    .line 170
    :cond_38
    const-string v3, "screenLayout"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_53

    .line 171
    iget-object v3, p0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    const-string v4, "SCREENLAYOUT_"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v3, v4}, Lorg/acra/collector/ConfigurationCollector;->activeFlags(Landroid/util/SparseArray;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1c

    .line 173
    :cond_53
    iget-object v3, p0, Lorg/acra/collector/ConfigurationCollector;->mValueArrays:Ljava/util/Map;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x5f

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/SparseArray;

    .line 174
    .local v2, "values":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    if-nez v2, :cond_7d

    .line 176
    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1c

    .line 179
    :cond_7d
    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 180
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_1c

    .line 182
    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1c
.end method

.method private toString(Landroid/content/res/Configuration;)Ljava/lang/String;
    .registers 12
    .param p1, "conf"    # Landroid/content/res/Configuration;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 127
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .local v3, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    array-length v6, v5

    const/4 v4, 0x0

    :goto_f
    if-ge v4, v6, :cond_6d

    aget-object v1, v5, v4

    .line 130
    .local v1, "f":Ljava/lang/reflect/Field;
    :try_start_13
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v7

    invoke-static {v7}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v7

    if-nez v7, :cond_42

    .line 131
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    .line 132
    .local v2, "fieldName":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x3d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v7

    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_45

    .line 134
    invoke-direct {p0, p1, v1}, Lorg/acra/collector/ConfigurationCollector;->getFieldValueName(Landroid/content/res/Configuration;Ljava/lang/reflect/Field;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    :cond_3d
    :goto_3d
    const/16 v7, 0xa

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    .end local v2    # "fieldName":Ljava/lang/String;
    :cond_42
    :goto_42
    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    .line 135
    .restart local v2    # "fieldName":Ljava/lang/String;
    :cond_45
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_3d

    .line 136
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_56
    .catch Ljava/lang/IllegalArgumentException; {:try_start_13 .. :try_end_56} :catch_57
    .catch Ljava/lang/IllegalAccessException; {:try_start_13 .. :try_end_56} :catch_62

    goto :goto_3d

    .line 140
    .end local v2    # "fieldName":Ljava/lang/String;
    :catch_57
    move-exception v0

    .line 141
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error while inspecting device configuration: "

    invoke-interface {v7, v8, v9, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_42

    .line 142
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_62
    move-exception v0

    .line 143
    .local v0, "e":Ljava/lang/IllegalAccessException;
    sget-object v7, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v8, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Error while inspecting device configuration: "

    invoke-interface {v7, v8, v9, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_42

    .line 146
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    .end local v1    # "f":Ljava/lang/reflect/Field;
    :cond_6d
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
