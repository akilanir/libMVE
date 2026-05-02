.class Lfreemarker/core/NumericalBuiltins$shortBI;
.super Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "shortBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;-><init>(Lfreemarker/core/NumericalBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;
    .registers 5
    .param p1, "num"    # Ljava/lang/Number;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 100
    instance-of v0, p1, Ljava/lang/Short;

    if-eqz v0, :cond_5

    .line 103
    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    :goto_4
    return-object p2

    .restart local p2    # "model":Lfreemarker/template/TemplateModel;
    :cond_5
    new-instance p2, Lfreemarker/template/SimpleNumber;

    .end local p2    # "model":Lfreemarker/template/TemplateModel;
    new-instance v0, Ljava/lang/Short;

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result v1

    invoke-direct {v0, v1}, Ljava/lang/Short;-><init>(S)V

    invoke-direct {p2, v0}, Lfreemarker/template/SimpleNumber;-><init>(Ljava/lang/Number;)V

    goto :goto_4
.end method
