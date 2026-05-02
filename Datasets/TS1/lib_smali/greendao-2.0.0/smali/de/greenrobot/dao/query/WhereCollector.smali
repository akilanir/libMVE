.class Lde/greenrobot/dao/query/WhereCollector;
.super Ljava/lang/Object;
.source "WhereCollector.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final dao:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;"
        }
    .end annotation
.end field

.field private final tablePrefix:Ljava/lang/String;

.field private final whereConditions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lde/greenrobot/dao/query/WhereCondition;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;)V
    .registers 4
    .param p2, "tablePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 33
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lde/greenrobot/dao/query/WhereCollector;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 35
    iput-object p2, p0, Lde/greenrobot/dao/query/WhereCollector;->tablePrefix:Ljava/lang/String;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/query/WhereCollector;->whereConditions:Ljava/util/List;

    .line 37
    return-void
.end method


# virtual methods
.method varargs add(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)V
    .registers 8
    .param p1, "cond"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 40
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    invoke-virtual {p0, p1}, Lde/greenrobot/dao/query/WhereCollector;->checkCondition(Lde/greenrobot/dao/query/WhereCondition;)V

    .line 41
    iget-object v4, p0, Lde/greenrobot/dao/query/WhereCollector;->whereConditions:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    move-object v0, p2

    .local v0, "arr$":[Lde/greenrobot/dao/query/WhereCondition;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_b
    if-ge v1, v2, :cond_1a

    aget-object v3, v0, v1

    .line 43
    .local v3, "whereCondition":Lde/greenrobot/dao/query/WhereCondition;
    invoke-virtual {p0, v3}, Lde/greenrobot/dao/query/WhereCollector;->checkCondition(Lde/greenrobot/dao/query/WhereCondition;)V

    .line 44
    iget-object v4, p0, Lde/greenrobot/dao/query/WhereCollector;->whereConditions:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 46
    .end local v3    # "whereCondition":Lde/greenrobot/dao/query/WhereCondition;
    :cond_1a
    return-void
.end method

.method addCondition(Ljava/lang/StringBuilder;Ljava/util/List;Lde/greenrobot/dao/query/WhereCondition;)V
    .registers 5
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p3, "condition"    # Lde/greenrobot/dao/query/WhereCondition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;",
            "Lde/greenrobot/dao/query/WhereCondition;",
            ")V"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p0, p3}, Lde/greenrobot/dao/query/WhereCollector;->checkCondition(Lde/greenrobot/dao/query/WhereCondition;)V

    .line 67
    iget-object v0, p0, Lde/greenrobot/dao/query/WhereCollector;->tablePrefix:Ljava/lang/String;

    invoke-interface {p3, p1, v0}, Lde/greenrobot/dao/query/WhereCondition;->appendTo(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 68
    invoke-interface {p3, p2}, Lde/greenrobot/dao/query/WhereCondition;->appendValuesTo(Ljava/util/List;)V

    .line 69
    return-void
.end method

.method appendWhereClause(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;)V
    .registers 7
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "tablePrefixOrNull"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    .local p3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v2, p0, Lde/greenrobot/dao/query/WhereCollector;->whereConditions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v1

    .line 95
    .local v1, "iter":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lde/greenrobot/dao/query/WhereCondition;>;"
    :goto_6
    invoke-interface {v1}, Ljava/util/ListIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 96
    invoke-interface {v1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    if-eqz v2, :cond_17

    .line 97
    const-string v2, " AND "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    :cond_17
    invoke-interface {v1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lde/greenrobot/dao/query/WhereCondition;

    .line 100
    .local v0, "condition":Lde/greenrobot/dao/query/WhereCondition;
    invoke-interface {v0, p1, p2}, Lde/greenrobot/dao/query/WhereCondition;->appendTo(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 101
    invoke-interface {v0, p3}, Lde/greenrobot/dao/query/WhereCondition;->appendValuesTo(Ljava/util/List;)V

    goto :goto_6

    .line 103
    .end local v0    # "condition":Lde/greenrobot/dao/query/WhereCondition;
    :cond_24
    return-void
.end method

.method checkCondition(Lde/greenrobot/dao/query/WhereCondition;)V
    .registers 3
    .param p1, "whereCondition"    # Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 72
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    instance-of v0, p1, Lde/greenrobot/dao/query/WhereCondition$PropertyCondition;

    if-eqz v0, :cond_b

    .line 73
    check-cast p1, Lde/greenrobot/dao/query/WhereCondition$PropertyCondition;

    .end local p1    # "whereCondition":Lde/greenrobot/dao/query/WhereCondition;
    iget-object v0, p1, Lde/greenrobot/dao/query/WhereCondition$PropertyCondition;->property:Lde/greenrobot/dao/Property;

    invoke-virtual {p0, v0}, Lde/greenrobot/dao/query/WhereCollector;->checkProperty(Lde/greenrobot/dao/Property;)V

    .line 75
    :cond_b
    return-void
.end method

.method checkProperty(Lde/greenrobot/dao/Property;)V
    .registers 11
    .param p1, "property"    # Lde/greenrobot/dao/Property;

    .prologue
    .line 78
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    iget-object v6, p0, Lde/greenrobot/dao/query/WhereCollector;->dao:Lde/greenrobot/dao/AbstractDao;

    if-eqz v6, :cond_41

    .line 79
    iget-object v6, p0, Lde/greenrobot/dao/query/WhereCollector;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v6}, Lde/greenrobot/dao/AbstractDao;->getProperties()[Lde/greenrobot/dao/Property;

    move-result-object v4

    .line 80
    .local v4, "properties":[Lde/greenrobot/dao/Property;
    const/4 v1, 0x0

    .line 81
    .local v1, "found":Z
    move-object v0, v4

    .local v0, "arr$":[Lde/greenrobot/dao/Property;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_e
    if-ge v2, v3, :cond_15

    aget-object v5, v0, v2

    .line 82
    .local v5, "property2":Lde/greenrobot/dao/Property;
    if-ne p1, v5, :cond_3e

    .line 83
    const/4 v1, 0x1

    .line 87
    .end local v5    # "property2":Lde/greenrobot/dao/Property;
    :cond_15
    if-nez v1, :cond_41

    .line 88
    new-instance v6, Lde/greenrobot/dao/DaoException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Property \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p1, Lde/greenrobot/dao/Property;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\' is not part of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lde/greenrobot/dao/query/WhereCollector;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 81
    .restart local v5    # "property2":Lde/greenrobot/dao/Property;
    :cond_3e
    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    .line 91
    .end local v0    # "arr$":[Lde/greenrobot/dao/Property;
    .end local v1    # "found":Z
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "properties":[Lde/greenrobot/dao/Property;
    .end local v5    # "property2":Lde/greenrobot/dao/Property;
    :cond_41
    return-void
.end method

.method varargs combineWhereConditions(Ljava/lang/String;Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;
    .registers 14
    .param p1, "combineOp"    # Ljava/lang/String;
    .param p2, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p4, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 50
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v6, "("

    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .local v1, "builder":Ljava/lang/StringBuilder;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v2, "combinedValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-virtual {p0, v1, v2, p2}, Lde/greenrobot/dao/query/WhereCollector;->addCondition(Ljava/lang/StringBuilder;Ljava/util/List;Lde/greenrobot/dao/query/WhereCondition;)V

    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    invoke-virtual {p0, v1, v2, p3}, Lde/greenrobot/dao/query/WhereCollector;->addCondition(Ljava/lang/StringBuilder;Ljava/util/List;Lde/greenrobot/dao/query/WhereCondition;)V

    .line 57
    move-object v0, p4

    .local v0, "arr$":[Lde/greenrobot/dao/query/WhereCondition;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_18
    if-ge v4, v5, :cond_25

    aget-object v3, v0, v4

    .line 58
    .local v3, "cond":Lde/greenrobot/dao/query/WhereCondition;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {p0, v1, v2, v3}, Lde/greenrobot/dao/query/WhereCollector;->addCondition(Ljava/lang/StringBuilder;Ljava/util/List;Lde/greenrobot/dao/query/WhereCondition;)V

    .line 57
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 61
    .end local v3    # "cond":Lde/greenrobot/dao/query/WhereCondition;
    :cond_25
    const/16 v6, 0x29

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    new-instance v6, Lde/greenrobot/dao/query/WhereCondition$StringCondition;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v2}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lde/greenrobot/dao/query/WhereCondition$StringCondition;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v6
.end method

.method isEmpty()Z
    .registers 2

    .prologue
    .line 106
    .local p0, "this":Lde/greenrobot/dao/query/WhereCollector;, "Lde/greenrobot/dao/query/WhereCollector<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/WhereCollector;->whereConditions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method
