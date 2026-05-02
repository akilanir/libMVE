.class Lfreemarker/core/SequenceBuiltins;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/SequenceBuiltins$1;,
        Lfreemarker/core/SequenceBuiltins$joinBI;,
        Lfreemarker/core/SequenceBuiltins$chunkBI;,
        Lfreemarker/core/SequenceBuiltins$seq_index_ofBI;,
        Lfreemarker/core/SequenceBuiltins$seq_containsBI;,
        Lfreemarker/core/SequenceBuiltins$sort_byBI;,
        Lfreemarker/core/SequenceBuiltins$sortBI;,
        Lfreemarker/core/SequenceBuiltins$reverseBI;,
        Lfreemarker/core/SequenceBuiltins$lastBI;,
        Lfreemarker/core/SequenceBuiltins$firstBI;,
        Lfreemarker/core/SequenceBuiltins$SequenceBuiltIn;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static access$800(Lfreemarker/template/TemplateModel;)Z
    .registers 2
    .param p0, "x0"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 85
    invoke-static {p0}, Lfreemarker/core/SequenceBuiltins;->isBuggySeqButGoodCollection(Lfreemarker/template/TemplateModel;)Z

    move-result v0

    return v0
.end method

.method private static isBuggySeqButGoodCollection(Lfreemarker/template/TemplateModel;)Z
    .registers 3
    .param p0, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    const/4 v0, 0x0

    .line 477
    instance-of v1, p0, Lfreemarker/ext/beans/CollectionModel;

    if-eqz v1, :cond_e

    check-cast p0, Lfreemarker/ext/beans/CollectionModel;

    .end local p0    # "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0}, Lfreemarker/ext/beans/CollectionModel;->getSupportsIndexedAccess()Z

    move-result v1

    if-nez v1, :cond_e

    const/4 v0, 0x1

    :cond_e
    return v0
.end method

.method public static modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z
    .registers 16
    .param p0, "seqItemIndex"    # I
    .param p1, "seqItem"    # Lfreemarker/template/TemplateModel;
    .param p2, "searchedItem"    # Lfreemarker/template/TemplateModel;
    .param p3, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 799
    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x1

    const/4 v9, 0x1

    move-object v0, p1

    move-object v4, p2

    move-object v10, p3

    :try_start_b
    invoke-static/range {v0 .. v10}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;ILjava/lang/String;Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Lfreemarker/core/Expression;ZZZLfreemarker/core/Environment;)Z
    :try_end_e
    .catch Lfreemarker/template/TemplateException; {:try_start_b .. :try_end_e} :catch_10

    move-result v0

    return v0

    .line 806
    :catch_10
    move-exception v11

    .line 807
    .local v11, "ex":Lfreemarker/template/TemplateException;
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "This error has occured when comparing sequence item at 0-based index "

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p0}, Ljava/lang/Integer;-><init>(I)V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    const-string v3, " to the searched item:\n"

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-instance v3, Lfreemarker/core/_DelayedGetMessage;

    invoke-direct {v3, v11}, Lfreemarker/core/_DelayedGetMessage;-><init>(Ljava/lang/Throwable;)V

    aput-object v3, v1, v2

    invoke-direct {v0, v11, v1}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v0
.end method
