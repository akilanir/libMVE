.class public Lch/qos/logback/core/joran/action/ActionUtil;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/joran/action/ActionUtil$1;,
        Lch/qos/logback/core/joran/action/ActionUtil$Scope;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static setProperties(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/util/Properties;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V
    .registers 5

    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$1;->$SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope:[I

    invoke-virtual {p2}, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_22

    :goto_b
    return-void

    :pswitch_c
    invoke-virtual {p0, p1}, Lch/qos/logback/core/joran/spi/InterpretationContext;->addSubstitutionProperties(Ljava/util/Properties;)V

    goto :goto_b

    :pswitch_10
    new-instance v0, Lch/qos/logback/core/util/ContextUtil;

    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getContext()Lch/qos/logback/core/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lch/qos/logback/core/util/ContextUtil;-><init>(Lch/qos/logback/core/Context;)V

    invoke-virtual {v0, p1}, Lch/qos/logback/core/util/ContextUtil;->addProperties(Ljava/util/Properties;)V

    goto :goto_b

    :pswitch_1d
    invoke-static {p0, p1}, Lch/qos/logback/core/util/OptionHelper;->setSystemProperties(Lch/qos/logback/core/spi/ContextAware;Ljava/util/Properties;)V

    goto :goto_b

    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_c
        :pswitch_10
        :pswitch_1d
    .end packed-switch
.end method

.method public static setProperty(Lch/qos/logback/core/joran/spi/InterpretationContext;Ljava/lang/String;Ljava/lang/String;Lch/qos/logback/core/joran/action/ActionUtil$Scope;)V
    .registers 6

    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$1;->$SwitchMap$ch$qos$logback$core$joran$action$ActionUtil$Scope:[I

    invoke-virtual {p3}, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_1c

    :goto_b
    return-void

    :pswitch_c
    invoke-virtual {p0, p1, p2}, Lch/qos/logback/core/joran/spi/InterpretationContext;->addSubstitutionProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    :pswitch_10
    invoke-virtual {p0}, Lch/qos/logback/core/joran/spi/InterpretationContext;->getContext()Lch/qos/logback/core/Context;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lch/qos/logback/core/Context;->putProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    :pswitch_18
    invoke-static {p0, p1, p2}, Lch/qos/logback/core/util/OptionHelper;->setSystemProperty(Lch/qos/logback/core/spi/ContextAware;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_b

    :pswitch_data_1c
    .packed-switch 0x1
        :pswitch_c
        :pswitch_10
        :pswitch_18
    .end packed-switch
.end method

.method public static stringToScope(Ljava/lang/String;)Lch/qos/logback/core/joran/action/ActionUtil$Scope;
    .registers 2

    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->SYSTEM:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->SYSTEM:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    :goto_e
    return-object v0

    :cond_f
    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->CONTEXT:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    invoke-virtual {v0}, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->CONTEXT:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    goto :goto_e

    :cond_1e
    sget-object v0, Lch/qos/logback/core/joran/action/ActionUtil$Scope;->LOCAL:Lch/qos/logback/core/joran/action/ActionUtil$Scope;

    goto :goto_e
.end method
