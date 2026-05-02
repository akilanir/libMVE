.class Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;
.super Ljava/lang/Object;
.source "SimpleCollection.java"

# interfaces
.implements Lfreemarker/template/TemplateModelIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/template/SimpleCollection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimpleTemplateModelIterator"
.end annotation


# instance fields
.field private iterator:Ljava/util/Iterator;

.field private iteratorShared:Z

.field private final this$0:Lfreemarker/template/SimpleCollection;


# direct methods
.method constructor <init>(Lfreemarker/template/SimpleCollection;Ljava/util/Iterator;Z)V
    .registers 4
    .param p2, "iterator"    # Ljava/util/Iterator;
    .param p3, "iteratorShared"    # Z

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->this$0:Lfreemarker/template/SimpleCollection;

    .line 130
    iput-object p2, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iterator:Ljava/util/Iterator;

    .line 131
    iput-boolean p3, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iteratorShared:Z

    .line 132
    return-void
.end method

.method private makeIteratorDirty()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->this$0:Lfreemarker/template/SimpleCollection;

    monitor-enter v1

    .line 160
    :try_start_3
    iget-object v0, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->this$0:Lfreemarker/template/SimpleCollection;

    invoke-static {v0}, Lfreemarker/template/SimpleCollection;->access$000(Lfreemarker/template/SimpleCollection;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 161
    new-instance v0, Lfreemarker/template/TemplateModelException;

    const-string v2, "This collection variable wraps a java.util.Iterator, thus it can be <list>-ed or <foreach>-ed only once"

    invoke-direct {v0, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw v0

    .line 165
    :cond_16
    :try_start_16
    iget-object v0, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->this$0:Lfreemarker/template/SimpleCollection;

    const/4 v2, 0x1

    invoke-static {v0, v2}, Lfreemarker/template/SimpleCollection;->access$002(Lfreemarker/template/SimpleCollection;Z)Z

    .line 166
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iteratorShared:Z

    .line 168
    monitor-exit v1
    :try_end_20
    .catchall {:try_start_16 .. :try_end_20} :catchall_13

    .line 169
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 154
    iget-boolean v0, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iteratorShared:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->makeIteratorDirty()V

    .line 155
    :cond_7
    iget-object v0, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Lfreemarker/template/TemplateModel;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 135
    iget-boolean v1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iteratorShared:Z

    if-eqz v1, :cond_7

    invoke-direct {p0}, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->makeIteratorDirty()V

    .line 137
    :cond_7
    iget-object v1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_17

    .line 138
    new-instance v1, Lfreemarker/template/TemplateModelException;

    const-string v2, "The collection has no more elements."

    invoke-direct {v1, v2}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_17
    iget-object v1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->iterator:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 142
    .local v0, "value":Ljava/lang/Object;
    instance-of v1, v0, Lfreemarker/template/TemplateModel;

    if-eqz v1, :cond_24

    .line 143
    check-cast v0, Lfreemarker/template/TemplateModel;

    .line 145
    .end local v0    # "value":Ljava/lang/Object;
    :goto_23
    return-object v0

    .restart local v0    # "value":Ljava/lang/Object;
    :cond_24
    iget-object v1, p0, Lfreemarker/template/SimpleCollection$SimpleTemplateModelIterator;->this$0:Lfreemarker/template/SimpleCollection;

    invoke-virtual {v1, v0}, Lfreemarker/template/SimpleCollection;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    goto :goto_23
.end method
