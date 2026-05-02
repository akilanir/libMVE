.class public final Lnl/qbusict/cupboard/CupboardFactory;
.super Ljava/lang/Object;
.source "CupboardFactory.java"


# static fields
.field private static INSTANCE:Lnl/qbusict/cupboard/Cupboard;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    new-instance v0, Lnl/qbusict/cupboard/Cupboard;

    invoke-direct {v0}, Lnl/qbusict/cupboard/Cupboard;-><init>()V

    sput-object v0, Lnl/qbusict/cupboard/CupboardFactory;->INSTANCE:Lnl/qbusict/cupboard/Cupboard;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cupboard()Lnl/qbusict/cupboard/Cupboard;
    .registers 1

    .prologue
    .line 38
    sget-object v0, Lnl/qbusict/cupboard/CupboardFactory;->INSTANCE:Lnl/qbusict/cupboard/Cupboard;

    return-object v0
.end method

.method public static getInstance()Lnl/qbusict/cupboard/Cupboard;
    .registers 1

    .prologue
    .line 34
    sget-object v0, Lnl/qbusict/cupboard/CupboardFactory;->INSTANCE:Lnl/qbusict/cupboard/Cupboard;

    return-object v0
.end method

.method public static setCupboard(Lnl/qbusict/cupboard/Cupboard;)V
    .registers 1
    .param p0, "cupboard"    # Lnl/qbusict/cupboard/Cupboard;

    .prologue
    .line 30
    sput-object p0, Lnl/qbusict/cupboard/CupboardFactory;->INSTANCE:Lnl/qbusict/cupboard/Cupboard;

    .line 31
    return-void
.end method
