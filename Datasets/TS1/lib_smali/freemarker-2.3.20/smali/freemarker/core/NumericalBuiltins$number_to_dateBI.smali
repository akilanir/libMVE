.class Lfreemarker/core/NumericalBuiltins$number_to_dateBI;
.super Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;
.source "NumericalBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/NumericalBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "number_to_dateBI"
.end annotation


# instance fields
.field private final dateType:I


# direct methods
.method constructor <init>(I)V
    .registers 3
    .param p1, "dateType"    # I

    .prologue
    .line 303
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/NumericalBuiltins$NumberBuiltIn;-><init>(Lfreemarker/core/NumericalBuiltins$1;)V

    .line 304
    iput p1, p0, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;->dateType:I

    .line 305
    return-void
.end method


# virtual methods
.method calculateResult(Ljava/lang/Number;Lfreemarker/template/TemplateModel;)Lfreemarker/template/TemplateModel;
    .registers 7
    .param p1, "num"    # Ljava/lang/Number;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 309
    new-instance v0, Lfreemarker/template/SimpleDate;

    new-instance v1, Ljava/util/Date;

    invoke-static {p1}, Lfreemarker/core/NumericalBuiltins;->access$200(Ljava/lang/Number;)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    iget v2, p0, Lfreemarker/core/NumericalBuiltins$number_to_dateBI;->dateType:I

    invoke-direct {v0, v1, v2}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    return-object v0
.end method
