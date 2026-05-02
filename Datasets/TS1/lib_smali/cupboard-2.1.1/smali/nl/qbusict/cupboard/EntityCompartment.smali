.class public Lnl/qbusict/cupboard/EntityCompartment;
.super Lnl/qbusict/cupboard/BaseCompartment;
.source "EntityCompartment.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lnl/qbusict/cupboard/BaseCompartment;"
    }
.end annotation


# instance fields
.field private final mConverter:Lnl/qbusict/cupboard/convert/EntityConverter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)V
    .registers 4
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p0, "this":Lnl/qbusict/cupboard/EntityCompartment;, "Lnl/qbusict/cupboard/EntityCompartment<TT;>;"
    .local p2, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1}, Lnl/qbusict/cupboard/BaseCompartment;-><init>(Lnl/qbusict/cupboard/Cupboard;)V

    .line 28
    invoke-virtual {p0, p2}, Lnl/qbusict/cupboard/EntityCompartment;->getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    iput-object v0, p0, Lnl/qbusict/cupboard/EntityCompartment;->mConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    .line 29
    return-void
.end method


# virtual methods
.method public getTable()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    .local p0, "this":Lnl/qbusict/cupboard/EntityCompartment;, "Lnl/qbusict/cupboard/EntityCompartment<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/EntityCompartment;->mConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getTable()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toContentValues(Ljava/lang/Object;)Landroid/content/ContentValues;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Landroid/content/ContentValues;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lnl/qbusict/cupboard/EntityCompartment;, "Lnl/qbusict/cupboard/EntityCompartment<TT;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lnl/qbusict/cupboard/EntityCompartment;->toContentValues(Ljava/lang/Object;Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v0

    return-object v0
.end method

.method public toContentValues(Ljava/lang/Object;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .registers 4
    .param p2, "values"    # Landroid/content/ContentValues;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/content/ContentValues;",
            ")",
            "Landroid/content/ContentValues;"
        }
    .end annotation

    .prologue
    .line 58
    .local p0, "this":Lnl/qbusict/cupboard/EntityCompartment;, "Lnl/qbusict/cupboard/EntityCompartment<TT;>;"
    .local p1, "entity":Ljava/lang/Object;, "TT;"
    if-nez p2, :cond_11

    .line 59
    new-instance p2, Landroid/content/ContentValues;

    .end local p2    # "values":Landroid/content/ContentValues;
    iget-object v0, p0, Lnl/qbusict/cupboard/EntityCompartment;->mConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0}, Lnl/qbusict/cupboard/convert/EntityConverter;->getColumns()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p2, v0}, Landroid/content/ContentValues;-><init>(I)V

    .line 61
    .restart local p2    # "values":Landroid/content/ContentValues;
    :cond_11
    iget-object v0, p0, Lnl/qbusict/cupboard/EntityCompartment;->mConverter:Lnl/qbusict/cupboard/convert/EntityConverter;

    invoke-interface {v0, p1, p2}, Lnl/qbusict/cupboard/convert/EntityConverter;->toValues(Ljava/lang/Object;Landroid/content/ContentValues;)V

    .line 62
    return-object p2
.end method
