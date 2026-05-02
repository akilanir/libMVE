.class Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;
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
    name = "BIMethodForSequence"
.end annotation


# instance fields
.field private m_env:Lfreemarker/core/Environment;

.field private m_seq:Lfreemarker/template/TemplateSequenceModel;

.field private final this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;


# direct methods
.method private constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/Environment;)V
    .registers 4
    .param p2, "seq"    # Lfreemarker/template/TemplateSequenceModel;
    .param p3, "env"    # Lfreemarker/core/Environment;

    .prologue
    .line 501
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;

    .line 502
    iput-object p2, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    .line 503
    iput-object p3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->m_env:Lfreemarker/core/Environment;

    .line 504
    return-void
.end method

.method constructor <init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/Environment;Lfreemarker/core/SequenceBuiltins$1;)V
    .registers 5
    .param p1, "x0"    # Lfreemarker/core/SequenceBuiltins$seq_containsBI;
    .param p2, "x1"    # Lfreemarker/template/TemplateSequenceModel;
    .param p3, "x2"    # Lfreemarker/core/Environment;
    .param p4, "x3"    # Lfreemarker/core/SequenceBuiltins$1;

    .prologue
    .line 497
    invoke-direct {p0, p1, p2, p3}, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;-><init>(Lfreemarker/core/SequenceBuiltins$seq_containsBI;Lfreemarker/template/TemplateSequenceModel;Lfreemarker/core/Environment;)V

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
    .line 508
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->this$0:Lfreemarker/core/SequenceBuiltins$seq_containsBI;

    const/4 v4, 0x1

    invoke-virtual {v3, p1, v4}, Lfreemarker/core/SequenceBuiltins$seq_containsBI;->checkMethodArgCount(Ljava/util/List;I)V

    .line 509
    const/4 v3, 0x0

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 510
    .local v0, "arg":Lfreemarker/template/TemplateModel;
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v3}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v2

    .line 511
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    if-ge v1, v2, :cond_2a

    .line 512
    iget-object v3, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->m_seq:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v3, v1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v3

    iget-object v4, p0, Lfreemarker/core/SequenceBuiltins$seq_containsBI$BIMethodForSequence;->m_env:Lfreemarker/core/Environment;

    invoke-static {v1, v3, v0, v4}, Lfreemarker/core/SequenceBuiltins;->modelsEqual(ILfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 513
    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    .line 515
    :goto_26
    return-object v3

    .line 511
    :cond_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 515
    :cond_2a
    sget-object v3, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_26
.end method
