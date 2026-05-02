.class Lfreemarker/core/NumericalBuiltins$ceilingBI;
.super Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ceilingBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 163
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;-><init>(Lfreemarker/core/NumericalBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "num"    # Ljava/lang/Number;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 165
    new-instance v0, Lfreemarker/template/SimpleNumber;

    new-instance v1, Ljava/math/BigDecimal;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-static {}, Lfreemarker/core/NumericalBuiltins;->access$100()Ljava/math/BigDecimal;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    invoke-virtual {v1, v2, v3, v4}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;II)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    return-object v0
.end method
