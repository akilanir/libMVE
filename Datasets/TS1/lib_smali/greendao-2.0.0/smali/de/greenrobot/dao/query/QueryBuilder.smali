.class public Lde/greenrobot/dao/query/QueryBuilder;
.super Ljava/lang/Object;
.source "QueryBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static LOG_SQL:Z

.field public static LOG_VALUES:Z


# instance fields
.field private final dao:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;"
        }
    .end annotation
.end field

.field private final joins:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lde/greenrobot/dao/query/Join",
            "<TT;*>;>;"
        }
    .end annotation
.end field

.field private limit:Ljava/lang/Integer;

.field private offset:Ljava/lang/Integer;

.field private orderBuilder:Ljava/lang/StringBuilder;

.field private final tablePrefix:Ljava/lang/String;

.field private final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final whereCollector:Lde/greenrobot/dao/query/WhereCollector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/WhereCollector",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lde/greenrobot/dao/AbstractDao;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT;*>;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    const-string v0, "T"

    invoke-direct {p0, p1, v0}, Lde/greenrobot/dao/query/QueryBuilder;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method protected constructor <init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;)V
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
    .line 71
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p1, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-object p1, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    .line 73
    iput-object p2, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    .line 75
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    .line 76
    new-instance v0, Lde/greenrobot/dao/query/WhereCollector;

    invoke-direct {v0, p1, p2}, Lde/greenrobot/dao/query/WhereCollector;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;)V

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    .line 77
    return-void
.end method

.method private addJoin(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;
    .registers 11
    .param p1, "sourceTablePrefix"    # Ljava/lang/String;
    .param p2, "sourceProperty"    # Lde/greenrobot/dao/Property;
    .param p4, "destinationProperty"    # Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<J:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lde/greenrobot/dao/Property;",
            "Lde/greenrobot/dao/AbstractDao",
            "<TJ;*>;",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/Join",
            "<TT;TJ;>;"
        }
    .end annotation

    .prologue
    .line 164
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p3, "destinationDao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TJ;*>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "J"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 165
    .local v5, "joinTablePrefix":Ljava/lang/String;
    new-instance v0, Lde/greenrobot/dao/query/Join;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/query/Join;-><init>(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;Ljava/lang/String;)V

    .line 167
    .local v0, "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;TJ;>;"
    iget-object v1, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    return-object v0
.end method

.method private appendJoinsAndWheres(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .registers 9
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "tablePrefixOrNull"    # Ljava/lang/String;

    .prologue
    .line 322
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v3, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 323
    iget-object v3, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/query/Join;

    .line 324
    .local v1, "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    const-string v3, " JOIN "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lde/greenrobot/dao/query/Join;->daoDestination:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v4}, Lde/greenrobot/dao/AbstractDao;->getTablename()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x20

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 325
    iget-object v3, v1, Lde/greenrobot/dao/query/Join;->tablePrefix:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ON "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    iget-object v3, v1, Lde/greenrobot/dao/query/Join;->sourceTablePrefix:Ljava/lang/String;

    iget-object v4, v1, Lde/greenrobot/dao/query/Join;->joinPropertySource:Lde/greenrobot/dao/Property;

    invoke-static {p1, v3, v4}, Lde/greenrobot/dao/internal/SqlUtils;->appendProperty(Ljava/lang/StringBuilder;Ljava/lang/String;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 327
    iget-object v3, v1, Lde/greenrobot/dao/query/Join;->tablePrefix:Ljava/lang/String;

    iget-object v4, v1, Lde/greenrobot/dao/query/Join;->joinPropertyDestination:Lde/greenrobot/dao/Property;

    invoke-static {p1, v3, v4}, Lde/greenrobot/dao/internal/SqlUtils;->appendProperty(Ljava/lang/StringBuilder;Ljava/lang/String;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 329
    .end local v1    # "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    :cond_4c
    iget-object v3, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {v3}, Lde/greenrobot/dao/query/WhereCollector;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_8f

    const/4 v2, 0x1

    .line 330
    .local v2, "whereAppended":Z
    :goto_55
    if-eqz v2, :cond_63

    .line 331
    const-string v3, " WHERE "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    iget-object v3, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-virtual {v3, p1, p2, v4}, Lde/greenrobot/dao/query/WhereCollector;->appendWhereClause(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;)V

    .line 334
    :cond_63
    iget-object v3, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_69
    :goto_69
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_97

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lde/greenrobot/dao/query/Join;

    .line 335
    .restart local v1    # "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    iget-object v3, v1, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {v3}, Lde/greenrobot/dao/query/WhereCollector;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_69

    .line 336
    if-nez v2, :cond_91

    .line 337
    const-string v3, " WHERE "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    const/4 v2, 0x1

    .line 342
    :goto_85
    iget-object v3, v1, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    iget-object v4, v1, Lde/greenrobot/dao/query/Join;->tablePrefix:Ljava/lang/String;

    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-virtual {v3, p1, v4, v5}, Lde/greenrobot/dao/query/WhereCollector;->appendWhereClause(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/util/List;)V

    goto :goto_69

    .line 329
    .end local v1    # "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    .end local v2    # "whereAppended":Z
    :cond_8f
    const/4 v2, 0x0

    goto :goto_55

    .line 340
    .restart local v1    # "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    .restart local v2    # "whereAppended":Z
    :cond_91
    const-string v3, " AND "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_85

    .line 345
    .end local v1    # "join":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TT;*>;"
    :cond_97
    return-void
.end method

.method private checkLog(Ljava/lang/String;)V
    .registers 4
    .param p1, "sql"    # Ljava/lang/String;

    .prologue
    .line 313
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    sget-boolean v0, Lde/greenrobot/dao/query/QueryBuilder;->LOG_SQL:Z

    if-eqz v0, :cond_1a

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Built SQL for query: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/greenrobot/dao/DaoLog;->d(Ljava/lang/String;)I

    .line 316
    :cond_1a
    sget-boolean v0, Lde/greenrobot/dao/query/QueryBuilder;->LOG_VALUES:Z

    if-eqz v0, :cond_36

    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Values for query: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/greenrobot/dao/DaoLog;->d(Ljava/lang/String;)I

    .line 319
    :cond_36
    return-void
.end method

.method private checkOrderBuilder()V
    .registers 3

    .prologue
    .line 80
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    if-nez v0, :cond_c

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    .line 85
    :cond_b
    :goto_b
    return-void

    .line 82
    :cond_c
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_b

    .line 83
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b
.end method

.method public static internalCreate(Lde/greenrobot/dao/AbstractDao;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/AbstractDao",
            "<TT2;*>;)",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT2;>;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "dao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TT2;*>;"
    new-instance v0, Lde/greenrobot/dao/query/QueryBuilder;

    invoke-direct {v0, p0}, Lde/greenrobot/dao/query/QueryBuilder;-><init>(Lde/greenrobot/dao/AbstractDao;)V

    return-object v0
.end method

.method private varargs orderAscOrDesc(Ljava/lang/String;[Lde/greenrobot/dao/Property;)V
    .registers 9
    .param p1, "ascOrDescWithLeadingSpace"    # Ljava/lang/String;
    .param p2, "properties"    # [Lde/greenrobot/dao/Property;

    .prologue
    .line 184
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    move-object v0, p2

    .local v0, "arr$":[Lde/greenrobot/dao/Property;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_3
    if-ge v1, v2, :cond_28

    aget-object v3, v0, v1

    .line 185
    .local v3, "property":Lde/greenrobot/dao/Property;
    invoke-direct {p0}, Lde/greenrobot/dao/query/QueryBuilder;->checkOrderBuilder()V

    .line 186
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v4, v3}, Lde/greenrobot/dao/query/QueryBuilder;->append(Ljava/lang/StringBuilder;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;

    .line 187
    const-class v4, Ljava/lang/String;

    iget-object v5, v3, Lde/greenrobot/dao/Property;->type:Ljava/lang/Class;

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_20

    .line 188
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    const-string v5, " COLLATE LOCALIZED"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    :cond_20
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 192
    .end local v3    # "property":Lde/greenrobot/dao/Property;
    :cond_28
    return-void
.end method


# virtual methods
.method public varargs and(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;
    .registers 6
    .param p1, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 120
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    const-string v1, " AND "

    invoke-virtual {v0, v1, p1, p2, p3}, Lde/greenrobot/dao/query/WhereCollector;->combineWhereConditions(Ljava/lang/String;Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v0

    return-object v0
.end method

.method protected append(Ljava/lang/StringBuilder;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;
    .registers 6
    .param p1, "builder"    # Ljava/lang/StringBuilder;
    .param p2, "property"    # Lde/greenrobot/dao/Property;

    .prologue
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    const/16 v2, 0x27

    .line 213
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {v0, p2}, Lde/greenrobot/dao/query/WhereCollector;->checkProperty(Lde/greenrobot/dao/Property;)V

    .line 214
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p2, Lde/greenrobot/dao/Property;->columnName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 215
    return-object p1
.end method

.method public build()Lde/greenrobot/dao/query/Query;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/Query",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 239
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v5}, Lde/greenrobot/dao/AbstractDao;->getTablename()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    iget-object v7, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v7}, Lde/greenrobot/dao/AbstractDao;->getAllColumns()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlSelect(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 240
    .local v3, "select":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 242
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v0, v5}, Lde/greenrobot/dao/query/QueryBuilder;->appendJoinsAndWheres(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 244
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    if-eqz v5, :cond_33

    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_33

    .line 245
    const-string v5, " ORDER BY "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 248
    :cond_33
    const/4 v1, -0x1

    .line 249
    .local v1, "limitPosition":I
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->limit:Ljava/lang/Integer;

    if-eqz v5, :cond_4c

    .line 250
    const-string v5, " LIMIT ?"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    iget-object v6, p0, Lde/greenrobot/dao/query/QueryBuilder;->limit:Ljava/lang/Integer;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v1, v5, -0x1

    .line 255
    :cond_4c
    const/4 v2, -0x1

    .line 256
    .local v2, "offsetPosition":I
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->offset:Ljava/lang/Integer;

    if-eqz v5, :cond_71

    .line 257
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->limit:Ljava/lang/Integer;

    if-nez v5, :cond_5d

    .line 258
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Offset cannot be set without limit"

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 260
    :cond_5d
    const-string v5, " OFFSET ?"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    iget-object v6, p0, Lde/greenrobot/dao/query/QueryBuilder;->offset:Ljava/lang/Integer;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v2, v5, -0x1

    .line 265
    :cond_71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 266
    .local v4, "sql":Ljava/lang/String;
    invoke-direct {p0, v4}, Lde/greenrobot/dao/query/QueryBuilder;->checkLog(Ljava/lang/String;)V

    .line 268
    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v6, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v4, v6, v1, v2}, Lde/greenrobot/dao/query/Query;->create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;II)Lde/greenrobot/dao/query/Query;

    move-result-object v5

    return-object v5
.end method

.method public buildCount()Lde/greenrobot/dao/query/CountQuery;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/CountQuery",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 301
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v4}, Lde/greenrobot/dao/AbstractDao;->getTablename()Ljava/lang/String;

    move-result-object v3

    .line 302
    .local v3, "tablename":Ljava/lang/String;
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-static {v3, v4}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlSelectCountStar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 303
    .local v0, "baseSql":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 304
    .local v1, "builder":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v1, v4}, Lde/greenrobot/dao/query/QueryBuilder;->appendJoinsAndWheres(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 306
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 307
    .local v2, "sql":Ljava/lang/String;
    invoke-direct {p0, v2}, Lde/greenrobot/dao/query/QueryBuilder;->checkLog(Ljava/lang/String;)V

    .line 309
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v2, v5}, Lde/greenrobot/dao/query/CountQuery;->create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/CountQuery;

    move-result-object v4

    return-object v4
.end method

.method public buildDelete()Lde/greenrobot/dao/query/DeleteQuery;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/DeleteQuery",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->joins:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_10

    .line 277
    new-instance v4, Lde/greenrobot/dao/DaoException;

    const-string v5, "JOINs are not supported for DELETE queries"

    invoke-direct {v4, v5}, Lde/greenrobot/dao/DaoException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 279
    :cond_10
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v4}, Lde/greenrobot/dao/AbstractDao;->getTablename()Ljava/lang/String;

    move-result-object v3

    .line 280
    .local v3, "tablename":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-static {v3, v4}, Lde/greenrobot/dao/internal/SqlUtils;->createSqlDelete(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 281
    .local v0, "baseSql":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 285
    .local v1, "builder":Ljava/lang/StringBuilder;
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v1, v4}, Lde/greenrobot/dao/query/QueryBuilder;->appendJoinsAndWheres(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 287
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 290
    .local v2, "sql":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x22

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\".\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 291
    invoke-direct {p0, v2}, Lde/greenrobot/dao/query/QueryBuilder;->checkLog(Ljava/lang/String;)V

    .line 293
    iget-object v4, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    iget-object v5, p0, Lde/greenrobot/dao/query/QueryBuilder;->values:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v2, v5}, Lde/greenrobot/dao/query/DeleteQuery;->create(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;[Ljava/lang/Object;)Lde/greenrobot/dao/query/DeleteQuery;

    move-result-object v4

    return-object v4
.end method

.method public count()J
    .registers 3

    .prologue
    .line 408
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->buildCount()Lde/greenrobot/dao/query/CountQuery;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/CountQuery;->count()J

    move-result-wide v0

    return-wide v0
.end method

.method public join(Lde/greenrobot/dao/Property;Ljava/lang/Class;)Lde/greenrobot/dao/query/Join;
    .registers 6
    .param p1, "sourceProperty"    # Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<J:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/Property;",
            "Ljava/lang/Class",
            "<TJ;>;)",
            "Lde/greenrobot/dao/query/Join",
            "<TT;TJ;>;"
        }
    .end annotation

    .prologue
    .line 136
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p2, "destinationEntityClass":Ljava/lang/Class;, "Ljava/lang/Class<TJ;>;"
    iget-object v2, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v2}, Lde/greenrobot/dao/AbstractDao;->getSession()Lde/greenrobot/dao/AbstractDaoSession;

    move-result-object v2

    invoke-virtual {v2, p2}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 137
    .local v0, "destinationDao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TJ;*>;"
    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->getPkProperty()Lde/greenrobot/dao/Property;

    move-result-object v1

    .line 138
    .local v1, "destinationProperty":Lde/greenrobot/dao/Property;
    iget-object v2, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v2, p1, v0, v1}, Lde/greenrobot/dao/query/QueryBuilder;->addJoin(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;

    move-result-object v2

    return-object v2
.end method

.method public join(Lde/greenrobot/dao/Property;Ljava/lang/Class;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;
    .registers 6
    .param p1, "sourceProperty"    # Lde/greenrobot/dao/Property;
    .param p3, "destinationProperty"    # Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<J:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/Property;",
            "Ljava/lang/Class",
            "<TJ;>;",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/Join",
            "<TT;TJ;>;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p2, "destinationEntityClass":Ljava/lang/Class;, "Ljava/lang/Class<TJ;>;"
    iget-object v1, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getSession()Lde/greenrobot/dao/AbstractDaoSession;

    move-result-object v1

    invoke-virtual {v1, p2}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 147
    .local v0, "destinationDao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TJ;*>;"
    iget-object v1, p0, Lde/greenrobot/dao/query/QueryBuilder;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v1, p1, v0, p3}, Lde/greenrobot/dao/query/QueryBuilder;->addJoin(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;

    move-result-object v1

    return-object v1
.end method

.method public join(Lde/greenrobot/dao/query/Join;Lde/greenrobot/dao/Property;Ljava/lang/Class;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;
    .registers 7
    .param p2, "sourceProperty"    # Lde/greenrobot/dao/Property;
    .param p4, "destinationProperty"    # Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<J:",
            "Ljava/lang/Object;",
            ">(",
            "Lde/greenrobot/dao/query/Join",
            "<*TT;>;",
            "Lde/greenrobot/dao/Property;",
            "Ljava/lang/Class",
            "<TJ;>;",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/Join",
            "<TT;TJ;>;"
        }
    .end annotation

    .prologue
    .line 158
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p1, "sourceJoin":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<*TT;>;"
    .local p3, "destinationEntityClass":Ljava/lang/Class;, "Ljava/lang/Class<TJ;>;"
    iget-object v1, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v1}, Lde/greenrobot/dao/AbstractDao;->getSession()Lde/greenrobot/dao/AbstractDaoSession;

    move-result-object v1

    invoke-virtual {v1, p3}, Lde/greenrobot/dao/AbstractDaoSession;->getDao(Ljava/lang/Class;)Lde/greenrobot/dao/AbstractDao;

    move-result-object v0

    .line 159
    .local v0, "destinationDao":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TJ;*>;"
    iget-object v1, p1, Lde/greenrobot/dao/query/Join;->tablePrefix:Ljava/lang/String;

    invoke-direct {p0, v1, p2, v0, p4}, Lde/greenrobot/dao/query/QueryBuilder;->addJoin(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;

    move-result-object v1

    return-object v1
.end method

.method public join(Ljava/lang/Class;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;
    .registers 4
    .param p2, "destinationProperty"    # Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<J:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TJ;>;",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/Join",
            "<TT;TJ;>;"
        }
    .end annotation

    .prologue
    .line 128
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    .local p1, "destinationEntityClass":Ljava/lang/Class;, "Ljava/lang/Class<TJ;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->dao:Lde/greenrobot/dao/AbstractDao;

    invoke-virtual {v0}, Lde/greenrobot/dao/AbstractDao;->getPkProperty()Lde/greenrobot/dao/Property;

    move-result-object v0

    invoke-virtual {p0, v0, p1, p2}, Lde/greenrobot/dao/query/QueryBuilder;->join(Lde/greenrobot/dao/Property;Ljava/lang/Class;Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/Join;

    move-result-object v0

    return-object v0
.end method

.method public limit(I)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 3
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->limit:Ljava/lang/Integer;

    .line 222
    return-object p0
.end method

.method public list()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 353
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->list()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public listIterator()Lde/greenrobot/dao/query/CloseableListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/CloseableListIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 380
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->listIterator()Lde/greenrobot/dao/query/CloseableListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listLazy()Lde/greenrobot/dao/query/LazyList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/LazyList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 362
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->listLazy()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    return-object v0
.end method

.method public listLazyUncached()Lde/greenrobot/dao/query/LazyList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lde/greenrobot/dao/query/LazyList",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 371
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->listLazyUncached()Lde/greenrobot/dao/query/LazyList;

    move-result-object v0

    return-object v0
.end method

.method public offset(I)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 3
    .param p1, "offset"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 230
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->offset:Ljava/lang/Integer;

    .line 231
    return-object p0
.end method

.method public varargs or(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;
    .registers 6
    .param p1, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 111
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    const-string v1, " OR "

    invoke-virtual {v0, v1, p1, p2, p3}, Lde/greenrobot/dao/query/WhereCollector;->combineWhereConditions(Ljava/lang/String;Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v0

    return-object v0
.end method

.method public varargs orderAsc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 3
    .param p1, "properties"    # [Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 173
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    const-string v0, " ASC"

    invoke-direct {p0, v0, p1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAscOrDesc(Ljava/lang/String;[Lde/greenrobot/dao/Property;)V

    .line 174
    return-object p0
.end method

.method public orderCustom(Lde/greenrobot/dao/Property;Ljava/lang/String;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 5
    .param p1, "property"    # Lde/greenrobot/dao/Property;
    .param p2, "customOrderForProperty"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/Property;",
            "Ljava/lang/String;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-direct {p0}, Lde/greenrobot/dao/query/QueryBuilder;->checkOrderBuilder()V

    .line 197
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0, p1}, Lde/greenrobot/dao/query/QueryBuilder;->append(Ljava/lang/StringBuilder;Lde/greenrobot/dao/Property;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 198
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    return-object p0
.end method

.method public varargs orderDesc([Lde/greenrobot/dao/Property;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 3
    .param p1, "properties"    # [Lde/greenrobot/dao/Property;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lde/greenrobot/dao/Property;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 179
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    const-string v0, " DESC"

    invoke-direct {p0, v0, p1}, Lde/greenrobot/dao/query/QueryBuilder;->orderAscOrDesc(Ljava/lang/String;[Lde/greenrobot/dao/Property;)V

    .line 180
    return-object p0
.end method

.method public orderRaw(Ljava/lang/String;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 3
    .param p1, "rawOrder"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-direct {p0}, Lde/greenrobot/dao/query/QueryBuilder;->checkOrderBuilder()V

    .line 208
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->orderBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    return-object p0
.end method

.method public unique()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 389
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->unique()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public uniqueOrThrow()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 399
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lde/greenrobot/dao/query/QueryBuilder;->build()Lde/greenrobot/dao/query/Query;

    move-result-object v0

    invoke-virtual {v0}, Lde/greenrobot/dao/query/Query;->uniqueOrThrow()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 4
    .param p1, "cond"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/WhereCondition;",
            "[",
            "Lde/greenrobot/dao/query/WhereCondition;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {v0, p1, p2}, Lde/greenrobot/dao/query/WhereCollector;->add(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)V

    .line 93
    return-object p0
.end method

.method public varargs whereOr(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/QueryBuilder;
    .registers 7
    .param p1, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lde/greenrobot/dao/query/WhereCondition;",
            "Lde/greenrobot/dao/query/WhereCondition;",
            "[",
            "Lde/greenrobot/dao/query/WhereCondition;",
            ")",
            "Lde/greenrobot/dao/query/QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 101
    .local p0, "this":Lde/greenrobot/dao/query/QueryBuilder;, "Lde/greenrobot/dao/query/QueryBuilder<TT;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/QueryBuilder;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {p0, p1, p2, p3}, Lde/greenrobot/dao/query/QueryBuilder;->or(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/WhereCollector;->add(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)V

    .line 102
    return-object p0
.end method
