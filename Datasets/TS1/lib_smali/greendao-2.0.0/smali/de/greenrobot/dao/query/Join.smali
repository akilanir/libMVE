.class public Lde/greenrobot/dao/query/Join;
.super Ljava/lang/Object;
.source "Join.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<SRC:",
        "Ljava/lang/Object;",
        "DST:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final daoDestination:Lde/greenrobot/dao/AbstractDao;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/AbstractDao",
            "<TDST;*>;"
        }
    .end annotation
.end field

.field final joinPropertyDestination:Lde/greenrobot/dao/Property;

.field final joinPropertySource:Lde/greenrobot/dao/Property;

.field final sourceTablePrefix:Ljava/lang/String;

.field final tablePrefix:Ljava/lang/String;

.field final whereCollector:Lde/greenrobot/dao/query/WhereCollector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lde/greenrobot/dao/query/WhereCollector",
            "<TDST;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lde/greenrobot/dao/Property;Lde/greenrobot/dao/AbstractDao;Lde/greenrobot/dao/Property;Ljava/lang/String;)V
    .registers 7
    .param p1, "sourceTablePrefix"    # Ljava/lang/String;
    .param p2, "sourceJoinProperty"    # Lde/greenrobot/dao/Property;
    .param p4, "destinationJoinProperty"    # Lde/greenrobot/dao/Property;
    .param p5, "joinTablePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lde/greenrobot/dao/Property;",
            "Lde/greenrobot/dao/AbstractDao",
            "<TDST;*>;",
            "Lde/greenrobot/dao/Property;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "this":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TSRC;TDST;>;"
    .local p3, "daoDestination":Lde/greenrobot/dao/AbstractDao;, "Lde/greenrobot/dao/AbstractDao<TDST;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lde/greenrobot/dao/query/Join;->sourceTablePrefix:Ljava/lang/String;

    .line 39
    iput-object p2, p0, Lde/greenrobot/dao/query/Join;->joinPropertySource:Lde/greenrobot/dao/Property;

    .line 40
    iput-object p3, p0, Lde/greenrobot/dao/query/Join;->daoDestination:Lde/greenrobot/dao/AbstractDao;

    .line 41
    iput-object p4, p0, Lde/greenrobot/dao/query/Join;->joinPropertyDestination:Lde/greenrobot/dao/Property;

    .line 42
    iput-object p5, p0, Lde/greenrobot/dao/query/Join;->tablePrefix:Ljava/lang/String;

    .line 43
    new-instance v0, Lde/greenrobot/dao/query/WhereCollector;

    invoke-direct {v0, p3, p5}, Lde/greenrobot/dao/query/WhereCollector;-><init>(Lde/greenrobot/dao/AbstractDao;Ljava/lang/String;)V

    iput-object v0, p0, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    .line 44
    return-void
.end method


# virtual methods
.method public varargs and(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;
    .registers 6
    .param p1, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 80
    .local p0, "this":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TSRC;TDST;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    const-string v1, " AND "

    invoke-virtual {v0, v1, p1, p2, p3}, Lde/greenrobot/dao/query/WhereCollector;->combineWhereConditions(Ljava/lang/String;Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v0

    return-object v0
.end method

.method public varargs or(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;
    .registers 6
    .param p1, "cond1"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p2, "cond2"    # Lde/greenrobot/dao/query/WhereCondition;
    .param p3, "condMore"    # [Lde/greenrobot/dao/query/WhereCondition;

    .prologue
    .line 71
    .local p0, "this":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TSRC;TDST;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    const-string v1, " OR "

    invoke-virtual {v0, v1, p1, p2, p3}, Lde/greenrobot/dao/query/WhereCollector;->combineWhereConditions(Ljava/lang/String;Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v0

    return-object v0
.end method

.method public varargs where(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/Join;
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
            "Lde/greenrobot/dao/query/Join",
            "<TSRC;TDST;>;"
        }
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TSRC;TDST;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {v0, p1, p2}, Lde/greenrobot/dao/query/WhereCollector;->add(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)V

    .line 53
    return-object p0
.end method

.method public varargs whereOr(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/Join;
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
            "Lde/greenrobot/dao/query/Join",
            "<TSRC;TDST;>;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lde/greenrobot/dao/query/Join;, "Lde/greenrobot/dao/query/Join<TSRC;TDST;>;"
    iget-object v0, p0, Lde/greenrobot/dao/query/Join;->whereCollector:Lde/greenrobot/dao/query/WhereCollector;

    invoke-virtual {p0, p1, p2, p3}, Lde/greenrobot/dao/query/Join;->or(Lde/greenrobot/dao/query/WhereCondition;Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)Lde/greenrobot/dao/query/WhereCondition;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Lde/greenrobot/dao/query/WhereCondition;

    invoke-virtual {v0, v1, v2}, Lde/greenrobot/dao/query/WhereCollector;->add(Lde/greenrobot/dao/query/WhereCondition;[Lde/greenrobot/dao/query/WhereCondition;)V

    .line 62
    return-object p0
.end method
