.class public abstract Lch/qos/logback/classic/turbo/MatchingFilter;
.super Lch/qos/logback/classic/turbo/TurboFilter;


# instance fields
.field protected onMatch:Lch/qos/logback/core/spi/FilterReply;

.field protected onMismatch:Lch/qos/logback/core/spi/FilterReply;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/classic/turbo/TurboFilter;-><init>()V

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMatch:Lch/qos/logback/core/spi/FilterReply;

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    return-void
.end method


# virtual methods
.method public final setOnMatch(Ljava/lang/String;)V
    .registers 3

    const-string v0, "NEUTRAL"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMatch:Lch/qos/logback/core/spi/FilterReply;

    :cond_c
    :goto_c
    return-void

    :cond_d
    const-string v0, "ACCEPT"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_c

    :cond_1a
    const-string v0, "DENY"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_c
.end method

.method public final setOnMismatch(Ljava/lang/String;)V
    .registers 3

    const-string v0, "NEUTRAL"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    :cond_c
    :goto_c
    return-void

    :cond_d
    const-string v0, "ACCEPT"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_c

    :cond_1a
    const-string v0, "DENY"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    iput-object v0, p0, Lch/qos/logback/classic/turbo/MatchingFilter;->onMismatch:Lch/qos/logback/core/spi/FilterReply;

    goto :goto_c
.end method
