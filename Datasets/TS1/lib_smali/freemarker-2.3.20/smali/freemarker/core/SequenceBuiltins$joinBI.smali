.class Lfreemarker/core/SequenceBuiltins$joinBI;
.super Lfreemarker/core/BuiltIn;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "joinBI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 813
    invoke-direct {p0}, Lfreemarker/core/BuiltIn;-><init>()V

    .line 826
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
    const/4 v3, 0x0

    .line 816
    iget-object v1, p0, Lfreemarker/core/SequenceBuiltins$joinBI;->target:Lfreemarker/core/Expression;

    invoke-virtual {v1, p1}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 817
    .local v0, "model":Lfreemarker/template/TemplateModel;
    instance-of v1, v0, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v1, :cond_13

    .line 818
    new-instance v1, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v1, p0, p1, v0, v3}, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;-><init>(Lfreemarker/core/SequenceBuiltins$joinBI;Lfreemarker/core/Environment;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/SequenceBuiltins$1;)V

    .line 820
    :goto_12
    return-object v1

    .line 819
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_13
    instance-of v1, v0, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v1, :cond_24

    .line 820
    new-instance v1, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;

    new-instance v2, Lfreemarker/core/CollectionAndSequence;

    check-cast v0, Lfreemarker/template/TemplateSequenceModel;

    .end local v0    # "model":Lfreemarker/template/TemplateModel;
    invoke-direct {v2, v0}, Lfreemarker/core/CollectionAndSequence;-><init>(Lfreemarker/template/TemplateSequenceModel;)V

    invoke-direct {v1, p0, p1, v2, v3}, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;-><init>(Lfreemarker/core/SequenceBuiltins$joinBI;Lfreemarker/core/Environment;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/SequenceBuiltins$1;)V

    goto :goto_12

    .line 822
    .restart local v0    # "model":Lfreemarker/template/TemplateModel;
    :cond_24
    new-instance v1, Lfreemarker/core/UnexpectedTypeException;

    iget-object v2, p0, Lfreemarker/core/SequenceBuiltins$joinBI;->target:Lfreemarker/core/Expression;

    const-string v3, "sequence or collection"

    invoke-direct {v1, v2, v0, v3, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v1
.end method
