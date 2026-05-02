.class public final Lcom/google/zxing/client/android/DecodeHintManager;
.super Ljava/lang/Object;
.source "DecodeHintManager.java"


# static fields
.field private static final COMMA:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-class v0, Lcom/google/zxing/client/android/DecodeHintManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    .line 39
    const-string v0, ","

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/android/DecodeHintManager;->COMMA:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static parseDecodeHints(Landroid/content/Intent;)Ljava/util/Map;
    .registers 12
    .param p0, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 204
    .local v1, "extras":Landroid/os/Bundle;
    if-eqz v1, :cond_c

    invoke-virtual {v1}, Landroid/os/Bundle;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_e

    .line 205
    :cond_c
    const/4 v5, 0x0

    .line 234
    :goto_d
    return-object v5

    .line 207
    :cond_e
    new-instance v5, Ljava/util/EnumMap;

    const-class v8, Lcom/google/zxing/DecodeHintType;

    invoke-direct {v5, v8}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 209
    .local v5, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/google/zxing/DecodeHintType;->values()[Lcom/google/zxing/DecodeHintType;

    move-result-object v0

    .local v0, "arr$":[Lcom/google/zxing/DecodeHintType;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_1b
    if-ge v6, v7, :cond_7f

    aget-object v4, v0, v6

    .line 211
    .local v4, "hintType":Lcom/google/zxing/DecodeHintType;
    sget-object v8, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    if-eq v4, v8, :cond_2b

    sget-object v8, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    if-eq v4, v8, :cond_2b

    sget-object v8, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    if-ne v4, v8, :cond_2e

    .line 209
    :cond_2b
    :goto_2b
    add-int/lit8 v6, v6, 0x1

    goto :goto_1b

    .line 217
    :cond_2e
    invoke-virtual {v4}, Lcom/google/zxing/DecodeHintType;->name()Ljava/lang/String;

    move-result-object v3

    .line 218
    .local v3, "hintName":Ljava/lang/String;
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2b

    .line 219
    invoke-virtual {v4}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v8

    const-class v9, Ljava/lang/Void;

    invoke-virtual {v8, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4a

    .line 221
    sget-object v8, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v5, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    .line 223
    :cond_4a
    invoke-virtual {v1, v3}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 224
    .local v2, "hintData":Ljava/lang/Object;
    invoke-virtual {v4}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5c

    .line 225
    invoke-interface {v5, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2b

    .line 227
    :cond_5c
    sget-object v8, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Ignoring hint "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " because it is not assignable from "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2b

    .line 233
    .end local v2    # "hintData":Ljava/lang/Object;
    .end local v3    # "hintName":Ljava/lang/String;
    .end local v4    # "hintType":Lcom/google/zxing/DecodeHintType;
    :cond_7f
    sget-object v8, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Hints from the Intent: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d
.end method

.method static parseDecodeHints(Landroid/net/Uri;)Ljava/util/Map;
    .registers 17
    .param p0, "inputUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;"
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual/range {p0 .. p0}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v11

    .line 120
    .local v11, "query":Ljava/lang/String;
    if-eqz v11, :cond_c

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_e

    .line 121
    :cond_c
    const/4 v3, 0x0

    .line 199
    :goto_d
    return-object v3

    .line 125
    :cond_e
    invoke-static {v11}, Lcom/google/zxing/client/android/DecodeHintManager;->splitQuery(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v10

    .line 127
    .local v10, "parameters":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v3, Ljava/util/EnumMap;

    const-class v13, Lcom/google/zxing/DecodeHintType;

    invoke-direct {v3, v13}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 129
    .local v3, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-static {}, Lcom/google/zxing/DecodeHintType;->values()[Lcom/google/zxing/DecodeHintType;

    move-result-object v0

    .local v0, "arr$":[Lcom/google/zxing/DecodeHintType;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    :goto_1f
    if-ge v5, v7, :cond_14a

    aget-object v2, v0, v5

    .line 131
    .local v2, "hintType":Lcom/google/zxing/DecodeHintType;
    sget-object v13, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    if-eq v2, v13, :cond_2f

    sget-object v13, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    if-eq v2, v13, :cond_2f

    sget-object v13, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    if-ne v2, v13, :cond_32

    .line 129
    :cond_2f
    :goto_2f
    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    .line 137
    :cond_32
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->name()Ljava/lang/String;

    move-result-object v8

    .line 138
    .local v8, "parameterName":Ljava/lang/String;
    invoke-interface {v10, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 139
    .local v9, "parameterText":Ljava/lang/String;
    if-eqz v9, :cond_2f

    .line 142
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v13

    const-class v14, Ljava/lang/Object;

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4e

    .line 145
    invoke-interface {v3, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 148
    :cond_4e
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v13

    const-class v14, Ljava/lang/Void;

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_60

    .line 150
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 153
    :cond_60
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v13

    const-class v14, Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_70

    .line 155
    invoke-interface {v3, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 158
    :cond_70
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v13

    const-class v14, Ljava/lang/Boolean;

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_ac

    .line 161
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_88

    .line 162
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 163
    :cond_88
    const-string v13, "0"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_a0

    const-string v13, "false"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_a0

    const-string v13, "no"

    invoke-virtual {v13, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_a6

    .line 166
    :cond_a0
    sget-object v13, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v3, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 168
    :cond_a6
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v3, v2, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2f

    .line 173
    :cond_ac
    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v13

    const-class v14, [I

    invoke-virtual {v13, v14}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_122

    .line 176
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_d7

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    invoke-virtual {v9, v13}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x2c

    if-ne v13, v14, :cond_d7

    .line 177
    const/4 v13, 0x0

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-virtual {v9, v13, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 179
    :cond_d7
    sget-object v13, Lcom/google/zxing/client/android/DecodeHintManager;->COMMA:Ljava/util/regex/Pattern;

    invoke-virtual {v13, v9}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v12

    .line 180
    .local v12, "values":[Ljava/lang/String;
    array-length v13, v12

    new-array v1, v13, [I

    .line 181
    .local v1, "array":[I
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_e1
    array-length v13, v12

    if-ge v4, v13, :cond_11b

    .line 183
    :try_start_e4
    aget-object v13, v12, v4

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    aput v13, v1, v4
    :try_end_ec
    .catch Ljava/lang/NumberFormatException; {:try_start_e4 .. :try_end_ec} :catch_ef

    .line 181
    add-int/lit8 v4, v4, 0x1

    goto :goto_e1

    .line 184
    :catch_ef
    move-exception v6

    .line 185
    .local v6, "ignored":Ljava/lang/NumberFormatException;
    sget-object v13, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Skipping array of integers hint "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " due to invalid numeric value: \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    aget-object v15, v12, v4

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const/16 v15, 0x27

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    const/4 v1, 0x0

    .line 190
    .end local v6    # "ignored":Ljava/lang/NumberFormatException;
    :cond_11b
    if-eqz v1, :cond_2f

    .line 191
    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_2f

    .line 195
    .end local v1    # "array":[I
    .end local v4    # "i":I
    .end local v12    # "values":[Ljava/lang/String;
    :cond_122
    sget-object v13, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Unsupported hint type \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\' of type "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v2}, Lcom/google/zxing/DecodeHintType;->getValueType()Ljava/lang/Class;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2f

    .line 198
    .end local v2    # "hintType":Lcom/google/zxing/DecodeHintType;
    .end local v8    # "parameterName":Ljava/lang/String;
    .end local v9    # "parameterText":Ljava/lang/String;
    :cond_14a
    sget-object v13, Lcom/google/zxing/client/android/DecodeHintManager;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Hints from the URI: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d
.end method

.method private static splitQuery(Ljava/lang/String;)Ljava/util/Map;
    .registers 11
    .param p0, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v9, 0x26

    const/16 v8, 0x2b

    const/16 v7, 0x20

    .line 59
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 60
    .local v2, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 61
    .local v4, "pos":I
    :goto_c
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_40

    .line 62
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v6, v9, :cond_1b

    .line 64
    add-int/lit8 v4, v4, 0x1

    .line 65
    goto :goto_c

    .line 67
    :cond_1b
    invoke-virtual {p0, v9, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 68
    .local v0, "amp":I
    const/16 v6, 0x3d

    invoke-virtual {p0, v6, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 69
    .local v1, "equ":I
    if-gez v0, :cond_5c

    .line 73
    if-gez v1, :cond_41

    .line 75
    invoke-virtual {p0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 76
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 77
    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 78
    const-string v5, ""

    .line 88
    .local v5, "text":Ljava/lang/String;
    :goto_37
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_40

    .line 89
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v0    # "amp":I
    .end local v1    # "equ":I
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "text":Ljava/lang/String;
    :cond_40
    return-object v2

    .line 81
    .restart local v0    # "amp":I
    .restart local v1    # "equ":I
    :cond_41
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 82
    .restart local v3    # "name":Ljava/lang/String;
    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 83
    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 84
    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .line 85
    .restart local v5    # "text":Ljava/lang/String;
    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 86
    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_37

    .line 93
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "text":Ljava/lang/String;
    :cond_5c
    if-ltz v1, :cond_60

    if-le v1, v0, :cond_7a

    .line 95
    :cond_60
    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 96
    .restart local v3    # "name":Ljava/lang/String;
    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 97
    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 98
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_77

    .line 99
    const-string v6, ""

    invoke-interface {v2, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    :cond_77
    add-int/lit8 v4, v0, 0x1

    .line 102
    goto :goto_c

    .line 104
    .end local v3    # "name":Ljava/lang/String;
    :cond_7a
    invoke-virtual {p0, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 105
    .restart local v3    # "name":Ljava/lang/String;
    invoke-virtual {v3, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 106
    invoke-static {v3}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 107
    add-int/lit8 v6, v1, 0x1

    invoke-virtual {p0, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 108
    .restart local v5    # "text":Ljava/lang/String;
    invoke-virtual {v5, v8, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 109
    invoke-static {v5}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 110
    invoke-interface {v2, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_9d

    .line 111
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    :cond_9d
    add-int/lit8 v4, v0, 0x1

    .line 114
    goto/16 :goto_c
.end method
