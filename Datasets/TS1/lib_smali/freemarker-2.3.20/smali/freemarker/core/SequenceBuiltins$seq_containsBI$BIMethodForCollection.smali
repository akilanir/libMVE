.class Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;
.super Ljava/lang/Object;
.source "SequenceBuiltins.java"

# interfaces
.implements Lfreemarker/template/TemplateMethodModelEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/SequenceBuiltins$seq_containsBI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BIMethodForCollection"
.end annotation


# instance fields
.field private m_coll:Lfreemarker/template/TemplateCollectionModel;

.field private m_env:Lfreemarker/core/Environment;

.field private final this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/Environment;)V
    .registers 4
    .param p2, "coll"    # Lfreemarker/template/TemplateCollectionModel;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 524
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;

    .line 525
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->m_coll:Lfreemarker/template/TemplateCollectionModel;

    .line 526
    iput-object p3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->m_env:Lfreemarker/core/Environment;

    .line 527
    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 5
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$seq_containsBI;
    .param p2, "x1"    # Lfreemarker/template/TemplateCollectionModel;
    .param p3, "x2"    # Lfreemarker/core/Environment;
    .param p4, "x3"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 520
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;-><init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateCollectionModel;Lfreemarker/core/Environment;)V

    return-void
.end method


# virtual methods
.method public exec(Ljava/util/List;)Ljava/lang/Object;
    .registers 7
    .param p1, "args"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 531
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;

    const/4 v4, 0x1

    invoke-virtual {v3, p1, v4}, Lfreemarker/core/SequenceBuiltins$seq_containsBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 532
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 533
    .local v0, "arg":Lfreemarker/template/TemplateModel;
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->m_coll:Lfreemarker/template/TemplateCollectionModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v2

    .line 534
    .local v2, "it":Lfreemarker/template/TemplateModelIterator;
    const/4 v1, 0x0

    .line 535
    .local v1, "idx":I
    :goto_14
    invoke-interface {v2}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 536
    invoke-interface {v2}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForCollection;->m_env:Lfreemarker/core/Environment;

    invoke-static {v1, v3, v0, v4}, Lfreemarker/core/SequenceBuiltins;->modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v3

    if-eqz v3, :cond_29

    .line 537
    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    .line 540
    :goto_28
    return-object v3

    .line 538
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 540
    :cond_2c
    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_28
.end method
