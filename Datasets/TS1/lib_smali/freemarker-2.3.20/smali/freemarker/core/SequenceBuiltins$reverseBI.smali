.class Lfreemarker/core/SequenceBuiltins$reverseBI;
.super Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "reverseBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 129
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;-><init>(Lfreemarker/core/SequenceBuiltins$1;)V

    .line 138
    return-void
.end method


# virtual methods
.method calculateResult(Lfreemarker/template/TemplateSequenceModel;)Lfreemarker/template/TemplateModel;
    .registers 3
    .param p1, "tsm"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 131
    instance-of v0, p1, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;

    if-eqz v0, :cond_b

    .line 132
    check-cast p1, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;

    .end local p1    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    invoke-static {p1}, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;->access$100(Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v0

    .line 134
    :goto_a
    return-object v0

    .restart local p1    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :cond_b
    new-instance v0, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;

    invoke-direct {v0, p1}, Lfreemarker/core/SequenceBuiltins$reverseBI$ReverseSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    goto :goto_a
.end method
