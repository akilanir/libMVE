.class public abstract Lch/qos/logback/core/pattern/CompositeConverter;
.super Lch/qos/logback/core/pattern/DynamicConverter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/pattern/DynamicConverter",
        "<TE;>;"
    }
.end annotation


# instance fields
.field childConverter:Lch/qos/logback/core/pattern/Converter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/DynamicConverter;-><init>()V

    return-void
.end method


# virtual methods
.method public convert(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lch/qos/logback/core/pattern/CompositeConverter;->childConverter:Lch/qos/logback/core/pattern/Converter;

    :goto_7
    if-eqz v0, :cond_f

    invoke-virtual {v0, v1, p1}, Lch/qos/logback/core/pattern/Converter;->write(Ljava/lang/StringBuilder;Ljava/lang/Object;)V

    iget-object v0, v0, Lch/qos/logback/core/pattern/Converter;->next:Lch/qos/logback/core/pattern/Converter;

    goto :goto_7

    :cond_f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lch/qos/logback/core/pattern/CompositeConverter;->transform(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChildConverter()Lch/qos/logback/core/pattern/Converter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;"
        }
    .end annotation

    iget-object v0, p0, Lch/qos/logback/core/pattern/CompositeConverter;->childConverter:Lch/qos/logback/core/pattern/Converter;

    return-object v0
.end method

.method public setChildConverter(Lch/qos/logback/core/pattern/Converter;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lch/qos/logback/core/pattern/Converter",
            "<TE;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lch/qos/logback/core/pattern/CompositeConverter;->childConverter:Lch/qos/logback/core/pattern/Converter;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CompositeConverter<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lch/qos/logback/core/pattern/CompositeConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-eqz v1, :cond_13

    iget-object v1, p0, Lch/qos/logback/core/pattern/CompositeConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_13
    iget-object v1, p0, Lch/qos/logback/core/pattern/CompositeConverter;->childConverter:Lch/qos/logback/core/pattern/Converter;

    if-eqz v1, :cond_22

    const-string v1, ", children: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/CompositeConverter;->childConverter:Lch/qos/logback/core/pattern/Converter;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_22
    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract transform(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation
.end method
