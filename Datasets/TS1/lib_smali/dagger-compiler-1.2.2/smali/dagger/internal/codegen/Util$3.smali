.class synthetic Ldagger/internal/codegen/Util$3;
.super Ljava/lang/Object;
.source "Util.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ldagger/internal/codegen/Util;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$javax$lang$model$element$ElementKind:[I

.field static final synthetic $SwitchMap$javax$lang$model$type$TypeKind:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 270
    invoke-static {}, Ljavax/lang/model/type/TypeKind;->values()[Ljavax/lang/model/type/TypeKind;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    :try_start_9
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->BYTE:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_b1

    :goto_14
    :try_start_14
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->SHORT:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_ae

    :goto_1f
    :try_start_1f
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->INT:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_ab

    :goto_2a
    :try_start_2a
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->LONG:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_35
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2a .. :try_end_35} :catch_a9

    :goto_35
    :try_start_35
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->FLOAT:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_35 .. :try_end_40} :catch_a7

    :goto_40
    :try_start_40
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->DOUBLE:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_40 .. :try_end_4b} :catch_a5

    :goto_4b
    :try_start_4b
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->BOOLEAN:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_56} :catch_a3

    :goto_56
    :try_start_56
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->CHAR:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_62} :catch_a1

    :goto_62
    :try_start_62
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$type$TypeKind:[I

    sget-object v1, Ljavax/lang/model/type/TypeKind;->VOID:Ljavax/lang/model/type/TypeKind;

    invoke-virtual {v1}, Ljavax/lang/model/type/TypeKind;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_62 .. :try_end_6e} :catch_9f

    .line 243
    :goto_6e
    invoke-static {}, Ljavax/lang/model/element/ElementKind;->values()[Ljavax/lang/model/element/ElementKind;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$element$ElementKind:[I

    :try_start_77
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$element$ElementKind:[I

    sget-object v1, Ljavax/lang/model/element/ElementKind;->FIELD:Ljavax/lang/model/element/ElementKind;

    invoke-virtual {v1}, Ljavax/lang/model/element/ElementKind;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_82
    .catch Ljava/lang/NoSuchFieldError; {:try_start_77 .. :try_end_82} :catch_9d

    :goto_82
    :try_start_82
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$element$ElementKind:[I

    sget-object v1, Ljavax/lang/model/element/ElementKind;->CONSTRUCTOR:Ljavax/lang/model/element/ElementKind;

    invoke-virtual {v1}, Ljavax/lang/model/element/ElementKind;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_8d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_82 .. :try_end_8d} :catch_9b

    :goto_8d
    :try_start_8d
    sget-object v0, Ldagger/internal/codegen/Util$3;->$SwitchMap$javax$lang$model$element$ElementKind:[I

    sget-object v1, Ljavax/lang/model/element/ElementKind;->METHOD:Ljavax/lang/model/element/ElementKind;

    invoke-virtual {v1}, Ljavax/lang/model/element/ElementKind;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_98
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8d .. :try_end_98} :catch_99

    :goto_98
    return-void

    :catch_99
    move-exception v0

    goto :goto_98

    :catch_9b
    move-exception v0

    goto :goto_8d

    :catch_9d
    move-exception v0

    goto :goto_82

    .line 270
    :catch_9f
    move-exception v0

    goto :goto_6e

    :catch_a1
    move-exception v0

    goto :goto_62

    :catch_a3
    move-exception v0

    goto :goto_56

    :catch_a5
    move-exception v0

    goto :goto_4b

    :catch_a7
    move-exception v0

    goto :goto_40

    :catch_a9
    move-exception v0

    goto :goto_35

    :catch_ab
    move-exception v0

    goto/16 :goto_2a

    :catch_ae
    move-exception v0

    goto/16 :goto_1f

    :catch_b1
    move-exception v0

    goto/16 :goto_14
.end method
