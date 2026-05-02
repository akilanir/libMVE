.class public Lnl/qbusict/cupboard/CupboardBuilder;
.super Ljava/lang/Object;
.source "CupboardBuilder.java"


# instance fields
.field private mCupboard:Lnl/qbusict/cupboard/Cupboard;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    new-instance v0, Lnl/qbusict/cupboard/Cupboard;

    invoke-direct {v0}, Lnl/qbusict/cupboard/Cupboard;-><init>()V

    iput-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    .line 30
    return-void
.end method

.method public constructor <init>(Lnl/qbusict/cupboard/Cupboard;)V
    .registers 5
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v2, Lnl/qbusict/cupboard/Cupboard;

    invoke-direct {v2}, Lnl/qbusict/cupboard/Cupboard;-><init>()V

    iput-object v2, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    .line 40
    invoke-virtual {p1}, Lnl/qbusict/cupboard/Cupboard;->getRegisteredEntities()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_12
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_24

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 41
    .local v0, "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v2, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v2, v0}, Lnl/qbusict/cupboard/Cupboard;->register(Ljava/lang/Class;)V

    goto :goto_12

    .line 43
    .end local v0    # "entity":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_24
    return-void
.end method


# virtual methods
.method public build()Lnl/qbusict/cupboard/Cupboard;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    return-object v0
.end method

.method public registerEntityConverterFactory(Lnl/qbusict/cupboard/convert/EntityConverterFactory;)Lnl/qbusict/cupboard/CupboardBuilder;
    .registers 3
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/EntityConverterFactory;

    .prologue
    .line 52
    iget-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/Cupboard;->registerEntityConverterFactory(Lnl/qbusict/cupboard/convert/EntityConverterFactory;)V

    .line 53
    return-object p0
.end method

.method public registerFieldConverter(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/FieldConverter;)Lnl/qbusict/cupboard/CupboardBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lnl/qbusict/cupboard/convert/FieldConverter",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/CupboardBuilder;"
        }
    .end annotation

    .prologue
    .line 75
    .local p1, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p2, "converter":Lnl/qbusict/cupboard/convert/FieldConverter;, "Lnl/qbusict/cupboard/convert/FieldConverter<TT;>;"
    iget-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v0, p1, p2}, Lnl/qbusict/cupboard/Cupboard;->registerFieldConverter(Ljava/lang/Class;Lnl/qbusict/cupboard/convert/FieldConverter;)V

    .line 76
    return-object p0
.end method

.method public registerFieldConverterFactory(Lnl/qbusict/cupboard/convert/FieldConverterFactory;)Lnl/qbusict/cupboard/CupboardBuilder;
    .registers 3
    .param p1, "factory"    # Lnl/qbusict/cupboard/convert/FieldConverterFactory;

    .prologue
    .line 63
    iget-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    invoke-virtual {v0, p1}, Lnl/qbusict/cupboard/Cupboard;->registerFieldConverterFactory(Lnl/qbusict/cupboard/convert/FieldConverterFactory;)V

    .line 64
    return-object p0
.end method

.method public useAnnotations()Lnl/qbusict/cupboard/CupboardBuilder;
    .registers 3

    .prologue
    .line 85
    iget-object v0, p0, Lnl/qbusict/cupboard/CupboardBuilder;->mCupboard:Lnl/qbusict/cupboard/Cupboard;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnl/qbusict/cupboard/Cupboard;->setUseAnnotations(Z)V

    .line 86
    return-object p0
.end method
