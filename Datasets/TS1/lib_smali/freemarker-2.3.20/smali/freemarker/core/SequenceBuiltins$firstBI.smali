.class Lfreemarker/core/SequenceBuiltins$firstBI;
.super Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "firstBI"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateSequenceModel;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "tsm"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 110
    invoke-interface {p1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v0

    if-nez v0, :cond_8

    .line 111
    const/4 v0, 0x0

    .line 113
    :goto_7
    return-object v0

    :cond_8
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_7
.end method
