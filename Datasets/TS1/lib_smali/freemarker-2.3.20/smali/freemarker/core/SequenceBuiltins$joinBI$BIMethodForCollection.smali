.class Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$joinBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethodForCollection"
.end annotation


# instance fields
.field private final coll:Lfreemarker/template/TemplateCollectionModel;

.field private final env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/SequenceBuiltins$joinBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/SequenceBuiltins$joinBI;Lfreemarker/core/Environment;Lfreemarker/template/TemplateCollectionModel;)V
    .registers 4
    .param p2, "env"    # Lfreemarker/core/Environment;
    .param p3, "coll"    # Lfreemarker/template/TemplateCollectionModel;

    .prologue
    .line 831
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    .line 832
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->env:Lfreemarker/core/Environment;

    .line 833
    iput-object p3, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->coll:Lfreemarker/template/TemplateCollectionModel;

    .line 834
    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$joinBI;Lfreemarker/core/Environment;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 5
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$joinBI;
    .param p2, "x1"    # Lfreemarker/core/Environment;
    .param p3, "x2"    # Lfreemarker/template/TemplateCollectionModel;
    .param p4, "x3"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 826
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;-><init>(Lfreemarker/core/SequenceBuiltins$joinBI;Lfreemarker/core/Environment;Lfreemarker/template/TemplateCollectionModel;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 15
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 838
    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    const/4 v10, 0x1

    const/4 v11, 0x3

    invoke-virtual {v9, p1, v10, v11}, Lfreemarker/core/SequenceBuiltins$joinBI;->checkMethodArgCount(Ljava/util/List;II)V

    .line 839
    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    const/4 v10, 0x0

    invoke-virtual {v9, p1, v10}, Lfreemarker/core/SequenceBuiltins$joinBI;->getStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v7

    .line 840
    .local v7, "separator":Ljava/lang/String;
    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    const/4 v10, 0x1

    invoke-virtual {v9, p1, v10}, Lfreemarker/core/SequenceBuiltins$joinBI;->getOptStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v8

    .line 841
    .local v8, "whenEmpty":Ljava/lang/String;
    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    const/4 v10, 0x2

    invoke-virtual {v9, p1, v10}, Lfreemarker/core/SequenceBuiltins$joinBI;->getOptStringMethodArg(Ljava/util/List;I)Ljava/lang/String;

    move-result-object v0

    .line 843
    .local v0, "afterLast":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    .line 845
    .local v6, "sb":Ljava/lang/StringBuffer;
    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->coll:Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v9}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v4

    .line 847
    .local v4, "it":Lfreemarker/template/TemplateModelIterator;
    const/4 v3, 0x0

    .line 848
    .local v3, "idx":I
    const/4 v2, 0x0

    .line 849
    .local v2, "hadItem":Z
    :goto_29
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_85

    .line 850
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v5

    .line 851
    .local v5, "item":Lfreemarker/template/TemplateModel;
    if-eqz v5, :cond_45

    .line 852
    if-eqz v2, :cond_48

    .line 853
    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 858
    :goto_3a
    const/4 v9, 0x0

    const/4 v10, 0x0

    :try_start_3c
    iget-object v11, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->env:Lfreemarker/core/Environment;

    invoke-static {v5, v9, v10, v11}, Lfreemarker/core/EvalUtil;->coerceModelToString(Lfreemarker/template/TemplateModel;Lfreemarker/core/Expression;Ljava/lang/String;Lfreemarker/core/Environment;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_45
    .catch Lfreemarker/template/TemplateException; {:try_start_3c .. :try_end_45} :catch_4a

    .line 867
    :cond_45
    add-int/lit8 v3, v3, 0x1

    .line 868
    goto :goto_29

    .line 855
    :cond_48
    const/4 v2, 0x1

    goto :goto_3a

    .line 859
    :catch_4a
    move-exception v1

    .line 860
    .local v1, "e":Lfreemarker/template/TemplateException;
    new-instance v9, Lfreemarker/core/_TemplateModelException;

    const/16 v10, 0x8

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "\"?"

    aput-object v12, v10, v11

    const/4 v11, 0x1

    iget-object v12, p0, Lfreemarker/core/SequenceBuiltins$joinBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$joinBI;

    iget-object v12, v12, Lfreemarker/core/SequenceBuiltins$joinBI;->key:Ljava/lang/String;

    aput-object v12, v10, v11

    const/4 v11, 0x2

    const-string v12, "\" failed at index "

    aput-object v12, v10, v11

    const/4 v11, 0x3

    new-instance v12, Ljava/lang/Integer;

    invoke-direct {v12, v3}, Ljava/lang/Integer;-><init>(I)V

    aput-object v12, v10, v11

    const/4 v11, 0x4

    const-string v12, " with this error:\n\n"

    aput-object v12, v10, v11

    const/4 v11, 0x5

    const-string v12, "---begin-message---\n"

    aput-object v12, v10, v11

    const/4 v11, 0x6

    new-instance v12, Lfreemarker/core/_DelayedGetMessageWithoutStackTop;

    invoke-direct {v12, v1}, Lfreemarker/core/_DelayedGetMessageWithoutStackTop;-><init>(Lfreemarker/template/TemplateException;)V

    aput-object v12, v10, v11

    const/4 v11, 0x7

    const-string v12, "\n---end-message---"

    aput-object v12, v10, v11

    invoke-direct {v9, v1, v10}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v9

    .line 869
    .end local v1    # "e":Lfreemarker/template/TemplateException;
    .end local v5    # "item":Lfreemarker/template/TemplateModel;
    :cond_85
    if-eqz v2, :cond_96

    .line 870
    if-eqz v0, :cond_8c

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 874
    :cond_8c
    :goto_8c
    new-instance v9, Lfreemarker/template/SimpleScalar;

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    return-object v9

    .line 872
    :cond_96
    if-eqz v8, :cond_8c

    invoke-virtual {v6, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_8c
.end method
