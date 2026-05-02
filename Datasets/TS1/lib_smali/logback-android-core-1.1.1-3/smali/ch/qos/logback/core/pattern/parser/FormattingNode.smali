.class public Lch/qos/logback/core/pattern/parser/FormattingNode;
.super Lch/qos/logback/core/pattern/parser/Node;


# instance fields
.field formatInfo:Lch/qos/logback/core/pattern/FormatInfo;


# direct methods
.method constructor <init>(I)V
    .registers 2

    invoke-direct {p0, p1}, Lch/qos/logback/core/pattern/parser/Node;-><init>(I)V

    return-void
.end method

.method constructor <init>(ILjava/lang/Object;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lch/qos/logback/core/pattern/parser/Node;-><init>(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    const/4 v0, 0x0

    invoke-super {p0, p1}, Lch/qos/logback/core/pattern/parser/Node;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    :cond_7
    :goto_7
    return v0

    :cond_8
    instance-of v1, p1, Lch/qos/logback/core/pattern/parser/FormattingNode;

    if-eqz v1, :cond_7

    check-cast p1, Lch/qos/logback/core/pattern/parser/FormattingNode;

    iget-object v1, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-eqz v1, :cond_1b

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    iget-object v1, p1, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v0, v1}, Lch/qos/logback/core/pattern/FormatInfo;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_7

    :cond_1b
    iget-object v1, p1, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-nez v1, :cond_7

    const/4 v0, 0x1

    goto :goto_7
.end method

.method public getFormatInfo()Lch/qos/logback/core/pattern/FormatInfo;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    invoke-super {p0}, Lch/qos/logback/core/pattern/parser/Node;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v0}, Lch/qos/logback/core/pattern/FormatInfo;->hashCode()I

    move-result v0

    :goto_10
    add-int/2addr v0, v1

    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_10
.end method

.method public setFormatInfo(Lch/qos/logback/core/pattern/FormatInfo;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/pattern/parser/FormattingNode;->formatInfo:Lch/qos/logback/core/pattern/FormatInfo;

    return-void
.end method
