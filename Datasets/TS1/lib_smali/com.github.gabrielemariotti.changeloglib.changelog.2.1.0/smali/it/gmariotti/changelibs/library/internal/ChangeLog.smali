.class public Lit/gmariotti/changelibs/library/internal/ChangeLog;
.super Ljava/lang/Object;
.source "ChangeLog.java"


# instance fields
.field private bulletedList:Z

.field private rows:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    .line 41
    return-void
.end method


# virtual methods
.method public addRow(Lit/gmariotti/changelibs/library/internal/ChangeLogRow;)V
    .registers 3
    .param p1, "row"    # Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    .prologue
    .line 49
    if-eqz p1, :cond_12

    .line 50
    iget-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    if-nez v0, :cond_d

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    .line 51
    :cond_d
    iget-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 53
    :cond_12
    return-void
.end method

.method public clearAllRows()V
    .registers 2

    .prologue
    .line 59
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    .line 60
    return-void
.end method

.method public getRows()Ljava/util/LinkedList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/LinkedList",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    return-object v0
.end method

.method public isBulletedList()Z
    .registers 2

    .prologue
    .line 83
    iget-boolean v0, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->bulletedList:Z

    return v0
.end method

.method public setBulletedList(Z)V
    .registers 2
    .param p1, "bulletedList"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->bulletedList:Z

    .line 88
    return-void
.end method

.method public setRows(Ljava/util/LinkedList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/LinkedList",
            "<",
            "Lit/gmariotti/changelibs/library/internal/ChangeLogRow;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "rows":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lit/gmariotti/changelibs/library/internal/ChangeLogRow;>;"
    iput-object p1, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    .line 96
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .local v2, "sb":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bulletedList="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->bulletedList:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v3, "\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    iget-object v3, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    if-eqz v3, :cond_4a

    .line 69
    iget-object v3, p0, Lit/gmariotti/changelibs/library/internal/ChangeLog;->rows:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_2c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;

    .line 70
    .local v1, "row":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    const-string v3, "row=["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v1}, Lit/gmariotti/changelibs/library/internal/ChangeLogRow;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    const-string v3, "]\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2c

    .line 75
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "row":Lit/gmariotti/changelibs/library/internal/ChangeLogRow;
    :cond_4a
    const-string v3, "rows:none"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    :cond_4f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
