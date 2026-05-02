.class public Lch/qos/logback/classic/android/LogcatAppender;
.super Lch/qos/logback/core/AppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lch/qos/logback/core/AppenderBase",
        "<",
        "Lch/qos/logback/classic/spi/ILoggingEvent;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_TAG_LENGTH:I = 0x17


# instance fields
.field private checkLoggable:Z

.field private encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

.field private tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    iput-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    iput-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    return-void
.end method


# virtual methods
.method public append(Lch/qos/logback/classic/spi/ILoggingEvent;)V
    .registers 4

    invoke-virtual {p0}, Lch/qos/logback/classic/android/LogcatAppender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :cond_6
    :goto_6
    return-void

    :cond_7
    invoke-virtual {p0, p1}, Lch/qos/logback/classic/android/LogcatAppender;->getTag(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLevel()Lch/qos/logback/classic/Level;

    move-result-object v1

    iget v1, v1, Lch/qos/logback/classic/Level;->levelInt:I

    sparse-switch v1, :sswitch_data_94

    goto :goto_6

    :sswitch_15
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_20

    const/4 v1, 0x2

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_20
    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    invoke-interface {v1, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :sswitch_2e
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_39

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_39
    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    invoke-interface {v1, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :sswitch_47
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_52

    const/4 v1, 0x4

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_52
    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    invoke-interface {v1, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :sswitch_60
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_6b

    const/4 v1, 0x5

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_6b
    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    invoke-interface {v1, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    :sswitch_79
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_84

    const/4 v1, 0x6

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_6

    :cond_84
    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v1

    invoke-interface {v1, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_6

    nop

    :sswitch_data_94
    .sparse-switch
        -0x80000000 -> :sswitch_15
        0x1388 -> :sswitch_15
        0x2710 -> :sswitch_2e
        0x4e20 -> :sswitch_47
        0x7530 -> :sswitch_60
        0x9c40 -> :sswitch_79
    .end sparse-switch
.end method

.method public bridge synthetic append(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lch/qos/logback/classic/spi/ILoggingEvent;

    invoke-virtual {p0, p1}, Lch/qos/logback/classic/android/LogcatAppender;->append(Lch/qos/logback/classic/spi/ILoggingEvent;)V

    return-void
.end method

.method public getCheckLoggable()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    return v0
.end method

.method public getEncoder()Lch/qos/logback/classic/encoder/PatternLayoutEncoder;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    return-object v0
.end method

.method protected getTag(Lch/qos/logback/classic/spi/ILoggingEvent;)Ljava/lang/String;
    .registers 6

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    if-eqz v0, :cond_35

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v0}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v0

    invoke-interface {v0, p1}, Lch/qos/logback/core/Layout;->doLayout(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_e
    iget-boolean v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    if-eqz v1, :cond_34

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x17

    if-le v1, v2, :cond_34

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    const/16 v3, 0x16

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_34
    return-object v0

    :cond_35
    invoke-interface {p1}, Lch/qos/logback/classic/spi/ILoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public getTagEncoder()Lch/qos/logback/classic/encoder/PatternLayoutEncoder;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    return-object v0
.end method

.method public setCheckLoggable(Z)V
    .registers 2

    iput-boolean p1, p0, Lch/qos/logback/classic/android/LogcatAppender;->checkLoggable:Z

    return-void
.end method

.method public setEncoder(Lch/qos/logback/classic/encoder/PatternLayoutEncoder;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    return-void
.end method

.method public setTagEncoder(Lch/qos/logback/classic/encoder/PatternLayoutEncoder;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    return-void
.end method

.method public start()V
    .registers 5

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->encoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v0}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v0

    if-nez v0, :cond_2b

    :cond_c
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "No layout set for the appender named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/android/LogcatAppender;->addError(Ljava/lang/String;)V

    :goto_2a
    return-void

    :cond_2b
    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    if-eqz v0, :cond_90

    iget-object v0, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v0}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getLayout()Lch/qos/logback/core/Layout;

    move-result-object v0

    if-nez v0, :cond_56

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "No tag layout set for the appender named ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/classic/android/LogcatAppender;->addError(Ljava/lang/String;)V

    goto :goto_2a

    :cond_56
    instance-of v1, v0, Lch/qos/logback/classic/PatternLayout;

    if-eqz v1, :cond_90

    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->getPattern()Ljava/lang/String;

    move-result-object v1

    const-string v2, "%nopex"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8a

    iget-object v2, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v2}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->stop()V

    iget-object v2, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "%nopex"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->setPattern(Ljava/lang/String;)V

    iget-object v1, p0, Lch/qos/logback/classic/android/LogcatAppender;->tagEncoder:Lch/qos/logback/classic/encoder/PatternLayoutEncoder;

    invoke-virtual {v1}, Lch/qos/logback/classic/encoder/PatternLayoutEncoder;->start()V

    :cond_8a
    check-cast v0, Lch/qos/logback/classic/PatternLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lch/qos/logback/classic/PatternLayout;->setPostCompileProcessor(Lch/qos/logback/core/pattern/PostCompileProcessor;)V

    :cond_90
    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->start()V

    goto :goto_2a
.end method
