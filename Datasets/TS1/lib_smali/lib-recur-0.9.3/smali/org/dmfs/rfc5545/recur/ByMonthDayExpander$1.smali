.class synthetic Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/ByMonthDayExpander;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->values()[Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    :try_start_9
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_2f

    :goto_14
    :try_start_14
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->WEEKLY_AND_MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_2d

    :goto_1f
    :try_start_1f
    sget-object v0, Lorg/dmfs/rfc5545/recur/ByMonthDayExpander$1;->$SwitchMap$org$dmfs$rfc5545$recur$ByExpander$Scope:[I

    sget-object v1, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->MONTHLY:Lorg/dmfs/rfc5545/recur/ByExpander$Scope;

    invoke-virtual {v1}, Lorg/dmfs/rfc5545/recur/ByExpander$Scope;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_2a} :catch_2b

    :goto_2a
    return-void

    :catch_2b
    move-exception v0

    goto :goto_2a

    :catch_2d
    move-exception v0

    goto :goto_1f

    :catch_2f
    move-exception v0

    goto :goto_14
.end method
