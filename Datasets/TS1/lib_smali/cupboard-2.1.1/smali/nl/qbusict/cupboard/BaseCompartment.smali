.class Lnl/qbusict/cupboard/BaseCompartment;
.super Ljava/lang/Object;
.source "BaseCompartment.java"


# instance fields
.field protected final mCupboard:Lnl/qbusict/cupboard/Cupboard;


# direct methods
.method protected constructor <init>(Lnl/qbusict/cupboard/Cupboard;)V
    .registers 2
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lnl/qbusict/cupboard/BaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    .line 25
    return-void
.end method


# virtual methods
.method protected getConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "clz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/BaseCompartment;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/Cupboard;->getEntityConverter(Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;

    move-result-object v0

    return-object v0
.end method
