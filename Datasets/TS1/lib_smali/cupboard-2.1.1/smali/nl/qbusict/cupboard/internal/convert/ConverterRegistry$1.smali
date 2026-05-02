.class Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;
.super Ljava/lang/Object;
.source "ConverterRegistry.java"

# interfaces
.implements Lnl/qbusict/cupboard/convert/EntityConverterFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;->addDefaultEntityConverterFactories()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;


# direct methods
.method constructor <init>(Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;)V
    .registers 2

    .prologue
    .line 160
    iput-object p1, p0, Lnl/qbusict/cupboard/internal/convert/ConverterRegistry$1;->this$0:Lnl/qbusict/cupboard/internal/convert/ConverterRegistry;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)Lnl/qbusict/cupboard/convert/EntityConverter;
    .registers 4
    .param p1, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnl/qbusict/cupboard/Cupboard;",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Lnl/qbusict/cupboard/convert/EntityConverter",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 163
    .local p2, "type":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    new-instance v0, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;

    invoke-direct {v0, p1, p2}, Lnl/qbusict/cupboard/convert/ReflectiveEntityConverter;-><init>(Lnl/qbusict/cupboard/Cupboard;Ljava/lang/Class;)V

    return-object v0
.end method
