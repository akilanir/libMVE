.class public Lfreemarker/template/SimpleSequence;
.super Lfreemarker/template/WrappingTemplateModel;
.source "SimpleSequence.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/SimpleSequence$1;,
        Lfreemarker/template/SimpleSequence$SynchronizedSequence;
    }
.end annotation


# instance fields
.field protected final list:Ljava/util/List;

.field private unwrappedList:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 98
    const/4 v0, 0x0

    check-cast v0, Lfreemarker/template/ObjectWrapper;

    invoke-direct {p0, v0}, Lfreemarker/template/SimpleSequence;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 99
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "capacity"    # I

    .prologue
    .line 106
    invoke-direct {p0}, Lfreemarker/template/WrappingTemplateModel;-><init>()V

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    .line 108
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/ObjectWrapper;)V
    .registers 3
    .param p1, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 144
    invoke-direct {p0, p1}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 145
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    .line 146
    return-void
.end method

.method public constructor <init>(Lfreemarker/template/TemplateCollectionModel;)V
    .registers 5
    .param p1, "tcm"    # Lfreemarker/template/TemplateCollectionModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 127
    invoke-direct {p0}, Lfreemarker/template/WrappingTemplateModel;-><init>()V

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v0, "alist":Ljava/util/ArrayList;
    invoke-interface {p1}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v1

    .local v1, "it":Lfreemarker/template/TemplateModelIterator;
    :goto_c
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    .line 130
    invoke-interface {v1}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_c

    .line 132
    :cond_1a
    invoke-virtual {v0}, Ljava/util/ArrayList;->trimToSize()V

    .line 133
    iput-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    .line 134
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .param p1, "collection"    # Ljava/util/Collection;

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleSequence;-><init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V

    .line 120
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "collection"    # Ljava/util/Collection;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 160
    invoke-direct {p0, p2}, Lfreemarker/template/WrappingTemplateModel;-><init>(Lfreemarker/template/ObjectWrapper;)V

    .line 161
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    .line 162
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 173
    iget-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/template/SimpleSequence;->unwrappedList:Ljava/util/List;

    .line 175
    return-void
.end method

.method public add(Z)V
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 185
    if-eqz p1, :cond_8

    .line 186
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->TRUE:Lfreemarker/template/TemplateBooleanModel;

    invoke-virtual {p0, v0}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 191
    :goto_7
    return-void

    .line 189
    :cond_8
    sget-object v0, Lfreemarker/template/TemplateBooleanModel;->FALSE:Lfreemarker/template/TemplateBooleanModel;

    invoke-virtual {p0, v0}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    goto :goto_7
.end method

.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 227
    :try_start_0
    iget-object v3, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 228
    .local v2, "value":Ljava/lang/Object;
    instance-of v3, v2, Lfreemarker/template/TemplateModel;

    if-eqz v3, :cond_d

    .line 229
    check-cast v2, Lfreemarker/template/TemplateModel;

    .line 236
    .end local v2    # "value":Ljava/lang/Object;
    :goto_c
    return-object v2

    .line 231
    .restart local v2    # "value":Ljava/lang/Object;
    :cond_d
    invoke-virtual {p0, v2}, Lfreemarker/template/SimpleSequence;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 232
    .local v1, "tm":Lfreemarker/template/TemplateModel;
    iget-object v3, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v3, p1, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_16} :catch_18

    move-object v2, v1

    .line 233
    goto :goto_c

    .line 235
    .end local v1    # "tm":Lfreemarker/template/TemplateModel;
    .end local v2    # "value":Ljava/lang/Object;
    :catch_18
    move-exception v0

    .line 236
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    const/4 v2, 0x0

    goto :goto_c
.end method

.method public size()I
    .registers 2

    .prologue
    .line 242
    iget-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public synchronizedWrapper()Lfreemarker/template/SimpleSequence;
    .registers 3

    .prologue
    .line 249
    new-instance v0, Lfreemarker/template/SimpleSequence$SynchronizedSequence;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfreemarker/template/SimpleSequence$SynchronizedSequence;-><init>(Lfreemarker/template/SimpleSequence;Lfreemarker/template/SimpleSequence$1;)V

    return-object v0
.end method

.method public toList()Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 201
    iget-object v6, p0, Lfreemarker/template/SimpleSequence;->unwrappedList:Ljava/util/List;

    if-nez v6, :cond_62

    .line 202
    iget-object v6, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 203
    .local v4, "listClass":Ljava/lang/Class;
    const/4 v5, 0x0

    .line 205
    .local v5, "result":Ljava/util/List;
    :try_start_b
    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "result":Ljava/util/List;
    check-cast v5, Ljava/util/List;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_11} :catch_34

    .line 209
    .restart local v5    # "result":Ljava/util/List;
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v0

    .line 210
    .local v0, "bw":Lfreemarker/ext/beans/BeansWrapper;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_16
    iget-object v6, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v3, v6, :cond_60

    .line 211
    iget-object v6, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 212
    .local v2, "elem":Ljava/lang/Object;
    instance-of v6, v2, Lfreemarker/template/TemplateModel;

    if-eqz v6, :cond_2e

    .line 213
    check-cast v2, Lfreemarker/template/TemplateModel;

    .end local v2    # "elem":Ljava/lang/Object;
    invoke-virtual {v0, v2}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v2

    .line 215
    .restart local v2    # "elem":Ljava/lang/Object;
    :cond_2e
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    .line 206
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .end local v2    # "elem":Ljava/lang/Object;
    .end local v3    # "i":I
    .end local v5    # "result":Ljava/util/List;
    :catch_34
    move-exception v1

    .line 207
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Lfreemarker/template/TemplateModelException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Error instantiating an object of type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 217
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .restart local v3    # "i":I
    .restart local v5    # "result":Ljava/util/List;
    :cond_60
    iput-object v5, p0, Lfreemarker/template/SimpleSequence;->unwrappedList:Ljava/util/List;

    .line 219
    .end local v0    # "bw":Lfreemarker/ext/beans/BeansWrapper;
    .end local v3    # "i":I
    .end local v4    # "listClass":Ljava/lang/Class;
    .end local v5    # "result":Ljava/util/List;
    :cond_62
    iget-object v6, p0, Lfreemarker/template/SimpleSequence;->unwrappedList:Ljava/util/List;

    return-object v6
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 253
    iget-object v0, p0, Lfreemarker/template/SimpleSequence;->list:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
