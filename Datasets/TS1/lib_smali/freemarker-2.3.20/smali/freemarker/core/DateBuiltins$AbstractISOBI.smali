.class abstract Lfreemarker/core/DateBuiltins$AbstractISOBI;
.super Lfreemarker/core/DateBuiltins$DateBuiltin;
.source "DateBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/DateBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "AbstractISOBI"
.end annotation


# instance fields
.field protected final accuracy:I

.field protected final showOffset:Z


# direct methods
.method protected constructor <init>(ZI)V
    .registers 4
    .param p1, "showOffset"    # Z
    .param p2, "accuracy"    # I

    .prologue
    .line 106
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/DateBuiltins$DateBuiltin;-><init>(Lfreemarker/core/DateBuiltins$1;)V

    .line 107
    iput-boolean p1, p0, Lfreemarker/core/DateBuiltins$AbstractISOBI;->showOffset:Z

    .line 108
    iput p2, p0, Lfreemarker/core/DateBuiltins$AbstractISOBI;->accuracy:I

    .line 109
    return-void
.end method


# virtual methods
.method protected checkDateTypeNotUnknown(I)V
    .registers 7
    .param p1, "dateType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 113
    if-nez p1, :cond_2b

    .line 114
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "The value of the following has unknown date type, but ?"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lfreemarker/core/DateBuiltins$AbstractISOBI;->key:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, " needs a date value where it\'s known if it\'s a date-only, time-only, or date+time value:"

    aput-object v4, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    iget-object v2, p0, Lfreemarker/core/DateBuiltins$AbstractISOBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->blame(Lfreemarker/core/Expression;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    sget-object v2, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;

    invoke-virtual {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;->tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v1

    invoke-direct {v0, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v0

    .line 119
    :cond_2b
    return-void
.end method
