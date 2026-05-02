.class public Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
.super Ljava/lang/Object;
.source "DatabaseCompartment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/DatabaseCompartment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mCompartment:Lnl/qbusict/cupboard/DatabaseCompartment;

.field private mDistinct:Z

.field private final mEntityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mGroup:Ljava/lang/String;

.field private mHaving:Ljava/lang/String;

.field private mLimit:Ljava/lang/String;

.field private mOrder:Ljava/lang/String;

.field private mProjection:[Ljava/lang/String;

.field private mSelection:Ljava/lang/String;

.field private mSelectionArgs:[Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/Class;Lnl/qbusict/cupboard/DatabaseCompartment;)V
    .registers 4
    .param p2, "compartment"    # Lnl/qbusict/cupboard/DatabaseCompartment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lnl/qbusict/cupboard/DatabaseCompartment;",
            ")V"
        }
    .end annotation

    .prologue
    .line 427
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    .local p1, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 424
    const/4 v0, 0x0

    iput-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mLimit:Ljava/lang/String;

    .line 425
    const/4 v0, 0x0

    iput-boolean v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mDistinct:Z

    .line 428
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mEntityClass:Ljava/lang/Class;

    .line 429
    iput-object p2, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mCompartment:Lnl/qbusict/cupboard/DatabaseCompartment;

    .line 430
    return-void
.end method


# virtual methods
.method public byId(J)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 7
    .param p1, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    const/4 v3, 0x1

    .line 499
    const-string v0, "_id = ?"

    iput-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelection:Ljava/lang/String;

    .line 500
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelectionArgs:[Ljava/lang/String;

    .line 501
    invoke-virtual {p0, v3}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->limit(I)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;

    .line 502
    return-object p0
.end method

.method public distinct()Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 525
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mDistinct:Z

    .line 526
    return-object p0
.end method

.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 553
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getCursor()Landroid/database/Cursor;
    .registers 2

    .prologue
    .line 544
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public groupBy(Ljava/lang/String;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 2
    .param p1, "group"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 465
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mGroup:Ljava/lang/String;

    .line 466
    return-object p0
.end method

.method public having(Ljava/lang/String;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 2
    .param p1, "having"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 476
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mHaving:Ljava/lang/String;

    .line 477
    return-object p0
.end method

.method public limit(I)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 4
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 512
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    const/4 v0, 0x1

    if-ge p1, v0, :cond_b

    .line 513
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Limit must be greater or equal to 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 515
    :cond_b
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mLimit:Ljava/lang/String;

    .line 516
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
    .line 562
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->list()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public orderBy(Ljava/lang/String;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 2
    .param p1, "order"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 454
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mOrder:Ljava/lang/String;

    .line 455
    return-object p0
.end method

.method public query()Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnl/qbusict/cupboard/QueryResultIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 535
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mCompartment:Lnl/qbusict/cupboard/DatabaseCompartment;

    iget-object v1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mEntityClass:Ljava/lang/Class;

    iget-object v2, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mProjection:[Ljava/lang/String;

    iget-object v3, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelection:Ljava/lang/String;

    iget-object v4, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelectionArgs:[Ljava/lang/String;

    iget-object v5, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mGroup:Ljava/lang/String;

    iget-object v6, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mHaving:Ljava/lang/String;

    iget-object v7, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mOrder:Ljava/lang/String;

    iget-object v8, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mLimit:Ljava/lang/String;

    iget-boolean v9, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mDistinct:Z

    # invokes: Lnl/qbusict/cupboard/DatabaseCompartment;->query(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lnl/qbusict/cupboard/QueryResultIterable;
    invoke-static/range {v0 .. v9}, Lnl/qbusict/cupboard/DatabaseCompartment;->access$000(Lnl/qbusict/cupboard/DatabaseCompartment;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    return-object v0
.end method

.method public varargs withProjection([Ljava/lang/String;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 2
    .param p1, "projection"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 488
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mProjection:[Ljava/lang/String;

    .line 489
    return-object p0
.end method

.method public varargs withSelection(Ljava/lang/String;[Ljava/lang/String;)Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;
    .registers 3
    .param p1, "selection"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 441
    .local p0, "this":Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelection:Ljava/lang/String;

    .line 442
    iput-object p2, p0, Lnl/qbusict/cupboard/DatabaseCompartment$QueryBuilder;->mSelectionArgs:[Ljava/lang/String;

    .line 443
    return-object p0
.end method
