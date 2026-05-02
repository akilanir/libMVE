.class public Lcom/github/mikephil/charting/animation/Easing;
.super Ljava/lang/Object;
.source "Easing.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/github/mikephil/charting/animation/Easing$1;,
        Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;,
        Lcom/github/mikephil/charting/animation/Easing$EasingOption;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    return-void
.end method

.method public static getEasingFunctionFromOption(Lcom/github/mikephil/charting/animation/Easing$EasingOption;)Lcom/github/mikephil/charting/animation/EasingFunction;
    .registers 3
    .param p0, "easing"    # Lcom/github/mikephil/charting/animation/Easing$EasingOption;

    .prologue
    .line 47
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$1;->$SwitchMap$com$github$mikephil$charting$animation$Easing$EasingOption:[I

    invoke-virtual {p0}, Lcom/github/mikephil/charting/animation/Easing$EasingOption;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_60

    .line 50
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->Linear:Lcom/github/mikephil/charting/animation/EasingFunction;

    .line 104
    :goto_d
    return-object v0

    .line 52
    :pswitch_e
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInQuad:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 54
    :pswitch_11
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutQuad:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 56
    :pswitch_14
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutQuad:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 58
    :pswitch_17
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInCubic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 60
    :pswitch_1a
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutCubic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 62
    :pswitch_1d
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutCubic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 64
    :pswitch_20
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInQuart:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 66
    :pswitch_23
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutQuart:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 68
    :pswitch_26
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutQuart:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 70
    :pswitch_29
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInSine:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 72
    :pswitch_2c
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutSine:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 74
    :pswitch_2f
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutSine:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 76
    :pswitch_32
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInExpo:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 78
    :pswitch_35
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutExpo:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 80
    :pswitch_38
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutExpo:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 82
    :pswitch_3b
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInCirc:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 84
    :pswitch_3e
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutCirc:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 86
    :pswitch_41
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutCirc:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 88
    :pswitch_44
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInElastic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 90
    :pswitch_47
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutElastic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 92
    :pswitch_4a
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutElastic:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 94
    :pswitch_4d
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInBack:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 96
    :pswitch_50
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutBack:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 98
    :pswitch_53
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutBack:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 100
    :pswitch_56
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInBounce:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 102
    :pswitch_59
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseOutBounce:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 104
    :pswitch_5c
    sget-object v0, Lcom/github/mikephil/charting/animation/Easing$EasingFunctions;->EaseInOutBounce:Lcom/github/mikephil/charting/animation/EasingFunction;

    goto :goto_d

    .line 47
    nop

    :pswitch_data_60
    .packed-switch 0x2
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_23
        :pswitch_26
        :pswitch_29
        :pswitch_2c
        :pswitch_2f
        :pswitch_32
        :pswitch_35
        :pswitch_38
        :pswitch_3b
        :pswitch_3e
        :pswitch_41
        :pswitch_44
        :pswitch_47
        :pswitch_4a
        :pswitch_4d
        :pswitch_50
        :pswitch_53
        :pswitch_56
        :pswitch_59
        :pswitch_5c
    .end packed-switch
.end method
