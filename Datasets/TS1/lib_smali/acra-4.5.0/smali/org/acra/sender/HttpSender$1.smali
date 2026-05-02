.class synthetic Lorg/acra/sender/HttpSender$1;
.super Ljava/lang/Object;
.source "HttpSender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/sender/HttpSender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$acra$sender$HttpSender$Method:[I

.field static final synthetic $SwitchMap$org$acra$sender$HttpSender$Type:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 216
    invoke-static {}, Lorg/acra/sender/HttpSender$Method;->values()[Lorg/acra/sender/HttpSender$Method;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    :try_start_9
    sget-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    sget-object v1, Lorg/acra/sender/HttpSender$Method;->POST:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v1}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_45

    :goto_14
    :try_start_14
    sget-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Method:[I

    sget-object v1, Lorg/acra/sender/HttpSender$Method;->PUT:Lorg/acra/sender/HttpSender$Method;

    invoke-virtual {v1}, Lorg/acra/sender/HttpSender$Method;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_43

    .line 203
    :goto_1f
    invoke-static {}, Lorg/acra/sender/HttpSender$Type;->values()[Lorg/acra/sender/HttpSender$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    :try_start_28
    sget-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    sget-object v1, Lorg/acra/sender/HttpSender$Type;->JSON:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v1}, Lorg/acra/sender/HttpSender$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_41

    :goto_33
    :try_start_33
    sget-object v0, Lorg/acra/sender/HttpSender$1;->$SwitchMap$org$acra$sender$HttpSender$Type:[I

    sget-object v1, Lorg/acra/sender/HttpSender$Type;->FORM:Lorg/acra/sender/HttpSender$Type;

    invoke-virtual {v1}, Lorg/acra/sender/HttpSender$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_3f

    :goto_3e
    return-void

    :catch_3f
    move-exception v0

    goto :goto_3e

    :catch_41
    move-exception v0

    goto :goto_33

    .line 216
    :catch_43
    move-exception v0

    goto :goto_1f

    :catch_45
    move-exception v0

    goto :goto_14
.end method
