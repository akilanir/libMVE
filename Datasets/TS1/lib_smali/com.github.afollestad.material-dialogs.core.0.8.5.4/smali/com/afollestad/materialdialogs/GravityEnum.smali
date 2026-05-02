.class public final enum Lcom/afollestad/materialdialogs/GravityEnum;
.super Ljava/lang/Enum;
.source "GravityEnum.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/afollestad/materialdialogs/GravityEnum$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/afollestad/materialdialogs/GravityEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

.field public static final enum CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

.field public static final enum END:Lcom/afollestad/materialdialogs/GravityEnum;

.field private static final HAS_RTL:Z

.field public static final enum START:Lcom/afollestad/materialdialogs/GravityEnum;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 10
    new-instance v2, Lcom/afollestad/materialdialogs/GravityEnum;

    const-string v3, "START"

    invoke-direct {v2, v3, v1}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    new-instance v2, Lcom/afollestad/materialdialogs/GravityEnum;

    const-string v3, "CENTER"

    invoke-direct {v2, v3, v0}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/afollestad/materialdialogs/GravityEnum;->CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

    new-instance v2, Lcom/afollestad/materialdialogs/GravityEnum;

    const-string v3, "END"

    invoke-direct {v2, v3, v4}, Lcom/afollestad/materialdialogs/GravityEnum;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 9
    const/4 v2, 0x3

    new-array v2, v2, [Lcom/afollestad/materialdialogs/GravityEnum;

    sget-object v3, Lcom/afollestad/materialdialogs/GravityEnum;->START:Lcom/afollestad/materialdialogs/GravityEnum;

    aput-object v3, v2, v1

    sget-object v3, Lcom/afollestad/materialdialogs/GravityEnum;->CENTER:Lcom/afollestad/materialdialogs/GravityEnum;

    aput-object v3, v2, v0

    sget-object v3, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    aput-object v3, v2, v4

    sput-object v2, Lcom/afollestad/materialdialogs/GravityEnum;->$VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

    .line 12
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x11

    if-lt v2, v3, :cond_38

    :goto_35
    sput-boolean v0, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    return-void

    :cond_38
    move v0, v1

    goto :goto_35
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 24
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/afollestad/materialdialogs/GravityEnum;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/afollestad/materialdialogs/GravityEnum;

    return-object v0
.end method

.method public static values()[Lcom/afollestad/materialdialogs/GravityEnum;
    .registers 1

    .prologue
    .line 9
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->$VALUES:[Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-virtual {v0}, [Lcom/afollestad/materialdialogs/GravityEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/afollestad/materialdialogs/GravityEnum;

    return-object v0
.end method


# virtual methods
.method public getGravityInt()I
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .prologue
    .line 16
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum$1;->$SwitchMap$com$afollestad$materialdialogs$GravityEnum:[I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/GravityEnum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2a

    .line 24
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid gravity constant"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 18
    :pswitch_13
    sget-boolean v0, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    if-eqz v0, :cond_1b

    const v0, 0x800003

    .line 22
    :goto_1a
    return v0

    .line 18
    :cond_1b
    const/4 v0, 0x3

    goto :goto_1a

    .line 20
    :pswitch_1d
    const/4 v0, 0x1

    goto :goto_1a

    .line 22
    :pswitch_1f
    sget-boolean v0, Lcom/afollestad/materialdialogs/GravityEnum;->HAS_RTL:Z

    if-eqz v0, :cond_27

    const v0, 0x800005

    goto :goto_1a

    :cond_27
    const/4 v0, 0x5

    goto :goto_1a

    .line 16
    nop

    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_13
        :pswitch_1d
        :pswitch_1f
    .end packed-switch
.end method

.method public getTextAlignment()I
    .registers 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 30
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum$1;->$SwitchMap$com$afollestad$materialdialogs$GravityEnum:[I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/GravityEnum;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_12

    .line 36
    const/4 v0, 0x5

    :goto_c
    return v0

    .line 32
    :pswitch_d
    const/4 v0, 0x4

    goto :goto_c

    .line 34
    :pswitch_f
    const/4 v0, 0x6

    goto :goto_c

    .line 30
    nop

    :pswitch_data_12
    .packed-switch 0x2
        :pswitch_d
        :pswitch_f
    .end packed-switch
.end method
