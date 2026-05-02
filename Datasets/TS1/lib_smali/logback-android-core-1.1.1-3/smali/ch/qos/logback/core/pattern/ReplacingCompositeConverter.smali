.class public Lch/qos/logback/core/pattern/ReplacingCompositeConverter;
.super Lch/qos/logback/core/pattern/CompositeConverter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/pattern/CompositeConverter",
        "<TE;>;"
    }
.end annotation


# instance fields
.field pattern:Ljava/util/regex/Pattern;

.field regex:Ljava/lang/String;

.field replacement:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/CompositeConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public start()V
    .registers 5

    invoke-virtual {p0}, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->getOptionList()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_c

    const-string v0, "at least two options are expected whereas you have declared none"

    invoke-virtual {p0, v0}, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->addError(Ljava/lang/String;)V

    :goto_b
    return-void

    :cond_c
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x2

    if-ge v0, v2, :cond_3a

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "at least two options are expected whereas you have declared only "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "as ["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->addError(Ljava/lang/String;)V

    goto :goto_b

    :cond_3a
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->regex:Ljava/lang/String;

    iget-object v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->regex:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->pattern:Ljava/util/regex/Pattern;

    const/4 v0, 0x1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->replacement:Ljava/lang/String;

    invoke-super {p0}, Lch/qos/logback/core/pattern/CompositeConverter;->start()V

    goto :goto_b
.end method

.method protected transform(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    iget-boolean v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->started:Z

    if-nez v0, :cond_5

    :goto_4
    return-object p2

    :cond_5
    iget-object v0, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/ReplacingCompositeConverter;->replacement:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_4
.end method
