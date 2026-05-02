.class public Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
.super Ljava/lang/Object;
.source "ProviderCompartment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/qbusict/cupboard/ProviderCompartment;
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
.field private final mCompartment:Lnl/qbusict/cupboard/ProviderCompartment;

.field private final mEntityClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field private mOrder:Ljava/lang/String;

.field private mProjection:[Ljava/lang/String;

.field private mSelection:Ljava/lang/String;

.field private mSelectionArgs:[Ljava/lang/String;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/Class;Lnl/qbusict/cupboard/ProviderCompartment;)V
    .registers 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p3, "compartment"    # Lnl/qbusict/cupboard/ProviderCompartment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lnl/qbusict/cupboard/ProviderCompartment;",
            ")V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    .local p2, "entityClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p2, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mEntityClass:Ljava/lang/Class;

    .line 50
    iput-object p3, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mCompartment:Lnl/qbusict/cupboard/ProviderCompartment;

    .line 51
    iput-object p1, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mUri:Landroid/net/Uri;

    .line 52
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 94
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getCursor()Landroid/database/Cursor;
    .registers 2

    .prologue
    .line 85
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    return-object v0
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
    .line 103
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    invoke-virtual {p0}, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->query()Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    invoke-virtual {v0}, Lnl/qbusict/cupboard/QueryResultIterable;->list()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public orderBy(Ljava/lang/String;)Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
    .registers 2
    .param p1, "order"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mOrder:Ljava/lang/String;

    .line 62
    return-object p0
.end method

.method public query()Lnl/qbusict/cupboard/QueryResultIterable;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnl/qbusict/cupboard/QueryResultIterable",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mCompartment:Lnl/qbusict/cupboard/ProviderCompartment;

    iget-object v1, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mEntityClass:Ljava/lang/Class;

    iget-object v3, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mProjection:[Ljava/lang/String;

    iget-object v4, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mSelection:Ljava/lang/String;

    iget-object v5, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mSelectionArgs:[Ljava/lang/String;

    iget-object v6, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mOrder:Ljava/lang/String;

    # invokes: Lnl/qbusict/cupboard/ProviderCompartment;->query(Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lnl/qbusict/cupboard/QueryResultIterable;
    invoke-static/range {v0 .. v6}, Lnl/qbusict/cupboard/ProviderCompartment;->access$000(Lnl/qbusict/cupboard/ProviderCompartment;Landroid/net/Uri;Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Lnl/qbusict/cupboard/QueryResultIterable;

    move-result-object v0

    return-object v0
.end method

.method public varargs withProjection([Ljava/lang/String;)Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
    .registers 2
    .param p1, "projection"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 66
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mProjection:[Ljava/lang/String;

    .line 67
    return-object p0
.end method

.method public varargs withSelection(Ljava/lang/String;[Ljava/lang/String;)Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;
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
            "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;, "Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder<TT;>;"
    iput-object p1, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mSelection:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lnl/qbusict/cupboard/ProviderCompartment$QueryBuilder;->mSelectionArgs:[Ljava/lang/String;

    .line 57
    return-object p0
.end method
