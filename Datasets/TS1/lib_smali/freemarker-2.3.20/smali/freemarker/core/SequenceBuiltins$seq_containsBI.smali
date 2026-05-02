.class Lfreemarker/core/SequenceBuiltins$seq_containsBI;
.super Lfreemarker/core/BuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "seq_containsBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;,
        Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 482
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 520
    return-void
.end method


# virtual methods
.method _eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 485
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 488
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_19

    invoke-static {v0}, Lfreemarker/core/SequenceBuiltins;->access$800(Lfreemarker/template/TemplateModel;)Z

    move-result v1

    if-nez v1, :cond_19

    .line 489
    new-instance v1, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;

    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v1, p0, v0, p1, v2}, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;-><init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V

    .line 491
    :goto_18
    return-object v1

    .line 490
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_19
    instance-of v1, v0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v1, :cond_25

    .line 491
    new-instance v1, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v1, p0, v0, p1, v2}, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;-><init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V

    goto :goto_18

    .line 493
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_25
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI;->target:Lfreemarker/core/Expression;

    const-string v3, "sequence or collection"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method
