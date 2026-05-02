.class Lfreemarker/core/IteratorBlock$Context;
.super Ljava/lang/Object;
.source "IteratorBlock.java"

# interfaces
.implements Lfreemarker/core/LocalContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/core/IteratorBlock;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Context"
.end annotation


# instance fields
.field private hasNext:Z

.field private index:I

.field private list:Lfreemarker/template/TemplateModel;

.field private loopVar:Lfreemarker/template/TemplateModel;

.field private final this$0:Lfreemarker/core/IteratorBlock;

.field private variableNames:Ljava/util/Collection;


# direct methods
.method constructor <init>(Lfreemarker/core/IteratorBlock;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p2, "list"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    .line 164
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    .line 168
    iput-object p2, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    .line 169
    return-void
.end method


# virtual methods
.method public getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 210
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v0}, Lfreemarker/core/IteratorBlock;->access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 211
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v1}, Lfreemarker/core/IteratorBlock;->access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    sparse-switch v0, :sswitch_data_46

    .line 226
    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    return-object v0

    .line 213
    :sswitch_20
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->loopVar:Lfreemarker/template/TemplateModel;

    goto :goto_1f

    .line 215
    :sswitch_23
    const-string v0, "_index"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 216
    new-instance v0, Lfreemarker/template/SimpleNumber;

    iget v1, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleNumber;-><init>(I)V

    goto :goto_1f

    .line 220
    :sswitch_33
    const-string v0, "_has_next"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 221
    iget-boolean v0, p0, Lfreemarker/core/IteratorBlock$Context;->hasNext:Z

    if-eqz v0, :cond_42

    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_1f

    :cond_42
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    goto :goto_1f

    .line 211
    nop

    :sswitch_data_46
    .sparse-switch
        0x0 -> :sswitch_20
        0x6 -> :sswitch_23
        0x9 -> :sswitch_33
    .end sparse-switch
.end method

.method public getLocalVariableNames()Ljava/util/Collection;
    .registers 4

    .prologue
    .line 230
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    if-nez v0, :cond_53

    .line 231
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    .line 232
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    iget-object v1, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v1}, Lfreemarker/core/IteratorBlock;->access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 233
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v2}, Lfreemarker/core/IteratorBlock;->access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_index"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 234
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v2}, Lfreemarker/core/IteratorBlock;->access$100(Lfreemarker/core/IteratorBlock;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "_has_next"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_53
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->variableNames:Ljava/util/Collection;

    return-object v0
.end method

.method runLoop(Lfreemarker/core/Environment;)V
    .registers 10
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 173
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    instance-of v4, v4, Lfreemarker/template/TemplateCollectionModel;

    if-eqz v4, :cond_39

    .line 174
    iget-object v0, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    check-cast v0, Lfreemarker/template/TemplateCollectionModel;

    .line 175
    .local v0, "baseListModel":Lfreemarker/template/TemplateCollectionModel;
    invoke-interface {v0}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v1

    .line 176
    .local v1, "it":Lfreemarker/template/TemplateModelIterator;
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v4

    iput-boolean v4, p0, Lfreemarker/core/IteratorBlock$Context;->hasNext:Z

    .line 177
    :goto_15
    iget-boolean v4, p0, Lfreemarker/core/IteratorBlock$Context;->hasNext:Z

    if-eqz v4, :cond_8b

    .line 178
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->loopVar:Lfreemarker/template/TemplateModel;

    .line 179
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v4

    iput-boolean v4, p0, Lfreemarker/core/IteratorBlock$Context;->hasNext:Z

    .line 180
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v4, :cond_32

    .line 181
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v4}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 183
    :cond_32
    iget v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    goto :goto_15

    .line 186
    .end local v0    # "baseListModel":Lfreemarker/template/TemplateCollectionModel;
    .end local v1    # "it":Lfreemarker/template/TemplateModelIterator;
    :cond_39
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    instance-of v4, v4, Lfreemarker/template/TemplateSequenceModel;

    if-eqz v4, :cond_74

    .line 187
    iget-object v3, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    check-cast v3, Lfreemarker/template/TemplateSequenceModel;

    .line 188
    .local v3, "tsm":Lfreemarker/template/TemplateSequenceModel;
    invoke-interface {v3}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v2

    .line 189
    .local v2, "size":I
    iput v5, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    :goto_49
    iget v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    if-ge v4, v2, :cond_8b

    .line 190
    iget v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    invoke-interface {v3, v4}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->loopVar:Lfreemarker/template/TemplateModel;

    .line 191
    iget v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    add-int/lit8 v4, v4, 0x1

    if-le v2, v4, :cond_72

    const/4 v4, 0x1

    :goto_5c
    iput-boolean v4, p0, Lfreemarker/core/IteratorBlock$Context;->hasNext:Z

    .line 192
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v4, :cond_6b

    .line 193
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v4}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 189
    :cond_6b
    iget v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lfreemarker/core/IteratorBlock$Context;->index:I

    goto :goto_49

    :cond_72
    move v4, v5

    .line 191
    goto :goto_5c

    .line 197
    .end local v2    # "size":I
    .end local v3    # "tsm":Lfreemarker/template/TemplateSequenceModel;
    :cond_74
    invoke-virtual {p1}, Lfreemarker/core/Environment;->isClassicCompatible()Z

    move-result v4

    if-eqz v4, :cond_8c

    .line 198
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    iput-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->loopVar:Lfreemarker/template/TemplateModel;

    .line 199
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    if-eqz v4, :cond_8b

    .line 200
    iget-object v4, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    iget-object v4, v4, Lfreemarker/core/IteratorBlock;->nestedBlock:Lfreemarker/core/TemplateElement;

    invoke-virtual {p1, v4}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 207
    :cond_8b
    return-void

    .line 204
    :cond_8c
    new-instance v4, Lfreemarker/core/UnexpectedTypeException;

    iget-object v5, p0, Lfreemarker/core/IteratorBlock$Context;->this$0:Lfreemarker/core/IteratorBlock;

    invoke-static {v5}, Lfreemarker/core/IteratorBlock;->access$000(Lfreemarker/core/IteratorBlock;)Lfreemarker/core/Expression;

    move-result-object v5

    iget-object v6, p0, Lfreemarker/core/IteratorBlock$Context;->list:Lfreemarker/template/TemplateModel;

    const-string v7, "collection or sequence"

    invoke-direct {v4, v5, v6, v7, p1}, Lfreemarker/core/UnexpectedTypeException;-><init>(Lfreemarker/core/Expression;Lfreemarker/template/TemplateModel;Ljava/lang/String;Lfreemarker/core/Environment;)V

    throw v4
.end method
