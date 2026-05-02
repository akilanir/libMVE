.class public abstract Lch/qos/logback/core/pattern/FormattingConverter;
.super Lch/qos/logback/core/pattern/Converter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/pattern/Converter",
        "<TE;>;"
    }
.end annotation


# static fields
.field static final INITIAL_BUF_SIZE:I = 0x100

.field static final MAX_CAPACITY:I = 0x400


# instance fields
.field formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/pattern/Converter;-><init>()V

    return-void
.end method


# virtual methods
.method public final getFormattingInfo()Lch/qos/logback/core/pattern/FormatInfo;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    return-object v0
.end method

.method public final setFormattingInfo(Lch/qos/logback/core/pattern/FormatInfo;)V
    .registers 4

    iget-object v0, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-eqz v0, :cond_c

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FormattingInfo has been already set"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_c
    iput-object p1, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    return-void
.end method

.method public final write(Ljava/lang/StringBuilder;Ljava/lang/Object;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "TE;)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lch/qos/logback/core/pattern/FormattingConverter;->convert(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    if-nez v1, :cond_c

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_b
    :goto_b
    return-void

    :cond_c
    iget-object v1, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v1}, Lch/qos/logback/core/pattern/FormatInfo;->getMin()I

    move-result v1

    iget-object v2, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v2}, Lch/qos/logback/core/pattern/FormatInfo;->getMax()I

    move-result v2

    if-nez v0, :cond_20

    if-lez v1, :cond_b

    invoke-static {p1, v1}, Lch/qos/logback/core/pattern/SpacePadder;->spacePad(Ljava/lang/StringBuilder;I)V

    goto :goto_b

    :cond_20
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v2, :cond_41

    iget-object v1, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v1}, Lch/qos/logback/core/pattern/FormatInfo;->isLeftTruncate()Z

    move-result v1

    if-eqz v1, :cond_38

    sub-int v1, v3, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    :cond_38
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    :cond_41
    if-ge v3, v1, :cond_53

    iget-object v2, p0, Lch/qos/logback/core/pattern/FormattingConverter;->formattingInfo:Lch/qos/logback/core/pattern/FormatInfo;

    invoke-virtual {v2}, Lch/qos/logback/core/pattern/FormatInfo;->isLeftPad()Z

    move-result v2

    if-eqz v2, :cond_4f

    invoke-static {p1, v0, v1}, Lch/qos/logback/core/pattern/SpacePadder;->leftPad(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto :goto_b

    :cond_4f
    invoke-static {p1, v0, v1}, Lch/qos/logback/core/pattern/SpacePadder;->rightPad(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto :goto_b

    :cond_53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b
.end method
