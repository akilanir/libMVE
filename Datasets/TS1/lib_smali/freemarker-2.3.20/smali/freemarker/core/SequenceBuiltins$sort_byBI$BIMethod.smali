.class Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$sort_byBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BIMethod"
.end annotation


# instance fields
.field seq:Lfreemarker/template/TemplateSequenceModel;

.field private final this$0:Lfreemarker/core/SequenceBuiltins$sort_byBI;


# direct methods
.method constructor <init>(Lfreemarker/core/SequenceBuiltins$sort_byBI;Lfreemarker/template/TemplateSequenceModel;)V
    .registers 3
    .param p2, "seq"    # Lfreemarker/template/TemplateSequenceModel;

    .prologue
    .line 432
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$sort_byBI;

    .line 433
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->seq:Lfreemarker/template/TemplateSequenceModel;

    .line 434
    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 17
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    const/4 v14, 0x3

    const/4 v13, 0x2

    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 441
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v8, v11, :cond_2a

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "?"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$sort_byBI;

    iget-object v9, v9, Lfreemarker/core/SequenceBuiltins$sort_byBI;->key:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v8, v9, v11}, Lfreemarker/core/MessageUtil;->newArgCntError(Ljava/lang/String;II)Lfreemarker/template/TemplateModelException;

    move-result-object v8

    throw v8

    .line 444
    :cond_2a
    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 445
    .local v5, "obj":Ljava/lang/Object;
    instance-of v8, v5, Lfreemarker/template/TemplateScalarModel;

    if-eqz v8, :cond_45

    .line 446
    new-array v7, v11, [Ljava/lang/String;

    check-cast v5, Lfreemarker/template/TemplateScalarModel;

    .end local v5    # "obj":Ljava/lang/Object;
    invoke-interface {v5}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v12

    .line 470
    .local v7, "subvars":[Ljava/lang/String;
    :cond_3e
    iget-object v8, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-static {v8, v7}, Lfreemarker/core/SequenceBuiltins$sortBI;->sort(Lfreemarker/template/TemplateSequenceModel;[Ljava/lang/String;)Lfreemarker/template/TemplateSequenceModel;

    move-result-object v8

    return-object v8

    .line 447
    .end local v7    # "subvars":[Ljava/lang/String;
    .restart local v5    # "obj":Ljava/lang/Object;
    :cond_45
    instance-of v8, v5, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v8, :cond_8e

    move-object v6, v5

    .line 448
    check-cast v6, Lfreemarker/template/TemplateSequenceModel;

    .line 449
    .local v6, "seq":Lfreemarker/template/TemplateSequenceModel;
    invoke-interface {v6}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v4

    .line 450
    .local v4, "ln":I
    new-array v7, v4, [Ljava/lang/String;

    .line 451
    .restart local v7    # "subvars":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_53
    if-ge v2, v4, :cond_3e

    .line 452
    invoke-interface {v6, v2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 454
    .local v3, "item":Lfreemarker/template/TemplateModel;
    :try_start_59
    move-object v0, v3

    check-cast v0, Lfreemarker/template/TemplateScalarModel;

    move-object v8, v0

    invoke-interface {v8}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v2
    :try_end_63
    .catch Ljava/lang/ClassCastException; {:try_start_59 .. :try_end_63} :catch_66

    .line 451
    :cond_63
    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    .line 456
    :catch_66
    move-exception v1

    .line 457
    .local v1, "e":Ljava/lang/ClassCastException;
    instance-of v8, v3, Lfreemarker/template/TemplateScalarModel;

    if-nez v8, :cond_63

    .line 458
    new-instance v8, Lfreemarker/core/_TemplateModelException;

    const/4 v9, 0x5

    new-array v9, v9, [Ljava/lang/Object;

    const-string v10, "The argument to ?"

    aput-object v10, v9, v12

    iget-object v10, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$sort_byBI;

    iget-object v10, v10, Lfreemarker/core/SequenceBuiltins$sort_byBI;->key:Ljava/lang/String;

    aput-object v10, v9, v11

    const-string v10, "(key), when it\'s a sequence, must be a sequence of strings, but the item at index "

    aput-object v10, v9, v13

    new-instance v10, Ljava/lang/Integer;

    invoke-direct {v10, v2}, Ljava/lang/Integer;-><init>(I)V

    aput-object v10, v9, v14

    const/4 v10, 0x4

    const-string v11, " is not a string."

    aput-object v11, v9, v10

    invoke-direct {v8, v9}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v8

    .line 466
    .end local v1    # "e":Ljava/lang/ClassCastException;
    .end local v2    # "i":I
    .end local v3    # "item":Lfreemarker/template/TemplateModel;
    .end local v4    # "ln":I
    .end local v6    # "seq":Lfreemarker/template/TemplateSequenceModel;
    .end local v7    # "subvars":[Ljava/lang/String;
    :cond_8e
    new-instance v8, Lfreemarker/core/_TemplateModelException;

    new-array v9, v14, [Ljava/lang/Object;

    const-string v10, "The argument to ?"

    aput-object v10, v9, v12

    iget-object v10, p0, Lfreemarker/core/SequenceBuiltins$sort_byBI$BIMethod;->this$0:Lfreemarker/core/SequenceBuiltins$sort_byBI;

    iget-object v10, v10, Lfreemarker/core/SequenceBuiltins$sort_byBI;->key:Ljava/lang/String;

    aput-object v10, v9, v11

    const-string v10, "(key) must be a string (the name of the subvariable), or a sequence of strings (the \"path\" to the subvariable)."

    aput-object v10, v9, v13

    invoke-direct {v8, v9}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v8
.end method
